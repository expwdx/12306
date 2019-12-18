FROM python:3.6-stretch
WORKDIR /usr/src/app
ADD . /usr/src/app

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Shanghai


## install python requirements
RUN pip install --upgrade pip
RUN pip install -i https://mirrors.aliyun.com/pypi/simple pyspider --no-cache-dir -r requirements.txt
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

## install ntpdate, not accept but saving code
#RUN echo 'deb http://mirrors.163.com/debian/ jessie main non-free contrib \
#	deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib \
#	deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib' > /etc/apt/sources.list \
#	&& apt-get update\
#	&& apt-get install ntpdate -y \


#EXPOSE 5010

#CMD [ "python", "run.py" ]

RUN chmod u+x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
