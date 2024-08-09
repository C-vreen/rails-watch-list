class ListsController < ApplicationController
  # before_action :set_list, only: [:show]

# A user can see all the lists
# GET "lists"
  def index
    @lists = List.all
  end

  # A user can see the details of a given list and its name
  # GET "lists/42"
  def show
    @list = List.find(params[:id])
  end

  # A user can create a new list
  # GET "lists/new"
  def new
    @list = List.new
  end

  # POST "lists"
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  # def set_list
  #   @list = List.find(params[:id])
  # end
end
