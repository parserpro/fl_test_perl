FROM perl:5.28-slim
MAINTAINER Alexey Myshkin <parserpro@gmail.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install libpng-dev curl tar make gcc && \
    cd /bin && curl -L https://cpanmin.us/ -o cpanm && chmod +x cpanm && \
    cpanm --no-wget -n WWW::Mechanize::Chrome && \
    cpanm --no-wget -n Log::Log4perl && \
    cpanm --no-wget -n common::sense && \
    cpanm --no-wget -n utf8::all && \
    apt autoremove && \
    rm -fr /var/cache/apt

WORKDIR /srv/autotest/
COPY ./t ./t
#ENTRYPOINT ["prove", "./t"]
ENTRYPOINT ["./t/1.pl"]
