class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :done, :boolean
  end
end
