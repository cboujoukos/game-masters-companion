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
    binding.pry
    if @character.name != ""
      @character.campaign_id = @campaign.id
      @character.save
    end
    if params[:attack_1][:name] != ""
      @attack_1 = Attack.new(params[:attack_1])
      @attack_1.character_id = @character.id
      @attack_1.save
    end
    if params[:attack_2][:name] != ""
      @attack_2 = Attack.new(params[:attack_2])
      @attack_2.character_id = @character.id
      @attack_2.save
    end
    if params[:attack_3][:name] != ""
      @attack_3 = Attack.new(params[:attack_3])
      @attack_3.character_id = @character.id
      @attack_3.save
    end
    if params[:attack_4][:name] != ""
      @attack_4 = Attack.new(params[:attack_4])
      @attack_4.character_id = @character.id
      @attack_4.save
    end
    redirect "/campaigns/#{@campaign.slug}"
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
    @attacks = @character.attacks
    if logged_in?
      erb :'/characters/edit'
    else
      redirect '/'
    end
  end

  patch "/campaigns/:slug/characters/:id" do
    @user = User.find(session[:id])
    @campaign = Campaign.find_by_slug(params[:slug])
    @character = Character.find(params[:id])
    @character.update(params[:character])
    @attacks = @character.attacks
    if params[:attack_1][:name] != ""
      if @attacks.length > 0
        @attacks[0].update(params[:attack_1])
      else
        @attack_1 = Attack.new(params[:attack_1])
        @attack_1.character_id = @character.id
        @attack_1.save
      end
    end
    if params[:attack_2][:name] != ""
      if @attacks.length > 1
        @attacks[1].update(params[:attack_2])
      else
        @attack_2 = Attack.new(params[:attack_2])
        @attack_2.character_id = @character.id
        @attack_2.save
      end
    end
    if params[:attack_3][:name] != ""
      if @attacks.length > 2
        @attacks[2].update(params[:attack_3])
      else
        @attack_3 = Attack.new(params[:attack_3])
        @attack_3.character_id = @character.id
        @attack_3.save
      end
    end
    if params[:attack_4][:name] != ""
      if @attacks.length > 3
        @attacks[3].update(params[:attack_4])
      else
        @attack_4 = Attack.new(params[:attack_4])
        @attack_4.character_id = @character.id
        @attack_4.save
      end
    end
    @character.save
    redirect "/campaigns/#{@campaign.slug}/characters/#{@character.id}"
  end

#  delete "/campaigns/:slug/characters/:id/delete" do
#    @campaign = Campaign.find_by_slug(params[:slug])
#    @character = Character.find(params[:id])
#    if current_user.id == session[:id]
#      @character.delete
#      redirect "campaigns/#{@campaign.slug}"
#    else
#      redirect '/'
#    end
#  end

  delete "/campaigns/:slug/characters/:id" do
    @campaign = Campaign.find_by_slug(params[:slug])
    @character = Character.find(params[:id])
    if current_user.id == session[:id]
      @character.delete
      redirect "campaigns/#{@campaign.slug}"
    else
      redirect '/'
    end
  end

end
