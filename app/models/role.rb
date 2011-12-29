class Role < ActiveRecord::Base
  has_many :users
  validates :rolename, :presence => true
end