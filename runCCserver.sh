#!/bin/bash
source venv/bin/activate
python megaCcenter/ccAdmin/src/manage.py runserver 0.0.0.0:8000 &
