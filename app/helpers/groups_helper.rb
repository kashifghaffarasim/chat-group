module GroupsHelper

    def is_joined(group)
        GroupMember.where(group_id: group.id, user_id: current_user.id)
    end
end
