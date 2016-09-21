class Task < ApplicationRecord
  belongs_to :board, optional: true
  has_many :cards
  has_many :feeds

  accepts_nested_attributes_for :cards,
    :allow_destroy => true,
    :reject_if     => :all_blank
end
