import json
import re

import requests

from app.core.config import settings
from app.services.dateparser_service import parse_relative_date

EXTRACTION_PROMPT = """You are a task extraction engine. Given a spoken sentence, extract tasks and events as JSON only, no extra text.

Format:
{{
  "tasks": [
    {{"title": "string", "date": "YYYY-MM-DD or null", "time": "HH:MM or null", "type": "exam|meeting|deadline|other"}}
  ],
  "summary": "one line summary"
}}

Sentence: "{text}"

Respond with JSON only."""


def extract_tasks(text: str) -> dict:
    prompt = EXTRACTION_PROMPT.format(text=text)
    try:
        response = requests.post(
            f"{settings.ollama_host}/api/generate",
            json={"model": settings.ollama_model, "prompt": prompt, "stream": False},
            timeout=60,
        )
        response.raise_for_status()
        print(f"[DEBUG] Raw LLM output: {raw}")
        match = re.search(r"\{.*\}", raw, re.DOTALL)
        parsed = json.loads(match.group(0)) if match else {"tasks": [], "summary": text}
    except Exception:
        parsed = {"tasks": [], "summary": text}

    for task in parsed.get("tasks", []):
        if not task.get("date"):
            date, time = parse_relative_date(text)
            task["date"] = date
            task["time"] = task.get("time") or time
        if not task.get("type"):
            task["type"] = "other"

    if not parsed.get("tasks"):
        date, time = parse_relative_date(text)
        parsed["tasks"] = [
            {"title": text.strip().capitalize(), "date": date, "time": time, "type": "other"}
        ]
        parsed["summary"] = parsed.get("summary") or text

    return parsed
