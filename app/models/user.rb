class User < ActiveRecord::Base
    has_many :lists
    has_many :places, through: :lists
    validates :email, :username, presence: true
    validates :email, :username, uniqueness: true
    has_secure_password
end