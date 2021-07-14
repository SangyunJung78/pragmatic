FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/SangyunJung78/pragmatic.git

WORKDIR /home/pragmatic/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN echo "SECRET_KEY= django-insecure-+uih(td&b8aiw#&ay=am#hsbr1c!cl@n^)$dpng9dg8h_x=*(9" > .env

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "pragmatic.wsgi", "--bind", "0.0.0.0:8000"]
