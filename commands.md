Terminal A — emulator:

powershell
flutter emulators --launch Pixel_7

Wait until the emulator window shows the full Android home screen (not black, not loading).

Terminal B — backend:

powershell
cd D:\engineering\llm\neuronote\backend
.\venv\Scripts\Activate.ps1
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

Wait for Application startup complete.

Terminal C — Flutter:

powershell
cd D:\engineering\llm\neuronote\mobile_app
flutter run