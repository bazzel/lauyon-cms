# This migration comes from refinery_partners (originally 1)
class CreatePartnersPartners < ActiveRecord::Migration

  def up
    create_table :refinery_partners do |t|
      t.string :name
      t.integer :logo_id
      t.string :url
      t.boolean :show_on_page, :default => true
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-partners"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/partners/partners"})
    end

    drop_table :refinery_partners

  end

end
