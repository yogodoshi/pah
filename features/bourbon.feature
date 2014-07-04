@no-clobber
Feature: Bourbon
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Correct bourbon install
    Then I have the file app/assets/stylesheets/application.css.scss and contents of this file should include:
      """
      @import 'bourbon';
      @import 'base/base';
      @import 'neat';
      """
    Then I have the file app/assets/stylesheets/application.css.scss and contents of this file should not include:
      """
      *= require_tree .
      """
    Then I have the file app/assets/stylesheets/base/_base.scss and contents of this file should match:
      """
      ^@import 'grid-settings';
      """
    Then I dont have a app/assets/stylesheets/application.css


