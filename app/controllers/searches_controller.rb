class SearchesController < ApplicationController

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == "item"
			@records = Item.search_for(@content, @method)
		elsif @model == "genre"
			@records = Genre.search_for(@content, @method)
			@records_genre =Item.where(genre_id: @records.ids)
		else
		  @records = Customer.search_for(@content, @method)
		end
	end
end
