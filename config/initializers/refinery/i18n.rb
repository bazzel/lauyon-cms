# encoding: utf-8

Refinery::I18n.configure do |config|
   config.enabled = false
   # Switching off I18n can cause errors, due to missing slug values.
   # The following query will fix this:
   # UPDATE `refinery_page_translations` a JOIN `refinery_page_translations` b ON a.refinery_page_id = b.refinery_page_id
   # SET a.slug = b.slug
   # WHERE a.locale = 'nl' AND b.locale = 'en';

  # config.default_locale = :en

   config.current_locale = :nl

   config.default_frontend_locale = :nl

   config.frontend_locales = [:en, :nl, :it]

   config.locales = {:en=>"English", :fr=>"Français", :nl=>"Nederlands", :"pt-BR"=>"Português", :da=>"Dansk", :nb=>"Norsk Bokmål", :sl=>"Slovenian", :es=>"Español", :it=>"Italiano", :de=>"Deutsch", :lv=>"Latviski", :ru=>"Русский", :sv=>"Svenska", :pl=>"Polski", :"zh-CN"=>"Simplified Chinese", :"zh-TW"=>"Traditional Chinese", :el=>"Ελληνικά", :rs=>"Srpski", :cs=>"Česky", :sk=>"Slovenský", :ja=>"日本語", :bg=>"Български"}
end
