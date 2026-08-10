# NeuroNote

NeuroNote is an AI-powered mobile application that converts spontaneous voice thoughts into structured tasks, calendar events, and reminders automatically.

---

## Problem Statement

People frequently record voice notes but rarely revisit them. 
NeuroNote bridges the gap between thought and action by converting voice input directly into structured productivity elements.

---

## MVP Features (Phase 1 Launch)

- Record voice input
- Convert speech to text
- Extract tasks and calendar events
- Display tasks in calendar view
- Schedule local reminders
- Store data locally (single device)

---

## System Architecture

Mobile (Flutter)
→ FastAPI Backend
→ Whisper (Speech-to-Text)
→ LLM (Task & Date Extraction)
→ Structured JSON Response
→ Local SQLite Storage
→ Calendar + Reminder Engine

---

## Tech Stack

- Flutter (Mobile App)
- FastAPI (Backend)
- Whisper (Speech Recognition)
- LLM (Structured Extraction)
- SQLite (Local Storage)

---

## Development Phases

Phase 0 – Planning & Architecture  
Phase 1 – Flutter Base Setup  
Phase 2 – Voice Recording + Transcription  
Phase 3 – NLP Extraction  
Phase 4 – Local Storage  
Phase 5 – Calendar Integration  
Phase 6 – Reminder Engine  
Phase 7 – Authentication  
Phase 8 – AI Smart Features  
Phase 9 – Deployment  
Phase 10 – Optimization
