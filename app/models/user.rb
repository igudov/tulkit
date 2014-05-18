class User < ActiveRecord::Base
  ACCESS_TYPES = [ "contractor", "homeowner"]

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ":style/missing.jpg", :acl => :public_read
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  


  after_destroy :ensure_a_user_remains
  validates :name, presence: true, uniqueness: true  
  validates :access, inclusion: ACCESS_TYPES
  has_many :jobs, dependent: :destroy
  has_many :bids, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_secure_password

  private
  	def ensure_a_user_remains
  		if User.count.zero?
  			raise "Can't delete last user"
  		end
  	end
end
