class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @post = Post.all
    end

    def show
    end

    def new
        @post = Post.new
    end

    def edit
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path, notice: "投稿に成功しました"
        else
            render :new
        end
    end

    def update
        if @post.update(post_params)
            redirect_to root_path, notice: "投稿を更新しました"
        else
            render :edit
        end
    end

    def destroy
        if @post.destroy
            render_to root_path, notice: "投稿を削除しました"
        else
            render_to root_path, alert: "投稿を削除できませんでした"
        end
    end

    private

    def post_params
        params.require(:post).permit(
            :content
        )
    end

    def find_post
        @post = Post.find(params[:id])
    end
end
