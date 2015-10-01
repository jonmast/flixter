class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.decimal :cost
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
