require 'rails_helper'

describe 'admin' do
  context 'as an admin' do
    it 'can create a new station' do
      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_station_path

      fill_in 'station[name]', with: 'Awesome Bike Place'
      fill_in 'station[dock_count]', with: 77
      fill_in 'station[city]', with: 'No Way Jose'
      fill_in 'station[installation_date]', with: '01/02/2003'
      fill_in 'station[lat]', with: -77.777
      fill_in 'station[long]', with: 177.777
      click_on 'Create Station'

      expect(current_path).to eq('/stations/awesome-bike-place')
      expect(page).to have_content('Created a new station')
      expect(page).to have_content('Awesome Bike Place')
      expect(page).to have_content(77)
      expect(page).to have_content('No Way Jose')
      expect(page).to have_content(01/02/2003)
      expect(page).to have_content(-77.777)
      expect(page).to have_content(177.777)
    end

    it 'must use appropriate latitude and longitude ranges' do
      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_station_path

      fill_in 'station[name]', with: 'Awesome Bike Place'
      fill_in 'station[dock_count]', with: 77
      fill_in 'station[city]', with: 'No Way Jose'
      fill_in 'station[installation_date]', with: '01/02/2003'
      fill_in 'station[lat]', with: 10000
      fill_in 'station[long]', with: 200
      click_on 'Create Station'

      expect(page).to have_button('Create Station')
      expect(page).to have_content('Failed to create a new station')
      expect(page).to_not have_content('Created a new station')
    end
  end
end
