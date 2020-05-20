class AppuntiController < ApplicationController

	skip_before_action :authenticate_user!, only: [:show, :index]

	# GET 
	def index
		@appunti = Appunto.all
		@user = current_user
	end
	
	def new
	end
	
	def edit
		id = params[:id]
		if Appunto.exists?(id: id)
			@appunto = Appunto.find(id)
		else
			redirect_to appunti_index_path
		end
	end
	
	def show
		id = params[:id]
		if Appunto.exists?(id: id)
			@appunto = Appunto.find(id)
			@comments = @appunto.comments

			rating = 0
			counter = 0
			@comments.each do |c|
				rating += c.rating
				counter += 1
			end

			rating_medio = rating.to_f / counter.to_f

			@appunto.update_attribute :rating, (rating_medio).to_s

		else
			redirect_to appunti_index_path
		end
	end
	
	# POST
	def create
		Appunto.create(params[:appunto].permit(:contenuto, :release_date, :rating))
		redirect_to action: 'index'
	end
	
	# PATCH
	def update
		id = params[:id]
		if Appunto.exists?(id: id)
            @appunto = Appunto.find(id)
			@appunto.update_attributes!(params[:appunto].permit(:contenuto, :release_date))
			redirect_to appunti_path(@appunto)
		else
			redirect_to appunti_index_path
		end
	end
	
	# DELETE
	def destroy
		id = params[:id]
		if Appunto.exists?(id: id)
			@appunto = Appunto.find(id)
			@appunto.destroy
			redirect_to appunti_index_path
		else
			redirect_to appunti_index_path
		end
	end
end
