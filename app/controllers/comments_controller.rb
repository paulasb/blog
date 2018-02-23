class CommentsController < ApplicationController

  def edit 
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(comment_params)
  end

  def update
    @article = Article.find(params[:article_id])

    if @article.comments.update(comment_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    # para mandar o usuario de volta para o post original
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
      params.require(:comment).permit(:commenter, :body)
  end
end
