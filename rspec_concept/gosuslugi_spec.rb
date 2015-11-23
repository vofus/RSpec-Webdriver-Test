require 'rspec'
require 'selenium-webdriver'
require_relative '../page_objects/abstract_page'
require_relative '../page_objects/home_page'
# require_relative '../page_objects/autorization_page'
# require_relative '../page_objects/registration_page'
# require_relative '../page_objects/personal_office_page'

describe 'gosuslugi site' do

  @app = nil

  before(:each) do
    @app = AbstractPage.new()
  end

  after(:each) do
    @app.quit
  end

  it 'should click on Enter link' do
    # Переход на страницу авторизации
    auth_page = @app.navigate_to_app_root
                    .navigate_to_autorization

    expect(auth_page.get_page_title).to be == 'Авторизация'
    auth_page.output_title
  end

  it 'should click on Registration link' do
    reg_page = @app.navigate_to_app_root
                   .navigate_to_registration

    expect(reg_page.get_page_title).to be == 'Регистрация'
    reg_page.output_title
  end

  it 'should autorization on site' do
    # Переход на страницу авторизации
    auth_page = @app.navigate_to_app_root
                    .navigate_to_autorization

    expect(auth_page.get_page_title).to be == 'Авторизация'
    auth_page.output_title

    # Переход на страницу личного кабинета
    person_page = auth_page.fill_in_login(auth_page.login)
                           .fill_in_password(auth_page.password)
                           .submit_form

    expect(person_page.get_page_title).to be == 'Личный кабинет физического лица'
    person_page.output_title

  end

  after(:all) do
    puts '--------------------'
    puts 'Все тесты завершены!'
  end

end