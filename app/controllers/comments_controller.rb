class CommentsController < ApplicationController
  def index
    @comments = @article.comments.paginate(:page => params[:page], :per_page => 5)
  end

  def edit 
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def create
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    # para mandar o usuario de volta para o post original
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
      params.require(:comment).permit(:commenter, :body)
  end
end
