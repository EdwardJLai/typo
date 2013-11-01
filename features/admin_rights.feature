Feature: A non-admin cannot merge articles
	As an admin
  In order to put similar articles in one place
  I want to merge similar articles into one
  
  Background: 
    Given I make a new article with "article_title" "Foobar" and "article__body_and_extended_editor" "Lorem Ipsum"
    And I make a new article with "article_title" "Barfoo" and "article__body_and_extended_editor" "dolor sit amet"
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
  	Given the blog is set up
  	And I am logged into the admin panel
  
  Scenario: Admin can see the merge page
  	Given I am on 
  
  Scenario: Non-admin can see merge page
  	When I follow "Users"
  	And I follow "New Users"



