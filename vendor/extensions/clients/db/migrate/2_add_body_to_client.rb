class AddBodyToClient < ActiveRecord::Migration
  def change
    add_column :refinery_clients, :body, :text
  end
end
