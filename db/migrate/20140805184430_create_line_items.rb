class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :item_id

      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

  end
end
