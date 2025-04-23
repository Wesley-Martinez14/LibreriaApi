#!/bin/bash
apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*
python LibreriaR/manage.py makemigrations &&
python LibreriaR/manage.py migrate &&
python LibreriaR/manage.py runserver 8080