require_relative '../page_objects/abstract_page'
require_relative '../page_objects/personal_office_page'

class AutorizationPage < AbstractPage

  def initialize (driver)
    super(driver)
  end

  def output_title
    wait.until { get_page_title.start_with? "Авторизация" }
    puts "Переход на страницу - " + get_page_title
  end

  def fill_in_login(login)
    # Заполнение поля Email / MobilePhone
    @email_field = @@driver.find_element(:id, 'mobileOrEmail')
    @email_field.clear
    @email_field.send_keys login
    return AutorizationPage.new(@@driver)
  end

  def fill_in_password(pass)
    # Заполнение поля Пароль
    @pass_field = @@driver.find_element(:name, 'password')
    @pass_field.clear
    @pass_field.send_keys pass
    return AutorizationPage.new(@@driver)
  end

  def submit_form
    # Нажатие на кнопку "Войти"
    @submit_btn = @@driver.find_element(:xpath, '//*[@id="authnFrm"]/div[1]/div[1]/div[3]/button')
    @submit_btn.click
    return PersonalOfficePage.new(@@driver)
  end

end