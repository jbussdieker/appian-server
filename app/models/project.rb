class Project < ActiveRecord::Base
  attr_accessible :name, :user_id
  before_create :create_job
  before_destroy :delete_job

  has_one :repository

  # Not blank and unique to user
  belongs_to :user
  validates :name, :presence => true, :uniqueness => {:scope => :user_id}

  def create_job
    uri = URI::parse(ENV["APPIAN_BUILD_URL"])
    Jenkins::Api.setup_base_url(:host => uri.host, :port => uri.port)
    result = Jenkins::Api.create_job("#{user.name}-#{name}", Jenkins::JobConfigBuilder.new{})
    if result == false
      errors.add(:name, result )
      return false
    end
  end

  def delete_job
    uri = URI.parse("#{ENV["APPIAN_BUILD_URL"]}/job/#{user.name}-#{name}/doDelete")
    Net::HTTP.post_form(uri, {})

    # TODO: This part is broken
    #uri = URI::parse(ENV["APPIAN_BUILD_URL"])
    #Jenkins::Api.setup_base_url(:host => uri.host, :port => uri.port)
    #Jenkins::Api.delete_job("#{user.name}-#{name}")
  end

  def build_info
    uri = URI::parse(ENV["APPIAN_BUILD_URL"])
    Jenkins::Api.setup_base_url(:host => uri.host, :port => uri.port)
    Jenkins::Api.job "#{user.name}-#{name}"
  end
end
