import uuid

from fastapi import APIRouter

from app.schemas.task_schema import ExtractRequest, ExtractResponse
from app.services.llm_service import extract_tasks

router = APIRouter()


@router.post("/extract", response_model=ExtractResponse)
async def extract(payload: ExtractRequest):
    result = extract_tasks(payload.text)
    for task in result["tasks"]:
        task["id"] = str(uuid.uuid4())
    return ExtractResponse(tasks=result["tasks"], summary=result.get("summary", ""))
