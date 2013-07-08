class ManagerController < ApplicationController
  def show
  	@managers_all = Manager.all
  	@manager_new = Manager.new
  end

  def new

  	Manager.create(params[:manager])
  	render js: "location.reload();"

  end

  def update

  	unless params[:manager_id].nil?
  		@manager_update = Manager.find(params[:manager_id])
  		updated = false
  		render :partial => 'update'
  	else
  		updated = Manager.update(params[:manager][:id], params[:manager])
  		if updated
        render js: "location.reload();"
      else
        render js: "alert('Didn`t update. Please, try againe!');"
      end
  	end

  end

  def delete
    Manager.find(params[:id_manager]).destroy
    render js: "location.reload();"
  end
end

