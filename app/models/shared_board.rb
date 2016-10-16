class SharedBoard < ApplicationRecord
  belongs_to :board
  belongs_to :collaborator, class_name: "User"
end
