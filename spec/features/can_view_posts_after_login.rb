require 'rails_helper'

RSpec.feature "Can view own posts after log in", type: :feature do
  scenario "sing up, make post, log out, log in, view own post" do
    sign_up
    expect(current_path).to eq('/login')
    visit('/posts')
    click_link "New post"
    fill_in "Message", with: "Hello, world! I am a dinosaur"
    click_button "Submit"
    expect(current_path).to eq('/posts/yours')
    click_on "Log out"
    expect(page).to have_content("You have successfully logged out. Don't let the flap hit you on the way out.")
    expect(current_path).to eq('/login')
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Submit"
    expect(current_path).to eq('/posts/yours')
    expect(page).to have_content("Hello, world! I am a dinosaur")
    expect(page).not_to have_content("You have no posts... :(")
  end
end
