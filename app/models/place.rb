class Place < ActiveRecord::Base
  belongs_to :list
  belongs_to :user
  validates :name, :content, presence: true
end