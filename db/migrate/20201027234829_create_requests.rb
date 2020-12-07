class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.time :time_submitted
      t.string :desc
      t.string :compsciclass
      t.string :qtype
      t.string :zoomurl

      t.timestamps
    end
  end
end
