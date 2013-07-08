class ClientController < ApplicationController
  def show
  	@clients_all = Client.all
  	@client_new = Client.new
    
  end

  def new

  	Client.create(params[:client])
  	render js: "location.reload();"

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
