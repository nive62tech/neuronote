neuronote/
├── mobile_app/                     # Flutter app
│   ├── lib/
│   │   ├── main.dart
│   │   ├── screens/
│   │   │   ├── home_screen.dart
│   │   │   ├── record_screen.dart
│   │   │   ├── task_list_screen.dart
│   │   │   ├── calendar_screen.dart
│   │   │   └── settings_screen.dart
│   │   ├── widgets/
│   │   ├── services/
│   │   │   ├── api_service.dart
│   │   │   ├── audio_service.dart
│   │   │   └── notification_service.dart
│   │   ├── providers/
│   │   ├── models/
│   │   │   └── task_model.dart
│   │   └── utils/
│   ├── test/
│   └── pubspec.yaml
├── backend/                        # FastAPI
│   ├── app/
│   │   ├── main.py
│   │   ├── api/routes/
│   │   │   ├── transcribe.py
│   │   │   ├── extract.py
│   │   │   ├── tasks.py
│   │   │   └── auth.py
│   │   ├── core/config.py
│   │   ├── services/
│   │   │   ├── whisper_service.py
│   │   │   ├── llm_service.py
│   │   │   ├── dateparser_service.py
│   │   │   └── reminder_engine.py
│   │   ├── models/
│   │   ├── schemas/
│   │   └── db/database.py
│   ├── tests/
│   ├── requirements.txt
│   └── .env.example
├── docs/
│   ├── architecture.md
│   └── api_contract.md
└── README.md