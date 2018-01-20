class EncountersController < ApplicationController
  get "/campaigns/:slug/create_encounter" do
    @campaign = Campaign.find_by_slug(params[:slug])
    if logged_in?
      erb :'/encounters/new'
    else
      redirect '/'
    end
  end

  post '/:slug/encounters' do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @encounter = Encounter.new(name: params[:encounter][:name],loot: params[:encounter][:loot],notes: params[:encounter][:notes])
    #binding.pry
    params[:encounter_characters].each do |char|
      @encounter.characters << Character.find(char)
    end
    if @encounter.name != ""
      @encounter.campaign_id = @campaign.id
      @encounter.save
      redirect "/campaigns/#{@campaign.slug}"
    else
      redirect '/'
    end
  end

  get "/campaigns/:slug/encounters/:id" do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @encounter = Encounter.find(params[:id])
    @enemies = @encounter.characters.map{|char| category == "enemy"}
    if logged_in?
      erb :'/encounters/show'
    else
      redirect '/'
    end
  end

  get "/campaigns/:slug/encounters/:id/edit_encounter" do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @encounter = Encounter.find(params[:id])
    @encounter_character_ids = @encounter.characters.collect{|char| char.id}
    @encounter_enemy_ids = @encounter.enemies.collect{|enemy| enemy.id}
    if logged_in?
      erb :'/encounters/edit'
    else
      redirect '/'
    end
  end

  post "/campaigns/:slug/encounters/:id" do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @encounter = Encounter.find(params[:id])
    @encounter.update(name: params[:encounter][:name],loot: params[:encounter][:loot],notes: params[:encounter][:notes])
    @encounter.characters = []
    params[:encounter_characters].each do |char|
      @encounter.characters << Character.find(char)
    end
    @encounter.enemies = []
    params[:encounter_enemies].each do |enemy|
      @encounter.enemies << Enemy.find(enemy)
    end
    #@encounter_character_ids = @encounter.characters.collect{|char| char.id}
    if @encounter.name != ""
      @encounter.save
      redirect "/campaigns/#{@campaign.slug}/encounters/#{@encounter.id}"
    else
      redirect '/'
    end
  end

  delete "/campaigns/:slug/encounters/:id" do
    @campaign = Campaign.find_by_slug(params[:slug])
    @encounter = Encounter.find(params[:id])
    if current_user.id == session[:id]
      @encounter.delete
      redirect "campaigns/#{@campaign.slug}"
    else
      redirect '/'
    end
  end

end
