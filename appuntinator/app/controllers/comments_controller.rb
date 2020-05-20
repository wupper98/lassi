class CommentsController < ApplicationController
    def new
    end

    def create
        id = params[:appunti_id]
        user = current_user.id
        if Appunto.exists?(id)
            @appunto = Appunto.find(id)
            @comment = Comment.new(params[:comment].permit(:rating, :body))
            @comment.user_id = user
            @comment.appunto_id = id
            @comment.save!
            redirect_to appunti_path(@appunto)
        end
    end

    def edit
        appunto_id = params[:appunti_id]
        comment_id = params[:id]
        @appunto = Appunto.find(appunto_id)
        @commento = Comment.find(comment_id)
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

        @commento = Comment.find(id)
        @commento.destroy
        
		redirect_to appunti_path(Appunto.find(comment_id))
	end
end