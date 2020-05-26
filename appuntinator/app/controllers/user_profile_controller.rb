class UserProfileController < ApplicationController
    def index
        if user_signed_in?
            @user = current_user
            @appunti = Appunto.where(user_id: @user.id)

            @appunti.each do |app|
                if app.comm_counter > 0
                    if app.rating.to_f >= 3
                        @user.trust_level += 1
                    else
                        @user.trust_level -= 1
                    end
                end
            end
        else
            redirect_to appunti_index_path
        end
    end

    def show
        @user = User.find(params[:id])
        @appunti = Appunto.where(user_id: @user.id)
        @appunti.each do |app|
            if app.comm_counter > 0
                if app.rating.to_f >= 3
                    @user.trust_level += 1
                else
                    @user.trust_level -= 1
                end
            end
        end
    end
end
