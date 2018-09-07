require 'rails_helper'

describe 'Feature Test: User Maps a Tank Location', type: :feature do

  before :each do
    @user = User.create(id: 1, email: "nolan@example.com", user_name: "loudmouse", password: "Password1234", password_confirmation: "Password1234")
    @tank_location = @user.tank_locations.create(longitude: -87.658563, latitude: 41.882413, address: "17 N Elizabeth St, Chicago, IL 60607")
  end

  it 'lets user map a water tank location' do
    visit '/users/sign_in'
    fill_in("user[email]", with: "nolan@example.com")
    fill_in("user[password]", with: "Password1234")
    click_button("Submit")
    expect(current_path).to eql(root_path)
    click_link("Add a Water Tank")
    expect(current_path).to eql("/tank_locations/new")
    fill_in("tank_location[address]", with: "17 N Elizabeth St, Chicago, IL 60607")
    find("#photo_image").click
    attach_file('tank_location[photos_attributes][0][image]', Rails.root + 'app/assets/images/test_tank_photo.jpg')
    click_button("Submit")
  end

end
