class AddCompletedToItems < ActiveRecord::Migration
  def change
    add_column :items, :coItems, :string
    add_column :items, :completed, :boolean
  end
end
