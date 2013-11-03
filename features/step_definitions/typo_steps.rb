Given /^I make a new article with title "(.+)" and body "(.+)"/ do |title, body|
	step %{I am on the new article page}
	step %{I fill in "article_title" with "#{title}"}
	step %{I fill in "article__body_and_extended_editor" with "#{body}"}
	step %{I press "Publish"}
end

When /^I make a blog publisher account with username "(.+)"/ do |name|
	  User.create!({:login => "#{name}",
                :password => "#{name}",
                :email => "#{name}",
                :profile_id => 2,
                :name => "#{name}",
                :state => 'active'})
end

When /^I log out/ do 
	visit '/accounts/logout'
end

When /^I am logged in as "(.+)"/ do |user|
	visit '/accounts/login'
	step %{I fill in "user_login" with "#{user}"}
	step %{I fill in "user_password" with "#{user}"}
	click_button 'Login'
end

Then /^"(.+)" should not be visible$/ do |word|
	page.should have_selector("\##{word}", visible: false)	
end
