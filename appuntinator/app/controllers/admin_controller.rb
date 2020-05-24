class AdminController < ApplicationController
    def index
        if user_signed_in? && current_user.is_admin
            @utenti = User.all
        else
            redirect_to root_path
        end
    end

    def edit
        user = User.find(params[:id])
        user.destroy!
        flash[:notice] = "Utente correttamente rimosso"
        redirect_to admin_index_path
    end

end
