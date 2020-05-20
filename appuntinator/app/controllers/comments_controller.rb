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
end