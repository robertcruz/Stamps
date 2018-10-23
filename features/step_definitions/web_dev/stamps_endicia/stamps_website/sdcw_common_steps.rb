Then /^SDCW: navigate back$/ do
  SdcPage.browser.back
  step 'pause for 1 second'
end

Then /^SDCW: page redirects to (.*)$/ do |str|
  sdcw_page = TestSession.env.url
end

Then /^SDCW: blur_out on page$/ do
  StampsWebsite.common_page.stamps_logo.blur_out
  step 'pause for 1 second'
end

Then /^SDCW: click stamps website logo$/ do
  StampsWebsite.common_page.stamps_logo.click
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/')
    when :prod
      expect(url).to eql('https://www.stamps.com/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/")
  end
end

Then /^SDCW: click get started button$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common_page.get_started_xs.click!
  else
    common_page.get_started.click!
  end
  step 'pause for 2 second'
  step 'WL: expect profile page email exists'

  url = SdcPage.browser.url

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://qa-registration.stamps.com/registration/#!&p=profile')
    when :stg
      expect(url).to eql('https://staging-registration.stamps.com/registration/#!&p=profile')
    when :prod
      expect(url).to eql('https://registration.stamps.com/registration/#!&p=profile')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/registration/#!&p=profile")
  end
end

Then /^SDCW: click get log in button$/ do
  StampsWebsite.common_page.log_in.click!
  step 'pause for 2 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://print.qacc.stamps.com/SignIn/')
    when :stg
      expect(url).to eql('https://print.testing.stamps.com/SignIn/')
    when :prod
      expect(url).to eql('https://print.stamps.com/SignIn/')
  end
end

Then /^SDCW: click FAQ$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: click hamburger button'
    common_page.faq_header_xs.click
  else
    common_page.faq_header.click
  end

  step 'pause for 2 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/postage-online/faqs/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/postage-online/faqs/')
    when :prod
      expect(url).to eql('https://www.stamps.com/postage-online/faqs/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/postage-online/faqs/")
  end
end

Then /^SDCW: click hamburger button$/ do
  menu_xs = StampsWebsite.common_page.menu_xs
  menu_xs.wait_until_present(timeout: 5)
  step 'pause for 1 second'
  att_value = menu_xs.attribute_value 'class'
  menu_xs.click if att_value == 'navbar-toggle collapsed'
  step 'pause for 2 second'
  expect(menu_xs.attribute_value 'class').to eql('navbar-toggle')
end

Then /^SDCW: click hamburger --> get started link$/ do
  step 'SDCW: click hamburger button'
  StampsWebsite.common_page.get_started_xs.click
  step 'pause for 2 second'
  step 'WL: expect profile page email exists'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://qa-registration.stamps.com/registration/#!&p=profile')
    when :stg
      expect(url).to eql('https://staging-registration.stamps.com/registration/#!&p=profile')
    when :prod
      expect(url).to eql('https://registration.stamps.com/registration/#!&p=profile')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/registration/#!&p=profile")
  end
end

Then /^SDCW: click hamburger --> learn more$/ do
  step 'SDCW: click hamburger button'
  menu_learn_more_xs = StampsWebsite.common_page.menu_learn_more_xs
  menu_learn_more_xs.wait_until_present(timeout: 5)
  step 'pause for 1 second'
  att_value = menu_learn_more_xs.attribute_value 'class'
  menu_learn_more_xs.click if att_value == 'list-group-item list-group-item-success collapsed'
  step 'pause for 1 second'
  expect(menu_learn_more_xs.attribute_value 'class').to eql('list-group-item list-group-item-success')
end

Then /^SDCW: click learn more --> small office mailers link$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: click hamburger --> learn more'
    common_page.small_office_mailers_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.learn_more.click
    else
      common_page.learn_more.hover
      common_page.learn_more.click if TestSession.env.local_browser == :gc_iPad
    end
    common_page.small_office_mailers.click
  end
  step 'pause for 2 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/postage-online/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/postage-online/')
    when :prod
      expect(url).to eql('https://www.stamps.com/postage-online/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/postage-online/")
  end
end

Then /^SDCW: click learn more --> online sellers link$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: click hamburger --> learn more'
    common_page.online_sellers_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.learn_more.click
    else
      common_page.learn_more.hover
      common_page.learn_more.click if TestSession.env.local_browser == :gc_iPad
    end
    common_page.online_sellers.click
  end
  step 'pause for 2 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/shipping/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/shipping/')
    when :prod
      expect(url).to eql('https://www.stamps.com/shipping/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/shipping/")
  end
end

Then /^SDCW: click learn more --> warehouse shippers link$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: click hamburger --> learn more'
    common_page.warehouse_shippers_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.learn_more.click
    else
      common_page.learn_more.hover
      common_page.learn_more.click if TestSession.env.local_browser == :gc_iPad
    end
    common_page.warehouse_shippers.click
  end
  step 'pause for 2 second'
  url = SdcPage.browser.url

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/warehouse/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/warehouse/')
    when :prod
      expect(url).to eql('https://www.stamps.com/warehouse/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/warehouse/")
  end
end

Then /^SDCW: click learn more --> corporate postage solutions link$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: click hamburger --> learn more'
    common_page.corporate_postage_solutions_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.learn_more.click
      common_page.corporate_postage_solutions.focus
      common_page.corporate_postage_solutions.click
    else
      common_page.learn_more.hover
      common_page.learn_more.click if TestSession.env.local_browser == :gc_iPad
      common_page.corporate_postage_solutions.click
    end
  end
  step 'pause for 2 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/enterprise/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/enterprise/')
    when :prod
      expect(url).to eql('https://www.stamps.com/enterprise/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/enterprise/")
  end
end

Then /^SDCW: click hamburger --> customer support$/ do
  step 'SDCW: click hamburger button'
  StampsWebsite.common_page.customer_support_header_xs.click
  step 'pause for 2 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close
  expect(url).to eql('https://stamps--tst.custhelp.com/app/answers/list')
end

Then /^SDCW: click hamburger --> customer log-in/ do
  step 'SDCW: click hamburger button'
  StampsWebsite.common_page.customer_log_in_xs.click

  step 'pause for 2 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://print.qacc.stamps.com/SignIn/?')
    when :stg
      expect(url).to eql('https://print.testing.stamps.com/SignIn/?')
    when :prod
      expect(url).to eql('https://print.stamps.com/SignIn/?')
  end
end

Then /^SDCW: expect hamburger --> call us 1-888-434-0055 to be present/ do
  step 'SDCW: click hamburger button'
  call_us_xs = StampsWebsite.common_page.call_us_xs
  expect(call_us_xs.text_value).to be_present
  expect(call_us_xs.text_value).to eql('Call Us 1-888-434-0055')
end


Then /^SDCW: verify default elements on header for browser$/ do
  step 'SDCW: click stamps website logo'
  step 'SDCW: navigate back'
  step 'SDCW: click get started button'
  step 'SDCW: navigate back'
  step 'SDCW: click get log in button'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> small office mailers link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> online sellers link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> warehouse shippers link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> corporate postage solutions link'
  step 'SDCW: navigate back'
end

Then /^SDCW: verify default elements on header for mobile$/ do
  step 'SDCW: click stamps website logo'
  step 'SDCW: navigate back'
  step 'SDCW: click get started button'
  step 'SDCW: navigate back'
  step 'SDCW: click hamburger --> get started link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> small office mailers link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> online sellers link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> warehouse shippers link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> corporate postage solutions link'
  step 'SDCW: navigate back'
  step 'SDCW: click hamburger --> customer support'
  step 'SDCW: click hamburger --> customer log-in'
  step 'SDCW: navigate back'
  step 'SDCW: expect hamburger --> call us 1-888-434-0055 to be present'
end

Then /^SDCW: verify default elements on footer for browser$/ do
  step 'SDCW: expect stamps website footer usps logo exists'
  step 'SDCW: expect stamps website footer usps logo words is Stamps.com is an independent vendor of the USPS.'
  step 'SDCW: expect stamps website footer copyright exists'
  step 'SDCW: expect stamps website footer copyright text is Copyright © 1998-2018 Stamps.com Inc.'
  step 'SDCW: click footer copyright link'
  step 'SDCW: click products --> small office mailers'
  step 'SDCW: click products --> online sellers'
  step 'SDCW: click products --> warehouse shippers'
  step 'SDCW: click products --> corporate postage solutions'
  step 'SDCW: click products --> photo stamps'
  step 'SDCW: click products --> supplies'
  step 'SDCW: click support --> download software'
  step 'SDCW: click support --> customer support'
  step 'SDCW: click support --> how to videos'
  step 'SDCW: click support --> system status'
  step 'SDCW: click company stuff --> about us'
  step 'SDCW: click company stuff --> shipping partners'
  step 'SDCW: click company stuff --> privacy policy'
  step 'SDCW: click company stuff --> investor info'
  step 'SDCW: click company stuff --> careers'
  step 'SDCW: click company stuff --> affiliates'
  step 'SDCW: click company stuff --> site map'
  step 'SDCW: click company stuff --> site map'
  step 'SDCW: click company stuff --> contact us'
  step 'SDCW: click developers --> developer overview'
  step 'SDCW: click developers --> developer registration'
  step 'SDCW: click developers --> developer reference guide'
  step 'SDCW: click developers --> developer products'
  step 'SDCW: click follow us --> facebook'
  step 'SDCW: click follow us --> twitter'
  step 'SDCW: click follow us --> google plus'
  step 'SDCW: click follow us --> youtube'
  step 'SDCW: click follow us --> linkedin'
  step 'SDCW: click follow us --> blog'
end

Then /^SDCW: verify default elements on footer for mobile$/ do
  step 'SDCW: expect stamps website footer usps logo exists'
  step 'SDCW: expect stamps website footer usps logo words is Stamps.com is an independent vendor of the USPS.'
  step 'SDCW: expect stamps website footer copyright exists'
  step 'SDCW: expect stamps website footer copyright text is Copyright © 1998-2018 Stamps.com Inc.'
  step 'SDCW: click footer copyright link'
  step 'SDCW: click products --> small office mailers'
  step 'SDCW: click products --> online sellers'
  step 'SDCW: click products --> warehouse shippers'
  step 'SDCW: click products --> corporate postage solutions'
  step 'SDCW: click products --> photo stamps'
  step 'SDCW: click products --> supplies'
  step 'SDCW: collapse footer products mobile'
  step 'SDCW: click support --> download software'
  step 'SDCW: click support --> customer support'
  step 'SDCW: click support --> how to videos'
  step 'SDCW: click support --> system status'
  step 'SDCW: collapse footer support mobile'
  step 'SDCW: click company stuff --> about us'
  step 'SDCW: click company stuff --> shipping partners'
  step 'SDCW: click company stuff --> privacy policy'
  step 'SDCW: click company stuff --> investor info'
  step 'SDCW: click company stuff --> careers'
  step 'SDCW: click company stuff --> affiliates'
  step 'SDCW: click company stuff --> site map'
  step 'SDCW: click company stuff --> contact us'
  step 'SDCW: collapse footer company stuff mobile'
  step 'SDCW: click developers --> developer overview'
  step 'SDCW: click developers --> developer registration'
  step 'SDCW: click developers --> developer reference guide'
  step 'SDCW: click developers --> developer products'
  step 'SDCW: collapse footer developers mobile'
  step 'SDCW: click follow us --> facebook'
  step 'SDCW: click follow us --> twitter'
  step 'SDCW: click follow us --> google plus'
  step 'SDCW: click follow us --> youtube'
  step 'SDCW: click follow us --> linkedin'
  step 'SDCW: click follow us --> blog'
end

#........footer...........#
Then /^SDCW: expect stamps website footer usps logo exists$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    usps_logo = common_page.usps_logo[0]
  else
    usps_logo = common_page.usps_logo[1]
  end

  common_page.footer.wait_until_present(timeout: 2)
  common_page. footer.scroll_into_view
  expect(usps_logo).to be_present
end

Then /^SDCW: expect stamps website footer usps logo words is (.*)$/ do |str|
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    usps_logo_caption = common_page.usps_logo_caption[0]
  else
    usps_logo_caption = common_page.usps_logo_caption[1]
  end

  common_page.footer.wait_until_present(timeout: 2)
  common_page.footer.scroll_into_view
  text = usps_logo_caption.inner_text.strip
  expect(text).to eql(str)
end

Then /^SDCW: expect stamps website footer copyright exists$/ do
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    copyright = StampsWebsite.common_page.copyright[0]
  else
    copyright = StampsWebsite.common_page.copyright[1]
  end
  copyright.wait_until_present(timeout: 2)
  copyright.scroll_into_view
  expect(copyright).to be_present
end


Then /^SDCW: expect stamps website footer copyright text is (.*)$/ do |str|
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    copyright = StampsWebsite.common_page.copyright[0]
  else
    copyright = StampsWebsite.common_page.copyright[1]
  end
  text = copyright.inner_text.strip
  expect(text).to eql(str)
end

Then /^SDCW: click footer copyright link$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    common_page.copyright[0].scroll_into_view
    common_page.copyright[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.copyright[1].focus
      common_page.copyright[1].click
    else
      common_page.copyright[1].scroll_into_view
      common_page.copyright[1].hover
      common_page.copyright[1].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/site/copyright/#copyright')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/site/copyright/#copyright')
    when :prod
      expect(url).to eql('https://www.stamps.com/site/copyright/#copyright')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/site/copyright/#copyright")
  end

  step 'SDCW: navigate back'
end

######## Products #######
#
Then /^SDCW: expand footer products mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.footer_products_xs.scroll_into_view
  status = common_page.footer_products_xs.attribute_value  'class'
  common_page.footer_products_xs.click if status.include? 'collapsed'
  step 'pause for 1 second'
end

Then /^SDCW: collapse footer products mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.footer_products_xs.scroll_into_view
  status = common_page.footer_products_xs.attribute_value  'class'
  common_page.footer_products_xs.click if status.exclude? 'collapsed'
  step 'pause for 1 second'
end

Then /^SDCW: click products --> small office mailers$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    step 'SDCW: expand footer products mobile'
    common_page.footer_office_mailers[2].click
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_office_mailers[3].click
    else
      common_page.footer_office_mailers[3].scroll_into_view
      common_page.footer_office_mailers[3].hover
      common_page.footer_office_mailers[3].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/postage-online/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/postage-online/')
    when :prod
      expect(url).to eql('https://www.stamps.com/postage-online/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/postage-online/")
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click products --> online sellers$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    step 'SDCW: expand footer products mobile'
    common_page.footer_online_sellers[2].click
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_online_sellers[3].click
    else
      common_page.footer_online_sellers[3].scroll_into_view
      common_page.footer_online_sellers[3].hover
      common_page.footer_online_sellers[3].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/shipping/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/shipping/')
    when :prod
      expect(url).to eql('https://www.stamps.com/shipping/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/shipping/")
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click products --> warehouse shippers$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    step 'SDCW: expand footer products mobile'
    common_page.footer_warehouse_shippers[2].click
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_warehouse_shippers[3].click
    else
      common_page.footer_warehouse_shippers[3].scroll_into_view
      common_page.footer_warehouse_shippers[3].hover
      common_page.footer_warehouse_shippers[3].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/warehouse/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/warehouse/')
    when :prod
      expect(url).to eql('https://www.stamps.com/warehouse/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/warehouse/")
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click products --> corporate postage solutions$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    step 'SDCW: expand footer products mobile'
    common_page.footer_corporate_postage_solutions[2].click
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_corporate_postage_solutions[3].click
    else
      common_page.footer_corporate_postage_solutions[3].scroll_into_view
      common_page.footer_corporate_postage_solutions[3].hover
      common_page.footer_corporate_postage_solutions[3].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/enterprise/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/enterprise/')
    when :prod
      expect(url).to eql('https://www.stamps.com/enterprise/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/enterprise/")
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click products --> photo stamps$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer products mobile'
    common_page.footer_photo_stamps[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_photo_stamps[1].click
    else
      common_page.footer_photo_stamps[1].scroll_into_view
      common_page.footer_photo_stamps[1].hover
      common_page.footer_photo_stamps[1].click
    end
  end
  step 'pause for 3 second'
  url = SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://photo.corp.stamps.com/Store/')
    when :stg
      expect(url).to eql('https://photo.staging.stamps.com/Store/')
    when :prod
      expect(url).to eql('https://photo.corp.stamps.com/Store/')
  end

  step 'pause for 1 second'
end

Then /^SDCW: click products --> supplies$/ do
  common_page = StampsWebsite.common_page

  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer products mobile'
    common_page.footer_supplies[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_supplies[1].wait_until_present(timeout: 10)
      common_page.footer_supplies[1].click
    else
      common_page.footer_supplies[1].wait_until_present(timeout: 10)
      common_page.footer_supplies[1].scroll_into_view
      common_page.footer_supplies[1].hover
      common_page.footer_supplies[1].click
    end
  end
  step 'pause for 1 second'
  SdcPage.browser.windows.last.use
  common_page.stamps_store_logo.wait_until_present(timeout: 30)
  url = SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://store.corp.stamps.com/Store/')
    when :stg
      expect(url).to eql('https://store.staging.stamps.com/Store/')
    when :prod
      expect(url).to eql('https://store.corp.stamps.com/Store/')
    else
      expect(url).to eql('https://store.corp.stamps.com/Store/')
  end

  step 'pause for 1 second'
end

#......Support.......#
Then /^SDCW: expand footer support mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.footer_support_xs.scroll_into_view
  status = common_page.footer_support_xs.attribute_value  'class'
  common_page.footer_support_xs.click if status.include? 'collapsed'
  step 'pause for 1 second'
end

Then /^SDCW: collapse footer support mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.footer_support_xs.scroll_into_view
  status = common_page.footer_support_xs.attribute_value  'class'
  common_page.footer_support_xs.click if status.exclude? 'collapsed'
  step 'pause for 1 second'
end

Then /^SDCW: click support --> download software$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer support mobile'
    common_page.download_software[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.download_software[1].click
    else
      common_page.download_software[1].scroll_into_view
      common_page.download_software[1].hover
      common_page.download_software[1].click
    end
  end
  step 'pause for 5 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/download/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/download/')
    when :prod
      expect(url).to eql('https://www.stamps.com/download/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/download/")
  end

  step 'SDCW: navigate back'
end

Then /^SDCW: click support --> customer support$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer support mobile'
    common_page.customer_support[1].click
  else
    if TestSession.env.local_browser == :edge
      common_page.customer_support[2].click
    else
      common_page.customer_support[2].scroll_into_view
      common_page.customer_support[2].hover
      common_page.customer_support[2].click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://stamps--tst.custhelp.com/')
    when :stg
      expect(url).to eql('https://stamps--tst.custhelp.com/')
    when :prod
      expect(url).to eql('https://stamps--tst.custhelp.com/')
    else
      expect(url).to eql('https://stamps--tst.custhelp.com/')
  end

end

Then /^SDCW: click support --> how to videos$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer support mobile'
    common_page.how_to_videos[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.how_to_videos[1].click
    else
      common_page.how_to_videos[1].scroll_into_view
      common_page.how_to_videos[1].hover
      common_page.how_to_videos[1].click
    end
  end
  step 'pause for 5 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    expect(url).to eql('https://m.youtube.com/user/StampscomVideo')
  elsif TestSession.env.local_browser == :gc_iPad
    expect(url).to eql('https://m.youtube.com/user/StampscomVideo')
  else
    expect(url).to eql('https://www.youtube.com/user/StampscomVideo')
  end

end


Then /^SDCW: click support --> system status$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer support mobile'
    common_page.system_status[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.system_status[1].click
    else
      common_page.system_status[1].scroll_into_view
      common_page.system_status[1].hover
      common_page.system_status[1].click
    end
  end
  step 'pause for 3 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://status.stamps.com/')
    when :stg
      expect(url).to eql('https://status.stamps.com/')
    when :prod
      expect(url).to eql('https://status.stamps.com/')
    else
      expect(url).to eql('https://status.stamps.com/')
  end

end

####### company stuff #####
Then /^SDCW: expand footer company stuff mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.footer_company_stuff_xs.scroll_into_view
  status = common_page.footer_company_stuff_xs.attribute_value  'class'
  common_page.footer_company_stuff_xs.click if status.include? 'collapsed'
  step 'pause for 1 second'
end

Then /^SDCW: collapse footer company stuff mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.footer_company_stuff_xs.scroll_into_view
  status = common_page.footer_company_stuff_xs.attribute_value  'class'
  common_page.footer_company_stuff_xs.click if status.exclude? 'collapsed'
  step 'pause for 1 second'
end

Then /^SDCW: click company stuff --> about us$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer company stuff mobile'
    common_page.about_us[0].click

  else
    if TestSession.env.local_browser == :edge
      common_page.about_us[1].click
    else
      common_page.about_us[1].scroll_into_view
      common_page.about_us[1].hover
      common_page.about_us[1].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/company-info/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/company-info/')
    when :prod
      expect(url).to eql('https://www.stamps.com/company-info/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/company-info/")
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click company stuff --> shipping partners$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer company stuff mobile'
    common_page.shipping_partners[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.shipping_partners[1].click
    else
      common_page.shipping_partners[1].scroll_into_view
      common_page.shipping_partners[1].hover
      common_page.shipping_partners[1].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/shipping/integrations/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/shipping/integrations/')
    when :prod
      expect(url).to eql('https://www.stamps.com/shipping/integrations/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/shipping/integrations/")
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click company stuff --> privacy policy$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer company stuff mobile'
    common_page.privacy_policy[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.privacy_policy[1].click
    else
      common_page.privacy_policy[1].scroll_into_view
      common_page.privacy_policy[1].hover
      common_page.privacy_policy[1].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/privacy-policy/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/privacy-policy/')
    when :prod
      expect(url).to eql('https://www.stamps.com/privacy-policy/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/privacy-policy/")
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click company stuff --> investor info$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer company stuff mobile'
    common_page.investor_info[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.investor_info[1].click
    else
      common_page.investor_info[1].scroll_into_view
      common_page.investor_info[1].hover
      common_page.investor_info[1].click
    end
  end
  step 'pause for 3 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('http://investor.stamps.com/')
    when :stg
      expect(url).to eql('http://investor.stamps.com/')
    when :prod
      expect(url).to eql('http://investor.stamps.com/')
    else
      expect(url).to eql('http://investor.stamps.com/')
  end

end

Then /^SDCW: click company stuff --> careers$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer company stuff mobile'
    common_page.careers[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.careers[1].click
    else
      common_page.careers[1].scroll_into_view
      common_page.careers[1].hover
      common_page.careers[1].click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close
  expect(url).to include 'https://careers-stamps.icims.com/jobs/intro?hashed=-435738745'
end

Then /^SDCW: click company stuff --> affiliates$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer company stuff mobile'
    common_page.affiliates[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.affiliates[1].click
    else
      common_page.affiliates[1].scroll_into_view
      common_page.affiliates[1].hover
      common_page.affiliates[1].click
    end
  end
  step 'pause for 3 second'
  url = SdcPage.browser.url

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/affiliates/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/affiliates/')
    when :prod
      expect(url).to eql('https://www.stamps.com/affiliates/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/affiliates/")
  end

  step 'SDCW: navigate back'
end

Then /^SDCW: click company stuff --> site map$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer company stuff mobile'
    common_page.site_map[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.site_map[1].click
    else
      common_page.site_map[1].scroll_into_view
      common_page.site_map[1].hover
      common_page.site_map[1].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/sitemap/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/sitemap/')
    when :prod
      expect(url).to eql('https://www.stamps.com/sitemap/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/sitemap/")
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click company stuff --> contact us$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer company stuff mobile'
    common_page.contact_us[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.contact_us[1].click
    else
      common_page.contact_us[1].scroll_into_view
      common_page.contact_us[1].hover
      common_page.contact_us[1].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/contact-us/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/contact-us/')
    when :prod
      expect(url).to eql('https://www.stamps.com/contact-us/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/contact-us/")
  end
  step 'SDCW: navigate back'
end

#### developers ####
Then /^SDCW: expand footer developers mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.developers_xs.scroll_into_view
  status = common_page.developers_xs.attribute_value  'class'
  common_page.developers_xs.click if status.include? 'collapsed'
  step 'pause for 1 second'
end

Then /^SDCW: collapse footer developers mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.developers_xs.scroll_into_view
  status = common_page.developers_xs.attribute_value  'class'
  common_page.developers_xs.click if status.exclude? 'collapsed'
  step 'pause for 1 second'
end

Then /^SDCW: click developers --> developer overview$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer developers mobile'
    common_page.developer_overview[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.developer_overview[1].click
    else
      common_page.developer_overview[1].scroll_into_view
      common_page.developer_overview[1].hover
      common_page.developer_overview[1].click
    end
  end
  step 'pause for 3 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://developer.qacc.stamps.com/developer/')
    when :stg
      expect(url).to eql('https://developer.staging.stamps.com/developer/')
    when :prod
      expect(url).to eql('https://stamps.com/developer/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-developer.corp.stamps.com/developer/")
  end
end

Then /^SDCW: click developers --> developer registration$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer developers mobile'
    common_page.developer_reg[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.developer_reg[1].click
    else
      common_page.developer_reg[1].scroll_into_view
      common_page.developer_reg[1].hover
      common_page.developer_reg[1].click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://developer.qacc.stamps.com/developer/register/')
    when :stg
      expect(url).to eql('https://developer.staging.stamps.com/developer/register/')
    when :prod
      expect(url).to eql('https://developer.stamps.com/developer/register/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-developer.corp.stamps.com/developer/register/")
  end

end

Then /^SDCW: click developers --> developer reference guide$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer developers mobile'
    common_page.developer_ref_guide[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.developer_ref_guide[1].click
    else
      common_page.developer_ref_guide[1].scroll_into_view
      common_page.developer_ref_guide[1].hover
      common_page.developer_ref_guide[1].click
    end
  end
  step 'pause for 5 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://developer.qacc.stamps.com/developer/docs/swsimv71.html#stamps-api-reference-guide')
    when :stg
      expect(url).to eql('https://developer.staging.stamps.com/developer/docs/swsimv71.html#stamps-api-reference-guide')
    when :prod
      expect(url).to eql('https://developer.stamps.com/developer/docs/swsimv71.html#stamps-api-reference-guide')
    else
      expect(url).to include("https://#{TestSession.env.url}-developer.corp.stamps.com/developer/docs")
  end

end

Then /^SDCW: click developers --> developer products$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer developers mobile'
    common_page.developer_products[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.developer_products[1].click
    else
      common_page.developer_products[1].scroll_into_view
      common_page.developer_products[1].hover
      common_page.developer_products[1].click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://developer.qacc.stamps.com/developer/products/')
    when :stg
      expect(url).to eql('https://developer.staging.stamps.com/developer/products/')
    when :prod
      expect(url).to eql('https://developer.stamps.com/developer/products/')
    else
      expect(url).to eql("https://#{TestSession.env.url}-developer.corp.stamps.com/developer/products")
  end

end

####### follow us #####
Then /^SDCW: expand footer follow us mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.follow_us_xs.scroll_into_view
  status = common_page.follow_us_xs.attribute_value  'class'
  common_page.follow_us_xs.click if status.include? 'collapsed'
  step 'pause for 1 second'
end

Then /^SDCW: collapse footer follow us mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.follow_us_xs.scroll_into_view
  status = common_page.follow_us_xs.attribute_value  'class'
  common_page.follow_us_xs.click if status.exclude? 'collapsed'
  step 'pause for 1 second'
end

Then /^SDCW: click follow us --> facebook$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer follow us mobile'
    common_page.facebook[0].scroll_into_view
    common_page.facebook[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.facebook[1].click
    else
      common_page.facebook[1].scroll_into_view
      common_page.facebook[1].hover
      common_page.facebook[1].click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close


  if SdcGlobal.web_dev_device
    expect(url).to eql('https://m.facebook.com/stamps.com/')
  elsif  TestSession.env.local_browser == :gc_iPad
    expect(url).to eql('https://m.facebook.com/stamps.com/')
  elsif  TestSession.env.mobile_device
    expect(url).to eql('https://m.facebook.com/stamps.com/')
  else
    expect(url).to eql('https://www.facebook.com/stamps.com/')
  end

end

Then /^SDCW: click follow us --> twitter$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer follow us mobile'
    common_page.twitter[0].scroll_into_view
    common_page.twitter[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.twitter[1].click
    else
      common_page.twitter[1].scroll_into_view
      common_page.twitter[1].hover
      common_page.twitter[1].click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  if SdcGlobal.web_dev_device
    expect(url).to eql('https://mobile.twitter.com/stampscom/')
  elsif  TestSession.env.local_browser == :gc_iPad
    expect(url).to eql('https://mobile.twitter.com/stampscom/')
  elsif  TestSession.env.mobile_device
    expect(url).to eql('https://mobile.twitter.com/stampscom/')
  else
    expect(url).to eql('https://twitter.com/stampscom/')
  end

end

Then /^SDCW: click follow us --> google plus$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer follow us mobile'
    common_page.google_plus[0].scroll_into_view
    common_page.google_plus[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.google_plus[1].click
    else
      common_page.google_plus[1].scroll_into_view
      common_page.google_plus[1].hover
      common_page.google_plus[1].click
    end
  end
  step 'pause for 3 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  expect(url).to eql('https://plus.google.com/+stampscom')

end

Then /^SDCW: click follow us --> youtube$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer follow us mobile'
    common_page.youtube[0].scroll_into_view
    common_page.youtube[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.youtube[1].click
    else
      common_page.youtube[1].scroll_into_view
      common_page.youtube[1].hover
      common_page.youtube[1].click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  if SdcGlobal.web_dev_device
    expect(url).to eql('https://m.youtube.com/user/StampscomVideo')
  elsif  TestSession.env.local_browser == :gc_iPad
    expect(url).to eql('https://m.youtube.com/user/StampscomVideo')
  elsif  TestSession.env.mobile_device
    expect(url).to eql('https://m.youtube.com/user/StampscomVideo')
  else
    expect(url).to eql('https://www.youtube.com/user/StampscomVideo')
  end

end

Then /^SDCW: click follow us --> linkedin$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer follow us mobile'
    common_page.linkedin[0].scroll_into_view
    common_page.linkedin[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.linkedin[1].click
    else
      common_page.linkedin[1].scroll_into_view
      common_page.linkedin[1].hover
      common_page.linkedin[1].click
    end
  end
  step 'pause for 3 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  expect(url).to include('https://www.linkedin.com/')
end

Then /^SDCW: click follow us --> blog$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer follow us mobile'
    common_page.blog[0].scroll_into_view
    common_page.blog[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.blog[1].click
    else
      common_page.blog[1].scroll_into_view
      common_page.blog[1].hover
      common_page.blog[1].click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close
  expect(url).to eql('http://blog.stamps.com/')

end