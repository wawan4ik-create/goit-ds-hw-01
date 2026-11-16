# 1. Базовий образ: Python тієї версії, що в Pipfile
FROM python:3.13.3-slim

# 2. Робоча папка всередині контейнера
WORKDIR /app

# 3. Спершу файли залежностей (щоб Docker кешував цей шар)
COPY Pipfile Pipfile.lock ./

# 4. Встановлення залежностей
RUN pip install pipenv && pipenv install --system --deploy

# 5. Решта коду
COPY . .

# 6. Команда запуску за замовчуванням
CMD ["python", "task.py"]