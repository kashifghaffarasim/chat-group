class CommentsController < ApplicationController

    before_action :get_comment, only: [:show, :destory]

    def index 
        @comment = current_user.comments.where(post_id: params[:post_id])
    end 

    def new 
        @comment = Comment.new
    end 

    def create 
        @comment = current_user.comments.new(comment_params)
        
        if @comment.save 
            redirect_to post_url(id: params[:comment][:post_id]) 
        else 
            render :new
        end
    end 

    def show 

    end 

    def update 
        if @comment.update(comment_params) 
            redirect_to posts_url 
        else 
            render :new
        end
    end 

    def destory 
        
        if @comment.destory  
            redirect_to posts_url 
        end
    end 

    private 

    def comment_params 
        params.require(:comment).permit(:text, :post_id, :comment_id)
    end 

    def get_comment 
        @comment = Comment.find_by_id(params[:id])
    end 
end
