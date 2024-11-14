class BookmarksController < ApplicationController
  before_action :set_list
  before_action :set_movie, only: [:create, :destroy]

  def create
    @bookmark = @list.bookmarks.new(movie: @movie, comment: bookmark_params[:comment])

    if @bookmark.save
      redirect_to @list, notice: 'Movie bookmarked!'
    else
      redirect_to @list, alert: 'Failed to bookmark movie.'
    end
  end

  def destroy
    @bookmark = @list.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to @list, notice: 'Bookmark deleted.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
