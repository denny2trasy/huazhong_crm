class User < ActiveRecord::Base
  has_many  :products
  has_many  :warehouse_vouchers
  has_many  :delivery_vouchers
  has_many  :work_sheets
  has_one  :workshops
  has_one  :equipments
  before_save :encrypt_password
  
  
  def self.select_list
    list = [nil,nil]
    User.all.each do |u|
      list << [u.name,u.id]
    end
    list
  end
  
  
  
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100


  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
#  attr_accessible :login, :email, :name, :password, :password_confirmation



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end


  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end



  
  
  
  private
  
  
#  def encrypt(password)
#    self.class.password_digest(password, salt)
#  end
#  
#  def authenticated?(password)
#    crypted_password == encrypt(password)
#  end
#  def make_token
#    secure_digest(Time.now, (1..10).map{ rand.to_s })
#  end  
#  # before filter 
#  def encrypt_password
#    return if password.blank?
#    self.salt = self.class.make_token if new_record?
#    self.crypted_password = encrypt(password)
#  end
#  def password_required?
#    crypted_password.blank? || !password.blank?
#  end  

  
end
