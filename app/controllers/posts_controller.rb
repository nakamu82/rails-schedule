class PostsController < ApplicationController
  def index
    @posts = Post.all
    #@posts = Post.all.order(〇〇_at::desc) 
    #すべてのレコードを取り出し、＠でビューに渡す
  end
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to("/posts")     
    else
      flash.now[:notice] = "失敗しました"
      render :new
    end
  end

  def show
    @id = params[:id]
    @post = Post.find_by(id:params[:id])
    if @post.nil? 
      redirect_to posts_path, alert: "投稿が見つかりませんでした" 
    end
  end

  def edit
    @post = Post.find_by(id:params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
    #@post.title = params[:title]
    #@post.content = params[:content]
    #@post.save
    flash[:notice] = "スケジュールを更新しました"
    redirect_to("/posts")
    else
      flash.now[:notice] = "失敗しました"
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post
      @post.destroy
      flash[:notice] = "スケジュールを削除しました"
    else
      flash.now[:notice] = "失敗しました"
    end
    redirect_to("/posts")
  end

  def post_params
  params.require(:post).permit(:title, :content, :start_time, :end_time, :all_day)
  end
  
end
