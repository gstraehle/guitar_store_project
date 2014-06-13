require 'spec_helper'


feature 'User views products' do
  scenario 'on the front page' do

    visit root_path

    expect(page).to have_content 'Fretrograde'
    expect(page).to have_content 'Our Guitars'
    expect(page).to have_content 'Products'
    expect(page).to have_content 'Guitars so awesome'
    expect(page).to have_content 'Login'
  end
end



feature 'User views product' do
  scenario 'on the front page' do
    visit root_path
      click_link 'Products'
    expect(page).to have_content 'Products'
    expect(page).to have_content 'Guitars so awesome'
    expect(page).to have_content 'Login'

  end
end

feature 'User views product' do
  scenario 'on the front page' do
    visit root_path
      click_link 'Sign up'
    expect(page).to have_content 'Sign up'
    expect(page).to have_content 'City'
    expect(page).to have_content 'Password'

  end
end

feature 'User views product' do
  scenario 'on the front page' do
    visit root_path
      click_link 'Login'
    expect(page).to have_content 'Sign in'
    expect(page).to have_content 'Remember me'
    expect(page).to have_content 'Password'

  end
end

feature 'User views product' do
  scenario 'on the front page' do
    visit root_path
      click_link 'Login'
        fill_in 'user_email', with: 'kag@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'Sign in'
    expect(page).to have_content 'Logged in as kag@example.com'


  end
end
