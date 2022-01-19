require 'rails_helper'

RSpec.describe 'Login management', type: :feature do
  it 'Sign up (test_user@test.com)' do
    visit sign_up_path
    page.fill_in 'Email', with: 'test_user@test.com'
    page.fill_in 'Password', with: '123'
    click_on 'commit'
    expect(page).to have_current_path(valera_path, ignore_query: true)
  end

  it 'Sign in (test_user@test.com)' do
    visit sign_in_path
    page.fill_in 'Email', with: 'test_user@test.com'
    page.fill_in 'Password', with: '123'
    click_on 'commit'
    expect(page).to have_current_path(valera_path, ignore_query: true)
  end

  it 'Login wrong email (user_does_not_exist@test.com)' do
    visit sign_in_path
    page.fill_in 'Email', with: 'user_does_not_exist@test.com'
    page.fill_in 'Password', with: '123'
    click_on 'commit'
    expect(page).to have_content('Bad email or password.')
  end

  it 'Login wrong password (test_user@test.com)' do
    visit sign_in_path
    page.fill_in 'Email', with: 'test_user@test.com'
    page.fill_in 'Password', with: '123_'
    click_on 'commit'
    expect(page).to have_content('Bad email or password.')
  end

  it 'Reset pwd (test_user@test.com)' do
    visit new_password_path
    page.fill_in 'Email', with: 'test_user@test.com'
    click_on 'commit'
    expect(page).to have_current_path(passwords_path, ignore_query: true)
  end

  it 'Reset pwd empty email' do
    visit new_password_path
    page.fill_in 'Email', with: ''
    click_on 'commit'
    expect(page).to have_content('Email can\'t be blank.')
  end
end
