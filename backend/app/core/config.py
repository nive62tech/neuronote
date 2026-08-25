from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    ollama_host: str = "http://localhost:11434"
    ollama_model: str = "llama3.1"
    whisper_model: str = "base"
    database_url: str = "sqlite:///./neuronote.db"

    class Config:
        env_file = ".env"


settings = Settings()
