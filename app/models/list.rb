class List < ActiveRecord::Base
  has_many :places
  has_many :users, through: :places
   
end