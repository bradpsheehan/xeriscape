class Plant < ApplicationRecord
  belongs_to :garden
  belongs_to :plant_type
  has_many :irrigations, dependent: :destroy

  enum status: [:planted, :growing, :mature, :saturated, :dead]

  def calculate_status
    irrigations_count = irrigations.size

    if irrigations_count == 0
      self.status = :planted
    elsif irrigations_count.between?(1,3)
      self.status = :growing
    elsif irrigations_count.between?(4,6)
      self.status = :mature
    elsif irrigations_count.between?(7,10)
      self.status = :saturated
    elsif irrigations_count > 10
      self.status = :dead
    end
  end
end
