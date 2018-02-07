FROM ruby:2.5

EXPOSE 3000

ENV APP_HOME /meal_delivery

RUN apt-get update -qq \
  && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    qt5-default\
    libqt5webkit5-dev\
    gstreamer1.0-plugins-base\
    gstreamer1.0-tools gstreamer1.0-x\
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
