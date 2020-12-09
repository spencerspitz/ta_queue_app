class AddStackIdToResponses < ActiveRecord::Migration[6.0]
  def change
    add_column :responses, :stack_id, :integer
    add_index :responses, :stack_id
  end
end
