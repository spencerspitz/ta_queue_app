class AddResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.text :comment
    
      t.references :stack, null: false, foreign_key: true
    end
  end
end
