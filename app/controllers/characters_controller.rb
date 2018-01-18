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

  get "/campaigns/:slug/characters/:id" do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @character = Character.find(params[:id])
    if logged_in?
      erb :'/characters/show'
    else
      redirect '/'
    end
  end

  get "/campaigns/:slug/characters/:id/edit_character" do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @character = Character.find(params[:id])
    if logged_in?
      erb :'/characters/edit'
    else
      redirect '/'
    end
  end

  post "/campaigns/:slug/characters/:id" do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @character = Character.find(params[:id])
    @character.update(params[:characters][])
    @character.save
  end

end
