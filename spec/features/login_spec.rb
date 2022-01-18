require 'rails_helper'

RSpec.describe 'Widget management', type: :feature do
  it 'Sign up (test_user@test.com)' do
    visit sign_up_path
    page.fill_in 'Email', with: 'test_user@test.com'
    page.fill_in 'Password', with: '123'
    click_on 'commit'
    expect(page).to have_current_path(valera_path, ignore_query: true)
  end
end
