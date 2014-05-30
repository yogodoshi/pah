Feature: Public
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have a public/robots.txt
    Then I have a public/404.html
    Then I have a public/500.html
    Then I have the file public/robots.txt and contents of this file should include:
      """
      Disallow: /admin/
      """
    Then I have the file public/404.html and contents of this file should include:
      """
      Hmmm... Não achamos a página que você está procurando.
      """
    Then I have the file public/500.html and contents of this file should include:
      """
      Erro interno no servidor. :,(
      """
