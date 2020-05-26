class UserProfileController < ApplicationController
    def index
        if user_signed_in?
            @user = current_user
            @appunti = Appunto.where(user_id: @user.id)

            trust = 0

            @appunti.each do |app|
                if app.comm_counter > 0
                    if app.rating.to_f >= 3
                        trust += 1
                    else
                        trust -= 1
                    end
                end
            end
            @user.update_attributes(:trust_level => trust )

        else
            redirect_to appunti_index_path
        end
    end

    def show
        @user = User.find(params[:id])
        @appunti = Appunto.where(user_id: @user.id)

        trust = 0
        @appunti.each do |app|
            if app.comm_counter > 0
                if app.rating.to_f >= 3
                    trust += 1
                else
                    trust -= 1
                end
            end
        end
        @user.update_attributes(:trust_level => trust )
    end
end
