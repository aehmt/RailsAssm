class CreateSharedBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :shared_boards do |t|
      t.integer :collaborator_id
      t.integer :owner_id
      t.integer :board_id
    end
  end
end
