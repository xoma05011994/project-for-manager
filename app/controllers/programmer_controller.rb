class ProgrammerController < ApplicationController
  def show
  	@programmers_all = Programmer.all
  	@programmer_new = Programmer.new
  end

  def new
  	Programmer.create(params[:programmer])
  	render js: "location.reload();"
  end

  def update

  	unless params[:programmer_id].nil?
  		@programmer_update = Programmer.find(params[:programmer_id])
  		updated = false
  		render :partial => 'update'
  	else
  		updated = Programmer.update(params[:programmer][:id], params[:programmer])
  		if updated
        render js: "location.reload();"
      else
        render js: "alert('Didn`t update. Please, try againe!');"
      end
  	end

  end

  def delete
    Programmer.find(params[:id_programmer]).destroy
    render js: "location.reload();"
  end
end
