class AddAllDayToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :all_day, :boolean
  end
end
