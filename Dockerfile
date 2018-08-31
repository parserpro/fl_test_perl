FROM perl:5.28-slim
MAINTAINER Alexey Myshkin <parserpro@gmail.com>

RUN apk update && apk add curl tar make gcc build-base chrome && rm -fr /var/cache/apk/*

RUN cd /bin && curl -L https://cpanmin.us/ -o cpanm && chmod +x cpanm

RUN cpanm --no-wget -n WWW::Mechanize::Chrome


WORKDIR /srv/autotest/
COPY ./t ./t
ENTRYPOINT ["prove", "./t"]
