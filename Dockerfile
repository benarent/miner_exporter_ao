
FROM python:3.8-slim-buster
#LABEL org.opencontainers.image.source https://github.com/tedder/miner_exporter
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get upgrade -y && apt-get clean

COPY requirements.txt /opt/app/
RUN pip3 install -r /opt/app/requirements.txt

WORKDIR /opt/app
ADD . /opt/app

# copying the py later than the reqs so we don't need to rebuild as often
COPY *py /opt/app/
CMD /opt/app/miner_exporter_AO.py
