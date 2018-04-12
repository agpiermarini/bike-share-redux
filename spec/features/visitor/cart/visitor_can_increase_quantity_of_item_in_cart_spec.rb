require 'rails_helper'

describe 'Visitor' do
  context 'a visitor goes to the cart page' do
    it 'increases item quantity in cart' do
      accessory1 = Accessory.create!(title: "help", description: "Bad", price: 100, image_url: "http://icons.iconarchive.com/icons/guillendesign/variations-3/256/Default-Icon-icon.png", status: 0)

      visit bike_shop_path

      within('form:nth-of-type(1)') do
        click_button("Add to Cart")
      end

      visit '/cart'

      click_on "+"

      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("$100.00 x 2 = $200.00")
      expect(page).to have_content("Total: $200.00")
      expect(current_path).to eq("/cart")
    end
  end

end
