Feature: Assets
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have a app/assets/javascripts/application.js
    Then I have a app/assets/stylesheets/_variables.scss
    Then I have a app/assets/stylesheets/application.scss
    Then I have a app/assets/stylesheets/reset.scss
    Then I have a app/assets/stylesheets/general.scss
    Then I have a app/assets/stylesheets/form.scss
    Then I have a app/assets/stylesheets/responsive.scss
    Then I dont have a app/assets/stylesheets/application.css
