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

describe 'Feature Test: User Sign In', type: :feature do

  before :each do
    @user = User.create(email: "nolan@example.com", user_name: "loudmouse", password: "Password1234", password_confirmation: "Password1234")
  end

  it 'does not allow a user to sign in without email' do
    visit '/users/sign_in'
    fill_in("user[password]", with: "Password1234")
    click_button("Submit")
    expect(page).to have_content("Invalid Email or password")
  end

  it 'does not allow a user to sign in without a password' do
    visit '/users/sign_in'
    fill_in("user[email]", with: "nolan@example.com")
    click_button("Submit")
    expect(page).to have_content("Invalid Email or password")
  end

  it 'redirects to homepage if sign successful' do
    visit '/users/sign_in'
    fill_in("user[email]", with: "nolan@example.com")
    fill_in("user[password]", with: "Password1234")
    click_button("Submit")
    expect(current_path).to eql(root_path)
  end

  it 'sends user to root when visiting sign in if already logged in' do
    visit '/users/sign_in'
    fill_in("user[email]", with: "nolan@example.com")
    fill_in("user[password]", with: "Password1234")
    click_button("Submit")
    visit '/users/sign_in'
    expect(current_path).to eql(root_path)
    expect(page).to have_content("You are already signed in.")
  end

  it 'sends user to root when visiting sign up if already logged in' do
    visit '/users/sign_in'
    fill_in("user[email]", with: "nolan@example.com")
    fill_in("user[password]", with: "Password1234")
    click_button("Submit")
    visit '/users/sign_up'
    expect(current_path).to eql(root_path)
    expect(page).to have_content("You are already signed in.")
  end

end

describe 'Feature Test: Users Homepage with Zero Tank Locations', type: :feature do

  before :each do
    @user = User.create(id: 1, email: "nolan@example.com", user_name: "loudmouse", password: "Password1234", password_confirmation: "Password1234")
  end

  it 'tells user to map a tank to unlock profile' do
    visit '/users/sign_in'
    fill_in("user[email]", with: "nolan@example.com")
    fill_in("user[password]", with: "Password1234")
    click_button("Submit")
    expect(current_path).to eql(root_path)
    click_link("My Profile")
    expect(current_path).to eql("/users/loudmouse")
    expect(page).to have_content("Map a Tank to Unlock Your Profile")
  end

end
