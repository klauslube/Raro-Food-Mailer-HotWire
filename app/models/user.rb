# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :name, :email, :cpf, :password, presence: true
  # validates :cpf, length: { is: 11 }
  # validates :cpf, uniqueness: { scope: :email }
  validates :password, length: { in: 6..20 }
end
