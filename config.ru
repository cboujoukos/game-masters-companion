require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use EnemiesController
use EncountersController
use CharactersController
use CampaignsController
use UsersController
run ApplicationController
