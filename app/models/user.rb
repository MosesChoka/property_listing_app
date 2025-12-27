class User < ApplicationRecord
  has_many :properties, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  rolify

  def admin?
    has_role?(:admin)
  end

  def landlord?
    has_role?(:landlord)
  end
end
