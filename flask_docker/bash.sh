#!/bin/bash

# Directorio de trabajo dentro del contenedor
WORKDIR="/flask_docker"

# Nombre de la imagen de Docker
IMAGE_NAME="flask-app"

# Construir la imagen de Docker
docker build -t "$IMAGE_NAME" - <<EOF
FROM python:3.9

WORKDIR $WORKDIR

COPY . $WORKDIR

RUN pip install flask ping3

EXPOSE 1018

CMD ["python", "$WORKDIR/app1.py"]
EOF

# Ejecutar el contenedor de Docker
docker run -p 1018:1018 "$IMAGE_NAME"

