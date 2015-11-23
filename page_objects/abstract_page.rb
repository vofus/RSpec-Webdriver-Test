require 'rspec'
require 'selenium-webdriver'
require_relative '../libs/data_test'

class AbstractPage

  @@driver = nil
  include DataTest
  # @@home_page_url = "http://gosuslugi.ru"
  # @@login = "topor-1989@mail.ru"
  # @@password = "11111111"

  def initialize (driver = Selenium::WebDriver.for(:firefox))
    @@driver = driver
    @@driver.manage.window.maximize
  end

  def login
    return @@login
  end

  def password
    return @@password
  end

  def navigate_to_app_root
    @@driver.navigate.to(@@home_page_url)
    # Нажимаем на кнопку автоопределения местоположения
    @auto_action_btn = @@driver.find_element(:name, 'autoAction')
    if @auto_action_btn.displayed?
      @auto_action_btn.click
    end
    return HomePage.new(@@driver)
  end

  def quit
    @@driver.quit
  end

  def get_page_title
    return @@driver.title
  end

  def wait
    # Инициализация ожидания
    return Selenium::WebDriver::Wait.new(:timeout => 10, :interval => 0.2)
  end

  # def auto_location
  #   # Нажимаем на кнопку автоопределения местоположения
  #   @auto_action_btn = @@driver.find_element(:name, 'autoAction')
  #   if @auto_action_btn.displayed?
  #     @auto_action_btn.click
  #   end
  #   return HomePage.new(@@driver)
  # end

end