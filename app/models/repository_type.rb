class RepositoryType < ActiveRecord::Base
  attr_accessible :caption

  has_many :repositories

  # Must have a caption
  validates :caption, :presence => true
end
