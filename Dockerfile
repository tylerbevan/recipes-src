FROM python:latest
RUN pip3 install pelican
WORKDIR /opt
ADD blueidea /opt/blueidea/
ADD content /opt/content/
ADD pelicanconf.py /opt/pelicanconf.py
RUN pelican /opt/content -o /opt/output -s /opt/pelicanconf.py -t /opt/blueidea

FROM nginx:latest
COPY --from=0 /opt/output /usr/share/nginx/html/

