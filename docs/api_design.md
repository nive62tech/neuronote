# API Design

## Endpoint 1: Process Voice

POST /process-voice

### Input
Multipart form-data:
- audio_file (wav or m4a)

### Output

{
  "summary": "You have 1 task and 1 event.",
  "tasks": [
    {
      "title": "Finish ML assignment",
      "date": "2026-02-21",
      "time": null,
      "suggested_reminder": "2026-02-20T19:00:00"
    }
  ],
  "events": [
    {
      "title": "Presentation",
      "date": "2026-02-25",
      "time": "15:00",
      "suggested_reminder": "2026-02-25T14:30:00"
    }
  ]
}

All dates must be in ISO format.
No natural language responses allowed.
