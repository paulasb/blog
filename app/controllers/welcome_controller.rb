# mostra a pagina home do blog
class WelcomeController < ApplicationController
  def index
  	@ultimo_post = Article.last
  end
end
