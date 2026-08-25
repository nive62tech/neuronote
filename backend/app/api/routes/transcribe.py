import os
import tempfile

from fastapi import APIRouter, File, HTTPException, UploadFile

from app.schemas.task_schema import TranscribeResponse
from app.services.whisper_service import transcribe_audio

router = APIRouter()


@router.post("/transcribe", response_model=TranscribeResponse)
async def transcribe(audio: UploadFile = File(...)):
    suffix = os.path.splitext(audio.filename or "audio.wav")[1] or ".wav"
    with tempfile.NamedTemporaryFile(delete=False, suffix=suffix) as tmp:
        tmp.write(await audio.read())
        tmp_path = tmp.name

    try:
        text = transcribe_audio(tmp_path)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Transcription failed: {e}")
    finally:
        os.remove(tmp_path)

    return TranscribeResponse(text=text)
