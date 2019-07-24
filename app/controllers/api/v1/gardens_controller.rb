class Api::V1::GardensController < ApplicationController
  def show
    garden = Garden.find(params[:id])

    render json: {data: garden, errors: []}
  end

  def plant_seeds
  end

  private

  def garden_params
    params.require(:gardens).permit(
      :name,
      :description
    )
  end
end
