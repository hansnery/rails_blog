class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # Best way | Need helper method in app\helpers\articles_helper.rb
    @article = Article.new(article_params)
    
    # One way
    # @article = Article.new(
    #     title: params[:article][:title],
    #     body: params[:article][:body]
    # )

    # Another way
    # @article = Article.new
    # @article.title = params[:article][:title]
    # @article.body = params[:article][:body]

    @article.save

    flash.notice = "Article '#{@article.title}' created!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article '#{@article.title}' deleted!"

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' updated!"
  
    redirect_to article_path(@article)
  end

end
