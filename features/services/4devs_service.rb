# frozen_string_literal: true

# Módulo para ser utilizado em qualquer chamada de API do 4Devs.
module ForDevs
  include HTTParty
  base_uri 'https://www.4devs.com.br'
  headers 'Content-Type': 'application/x-www-form-urlencoded'
end
