class BookmarksController < ApplicationController
	def new
		@bookmark = Bookmark.new
	end

	def create
		@bookmark = Bookmark.new(bookmark_params)
		@bookmark.list = @list
		if @bookmark.save
			redirect lists_path
		else
			render :new
		end
	end

	def destroy
		@bookmark = Bookmark.find(params[:id])
		@bookmark.destroy
		redirect_to lists_path
	end

	private

	def bookmark_params
		params.require(:bookmark).permit(:comment)
	end
end
