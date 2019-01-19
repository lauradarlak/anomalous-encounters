class EncountersController < ApplicationController
  include SidebarBeforeActions
  before_action :user_exists?
  before_action :set_user_by_display_name, only: [:index, :create, :show, :update]
  before_action :set_encounter, only: [:edit, :update, :destroy]
  before_action :redirect_if_not_authorized!, :except => [:show, :index, :recent_encounters]


  def index
    if params[:display_name]
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
    @encounter = @user.encounters.new(encounter_params)
    if @encounter.save
      flash[:notice] = "Encounter Successfully Created!"
      redirect_to user_encounter_path(@user.display_name, @encounter)
    else
      render :new
    end
  end

  def show
    @encounter = @user.encounters.find_by(id: params[:id])
    redirect_to root_path, alert: "Encounter unknown." if @encounter.nil?

  end

  def edit

  end

  def update
    if @encounter.update(encounter_params)
      flash[:notice] = "Encounter Successfully Updated!"
      redirect_to user_encounter_path(@user.display_name, @encounter)
    else
      render :edit
    end
  end

  def destroy
    @encounter.destroy
    flash[:notice] = "Encounter Successfully Deleted"
    redirect_to root_path
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

  def set_user_by_display_name
    @user = User.find_by(display_name: params[:display_name])
  end

  def set_encounter
    @encounter = Encounter.find_by(id: params[:id])
  end


end
