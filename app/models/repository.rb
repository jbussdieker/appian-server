class Repository < ActiveRecord::Base
  attr_accessible :name, :repository_type_id, :project_id, :url

  # Must have a type
  has_one :repository_type
  validates :repository_type_id, :presence => true

  # Must be owned by a project
  belongs_to :project
  validates :project_id, :presence => true

  # Must have a url
  validates :url, :presence => true
end
