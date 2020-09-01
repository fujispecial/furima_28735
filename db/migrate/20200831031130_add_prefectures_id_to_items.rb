class AddPrefecturesIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :prefectures_id, :integer
  end
end
