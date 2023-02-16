module PagesHelper
    def active_relation?(user)
        is_active = Relationship.find_by(following: current_user.id, followed: user.id)
        puts "is_active"
        puts !!is_active
        return !!is_active
    end
end 