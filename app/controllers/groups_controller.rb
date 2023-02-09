class GroupsController < ApplicationController

    before_action :get_group, only: [:show, :destory]

    def index 
        @groups = Group.all  
        @my_group = current_user.groups.all 
        @joined_ground = Group.all 
    end 


    def new 
        @group = Group.new
    end 

    def create 
        @group = Group.new(group_params)
        if @group.save 
            redirect_to groups_url 
        else 
            render :new
        end
    end 

    def show 

    end 

    def update 
        if @group.update(group_params) 
            redirect_to posts_url 
        else 
            render :new
        end
    end 

    def destory 
        
        if @group.destory  
            redirect_to groups_url 
        end
    end 

    private 

    def group_params 
        params.require(:group).permit(:text, :post_id, :user_id, :comment_id)
    end 

    def get_group 
        @group = Group.find_by_id(params[:id])
    end 
end

