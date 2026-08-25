from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api.routes import extract, tasks, transcribe

app = FastAPI(title="NeuroNote Backend")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(transcribe.router, prefix="/api")
app.include_router(extract.router, prefix="/api")
app.include_router(tasks.router, prefix="/api")


@app.get("/")
def root():
    return {"status": "NeuroNote backend running"}
