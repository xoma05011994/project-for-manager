class ProjectController < ApplicationController
  def projects

    @projects_all = Project.all
    @project_new = Project.new
    @clients_all = Client.all
    @managers_all = Manager.all
    @programmers_all = Programmer.all
    @statuses_all = Status.all
    @currencies_all = Currency.all
    @programmer_ids = Programmer.select("id")
    @programmer_last_names = Programmer.select("last_name")
  end

  def new

    new_project = Project.new
      new_project.client_id = params[:project][:client]
      new_project.currency_id = params[:project][:currency] 
      new_project.name = params[:project][:name] 
      new_project.manager_id = params[:project][:manager]  
      new_project.status_id = params[:project][:status] 
      new_project.date_of_start = params[:project][:date_of_start] 
      new_project.deadline = params[:project][:deadline]
      new_project.totally = params[:project][:totally] 
      new_project.paid = params[:project][:paid] 
      new_project.to_pay = params[:project][:totally].to_f - params[:project][:paid].to_f
      new_project.comment = params[:project][:comment]


    if new_project.save

      last_project = Project.last

      params[:project][:programmer_ids].each do |programmer_id|
        unless programmer_id == ""
          programmer_project = ProgrammerProject.new
          programmer_project.programmer_id = programmer_id
          programmer_project.project_id = last_project.id
          programmer_project.save
        end
      end
      render js: "location.reload();"

    else

      render js: "alert('Didn`t save. Please, try againe!');"

    end
  end

  def delete
    # binding.pry
    Project.find(params[:id_project]).destroy
    ProgrammerProject.where("project_id = ?", params[:id_project]).each do |p_p|
      p_p.destroy
    end
    render js: "location.reload();"
  end

  def update
    # binding.pry
    unless params[:project_id].nil?

      @project_update = Project.find(params[:project_id])
      @programmer_ids = Programmer.select("id")
      @programmer_last_names = Programmer.select("last_name")
      updated = false
      render :partial => 'update'

    else
      to_pay = params[:project][:totally].to_f - params[:project][:paid].to_f
      updated = Project.update(params[:project][:id], 
        :client_id => params[:project][:client], 
        :currency_id => params[:project][:currency],
        :name => params[:project][:name],
        :manager_id => params[:project][:manager],
        :status_id => params[:project][:status],
        :date_of_start => params[:project][:date_of_start],
        :deadline => params[:project][:deadline],
        :totally => params[:project][:totally],
        :paid => params[:project][:paid],
        :to_pay => to_pay,
        :comment => params[:project][:comment])

      if updated
        ProgrammerProject.where("project_id = ?", params[:project][:id]).each do |p_p|
          p_p.destroy
        end

        updated_project = Project.find(params[:project][:id])

        params[:project][:programmer_ids].each do |programmer_id|
          unless programmer_id == ""
            programmer_project = ProgrammerProject.new
            programmer_project.programmer_id = programmer_id
            programmer_project.project_id = updated_project.id
            programmer_project.save
          end
        end  
        render js: "location.reload();"
      else
        render js: "alert('Didn`t update. Please, try againe!');"
      end
    end
  end

end
