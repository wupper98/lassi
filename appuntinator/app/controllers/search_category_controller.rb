class SearchCategoryController < ApplicationController
    def show
        @category = params[:id]
        @appunti = Appunto.where(category: @category)
    end
end
