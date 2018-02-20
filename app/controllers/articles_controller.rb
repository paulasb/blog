class ArticlesController < ApplicationController
	def index #para ver todos os articles
    	@articles = Article.all
  	end
  	
	def show #edireciona-se o ususario para o show action acima
    	@article = Article.find(params[:id])
  	end

	def new
 	end
	
	def create # para usar o Article model para salvar os dados no banco de dados
		#params[:article] possui os atributos do form 
		#antes estava assim: @article = Article.new(params[:article])
		#então cria-se a funcao "article_params" abaixo e fica assim: @article = Article.new(article_params) 
	  	#isso é feito para quais parametros sao permitidos na ação do controller
	  	@article = Article.new(article_params) 
	 
	  	@article.save
	  	redirect_to @article
	end
	 
	private
	  def article_params
	    params.require(:article).permit(:title, :text)#para eivtar que violem os campos do form?
	  end

	#mostra os parametros (atributos) do formulario, os valores inseridos
	#def create
	  #render plain: params[:article].inspect
	#end
	end

