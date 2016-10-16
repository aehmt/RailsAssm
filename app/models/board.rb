class Board < ApplicationRecord
  belongs_to :user, optional: true
  has_many :lists
  has_many :feeds
  has_many :shared_boards
  has_many :collaborators, through: :shared_boards

  validates_length_of :name, maximum: 30, message: "board must be a maximium of 30 characters"
end
