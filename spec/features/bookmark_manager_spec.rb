require './spec/web_helper.rb'

feature 'Testing the infrastructure of our app' do
  scenario 'Testing the user can see Hello World on the page' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end
end

feature 'Testing the bookmarks page' do
  scenario 'User is forwarded to /bookmarks and can see a list of bookmarks' do
    add_bookmarks_test
    visit('/')
    click_button('my_bookmarks')
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
    expect(page).to have_content('http://www.google.com')
  end
end

feature 'User can add a bookmark' do
  scenario 'User visits the homepage, clicks add bookmark and can see it added to the list' do
    visit('/')
    fill_in 'new_bookmark_url', :with => 'http://www.askjeeves.com'
    click_button('Add Bookmark')
    expect(page).to have_content('http://www.askjeeves.com')
  end
end
