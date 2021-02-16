FROM python 
WORKDIR /app
COPY . /app
RUN pip install -r FakeCheck/requirements.txt
ENTRYPOINT rm -f db.sqlite3 &&\
           rm -f ./*/migrations/0*.py &&\
           python manage.py makemigrations &&\
           python manage.py migrate &&\
           python manage.py loaddata db.json &&\
           python manage.py runserver 0.0.0.0:8000

