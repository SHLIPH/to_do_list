class ListsController < ApplicationController
  before_action :set_list, :only => [:show, :edit, :update, :destroy, :is_public]

  def index
    @lists = List.order("due_date DESC")
  end

  def is_done
    @list.update(done: !(@list.done))
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_url
    else
      render :action => :new
    end
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to list_path(@list)
    else
      render :action => :edit
    end
  end

  def destroy
    @list.destroy

    redirect_to lists_url
  end

  def check

      @list = List.find(params[:id])

      if @list.done == false
        @type = "1"
      elsif @list.done == true
        @type = "2"
      else
        @type = "0"
      end

      @list.done = !@list.done;
      @list.save


      redirect_to lists_path(@list, flag: @type)
    end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :due_date, :note)
  end
end
