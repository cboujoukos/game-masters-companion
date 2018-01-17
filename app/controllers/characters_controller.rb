class CharactersController < ApplicationController

  get "/campaigns/:slug/create_character" do
    @campaign = Campaign.find_by_slug(params[:slug])
    if logged_in?
      erb :'/characters/new'
    else
      redirect '/'
    end
  end

  post '/:slug/characters' do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @character = Character.new(params[:character])
    if @character.name != ""
      @character.campaign_id = @campaign.id
      @character.save
      redirect "/campaigns/#{@campaign.slug}"
    else
      redirect '/'
    end
  end
end
