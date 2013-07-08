class Status < ActiveRecord::Base
  attr_accessible :title
  has_one :project
end
