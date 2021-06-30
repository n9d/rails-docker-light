FROM ruby:2.7 as ruby-base
RUN apt-get update && apt-get install -y nodejs
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s --



FROM ruby-base as initial
RUN apt-get update && apt-get install -y lv w3m
RUN mkdir /src
WORKDIR /src



FROM initial as development
WORKDIR /src



FROM ruby-base as production
COPY ./myapp /src/myapp
COPY ./Gemfile /src/
COPY ./Gemfile.lock /src/
COPY ./start.sh /src/
RUN bundle config --global build.nokogiri --use-system-libraries && bundle install
EXPOSE 3000
CMD ["start.sh"]
