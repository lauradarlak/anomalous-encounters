class EncountersController < ApplicationController

  def index
  end

  def new
    @encounter = Encounter.new
  end

  def create
    @encounter = current_user.encounters.build(encounter_params)
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


end
