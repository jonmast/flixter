class AddRowOrderToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :row_order, :integer, index: true
    add_index :lessons, :row_order
  end
end
