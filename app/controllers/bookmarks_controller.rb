class BookmarksController < ApplicationController
  before_action :set_list, only: :destroy
  before_action :set_list, only: [:new, :create]

  # A user can add a new bookmark (movie/list pair) to an existing list
  # Checkout simple_form docs about f.association to easily create a select dropdown for our list of movies.
  # GET "lists/42/bookmarks/new"
  def new
    @bookmark = Bookmark.new
  end

  # POST "lists/42/bookmarks"
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # A user can delete a bookmark from a list. How can we make a delete link again?
  # DELETE "bookmarks/25"
  def destroy
    @bookmark.destroy
    redirect_to lists_path(@bookmark.list_id), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def set_bookmark
   @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:id])
  end
end
