from typing import List, Optional

from pydantic import BaseModel


class TaskOut(BaseModel):
    id: str
    title: str
    date: Optional[str] = None
    time: Optional[str] = None
    type: str = "other"

    class Config:
        from_attributes = True


class TranscribeResponse(BaseModel):
    text: str


class ExtractRequest(BaseModel):
    text: str


class ExtractResponse(BaseModel):
    tasks: List[TaskOut]
    summary: str
