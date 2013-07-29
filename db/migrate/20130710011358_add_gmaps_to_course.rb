class AddGmapsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :gmaps, :boolean
  end
end
