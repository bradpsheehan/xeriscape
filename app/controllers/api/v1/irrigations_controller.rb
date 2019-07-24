class Api::V1::IrrigationsController < ApplicationController
  protect_from_forgery prepend: true

  def create
    irrigation = Irrigation.new(plant_id: params[:plant_id])
    if irrigation.save
      render json: {
        data: {
        irrigation: irrigation,
        plant_root_length: irrigation.plant.root_length,
        plant_status: irrigation.plant.status
      }, errors: []}, status: 200
    else
      render json: {data: {}, errors: irrigation.errors.full_messages}, status: 400
    end
  end

  private

  def permitted_params
    params.require(:irrigations).permit(
      :plant_id
    )
  end
end
