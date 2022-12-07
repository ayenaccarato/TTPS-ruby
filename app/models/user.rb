class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :uniqueness => true 
  #validates :sucursals_id, optional: false, if: :personal_bancario?
 
  enum :rol, [ :administrador, :personal_bancario, :cliente]

  def turns 
    if cliente?
      Turn.where(user_id: id)
    else personal_bancario?
      Turn.where(sucursal_id: sucursals_id)
    end
  end


end
