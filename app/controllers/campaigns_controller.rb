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
      flash[:name_error] = "Please give the campaign a name."
      redirect '/campaigns/new'
    end
  end

  get '/campaigns/:slug' do
    @campaign = Campaign.find_by_slug(params[:slug])
    if logged_in? # && @campaign.user == current_user

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

  patch '/campaigns/:slug' do
    user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    if logged_in? && @campaign.user == current_user
      @campaign.update(name: params[:name], setting: params[:setting], notes: params[:notes])
      if params[:name] != nil && params[:name] != ""
        @campaign.save
        redirect "/campaigns/#{@campaign.slug}"
      else
        flash[:name_error] = "Please give the campaign a name."
        redirect back
      end
    else
      redirect '/login'
    end
  end

  delete "/campaigns/:slug/delete" do
    @campaign = Campaign.find_by_slug(params[:slug])
    if current_user.id == session[:id]
      @campaign.delete
      # DELETE ALL ASSOCIATED ENCOUNTERS AND CHARACTERS?
      redirect "/"
    else
      redirect '/'
    end
  end
end
