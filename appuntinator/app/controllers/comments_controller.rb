class CommentsController < ApplicationController
    def new
    end

    def create
        id = params[:appunti_id]
        user = current_user.id
        if Appunto.exists?(id)
            @appunto = Appunto.find(id)
            if(user != @appunto.user_id) 
                @comment = Comment.new(params[:comment].permit(:rating, :body))
                @comment.user_id = user
                @comment.appunto_id = id
                @comment.save!
                flash[:notice] = "Commento aggiornato!"
                @appunto.update_attribute :comm_counter, @appunto.comm_counter+1
            else
                flash[:notice] = "Non puoi commentare un tuo appunto"
            end
            redirect_to appunti_path(@appunto)
        end
    end

    def edit
        appunto_id = params[:appunti_id]
        comment_id = params[:id]

        if Appunto.exists?(appunto_id) && Comment.exists?(comment_id)
            @appunto = Appunto.find(appunto_id)
            @commento = Comment.find(comment_id)

            if @commento.user_id != current_user.id
                flash[:notice] = "Non è il tuo commento"
                redirect_to appunti_path(appunto_id)
            end
        
        else
            flash[:notice] = "Commento non trovato"
            redirect_to appunti_path(comment_id)
        end
    end
    
    # PATCH
	def update
		id = params[:id]
		if Comment.exists?(id: id)
            @commento = Comment.find(id)
			@commento.update_attributes!(params[:comment].permit(:body, :rating))
			redirect_to appunti_path(Appunto.find(params[:appunti_id]))
		else
			redirect_to appunti_index_path
		end
	end
	
    # DELETE
    def destroy
        id = params[:id]
        comment_id = params[:appunti_id]

        if Comment.exists?(id)
            @commento = Comment.find(id)
            if @commento.user_id == current_user.id
                @commento.destroy
                flash[:notice] = "Commento correttamente rimosso"
            else
                flash[:notice] = "Non è il tuo commento"
            end
        else
            flash[:notice] = "Commento non trovato"
        end
        
		redirect_to appunti_path(Appunto.find(comment_id))
	end
end