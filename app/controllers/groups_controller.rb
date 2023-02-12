class GroupsController < ApplicationController

    before_action :get_group, only: [:show, :destory]

    def index 
        @groups = Group.all  
        # @my_group = current_user.groups.all 
        @joined_ground = Group.all 
    end 

    def my_group
        @groups = current_user.groups.all 
    end

    def joined_group
        group_ids = current_user.group_members.collect(&:group_id)
        @groups = Group.where(id: group_ids)
    end


    def joined 
       member =  current_user.group_members.new(group_id: params[:id])
       member.save 
       redirect_to dashboards_path
    end 

    def new 
        @group = Group.new
    end 

    def create 
        @group = Group.new(group_params)
        @group.user_id = current_user.id 
        if @group.save 
            redirect_to dashboards_url 
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
        params.require(:group).permit(:name)
    end 

    def get_group 
        @group = Group.find_by_id(params[:id])
    end 
end

