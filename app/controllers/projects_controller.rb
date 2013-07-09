class ProjectsController < ApplicationController
  
  def index
    @projects_all = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

    @project.to_pay = params[:project][:totally].to_f - params[:project][:paid].to_f


    if @project.save

      params[:project][:programmer_ids].each do |programmer_id|
        unless programmer_id == ""
          @programmer_project = ProgrammerProject.new(params[programmers_id: programmer_id,project_id: @project.id])
          @programmer_project.save
        end
      end
      redirect_to projects_path

    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    @project.to_pay = params[:project][:totally].to_f - params[:project][:paid].to_f
    
    if @project.update_attributes(params[:project])


        params[:project][:programmer_ids].each do |programmer_id|

          unless programmer_id == ""
            @programmer_project = ProgrammerProject.find_by_project_id(params[:id])
            @programmer_project.update_attributes(params[programmers_id: programmer_id,project_id: @project.id])
          end
        end  

        redirect_to projects_path

      else
        render 'edit'
      end
  end

  def destroy
    # binding.pry
    Project.find(params[:id]).destroy

    ProgrammerProject.where("project_id = ?", params[:id]).each do |p_p|
      p_p.destroy
    end
    redirect_to projects_path
  end

end
