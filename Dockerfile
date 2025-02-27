FROM ubuntu:22.04
WORKDIR /app
ENV PATH="/root/gems/bin:$PATH"
ENV GEM_HOME="/root/gems"
COPY Gemfile /app
RUN apt update && \
    apt install ruby-full build-essential zlib1g-dev -y && \
    gem install jekyll bundler
RUN echo $PATH $GEM_HOME
RUN apt install npm -y
RUN bundle install && npm install
RUN apt install git -y
ENTRYPOINT ["bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0"]
