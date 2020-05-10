FROM python:3.6

COPY . /app

RUN apt-get -y update
RUN apt-get -y install --no-install-recommends binutils
WORKDIR /app
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r /app/requirements.txt

RUN python manage.py migrate
RUN python manage.py collectstatic --noinput

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
