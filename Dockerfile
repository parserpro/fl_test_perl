FROM perl:5.28-slim
MAINTAINER Alexey Myshkin <parserpro@gmail.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install libpng-dev curl tar make gcc && rm -fr /var/cache/apt

RUN cd /bin && curl -L https://cpanmin.us/ -o cpanm && chmod +x cpanm

RUN cpanm --no-wget -n WWW::Mechanize::Chrome
RUN cpanm --no-wget -n Log::Log4perl
RUN cpanm --no-wget -n common::sense
RUN cpanm --no-wget -n utf8::all


WORKDIR /srv/autotest/
COPY ./t ./t
#ENTRYPOINT ["prove", "./t"]
ENTRYPOINT ["./t/1.pl"]
