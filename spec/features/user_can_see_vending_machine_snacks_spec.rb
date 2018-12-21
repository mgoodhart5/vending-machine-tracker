require 'rails_helper'

describe 'as a visitor to the machines show page' do
  it 'should see the name of all the snacks and prices' do
    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
    snack_1 = machine_1.snacks.create(name: "hot tamales", price: "5")
    # machine_snack_1 = MachineSnack.create(machine_id: machine_1, snack_id: snack_1)

    visit machine_path(machine_1)

    expect(page).to have_content("Candy: #{snack_1.name}")
    expect(page).to have_content("Price: #{snack_1.price}")
  end
end
