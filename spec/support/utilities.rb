def full_title(page_title)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def valid_signup_information
  fill_in "Name",         with: "Example User"
  fill_in "Email",        with: "user@example.com"
  fill_in "Password",     with: "foobar"
  fill_in "Confirmation", with: "foobar"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.flash.error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.flash.success', text: message)
  end
end

RSpec::Matchers.define :have_header do |text|
  match do |page|
    page.should have_selector('h1', text: text)
  end
end

RSpec::Matchers.define :have_title do |text|
  match do |page|
    page.should have_selector('title', text: full_title(text))
  end
end

RSpec::Matchers.define :have_title_and_header do |text|
  match do |page|
    page.should have_title(text)
    page.should have_header(text)
  end
end