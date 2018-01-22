class CampaignsController < ApplicationController

  get '/campaigns' do
    if logged_in?
      erb :'/campaigns/index'
    else
      redirect '/'
    end
  end

  get '/campaigns/new' do
    if logged_in?
      erb :'/campaigns/new'
    else
      redirect '/'
    end
  end

  post '/campaigns' do
    @user = User.find(session[:id])
    @campaign = Campaign.new(params)
    @campaign.user_id = @user.id
    if @campaign.name != ""
      @campaign.save
      redirect "/campaigns/#{@campaign.slug}"
    else
      redirect '/campaigns/new'
    end
  end

  get '/campaigns/:slug' do
    if logged_in?
      @campaign = Campaign.find_by_slug(params[:slug])
      @encounters = @campaign.encounters
      @players = @campaign.characters.select{|ch| ch.category == "player"}.map{|ch| ch}
      @npcs = @campaign.characters.select{|ch| ch.category == "npc"}.map{|ch| ch}
      @enemies = @campaign.characters.select{|ch| ch.category == "enemy"}.map{|ch| ch}
      erb :'/campaigns/show'
    else
      redirect '/'
    end
  end

  get '/campaigns/:slug/edit' do
    if logged_in?
      @campaign = Campaign.find_by_slug(params[:slug])
      erb :'/campaigns/edit'
    else
      redirect '/'
    end
  end

  post '/campaigns/:slug' do
    user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @campaign.update(name: params[:name], setting: params[:setting], notes: params[:notes])
    @campaign.save
    redirect "/campaigns/#{@campaign.slug}"
  end
end
