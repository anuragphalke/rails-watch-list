class BookmarksController < ApplicationController
  before_action :set_list

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to @list, notice: 'Movie added!'
    else
      redirect_to @list, alert: "Failed to add the movie. #{@bookmark.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    @bookmark = @list.bookmarks.find(params[:id])  # Find the bookmark by its ID in the list
    @bookmark.destroy
    redirect_to @list, notice: 'Bookmark removed.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])  # Find the list by the list_id param
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
