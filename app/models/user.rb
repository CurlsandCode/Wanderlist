class User < ActiveRecord::Base
    has_many :user_places
    has_many :places, through: :user_places
    validates :email, :username, presence: true
    validates :email, :username, uniqueness: true
    has_secure_password
end