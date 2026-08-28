from datetime import datetime

from dateparser.search import search_dates


def parse_relative_date(text: str):
    results = search_dates(
        text,
        settings={"PREFER_DATES_FROM": "future", "RELATIVE_BASE": datetime.now()},
    )
    if results:
        _, parsed_date = results[-1]  # last date mention in the sentence
        return parsed_date.strftime("%Y-%m-%d"), parsed_date.strftime("%H:%M")
    return None, None