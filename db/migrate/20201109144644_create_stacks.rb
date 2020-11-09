class CreateStacks < ActiveRecord::Migration[6.0]
  def change
    create_table :stacks do |t|
      t.string :user
      t.string :topic
      t.string :class
      t.text :comment
      

      t.timestamps
    end
  end
end
