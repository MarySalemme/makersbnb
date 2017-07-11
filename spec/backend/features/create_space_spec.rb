
feature "list of spaces" do
  scenario "user creates a space" do
    create_space
    expect(page).to have_content("tiny flat")
    expect(page).to have_content("50.0")
    expect(page).to have_content("Mile End")
  end
end

feature "correct errors are thrown" do
  scenario "blank fields throw an error" do
    create_space(location: nil)
    expect(page).to have_content("must not be blank")
  end
end
