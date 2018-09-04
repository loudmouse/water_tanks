require_relative "../rails_helper.rb"

describe 'Feature Test: User Sign Up', type: :feature do

  it 'navigating from home to the sign up page' do
    visit '/'
    click_link("Sign Up", match: :first)
    expect(current_path).to eq("/users/sign_up")
    expect(page).to have_content("Help Us Map Chicago's Historic Water Tanks")
  end

end
