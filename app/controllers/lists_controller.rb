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
		@list = List.new(list_params)
		if @list.save
			redirect_to list_path(@list)
		else
			# when writes but doesnt save, nothing happens
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
		params.require(:list).permit(:name, :image)
	end
end
