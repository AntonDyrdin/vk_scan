class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :vk_id
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
