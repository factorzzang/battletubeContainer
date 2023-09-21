# fastAPI 앱 빌드
FROM python:3.10 AS builder

WORKDIR /tunestar_app

COPY requirements.txt /tunestar_app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install pyyaml uvicorn requests opencv-python-headless
RUN pip install python-multipart httpx

COPY ./fastApiOnairTest /tunestar_app/

CMD ["uvicorn", "main:app", "--root-path", "/api", "--host", "0.0.0.0", "--port", "8000", "--proxy-headers"]

