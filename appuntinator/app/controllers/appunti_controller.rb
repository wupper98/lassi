class AppuntiController < ApplicationController

	skip_before_action :authenticate_user!, only: [:show, :index]

	# GET
	def index
		@appunti = Appunto.all
		@user = current_user

		if user_signed_in? && UserProfile.where("user_id like ?", @user.id ).empty?
			UserProfile.create(:user_id => @user.id)
		end
	end
	
	def new
		@user = current_user.id
	end
	
	def edit
		id = params[:id]
		if Appunto.exists?(id: id)
			@appunto = Appunto.find(id)
			if @appunto.user_id != current_user.id && current_user.is_admin == false
				flash[:notice] = "Non è il tuo appunto"
				redirect_to appunti_path(@appunto)
			end
		else
			flash[:notice] = "Appunto non trovato"
			redirect_to appunti_index_path		
		end
	end
	
	def show
		id = params[:id]
		if Appunto.exists?(id: id)
			@appunto = Appunto.find(id)
			@comments = @appunto.comments

			@user = User.find(@appunto.user_id)
			
			@currentUser = current_user

			rating = 0
			counter = 0
			@comments.each do |c|
				rating += c.rating
				counter += 1
			end

			if counter > 0
				rating_medio = rating.to_f / counter.to_f
				@appunto.update_attribute :rating, (rating_medio).to_s
			end
		else
			redirect_to appunti_index_path
		end
	end
	
	# POST
	def create
		@appunto = Appunto.create(params[:appunto].permit(:contenuto, :release_date, :user_id, :category))

		redirect_to action: 'index'
	end
	
	# PATCH
	def update
		id = params[:id]
		user = current_user.id

		if Appunto.exists?(id: id)
			@appunto = Appunto.find(id)
			if @appunto.user_id == user || current_user.is_admin
				@appunto.update_attributes!(params[:appunto].permit(:contenuto))
				flash[:notice] = "Appunto correttamente modificato"
				redirect_to appunti_path(@appunto)
			end
		else
			flash[:notice] = "Non è il tuo appunto"
			redirect_to appunti_index_path
		end
	end
	
	# DELETE
	def destroy
		id = params[:id]
		user = current_user.id

		if Appunto.exists?(id: id)
			appunto = Appunto.find(id)
			if appunto.user_id == user || current_user.is_admin
				appunto.destroy
				flash[:notice] = "Appunto correttamente rimosso"
			else
				flash[:notice] = "Non è il tuo appunto"
			end
		end

		redirect_to appunti_index_path
	end
end
