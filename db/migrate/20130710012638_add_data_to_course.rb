class AddDataToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :phone, :string
    add_column :courses, :price, :text
    add_column :courses, :hours, :text
  end
end
