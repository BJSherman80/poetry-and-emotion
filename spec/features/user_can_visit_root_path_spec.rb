require 'rails_helper'

describe "User can visit root path" do
  it "to see a search form" do
    visit '/'
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Welcome to Poetry and Emotion')
    expect(page).to have_selector('input')
  end

  it "can enter name of author and see their poems" do
    visit '/'
    fill_in :author, with: "Emily"
    click_on 'Get Poems'

    within(first('.poem')) do
    expect(page).to have_content("Happy")
    expect(page).to have_css('.title')
    expect(page).to have_css('.author')
    expect(page).to have_css('.poem')
    expect(page).to have_css('.tone')
  end
  end


end
