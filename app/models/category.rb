class Category < ActiveRecord::Base
  acts_as_nested_set
  has_many :jobs, -> { order(updated_at: :desc) }

  validates :title, presence: true


end
