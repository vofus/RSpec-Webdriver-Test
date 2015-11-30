require_relative '../page_objects/abstract_page'

class RegistrationPage < AbstractPage

  # def initialize (driver)
  #   super(driver)
  # end

  def output_title
    wait.until { get_page_title.start_with? "Регистрация" }
    puts "Переход на страницу - " + get_page_title
  end

end