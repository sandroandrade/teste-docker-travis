FROM python

ARG requirements=requirements/production.txt
ENV DJANGO_SETTINGS_MODULE=djangodocker.settings.development
WORKDIR /app

COPY djangodocker djangodocker
COPY manage.py pytest.ini /app/
COPY requirements/ /app/requirements/

RUN pip install -r $requirements && \
    python manage.py collectstatic --noinput

EXPOSE 8001

CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]
