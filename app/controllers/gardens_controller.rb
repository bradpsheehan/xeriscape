class GardensController < ApplicationController
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
