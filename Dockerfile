FROM python:3.7.0

MAINTAINER vbutacu

COPY web/ /opt/webshop/

RUN pip3 install --user bottle

ENTRYPOINT [ "/usr/local/bin/python3", "/opt/webshop/web.py" ]

EXPOSE 8080/tcp