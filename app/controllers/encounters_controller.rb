class EncountersController < ApplicationController
  before_action :set_encounter, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_authorized!, :except => [:show, :index]

  def index
    if params[:display_name]
      @user = User.find_by(display_name: params[:display_name])
      @encounters = @user.encounters
      render action: "user_index"
    elsif params[:category_id]
      @category = Category.find_by(params[:category_id])
      @encounters = @category.encounters
      render action: "category_index"
    else
      @encouters = Encounter.all
    end
    # redirect_to 'user_encounters_path'
  end

  def new
    @encounter = Encounter.new

  end

  def create
    @user = User.find_by(display_name: params[:display_name])
    @encounter = @user.encounters.build(encounter_params)
    if @encounter.save
      redirect_to user_encounter_path(@user.display_name, @encounter)
    else
      render :new
    end
  end

  def show
    @tag = Tag.find_by_param(params[:name])

  end

  def edit
  end

  def update
    if @encounter.update(encounter_params)
      flash[:message] = "Encounter Successfully Updated!"
      redirect_to encounter_path(@encounter)
    else
      render :edit
    end
  end

  def destroy
  end

  def recent_encounters
    @encounters = Encounters.recently_added_encounters(25)
  end

  private

  def encounter_params
    params.require(:encounter).permit(:date, :time, :state, :county, :nearest_town, :conditions, :environment,
    :description, :witnesses, :category_id, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
  end

  def set_encounter
    @encounter = Encounter.find_by(id: params[:id])
  end




end
