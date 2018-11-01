
Then /^visit Orders landing page$/ do
  SdcGlobal.web_app = :orders
  step 'initialize test parameters'

  env = case TestSession.env.url
        when :qacc
          'ext.qacc'
        when :qasc
          'ext.qasc'
        when :stg
          '.testing'
        when :prod
          ''
        else
          # ignore
        end

  SdcOrdersLandingPage.visit(env)
  if TestSession.env.mobile_device
    expect(SdcOrdersLandingPage.browser.current_url).to include('stamps.com')
  else
    expect(SdcOrdersLandingPage.browser.url).to include('stamps.com')
  end
end

Then /^initialize test parameters$/ do
  TestData.hash[:customs_associated_items] = {}
  TestData.hash[:service_mapping_items] = {}
  TestData.hash[:details_associated_items] = {}
  TestData.hash[:order_id] = {}
  TestData.hash[:service_look_up] = {}
  TestData.hash[:service_look_up]['FCM'] = 'First-Class Mail'
  TestData.hash[:service_look_up]['PM'] = 'Priority Mail'
  TestData.hash[:service_look_up]['PME'] = 'Priority Mail Express'
  TestData.hash[:service_look_up]['MM'] = 'Media Mail'
  TestData.hash[:service_look_up]['PSG'] = 'Parcel Select Ground'
  TestData.hash[:service_look_up]['FCMI'] = 'First-Class Mail International'
  TestData.hash[:service_look_up]['PMI'] = 'Priority Mail International'
  TestData.hash[:service_look_up]['PMEI'] = 'Priority Mail Express International'
  TestData.hash[:ord_id_ctr] = 0
  TestData.hash[:sdc_app] = ENV['WEB_APP']
  TestData.hash[:url] = ENV['URL']
  TestData.hash[:test] = ENV['USER_CREDENTIALS']
end

Then /^fetch user credentials from MySQL$/ do
  unless TestData.hash[:username]
    if TestSession.env.usr.nil? || TestSession.env.usr.downcase == 'default'
      credentials = SdcUserCredentials.fetch(SdcGlobal.scenario.tags[0].name)
      usr = credentials[:username]
      pw = credentials[:password]
    else
      usr = TestSession.env.usr
      pw = TestSession.env.pw
    end
    TestData.hash[:username] = usr
    TestData.hash[:password] = pw
  end
end

Then /^sign-in to orders$/ do
 # step 'verify health check for Orders' if TestSession.env.healthcheck
  step 'visit Orders landing page'
  usr = TestSession.env.usr
  pw = TestSession.env.pw
  step "sign-in to orders with #{usr}/#{pw}"
end

Then /^sign-in to orders with (.+)\/(.+)$/ do |usr, pw|
  step "set Orders landing page username to #{usr}"
  step "set Orders landing page password to #{pw}"

  if TestSession.env.ios_test
    step 'ios: click sign-in button'
  elsif TestSession.env.browser_test
    step 'browser: click sign-in button'
    step 'check for server error'
    if SdcGlobal.web_app.eql? :orders
      step 'click through tutorial modal'
      step 'close learn more modal'
      step 'close add advanced shipping features modal'
      step 'close whats new modal in orders'
    end
  end
  TestData.hash[:username] = usr
  TestData.hash[:password] = pw
  print 'sign-in to orders... done!'
end

Then /^close add advanced shipping features modal$/ do
  modal = SdcWebsite.modals.advanced_shipiping_features
  modal.window.safe_wait_until_present(timeout: 1)
  6.times do
    break unless modal.window.present?
    modal.x_button.safe_wait_until_present(timeout: 2)
    modal.x_button.safe_click if modal.x_button.present?
    modal.window.safe_wait_until_present(timeout: 1)
  end
end

Then /^click through tutorial modal$/ do
  modal = SdcWebsite.modals.tutorial_window
  modal.window.safe_wait_until_present(timeout: 1)
  6.times do
    break unless modal.window.present?
    modal.next.safe_wait_until_present(timeout: 2)
    modal.next.safe_click if modal.next.present?
    modal.window.safe_wait_until_present(timeout: 1)
  end
end

Then /^close learn more modal$/ do
  modal = SdcWebsite.modals.learn_more
  modal.window.safe_wait_until_present(timeout: 1)
  5.times do
    break unless modal.window.present?
    modal.close.safe_wait_until_present(timeout: 1)
    modal.close.safe_click if modal.close.present?
  end
end

Then /^close whats new modal in orders$/ do
  whats_new = SdcWebsite.modals.whats_new
  if whats_new.title.present?
    whats_new.close.click
  end
end

Then /^browser: click sign-in button$/ do
  step 'click Orders landing page sign-in button'
  step 'check for server error'
  step 'loading orders...' if SdcGlobal.web_app.eql? :orders
end

Then /^ios: click sign-in button$/ do
  landing_page = SdcWebsite.landing_page
  landing_page.sign_in.send_keys_while_present(iteration: 3, timeout: 4)
  step 'loading orders...' if SdcGlobal.web_app.eql?(:orders)
end

Then /^click sign-in button on android$/ do
  SdcPage.browser.hide_keyboard
  SdcPage.browser.action.move_to(landing_page.sign_in).click.perform
  SdcPage.browser.action.move_to(landing_page.sign_in).send_keys(:enter).perform
end

Then /^loading orders...$/ do
  #toolbar = SdcOrders.toolbar
  loading_orders = SdcOrders.loading_orders
  landing_page = SdcWebsite.landing_page
  step 'check for server error'
  landing_page.username.safe_wait_while_present(timeout: 120)
  step 'check for server error'
  SdcLogger.debug 'loading_orders.safe_wait_until_present(timeout: 30)...'
  loading_orders.safe_wait_until_present(timeout: 5)
  step 'check for server error'
  SdcLogger.debug 'loading_orders.safe_wait_while_present(timeout: 60)...'
  loading_orders.safe_wait_while_present(timeout: 90)
  step 'check for server error'
  SdcLogger.debug 'SdcGrid.body.safe_wait_until_present(timeout: 60)...'
  OrdersGrid.body.safe_wait_until_present(timeout: 120)
  step 'check for server error'
  SdcLogger.debug 'expect(toolbar.add).to be_present...'
  expect(landing_page.username).to_not be_present
  step 'check for server error'
  SdcLogger.debug 'loading orders... done!'
end

Then /^set Orders landing page username to (.*)$/ do |str|
  landing_page = SdcWebsite.landing_page
  landing_page.username.wait_until_present(timeout: 90)
  landing_page.username.set(str)
end

Then /^set Orders landing page password to (.*)$/ do |str|
  landing_page = SdcWebsite.landing_page
  landing_page.password.wait_until_present(timeout: 60)
  landing_page.password.set(str)
end

Then /^set sign in page username to (.*)$/ do |str|
  landing_page = SdcWebsite.landing_page
  landing_page.username.wait_until_present(timeout: 40)
  landing_page.username.set(str)
end

Then /^set sign in page password to (.*)$/ do |str|
  landing_page = SdcWebsite.landing_page
  landing_page.password.wait_until_present(timeout: 40)
  landing_page.password.set(str)
end

Then /^click sign in page sign-in button$/ do
  landing_page = SdcWebsite.landing_page
  landing_page.sign_in.wait_until_present(timeout: 40)
  landing_page.sign_in.click
end

Then /^click Orders landing page sign-in button$/ do
  rating_error = SdcWebsite.modals.rating_error
  landing_page = SdcWebsite.landing_page
  landing_page.sign_in.wait_until_present(timeout: 20)
  landing_page.sign_in.click
  3.times do
    landing_page.sign_in.safe_wait_while_present(timeout: 15)
    break unless landing_page.sign_in.present?
    landing_page.sign_in.safe_click if landing_page.sign_in.present?
    step 'check for server error'
  end
  landing_page.invalid_username.safe_wait_while_present(timeout: 15)
  if landing_page.invalid_username.present?
    str = landing_page.invalid_username.text_value
    expect(str).to eql('')
  end
  landing_page.sign_in.safe_wait_while_present(timeout: 40)
  rating_error.body.safe_wait_until_present(timeout: 15)
  if rating_error.body.present?
    error_msg = rating_error.body.text_value
    rating_error.ok.click
    expect(error_msg).to eql('')
  end
  step 'check for server error'
end

Then /^verify health check for (.+)$/ do |str|

  env = case str.downcase
        when /orders/
          case TestSession.env.url
          when :qacc
            'printext.qacc'
          when :qasc
            'printext.qasc'
          when :stg
            'print.testing'
          when :prod
            ''
          else
            # ignore
          end

        when /address/
          case TestSession.env.url
          when :qacc
            'printext.qacc'
          when :qasc
            'printext.qasc'
          when :stg
            'print.testing'
          when :prod
            ''
          else
            # ignore
          end

        when /or reports/
          case TestSession.env.url
          when :qacc
            'orext.qacc'
          when :qasc
            'orext.qasc'
          when :stg
            'or.staging'
          when :prod
            ''
          else
            # ignore
          end

        when /postage/
          case TestSession.env.url
          when :qacc
            'orext.qacc'
          when :qasc
            'orext.qasc'
          when :stg
            'or.staging'
          when :prod
            ''
          else
            # ignore
          end
        else
          # ignore
        end

  app = case(str.downcase)
        when /orders/
          :orders
        when /address/
          :addressbook
        when /or reports/
          :orreports
        when /postage/
          :postagetools
        else
          raise ArgumentError, "Healthcheck not supported for #{str}"
        end

  SdcHealthCheck.visit([env, app])
  body = SdcHealthCheck.new.body
  body.safe_wait_until_present(timeout: 10)
  expect(body.text).to include('All tests passed')
  print "\n"
  print "\n"
  print body.text
  print "\n"
  print "\n"
end


Then /^expect landing page help link is (.*)$/ do |str|
  landing_page = SdcWebsite.landing_page
  expect(landing_page.help_link.text_value).to eql str
end

Then /^expect landing page sign up link is (.*)$/ do |str|
  landing_page = SdcWebsite.landing_page
  expect(landing_page.sign_up.text_value).to eql str
end

Then /^click sign up link on landing page$/ do
  landing_page = SdcWebsite.landing_page
  landing_page.sign_up.wait_until_present(timeout: 5)
  landing_page.sign_up.click
end

Then /^expect resulting web reg url is correct$/ do
  expected_url = case TestSession.env.url
                 when :qacc
                   'https://qa-registration.stamps.com/registration/#!&p=profile'
                 when :stg
                   'https://staging-registration.stamps.com/registration/#!&p=profile'
                 when :prod
                   'https://registration.stamps.com/registration/#!&p=profile'
                 else
                   "https://#{TestSession.env.url}-win10.corp.stamps.com/registration/#!&p=profile"
                 end
  begin
    SdcPage.browser.wait_until(timeout: 5) do
      SdcPage.browser.url.eql expected_url
    end
  rescue
    # ignore
  end
  actual_url = SdcPage.browser.url
  expect(actual_url).to eql expected_url
end

Then /^click on visit our learning center link on landing page$/ do
  landing_page = SdcWebsite.landing_page
  landing_page.learning_center.wait_until_present(timeout: 5)
  landing_page.learning_center.click
end

Then /^expect resulting help page url is correct$/ do
  expected_url = 'https://stamps.custhelp.com/app'
  begin
    SdcPage.browser.wait_until(timeout: 5) do
      SdcPage.browser.url.eql expected_url
    end
  rescue
    # ignore
  end
  actual_url = SdcPage.browser.url
  expect(actual_url).to eql expected_url
end