module Refinery
  module Partners
    class Partner < Refinery::Core::BaseModel
      self.table_name = 'refinery_partners'

      attr_accessible :name, :logo_id, :url, :show_on_page, :position

      acts_as_indexed :fields => [:name, :url]

      validates :name, :presence => true, :uniqueness => true
      validates :url, :presence => true, :url => true
      validates :logo, :presence => true

      belongs_to :logo, :class_name => '::Refinery::Image'
    end
  end
end
