class ProgrammersController < ApplicationController
  def index
  	@programmers = Programmer.all
  end

  def show
    @programmer = Programmer.find(params[:id])
  end

  def new
    @programmer = Programmer.new
  end

  def create
    @programmer = Programmer.new(params[:programmer])
  
   if @programmer.save
     redirect_to programmers_path
   else
     render 'new'
   end
  end

  def edit
    @programmer = Programmer.find(params[:id])
  end

  def update

  	@programmer = Programmer.find(params[:id])
 
    if @programmer.update_attributes(params[:programmer])
      redirect_to programmers_path
    else
      render 'edit'
    end

  end

  def destroy
    Programmer.find(params[:id]).destroy
    redirect_to programmers_path
  end
end
