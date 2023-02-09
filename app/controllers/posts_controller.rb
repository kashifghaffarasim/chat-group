class PostsController < ApplicationController

    before_action :get_post, only: [:show, :destory]

    def index 
        @posts = Post.all
    end 

    def new 
        @post = Post.new
    end 

    def create 
        @post = Post.new(post_params)
        if @post.save 
            redirect_to posts_url 
        else 
            render :new
        end
    end 

    def show 

    end 

    def update 
        if @posts.update(post_params) 
            redirect_to posts_url 
        else 
            render :new
        end
    end 

    def destory 
        
        if @post.destory  
            redirect_to posts_url 
        end
    end 

    private 

    def post_params 
        params.require(:comment).permit(:text, :post_id, :user_id, :comment_id)
    end 

    def get_post 
        @post = Post.find_by_id(params[:id])
    end 
end

