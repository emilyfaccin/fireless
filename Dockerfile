FROM ruby:3.0.1

# instalacao do nodejs e yarn
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update -qq && apt install -y nodejs yarn postgresql-client


# criacao diretorio da app
WORKDIR /var/www/fireless

COPY Gemfile /var/www/fireless/Gemfile
COPY Gemfile.lock /var/www/fireless/Gemfile.lock

# instala as gems
RUN bundle install

# copia o projeto para o container
COPY . /var/www/fireless/

# concede permissao de execucao e define o arquivo entrypoint
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]