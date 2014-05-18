class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  validates :price, :description, :user, :job, presence: true
end
