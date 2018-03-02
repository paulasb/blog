# controler dos posts
class ArticlesController < ApplicationController
  # para não precisar colocar o friendly em todos os find
  # olhar função find_article também, ela que mostra o friendly
  before_action :find_article, only: %i[show edit update destroy] 
  # para ver todos os articles
  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 3)
  end

  # redireciona-se o usuario para o show action acima
  def show
    @article = Article.friendly.find(params[:id])
    @comments = @article.comments.paginate(:page => params[:page], :per_page => 3)
  end

  def new
    @article = Article.new
  end

  def edit 
    #@article = Article.friendly.find(params[:id])
  end

  # para usar o Article model para salvar os dados no banco de dados
  def create
    # params[:article] possui os atributos do form
    # antes estava assim: @article = Article.new(params[:article])
    # entao cria-se a funcao "article_params" abaixo e fica assim:
    # @article = Article.new(article_params)
    # isso e feito para quais parametros sao permitidos na acao do controller
    @article = Article.new(article_params)

    # esse if indica para o usuario qual o erro da validacao no formulario
    # apesar da validacao estar ok em app/models/article
    # ela deve ser mostrada ao usuario
    if @article.save
      # faz uma nova requisicao,
      # mostrando o article que abacou de ser criado?
      redirect_to @article
    else
      render 'new' # nao faz requisicao, apenas recarrega a pagina?
    end
  end

  def update
    #@article = Article.friendly.find(params[:id])

    if @article.update(article_params)
      #flash[:notice] = "Post editado com sucesso"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    #@article = Article.friendly.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    # para eivtar que
    # violem os campos do form?
    params.require(:article).permit(:title, :text)
  end

  def find_article
    @article = Article.friendly.find(params[:id])
  end

  # mostra os parametros (atributos) do formulario, os valores inseridos
  # def create
  # render plain: params[:article].inspec
  # end
end
