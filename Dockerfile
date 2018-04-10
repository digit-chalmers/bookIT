FROM ruby:2.3.3
#
RUN apt-get update && apt-get install -y \
#Packages
net-tools \
nodejs

#Install gems
RUN mkdir /app
WORKDIR /app
COPY Gemfile* /app/
RUN bundle install

#Upload source
COPY . /app
RUN gem install sqlite3
RUN gem install mysql2
RUN useradd ruby
RUN chown -R ruby /app
USER ruby

# Database defaults
ENV DATABASE_NAME db/development.sqlite3
ENV DATABASE_HOST database
ENV DATABASE_USER root
ENV DATABASE_PASSWORD hello

# Start server
ENV RAILS_ENV development
ENV RACK_ENV development 
ENV SECRET_KEY_BASE secret
ENV PORT 3000
EXPOSE 3000

CMD ["sh", "start.sh"]
