class User < ActiveRecord::Base

	attr_accessor :password
	before_save :encrypt_password

	validates_confirmation_of :password, :on => :create, :message => "Passwords do not match"
	validates_presence_of :password, :on => :create, :message => "can't be blank"
	validates_presence_of :email, :on => :create, :message => "can't be blank"
	validates_presence_of :first_name, :last_name, :role
	validates_uniqueness_of :email, :on => :create
	validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+[a-z]{2,})\z/i, message: "is not a valid format"
	validates_inclusion_of :role, in: %w( patient care_manager )

	scope :alphabetical, -> { order('first_name, last_name') }

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def full_name
    first_name + " " + last_name
  end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
end
