class User < ActiveRecord::Base
	has_secure_password
	validates :first_name, presence: true, length: { maximum: 100, minimum: 2 }
	validates :last_name, presence: true
	validates :email, presence: true, 
					  length: { maximum: 100 }, 
					  uniqueness: true,
					  format: {
                    		with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
                  	  }
	before_save :downcase_email
	
	def downcase_email
		self.email = email.downcase
	end

end
