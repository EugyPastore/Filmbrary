class ListsController < ApplicationController
	def index
		@lists = List.all
	end

	def show
		@list = List.find(params[:id])
	end

# instantiate the form
	def new
		@list = List.new
	end

	def create
		if
			@list = List.create(list_params)
			redirect_to list_path(@list)
		else
			render :new
		end

	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy
		redirect_to lists_path
	end

	private
#whitelisting for security
	def list_params
	params.require(:list).permit(:name)
	end
end
