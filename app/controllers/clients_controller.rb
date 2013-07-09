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
     redirect_to @client
   else
     render 'new'
   end
  end

  def update

  	unless params[:client_id].nil?
  		@client_update = Client.find(params[:client_id])
  		updated = false
  		render :partial => 'update'
  	else
  		updated = Client.update(params[:client][:id], params[:client])
  		if updated
        render js: "location.reload();"
      else
        render js: "alert('Didn`t update. Please, try againe!');"
      end
  	end

  end
  
  def delete
    Client.find(params[:id_client]).destroy
    render js: "location.reload();"
  end
end
