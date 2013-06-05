class Login
  include ActiveAttr::BasicModel
  include ActiveAttr::MassAssignment
  attr_accessor :email, :password

  def authenticate
    reader = Reader.find_by_email(email) 
    if reader && reader.authenticate(password)
      return reader.id
    else
      nil
    end
  end
end
