require 'active_record/fixtures'

namespace :seed do
  desc 'seed the database with fixtures from spec/fixtures'
  task with_fixtures: :environment do
    path = File.join(File.dirname(__FILE__), '..', '..', 'spec', 'fixtures')
    ActiveRecord::FixtureSet.create_fixtures path, [:participants, :content_modules, :content_providers, :users, :slideshows, :slides, :content_releases]
  end
end