class Administrator < ApplicationRecord
  # :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable, :timeoutable, :trackable,
         :recoverable, :rememberable, :validatable
end
