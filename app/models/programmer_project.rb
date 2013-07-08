class ProgrammerProject < ActiveRecord::Base
  attr_accessible :programmer_id, :project_id
  belongs_to :programmer
  belongs_to :project
end
