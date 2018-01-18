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
    @encounter = Encounter.new(params[:encounter])
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
    if logged_in?
      erb :'/encounters/show'
    else
      redirect '/'
    end
  end

  get "/campaigns/:slug/characters/:id/edit_encounter" do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @encounter = Encounter.find(params[:id])
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
    @encounter.update(params[:encounter])
    @encounter.save
    redirect "/campaigns/#{@campaign.slug}/encounters/#{@encounter.id}"
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
