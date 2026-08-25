from datetime import datetime

import dateparser


def parse_relative_date(text: str):
    result = dateparser.parse(
        text,
        settings={"PREFER_DATES_FROM": "future", "RELATIVE_BASE": datetime.now()},
    )
    if result:
        return result.strftime("%Y-%m-%d"), result.strftime("%H:%M")
    return None, None
