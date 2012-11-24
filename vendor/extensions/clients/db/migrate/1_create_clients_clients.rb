class CreateClientsClients < ActiveRecord::Migration

  def up
    create_table :refinery_clients do |t|
      t.string :name
      t.text :description
      t.integer :logo_id
      t.string :url
      t.boolean :show_on_page, :default => true
      t.integer :position

      t.timestamps
    end

    Refinery::Clients::Client.create_translation_table! :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-clients"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/clients/clients"})
    end

    drop_table :refinery_clients

    Refinery::Clients::Client.drop_translation_table!

  end

end
