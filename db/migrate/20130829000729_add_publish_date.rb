class AddPublishDate < ActiveRecord::Migration
  def up
    add_column :spree_press_clippings, :publish_date, :datetime
  end

  def down
  end
end
