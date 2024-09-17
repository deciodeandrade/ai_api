# Usa a imagem oficial do Ruby
FROM ruby:3.2.0

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y build-essential nodejs sqlite3 libsqlite3-dev

# Define o diretório de trabalho no container
WORKDIR /app

# Copia o Gemfile e o Gemfile.lock para o container
COPY Gemfile Gemfile.lock ./

# Instala as gems
RUN bundle install

# Copia o restante do código da aplicação para o container
COPY . .

# Exposição da porta para o servidor
EXPOSE 3000

# Configura o comando padrão para iniciar o servidor
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
