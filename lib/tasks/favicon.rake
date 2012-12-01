# FaviconMaker
# See also: https://github.com/follmann/favicon_maker
#require 'favicon_maker'

desc "Create favicon files in various sizes from a base image"
namespace :favicon do
  task :create_versions do
    options = {
      :root_dir => Rails.root,
      :input_dir => 'public',
      :output_dir => 'public'
    }
    FaviconMaker::Generator.create_versions(options) do |filepath|
      puts "Created favicon: #{filepath}"
    end
  end
end

