class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new

  end

  def create 
    @client = Client.new(params[:client])
  
   if @client.save
     redirect_to clients_path
   else
     render 'new'
   end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
  @client = Client.find(params[:id])
 
  if @client.update_attributes(params[:client])
    redirect_to @client
  else
    render 'edit'
  end

  end
  
  def destroy
    Client.find(params[:id]).destroy
    redirect_to clients_path
  end

end

#   unless params[:client_id].nil?
 #    @client = Client.find(params[:client_id])
 #    updated = false
  #   render :partial => 'update'
  # else
  #   updated = Client.update(params[:client][:id], params[:client])
  #   if updated
   #     render 'index'
    #  else
     #   render :partial =>'update'
      #end
  # end