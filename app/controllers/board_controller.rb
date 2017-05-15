class BoardController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @show_post = Post.find(params[:post_id])
  end

  def new
    
  end
  
  def delete
  del_post = Post.find(params[:post_id])
  del_post.destroy
  redirect_to '/'

  end
  
  def create
    post_new = Post.new
    post_new.title=params[:title]
    post_new.editor= params[:editor]
    post_new.content= params[:content]
    
    post_new.save
    redirect_to '/'
  end

  def edit
    @upd_post = Post.find(params[:post_id])
  end
  
  def update
    upd_post = Post.find(params[:post_id])
    upd_post.title = params[:title]
    upd_post.editor = params[:editor]
    upd_post.content = params[:content]
    upd_post.save
    
    show_path = "/show/" +params[:post_id]
    redirect_to show_path
  end
end
