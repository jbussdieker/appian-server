class Project < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user

  # Not blank and unique to user
  validates :name, :presence => true, :uniqueness => {:scope => :user_id}
end
