class EncountersController < ApplicationController
  before_action :set_encounter, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_authorized!, :except => [:show, :index]

  def index
    if params[:dsplay_name] && redirect_if_not_authorized!
      @user = User.find_by(params[:user_id])
      @encounters = @user.encounters.tagged_with(params[:tag])
      render action: "user_index"
    elsif params[:category_id]
      @category = Category.find_by(params[:category_id])
      @encounters = @category.encounters
      render action: "category_index"
    else
      @encouters = Encounter.all
    end

  end

  def new
    @encounter = Encounter.new

  end

  def create
    @encounter = current_user.encounters.build(encounter_params)
    # @encounter.date = Date.new(params[:encounter]["date(1i)"].to_i,params[:encounter]["date(2i)"].to_i,params[:encounter]["date(3i)"].to_i)
    # @encounter.save
    if @encounter.save
      redirect_to encounter_path(@encounter)
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

  private

  def encounter_params
    params.require(:encounter).permit(:date, :time, :state, :county, :nearest_town, :conditions, :environment,
    :description, :witnesses, :category_id, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
  end

  def set_encounter
    @encounter = Encounter.find_by(id: params[:id])
  end




end
