FROM centos:7
MAINTAINER JOSE GOMEZ

ADD get-pip.py .

RUN yum -y update && \
    yum -y install epel-release \
    yum -y clean all

RUN python get-pip.py 
RUN pip install virtualenv
ADD requirements.txt .
RUN virtualenv appenv
RUN . /appenv/bin/activate && \
    pip install -r requirements.txt


ADD entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]

EXPOSE 8080
# Add application source
COPY megaCcenter/ccAdmin/src /application
WORKDIR /application
