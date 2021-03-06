feature "navigation bar when signed up" do

  before do
    sign_up
  end

  scenario "My spaces link takes you to the user spaces" do
    click_link('View Spaces')
    expect(page).to have_current_path('/users/spaces')
  end

  scenario "Add a space link takes you to the form to add a new space" do
    click_link('Add Space')
    expect(page).to have_current_path('/space/new')
  end

  scenario "Find a space link takes you to the list of spaces" do
    click_link('Find Space')
    expect(page).to have_current_path('/space')
  end

  scenario "View Booking Requests takes you to the list of booking requests" do
    click_link('View Booking Requests')
    expect(page).to have_current_path('/bookings/requests')
  end
end


feature "navigation bar when not signed up" do
  scenario "home link takes you back to homepage" do
    visit('/users/new')
    click_link('Home')
    expect(page).to have_current_path('/')
  end

  scenario "Log in takes you to login page" do
    visit('/')
    click_link('Log in')
    expect(page).to have_current_path('/sessions/new')
  end

  scenario "New user takes you to sign up page" do
    visit('/')
    click_link('New User?')
    expect(page).to have_current_path('/users/new')
  end
end
