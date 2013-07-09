class Project < ActiveRecord::Base
  attr_accessible :comment, :currency, :client_id, :date_of_start, :deadline, :manager_id, :name, :paid, :status, :to_pay, :totally, :programmer_ids, :currency_id, :status_id
  #belongs_to :currency
  # has_one :client
  #belongs_to :status

  belongs_to :client
  has_many :programmer_projects
  has_many :programmers, through: :programmer_projects
  belongs_to :manager
  

  validates :date_of_start, presence: true, format: { with: /(\d{4}\-\d{2}\-\d{2})/,
    message: "Only date, like yyyy-mm-dd" }
  validates :deadline, presence: true, format: { with: /(\d{4}\-\d{2}\-\d{2})/,
    message: "Only date, like yyyy-mm-dd" }
  validates :name, presence: true, uniqueness: true
  validates :totally, presence: true, format: { with: /^\d*\.?\d*$/,
    message: "Please enter number, like this '1,0'." }
  validates :paid, presence: true, format: { with: /^\d*\.?\d*$/,
    message: "Please enter number, like this '1,0'." }
  validates :date_of_start, :date => {:before => :deadline}

end

