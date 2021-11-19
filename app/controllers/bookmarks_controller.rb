class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list_id = @list.id
    if @bookmark.save
      redirect_to list_bookmarks_path(@list)
    else
      render 'new'
    end
  end

  def destroy
    @list = List.find(@bookmark.list_id)
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_bookmarks_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
