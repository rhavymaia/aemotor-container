FROM python:3.11-alpine

WORKDIR /usr/src/app

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
# watch app' files
ENV FLASK_DEBUG=true
ENV FLASK_ENV=development

RUN apk add --no-cache gcc musl-dev linux-headers

COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./app .

EXPOSE 5000

# running Flask as a module
CMD ["flask", "run"]