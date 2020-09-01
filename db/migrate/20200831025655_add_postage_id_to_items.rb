class AddPostageIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :postage_id, :integer
  end
end
