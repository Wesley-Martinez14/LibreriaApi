#!/bin/bash
python LibreriaR/manage.py makemigrations &&
python LibreriaR/manage.py migrate &&
python LibreriaR/manage.py runserver 8080