class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def self.average_price
    joins(:snacks).group(machine_id: :id).where(snack_id: snacks.id)
  end

end
