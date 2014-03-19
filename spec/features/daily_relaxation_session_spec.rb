require "spec_helper"

describe "daily relaxation session" do
  fixtures(
    :participants, :content_modules, :content_providers
  )

  before do
    sign_in_participant participants(:participant1)
    visit "/navigator/contexts/daily_relaxation_practice"
  end

  it "should display content of each page" do
    expect(page).to have_text('before you practice')
  end
end