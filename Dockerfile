FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/SangyunJung78/pragmatic.git

WORKDIR /home/pragmatic/

RUN pip install -r requirements.txt

RUN echo "SECRET_KEY= django-insecure-+uih(td&b8aiw#&ay=am#hsbr1c!cl@n^)$dpng9dg8h_x=*(9" > .env

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
