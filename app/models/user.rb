class User < ApplicationRecord
  include Sortable
  include Filterable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  search_scope :by_email, ->(value) {
    where("users.email ILIKE ?", "%#{value}%")
  }
end
