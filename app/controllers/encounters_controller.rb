class EncountersController < ApplicationController
  before_action :set_encounter, :redirect_if_unknown_encounter!, only: [:show, :edit, :update, :destroy]

  def index
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

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def encounter_params
    params.require(:encounter).permit(:date, :time, :state, :county, :nearest_town, :conditions, :environment,
    :description, :witnesses, :category_id)
  end

  def set_encounter
    @encounter = Encounter.find_by(id: params[:id])
  end

end
