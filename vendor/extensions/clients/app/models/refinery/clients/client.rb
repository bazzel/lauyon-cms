module Refinery
  module Clients
    class Client < Refinery::Core::BaseModel
      self.table_name = 'refinery_clients'

      attr_accessible :name, :description, :logo_id, :url, :show_on_page, :position

      translates :description

      scope :show_on_page, where(:show_on_page => true)

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:name, :description, :url]

      validates :name, :presence => true, :uniqueness => true
      validates :url, :url => true

      belongs_to :logo, :class_name => '::Refinery::Image'
    end
  end
end
