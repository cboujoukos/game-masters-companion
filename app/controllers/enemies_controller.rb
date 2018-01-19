class EnemiesController < ApplicationController

  get "/campaigns/:slug/create_enemy" do
    @campaign = Campaign.find_by_slug(params[:slug])
    if logged_in?
      erb :'/enemies/new'
    else
      redirect '/'
    end
  end

  post '/:slug/enemies' do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @enemy = Enemy.new(params[:enemy])
    if @enemy.name != ""
      @enemy.campaign_id = @campaign.id
      @enemy.save
      redirect "/campaigns/#{@campaign.slug}"
    else
      redirect '/'
    end
  end

  get "/campaigns/:slug/enemies/:id" do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @enemy = Enemy.find(params[:id])
    if logged_in?
      erb :'/enemies/show'
    else
      redirect '/'
    end
  end

  get "/campaigns/:slug/enemies/:id/edit_enemy" do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @enemy = Enemy.find(params[:id])
    if logged_in?
      erb :'/enemies/edit'
    else
      redirect '/'
    end
  end

  post "/campaigns/:slug/enemies/:id" do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @enemy = Enemy.find(params[:id])
    @enemy.update(params[:enemy])
    @enemy.save
    redirect "/campaigns/#{@campaign.slug}/enemies/#{@enemy.id}"
  end

  delete "/campaigns/:slug/enemies/:id" do
    @campaign = Campaign.find_by_slug(params[:slug])
    @enemy = Enemy.find(params[:id])
    if current_user.id == session[:id]
      @enemy.delete
      redirect "campaigns/#{@campaign.slug}"
    else
      redirect '/'
    end
  end
end
