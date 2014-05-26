class Job < ActiveRecord::Base
belongs_to :user
belongs_to :category
has_many :bids, dependent: :destroy
has_many :documents, dependent: :destroy

geocoded_by :address   # can also be an IP address
after_validation :geocode          # auto-fetch coordinates


	validates :title, :description, presence: true
	#validates :title, uniqueness: true
	#validates :image_url, allow_blank: true, format: {
	#	with: %r{\.(gif|jpg|png)\Z}i,
	#	message: 'must be a URL for GIF, JPG or PNG image.'
	#}
	validates_datetime :from
	validates_datetime :to

	def self.latest
		Job.order(:updated_at).last
	end
end
