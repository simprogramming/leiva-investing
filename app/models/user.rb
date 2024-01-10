class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :role, :first_name, :last_name, presence: true

  enum role: { admin: "admin", user: "user" }
  translate_enum :role
end
