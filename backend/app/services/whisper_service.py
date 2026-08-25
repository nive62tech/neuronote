from faster_whisper import WhisperModel

from app.core.config import settings

_model = None


def get_model():
    global _model
    if _model is None:
        _model = WhisperModel(settings.whisper_model, device="cpu", compute_type="int8")
    return _model


def transcribe_audio(file_path: str) -> str:
    model = get_model()
    segments, _ = model.transcribe(file_path)
    return " ".join(segment.text.strip() for segment in segments)
