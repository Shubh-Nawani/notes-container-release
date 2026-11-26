FROM python:3.12 AS build
WORKDIR /build
COPY app/requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.12-slim
WORKDIR /app
COPY --from=build /install /usr/local
COPY app/ ./app/
RUN useradd --create-home app
USER app
EXPOSE 5000
CMD ["python", "app/app.py"]
