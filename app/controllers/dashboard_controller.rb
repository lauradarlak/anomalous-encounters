class DashboardController < ApplicationController
  def index
    @most_recent_encoounts = Encounter.recently_added_encounters(15)
  end
end
