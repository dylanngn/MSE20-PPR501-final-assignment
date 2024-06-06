# syntax=docker/dockerfile:1.4
FROM python:3.10-alpine AS builder 

WORKDIR /code

COPY requirements.txt /code
RUN --mount=type=cache,target=/root/.cache/pip \
    pip3 install -r requirements.txt

COPY . /code

EXPOSE 80

ENTRYPOINT ["python"]
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:80"]