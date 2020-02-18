class UsersController < ApplicationController
  def dashboard
    if !current_user
      redirect_to new_user_registration_path
    else
      @user = current_user
      @categories = current_user.following_projects.flat_map{|fp| fp.categories}
      @hash_pie = {}
      @categories.each do |cat|
        if @hash_pie[cat.name].nil?
          @hash_pie[cat.name] = 1
        else
            @hash_pie[cat.name] += 1
        end
    end
    end
  end
end
