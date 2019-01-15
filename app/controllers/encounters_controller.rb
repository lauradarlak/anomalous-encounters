class EncountersController < ApplicationController
  before_action :top_tags, :top_categories, :user_exists?
  before_action :set_encounter, only: [:edit, :update, :destroy]
  before_action :redirect_if_not_authorized!, :except => [:show, :index, :recent_encounters]

  def index
    if params[:display_name]
      @user = User.find_by(display_name: params[:display_name])
      @encounters = @user.encounters
    else params[:category_slug]
      @category = Category.find_by(slug: params[:category_slug])
      @encounters = @category.encounters
    end
  end

  def new
    @encounter = Encounter.new
  end

  def create
    @user = User.find_by(display_name: params[:display_name])
    @encounter = @user.encounters.new(encounter_params)
    if @encounter.save
      flash[:notice] = "Encounter Successfully Created!"
      redirect_to user_encounter_path(@user.display_name, @encounter)
    else
      render :new
    end
  end

  def show
    user = User.find_by(display_name: params[:display_name])
    @encounter = user.encounters.find_by(id: params[:id])
    redirect_to root_path, alert: "Encounter unknown." if @encounter.nil?
  end

  def edit

  end

  def update
    user = User.find_by(display_name: params[:display_name])
    if @encounter.update(encounter_params)
      flash[:notice] = "Encounter Successfully Updated!"
      redirect_to user_encounter_path(user.display_name, @encounter)
    else
      render :edit
    end
  end

  def destroy
  end

  def recent_encounters
    @encounters = Encounter.recently_added_encounters(25)

  end

  private

  def encounter_params
    params.require(:encounter).permit(:date, :time, :state, :county, :nearest_town, :conditions, :environment,
    :description, :witnesses, :tag_list, :category_id, :category)
  end

  def set_encounter
    @encounter = Encounter.find_by(id: params[:id])
  end

  def top_tags
    @top_tags = Tag.top_tags
  end

  def top_categories
    @top_categories = Category.top_categories
  end




end
