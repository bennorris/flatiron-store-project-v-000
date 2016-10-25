class FixTitleinCategory < ActiveRecord::Migration
  def up
   change_column :categories, :title, :string
  end

 def down
   change_column :categories, :title, :integer
 end
end
