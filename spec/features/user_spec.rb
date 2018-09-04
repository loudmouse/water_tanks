require_relative "../rails_helper.rb"

describe 'Feature Test: User Sign Up', type: :feature do

  it 'navigating from home to the sign up page' do
    visit '/'
    click_link("Sign Up", match: :first)
    expect(current_path).to eq("/users/sign_up")
    expect(page).to have_content("Help Us Map Chicago's Historic Water Tanks")
  end

  it 'does not allow user account creation without an email' do
    visit '/users/sign_up'
    fill_in("user[user_name]", with: "loudmouse")
    fill_in("user[password]", with: "Password1234")
    fill_in("user[password_confirmation]", with: "Password1234")
    click_button("Sign Up")
    expect(page).to have_content("Email can't be blank")
  end

  it 'does not allow account creation without a password' do
    visit '/users/sign_up'
    fill_in("user[user_name]", with: "loudmouse")
    click_button("Sign Up")
    expect(page).to have_content("Password can't be blank")
  end

  it 'does not allow user account creation with mismatched password confirmation' do
    visit '/users/sign_up'
    fill_in("user[user_name]", with: "loudmouse")
    fill_in("user[email]", with: "nolan@example.com")
    fill_in("user[password]", with: "Password1234")
    fill_in("user[password_confirmation]", with: "passwordTYPO")
    click_button("Sign Up")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it 'allows a new user to be created' do
      visit '/users/sign_up'
      fill_in("user[user_name]", with: "loudmouse")
      fill_in("user[email]", with: "nolan@example.com")
      fill_in("user[password]", with: "Password1234")
      fill_in("user[password_confirmation]", with: "Password1234")
      click_button("Sign Up")
      expect(current_path).to eql(root_path)
  end

end

describe 'Feature Test: User Login', type: :feature do

  before :each do
    @user = User.create(email: "nolan@example.com", password: "Password1234", password_confirmation: "Password1234")
  end

  it 'does not allow a user to log in without email' do
    visit '/users/sign_in'
    fill_in("user[password]", with: "Password1234")
    click_button("Sign In")
    expect(page).to have_content("Invalid Email or password")
  end

  it 'does not allow a user to log in without a password' do
    visit '/users/sign_in'
    fill_in("user[email]", with: "nolan@example.com")
    click_button("Sign In")
    expect(page).to have_content("Invalid Email or password")
  end

end
