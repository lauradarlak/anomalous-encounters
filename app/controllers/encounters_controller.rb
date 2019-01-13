class EncountersController < ApplicationController
  before_action :set_encounter, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_authorized!, :except => [:show, :index, :recent_encounters]
  # before_action :set_categories, only: [:index, :show, :recent_encounters]
  before_action :set_categories, :set_tags

  def index
    @tags = Tag.all
    if params[:display_name]
      @user = User.find_by(display_name: params[:display_name])
      @encounters = @user.encounters
      # render action: "user_index"
    elsif params[:category_slug]
      @category = Category.find_by(slug: params[:category_slug])
      @encounters = @category.encounters
      # render action: "category_index"
    else
      @encounters = Encounter.all
    end
    # redirect_to 'user_encounters_path'
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
    # @tag = Tag.find_by_param(params[:name])
    @tags = Tag.all

  end

  def edit

  end

  def update
    if @encounter.update(encounter_params)
      flash[:notice] = "Encounter Successfully Updated!"
      redirect_to encounter_path(@encounter)
    else
      render :edit
    end
  end

  def destroy
  end

  def recent_encounters
    @encounters = Encounter.recently_added_encounters(25)
    @tags = Tag.all

  end

  private

  def encounter_params
    params.require(:encounter).permit(:date, :time, :state, :county, :nearest_town, :conditions, :environment,
    :description, :witnesses, :tag_list, :category_id, :category)
  end

  def set_encounter
    @encounter = Encounter.find_by(id: params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def set_tags
    @tags = Tag.all
  end




end
