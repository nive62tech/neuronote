from typing import List

from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from app.db.database import Base, engine, get_db
from app.models.task import TaskDB
from app.schemas.task_schema import TaskOut

Base.metadata.create_all(bind=engine)

router = APIRouter()


@router.get("/tasks", response_model=List[TaskOut])
def list_tasks(db: Session = Depends(get_db)):
    return db.query(TaskDB).order_by(TaskDB.created_at.desc()).all()


@router.post("/tasks", response_model=TaskOut)
def create_task(task: TaskOut, db: Session = Depends(get_db)):
    db_task = TaskDB(id=task.id, title=task.title, date=task.date, time=task.time, type=task.type)
    db.merge(db_task)
    db.commit()
    db.refresh(db_task)
    return db_task
