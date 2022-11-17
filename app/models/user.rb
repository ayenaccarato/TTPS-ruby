class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :uniqueness => true
 
  enum rol: ["Admin", "Personal bancario", "Cliente"]

  def self.get_roles
    {
      "Admin" => "Administrador",
      "Personal bancario" => "Personal Bancario",
    }
  end

  def set_rol_default
    self.rol = User.rol["Cliente"]
  end


end
