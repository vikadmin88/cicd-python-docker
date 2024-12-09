FROM python:3

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py db.py ./

EXPOSE 5000

# Populate database
RUN python db.py -a

ENTRYPOINT [ "python", "app.py" ]
CMD ["--host", "0.0.0.0", "--port", "5000"]