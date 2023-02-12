class PostsController < ApplicationController

    before_action :get_group, only: [:index]
    before_action :get_post, only: [:show, :destroy]

    def index 
        @posts = @group.posts.all
    end 

    def new 
        @post = Post.new
    end 

    def create 
        @post = current_user.posts.new(post_params)
        
        if @post.save 
            redirect_to posts_url(group_id: @post.group_id)
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

    def destroy 
        if @post.destroy  
            redirect_to posts_url(group_id: params[:group_id])
        end
    end 

    private 

    def post_params 
        params.require(:post).permit(:title, :description, :group_id)
    end 

    def get_post 
        @post = Post.find_by_id(params[:id])
    end 

    def get_group
        @group = Group.find_by_id(params[:group_id])
    end
end

