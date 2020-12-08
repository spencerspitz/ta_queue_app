class CreateResponseJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :stacks, :responses do |t|
       t.index [:stack_id, :response_id]
       t.index [:response_id, :stack_id]
    end
  end
end
