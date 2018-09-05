FROM perl:5.28-slim
MAINTAINER Alexey Myshkin <parserpro@gmail.com>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libpng-dev curl tar make gcc libssl-dev iputils-ping mc
#RUN cd /bin && curl -L https://cpanmin.us/ -o cpanm && chmod +x cpanm
RUN cpanm --no-wget -n WWW::Mechanize::Chrome
RUN cpanm --no-wget -n Log::Log4perl
RUN cpanm --no-wget -n common::sense
RUN cpanm --no-wget -n utf8::all
RUN cpanm --no-wget -n Net::IDN::Encode
RUN cpanm --no-wget -n URI
RUN cpanm --no-wget -n LWP::Protocol::https
RUN apt autoremove
RUN rm -fr /var/cache/apt

WORKDIR /srv/autotest/
#COPY ./t ./t
