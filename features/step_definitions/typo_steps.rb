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

When /^I merge "(.+)" with "(.+)"/ do |article1, article2|
	id = Article.find_by_title("#{article2}").id
	step %{I follow "#{article1}"}
	step %{I fill in "merge_with" with "#{id}"}
	step %{I press "Merge"}
end

Then /^"(.+)" should have the author "(.+)"/ do |article, author|
	writer = Article.find_by_title("#{article}").user.name
	assert author == writer, "The article has author #{writer}"
end

When /^I add the comment "(.+)" to the article "(.+)"$/ do |comment, article|
	step %{I am on the home page}
	step %{I follow "#{article}"}
	step %{I fill in "comment_author" with "me"}
	step %{I fill in "comment_body" with "#{comment}"}
	step %{I press "comment"}
end
