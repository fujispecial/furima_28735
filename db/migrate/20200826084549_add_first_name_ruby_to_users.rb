class AddFirstNameRubyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name_ruby, :string
  end
end
