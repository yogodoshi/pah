@no-clobber
Feature: Locale
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have a config/locales/pt-BR.yml
    Then I have a config/locales/app.pt-BR.yml
    Then I have the file config/application.rb and contents of this file should include:
      """
      config.time_zone = 'Brasilia'
      """
    Then I have the file config/application.rb and contents of this file should include:
      """
      config.i18n.enforce_available_locales = true
      """
    Then I have the file config/application.rb and contents of this file should include:
      """
      config.i18n.default_locale = :'pt-BR'
      """
    Then I have the file config/application.rb and contents of this file should include:
      """
      config.i18n.locale = :'pt-BR'
      """






