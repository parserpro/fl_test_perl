FROM perl:5.28-slim
MAINTAINER Alexey Myshkin <parserpro@gmail.com>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libpng-dev curl tar make gcc libssl-dev && \
    cpanm --no-wget -n WWW::Mechanize::Chrome@0.34 && \
    cpanm --no-wget -n Log::Log4perl && \
    cpanm --no-wget -n common::sense && \
    cpanm --no-wget -n utf8::all && \
    cpanm --no-wget -n Net::IDN::Encode && \
    cpanm --no-wget -n URI && \
    cpanm --no-wget -n LWP::Protocol::https && \
    apt autoremove && \
    rm -fr /var/cache/apt

WORKDIR /srv/autotest/
