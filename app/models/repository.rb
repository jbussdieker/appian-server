class Repository < ActiveRecord::Base
  attr_accessible :name, :project_id, :url
end
