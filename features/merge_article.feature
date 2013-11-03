@ignore-hidden-elements
Feature: Merge articles
	As an admin
  In order to put similar articles in one place
  I want to merge similar articles into one
  
  Background: 
  	Given the blog is set up
  	And I am logged into the admin panel
    And I make a new article with title "Foobar" and body "Lorem Ipsum"
    And I make a blog publisher account with username "Potato"
    And I log out
    And I am logged in as "Potato"
    And I make a new article with title "Barfoo" and body "dolor sit amet"
    And I log out
  
  Scenario: Admin can see the merge page
  	Given I am logged into the admin panel
  	And I am on the all articles page
  	Then I should see "Foobar"
  	When I follow "Foobar"
  	Then I should see "Merge"

  Scenario: Non-admin should not see merge page
  	Given I am logged in as "Potato"
  	Then I should see "Potato"
  	And I am on the all articles page
  	Then I should see "Barfoo"
  	When I follow "Barfoo"
  	Then "merge_with" should not be visible

	Scenario: Merged article should have title of first article
  	Given I am logged into the admin panel
		And I am on the all articles page
		And I merge "Foobar" with "Barfoo"
		Then I should see "Merged files successfully"
  	And I am on the all articles page
		Then I should see "Foobar"
		And I should not see "Barfoo"

	Scenario: Merged article contains text of both articles
  	Given I am logged into the admin panel
		And I am on the all articles page
		And I merge "Foobar" with "Barfoo"
		Then I should see "Merged files successfully"
		And I should see "Lorem Ipsum"
		And I should see "dolor sit amet"

	Scenario: Merged article should have author of first article
  	Given I am logged into the admin panel
		And I am on the all articles page
		And I merge "Foobar" with "Barfoo"
		Then I should see "Merged files successfully"
  	When I am on the all articles page
  	Then I should not see "Barfoo"
		And I should not see "Potato"

	Scenario: Merged article should contain both articles' comments
  	Given I am logged into the admin panel
  	When I add the comment "Tranquil as a forest" to the article "Foobar"
  	And I add the comment "But a fire within" to the article "Barfoo"
		And I am on the all articles page
		And I merge "Foobar" with "Barfoo"
		When I go to the home page
		Then I should see "Foobar"
		And I should not see "Barfoo"
		When I follow "Foobar"
		Then I should see "Tranquil as a forest"
		And I should see "But a fire within"
		
	
