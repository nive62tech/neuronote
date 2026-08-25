import uuid
from datetime import datetime

from sqlalchemy import Column, String, DateTime

from app.db.database import Base


class TaskDB(Base):
    __tablename__ = "tasks"

    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    title = Column(String, nullable=False)
    date = Column(String, nullable=True)
    time = Column(String, nullable=True)
    type = Column(String, default="other")
    created_at = Column(DateTime, default=datetime.utcnow)
