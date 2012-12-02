module Refinery
  module Partners
    module Admin
      class PartnersController < ::Refinery::AdminController

        crudify :'refinery/partners/partner',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
