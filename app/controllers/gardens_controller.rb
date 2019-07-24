class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def show
    @garden = GardenSerializer.new(Garden.find(params[:id]))
  end

  private

  def garden_params
    params.require(:gardens).permit(
      :name,
      :description
    )
  end
end
