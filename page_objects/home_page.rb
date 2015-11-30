require_relative '../page_objects/abstract_page'
require_relative '../page_objects/autorization_page'
require_relative '../page_objects/registration_page'

class HomePage < AbstractPage

  # def initialize (driver)
  #   super(driver)
  # end

  def navigate_to_autorization
    @enter_btn = @@driver.find_element(:css, 'a.sign-in')          # Кнопка "Вход"
    @enter_btn.click
    return AutorizationPage.new(@@driver)
  end

  def navigate_to_registration
    # click on Registration link
    @register_btn = @@driver.find_element(:css, 'a.register')      # Кнопка "Регистрация"
    @register_btn.click
    return RegistrationPage.new(@@driver)
  end

end