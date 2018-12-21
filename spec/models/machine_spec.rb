require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end
  describe 'relationships' do
    it {should have_many :machine_snacks}
    it {should have_many(:snacks).through(:machine_snacks)}
  end
  describe 'Class method' do
    describe 'should return average price of all snacks' do
      it '.average_price' do
        sam = Owner.create(name: "Sam's Snacks")
        machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
        snack_1 = machine_1.snacks.create(name: "hot tamales", price: "5")
        snack_1 = machine_1.snacks.create(name: "reeses", price: "10")
        snack_1 = machine_1.snacks.create(name: "gummis", price: "15")
        average_price_of_items = "10"

        expect(Machine.average_price).to eq(average_price_of_items)
      end
    end
  end
end
