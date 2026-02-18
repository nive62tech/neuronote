# System Architecture

## High-Level Flow

User speaks
↓
Flutter records audio
↓
Audio sent to FastAPI backend
↓
Whisper converts speech to text
↓
LLM extracts structured tasks/events
↓
Backend returns JSON
↓
Flutter stores data locally
↓
Calendar updates
↓
Reminder scheduled

---

## Components

### Mobile Layer (Flutter)
- UI
- Audio recording
- API calls
- Local database
- Notifications

### Backend Layer (FastAPI)
- Audio endpoint
- Transcription service
- NLP extraction
- JSON response formatting

### AI Layer
- Whisper (Speech-to-Text)
- LLM (Structured Extraction)
- dateparser (Relative Date Handling)

### Storage Layer (MVP)
- Local SQLite database
