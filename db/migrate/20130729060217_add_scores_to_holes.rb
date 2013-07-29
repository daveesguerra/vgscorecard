class AddScoresToHoles < ActiveRecord::Migration
  def change
    add_column :holes, :blue, :integer
    add_column :holes, :red, :integer
  end
end
