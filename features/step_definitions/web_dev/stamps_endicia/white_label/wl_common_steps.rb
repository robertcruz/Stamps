Then /^WL: navigate to (.*)$/ do |str|
  SdcPage.browser.goto str
  step 'pause for 2 second'
end

Then /WL: browser refresh$/ do
  SdcPage.browser.refresh
  step 'pause for 2 second'
end

Then /^WL: navigate back$/ do
  SdcPage.browser.back
  step 'pause for 2 second'
end


#..................................Modal....................#
Then /^WL: click modal continue button$/ do
  modal_continue = WhiteLabel.common_page.modal_continue
  modal_continue.wait_until_present(timeout: 2)
  modal_continue.click
  step 'pause for 1 second'
end

Then /^WL: click modal cancel button$/ do
  modal_cancel = WhiteLabel.common_page.modal_cancel
  modal_cancel.wait_until_present(timeout: 2)
  modal_cancel.click
  step 'pause for 1 second'
end


Then /^WL: click modal x button$/ do
  step 'pause for 1 second'
  modal_x = WhiteLabel.common_page.modal_x
  modal_x.scroll_into_view
  modal_x.wait_until_present(timeout: 2)
  modal_x.click if modal_x.present?
  step 'pause for 1 second'
end

#............Stamps Website......................#
Then /^WL: expect registration navigation bar stamps or endicia logo exists$/ do
  stamps_logo = WhiteLabel.common_page.stamps_logo
  stamps_logo.wait_until_present(timeout: 60)
  expect(stamps_logo).to be_present
end


Then /^WL: establish stamps website db connection$/ do
  WhiteLabel.sdc_db_connection
end

Then /^WL: close stamps website db connection$/ do
  WhiteLabel.sdc_db_connection.close
end

Then /^WL: navigates to default registration page for stamps with the following offer id (?:random value|(.*))$/ do |str|

  step 'WL: establish stamps website db connection'
  common_page = WhiteLabel.common_page
  if str.nil?
    source_id, content, promo_code, offer_id, target_url = common_page.sdc_website_source_id_query(nil)
    if content.include? 'SecurityQuestionsBeforeRegistration'
      hash = Hash.from_xml(content)
      security_questions_before_reg  = hash['root']['SecurityQuestionsBeforeRegistration']
    else
      security_questions_before_reg = 'true'
    end
  else
    source_id, content, promo_code, offer_id, target_url  = common_page.sdc_website_source_id_query(str)
    if content.include? 'SecurityQuestionsBeforeRegistration'
      hash = Hash.from_xml(content)
      security_questions_before_reg  = hash['root']['SecurityQuestionsBeforeRegistration']
    else
      security_questions_before_reg = 'true'
    end
  end
  step 'WL: close stamps website db connection'

  WhiteLabel::SDCWWebsite.visit(source_id)
  common_page.stamps_logo.wait_until_present(timeout: 10)
  expect(SdcPage.browser.url).to include(target_url.to_s)

  common_page.get_started.click!
  SdcLogger.info "Sourceid = #{source_id}"
  SdcLogger.info "Offerid = #{offer_id}"

  TestData.hash[:source_id] = source_id
  TestData.hash[:content] = content
  TestData.hash[:promo_code] = promo_code
  TestData.hash[:offer_id] = offer_id
  TestData.hash[:target_url] = target_url
  TestData.hash[:security_questions_before_registration] = security_questions_before_reg
end

Then /^WL: navigates to default registration page for endicia with the following offer id (?:random value|(.*))$/ do |str|

  step 'WL: establish stamps website db connection'
  common_page = WhiteLabel.common_page
  if str.nil?
    source_id, content, promo_code, offer_id, target_url, vendor_id = common_page.sdc_website_source_id_query(nil)
  else
    source_id, content, promo_code, offer_id, target_url, vendor_id  = common_page.sdc_website_source_id_query(str)
  end
  step 'WL: close stamps website db connection'

  WhiteLabel::EWWebsite.visit

  SdcLogger.info "VendorId = #{vendor_id}"
  SdcLogger.info "OfferId = #{offer_id}"

  TestData.hash[:source_id] = source_id
  TestData.hash[:vendor_id] = vendor_id
  TestData.hash[:content] = content
  TestData.hash[:promo_code] = promo_code
  TestData.hash[:offer_id] = offer_id
  TestData.hash[:target_url] = target_url
end


Then /^WL: expect offer id and source id are the same between sdc_website and stamp_mart db$/ do
  offer_id, source_id = WhiteLabel.common_page.stamps_mart_source_id_query(TestData.hash[:source_id])
  wr_offer_id = WhiteLabel.common_page.wr_model_session_offer

  expect(TestData.hash[:offer_id]).to eql(offer_id) , 'sdc_website and stamp_mart offer id are not same'
  expect(wr_offer_id).to eql(offer_id), 'wr_web_page and stamp_mart offer id are not same'
  expect(source_id).to eql(TestData.hash[:source_id]), 'sdc_website and stamp_mart source id are not same'

end

#...................Security Question.....................#
Then /^WL: expect security questions header to be (.*)$/ do |str|
  sq_header = WhiteLabel.common_page.sq_header
  sq_header.wait_until_present(timeout: 100)
  expect(sq_header.text_value).to eql(str)
end

Then /^WL: [Ee]xpect security questions title to be (.*)$/ do |str|
  security_question_title = WhiteLabel.common_page.security_question
  security_question_title.wait_until_present(timeout: 5)
  expect(security_question_title.text_value).to eql(str)
end

Then /^WL: expect profile security questions header to be (.*)$/ do |str|
  expect(WhiteLabel.common_page.sq_header_profile.text_value.strip).to eql(str)
end

Then /^WL: expect profile security questions header is not present$/ do
  expect(WhiteLabel.common_page.sq_header_profile).not_to be_present
end

Then /^WL: select security questions first security question (.*)$/ do |str|
  common_page = WhiteLabel.common_page
  common_page.first_security_question.wait_until_present(timeout: 30)
  common_page.first_security_question.click
  common_page.dropdown_selection(str, 0)
  common_page.dropdown_element.safe_wait_until_present(timeout: 2)
  common_page.dropdown_element.click
  TestData.hash[:first_security_question] = common_page.first_security_question.attribute_value('title').strip
  expect(TestData.hash[:first_security_question]).to eql str
end

Then /^WL: expect first security question tooltip index (\d+) to be (.*)$/ do |index, str|
  first_security_question_help_block = WhiteLabel.common_page.first_security_question_help_block
  first_security_question_help_block.wait_until_present(timeout: 5)
  help_block_text = first_security_question_help_block.text_value.split("\n")
  expect(help_block_text[index - 1]).to eql(str)
end

Then /^WL: expect security questions first security question is (?:correct|(.*))$/ do |str|
  first_security_question = WhiteLabel.common_page.first_security_question
  str ||= TestData.hash[:first_security_question]
  expect(first_security_question.title).to eql(str)
  TestData.hash[:first_security_question] = str
end

Then /^WL: set security questions first security answer to (?:random value|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_numeric(min:6, max:10)
  WhiteLabel.common_page.first_secret_answer.set(str)
  TestData.hash[:first_security_answer] = str
end

Then /WL: expect security questions first security answer is (?:correct|(.*))$/ do |str|
  first_secret_answer =  WhiteLabel.common_page.first_secret_answer
  first_secret_answer.wait_until_present(timeout: 5)
  str ||= TestData.hash[:first_security_answer]
  str = '' if str == 'empty'
  expect(first_secret_answer.text_value.strip).to eql(str)
  TestData.hash[:first_security_answer] = str
end

Then /^WL: expect first security answer tooltip index (\d+) to be (.*)$/ do |index, str|
  first_security_answer_help_block = WhiteLabel.common_page.first_security_answer_help_block
  first_security_answer_help_block.wait_until_present(timeout: 5)
  help_block_text = first_security_answer_help_block.text_value.split("\n")
  expect(help_block_text[index - 1]).to eql(str)
end

Then /^WL: select security questions second security question (.*)$/ do |str|
  common_page = WhiteLabel.common_page
  common_page.second_security_question.click
  common_page.dropdown_selection(str, 1)
  common_page.dropdown_element.safe_wait_until_present(timeout: 2)
  common_page.dropdown_element.click
  TestData.hash[:second_security_question] = common_page.second_security_question.attribute_value('title').strip
  expect(TestData.hash[:second_security_question]).to eql str
end

Then /^WL: expect second security question tooltip index (\d+) to be (.*)$/ do |index, str|
  second_security_question_help_block = WhiteLabel.common_page.second_security_question_help_block
  second_security_question_help_block.wait_until_present(timeout: 5)
  help_block = second_security_question_help_block.text_value.split("\n")
  expect(help_block[index - 1]).to eql(str)
end

Then /^WL: expect security questions second security question is (?:correct|(.*))$/ do |str|
  second_security_question = WhiteLabel.common_page.second_security_question
  str ||= TestData.hash[:second_security_question]
  expect(second_security_question.title).to eql(str)
  TestData.hash[:second_security_question] = str
end

Then /^WL: set security questions second security answer to (?:random value|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_numeric(min:6, max:10)
  WhiteLabel.common_page.second_secret_answer.set(str)
  TestData.hash[:second_security_answer] = str
end

Then /WL: expect security questions second security answer is (?:correct|(.*))$/ do |str|
  second_secret_answer =  WhiteLabel.common_page.second_secret_answer
  second_secret_answer.wait_until_present(timeout: 5)
  str ||= TestData.hash[:second_security_answer]
  str = '' if str == 'empty'
  expect(second_secret_answer.text_value.strip).to eql(str)
  TestData.hash[:second_secret_answer] = str
end

Then /^WL: expect second security answer tooltip index (\d+) to be (.*)$/ do |index, str|
  second_security_answer_help_block = WhiteLabel.common_page.second_security_answer_help_block_pro_page
  second_security_answer_help_block.wait_until_present(timeout: 5)
  help_block = second_security_answer_help_block.text_value.split("\n")
  expect(help_block[index - 1]).to eql(str)
end

Then /^WL: expect security question page tooltip to be (.*)$/ do |str|
  sq_page_sq_help_block =  WhiteLabel.common_page.sq_page_sq_help_block
  expect(sq_page_sq_help_block[0].inner_text.strip).to eql(str)
  expect(sq_page_sq_help_block[1].inner_text.strip).to eql(str)
  expect(sq_page_sq_help_block[2].inner_text.strip).to eql(str)
  expect(WhiteLabel.common_page.second_security_answer_help_block.inner_text.strip).to eql(str)
end

Then /^WL: click security questions get started button$/ do
  step 'pause for 2 seconds'
  sq_get_started = WhiteLabel.common_page.sq_get_started
  sq_get_started.wait_until_present(timeout: 2)
  sq_get_started.click
  step 'pause for 2 seconds'
end

Then /^WL: expect security questions get started button exists$/ do
  WhiteLabel.common_page.sq_get_started.wait_until_present(timeout: 50)
  expect(WhiteLabel.common_page.sq_get_started).to be_present
end

Then /^WL: expect security question modal does not exists$/ do
  expect(WhiteLabel.common_page.security_question).not_to be_present
end

Then /^WL: if security question is present before registration then set the values$/ do
  if TestData.hash[:security_questions_before_registration] == 'true'
    step "WL: select security questions first security question What is your mother's maiden name?"
    step 'WL: set security questions first security answer to random value'
    step "WL: select security questions second security question What is your pet's name?"
    step 'WL: set security questions second security answer to random value'
  else
    expect(WhiteLabel.common_page.first_security_question).not_to be_present
  end
end

Then /^WL: if security question is present after registration then set the values$/ do
  if TestData.hash[:security_questions_before_registration] == 'false'
    step "WL: select security questions first security question What is your mother's maiden name?"
    step 'WL: set security questions first security answer to random value'
    step "WL: select security questions second security question What is your pet's name?"
    step 'WL: set security questions second security answer to random value'
    step 'WL: click security questions get started button'
  else
    expect(WhiteLabel.common_page.second_security_question).not_to be_present
  end
end

#...............................Username Taken Modal....................#
Then /^WL: if username taken is present then set username to (?:random value|(.*))$/ do |str|
  membership_page =  WhiteLabel.membership_page
  if TestData.hash[:username_taken] == TestData.hash[:username]
    expect(membership_page.username_taken_header).not_to be_present
  else
    membership_page.new_username.wait_until_present(timeout: 5)
    expect(membership_page.username_taken_header).to be_present
    membership_page.new_username.set ((TestData.hash[:username]=(str.nil?)?(TestHelper.rand_usr) : str))

    SdcLogger.info "UserName = #{TestData.hash[:username]}"
    step 'WL: click username taken continue button'
  end
end

Then /^WL: set username taken to (?:random value|(.*))/ do |str|
  new_username = WhiteLabel.membership_page.new_username
  new_username.wait_until_present(timeout: 10)

  5.times do
    new_username.clear
    new_username.set((TestData.hash[:username]=(str.nil?)?(TestHelper.rand_usr) : str))
    break unless new_username.text_value.strip == ''
  end

  new_username.click
  new_username.send_keys(:tab)
  SdcLogger.info "UserName Taken = #{TestData.hash[:username]}"
end

Then /^WL: set username taken username to an existing username from db$/ do
  existing_usr = WhiteLabel.common_page.existing_username_query
  step "WL: set username taken to #{existing_usr}"
end

Then /^WL: click username taken continue button$/ do
  step 'pause for 1 second'
  WhiteLabel.membership_page.username_taken_continue_btn.click!
end

Then /^WL: expect username taken header to be (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  step 'pause for 1 second'
  membership_page.username_taken_header.wait_until_present(timeout: 15)
  expect(membership_page.username_taken_header.text_value.strip).to eql(str)
end

Then /^WL: expect username taken paragraph to be$/ do |str|
  username_taken_p = WhiteLabel.membership_page.username_taken_p
  actual = username_taken_p.text_value.strip.gsub(/\P{ASCII}/, '')
  expected = str.gsub('USERNAME', TestData.hash[:username].strip)

  expect(expected).to eql(actual)
end

Then /^WL: expect username taken tooltip to be (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.new_username.click
  membership_page.new_username.send_keys(:tab)
  membership_page.new_username_help_block.wait_until_present(timeout: 3)
  expect(membership_page.new_username_help_block.text_value.strip).to eql(str)
end

#.........................An Error Occurred..............................#
Then /^WL: expect an error occurred modal head to be (.*)$/ do |str|
  error_occurred_header = WhiteLabel.common_page.error_occurred_header
  error_occurred_header.wait_until_present(timeout: 20)
  expect(error_occurred_header.text_value.strip).to eql(str)
end

Then /^WL: expect an error occurred modal paragraph to be$/ do |str|
  expect(WhiteLabel.common_page.error_occurred_p.text_value.strip).to eql(str)
end

Then /^WL: expect an error occurred modal error code to be (.*)$/ do |str|
  expect(WhiteLabel.common_page.error_occurred_error_code.text_value.strip).to eql(str)
end

Then /^WL: expect an error occurred modal error description to include (.*)$/ do |str|
  expect(WhiteLabel.common_page.error_occurred_error_description.text_value.strip).to include(str)
end

#................................Offer 573 Landing Page..............................#
Then /^WL: expect offer 573 landing page header to be (.*)$/ do |str|
  SdcPage.browser.alert.close if SdcPage.browser.alert.exists?

  offer_573_header = WhiteLabel.common_page.offer_573_header
  offer_573_header.wait_until_present(timeout: 30)
  step 'pause for 1 second'
  expect(offer_573_header.text_value.strip).to eql(str)
end

Then /^WL: expect offer 573 landing page sub header paragraph to be$/ do |str|
  expect(WhiteLabel.common_page.offer_573_p.text_value.strip).to eql(str)
end

Then /^WL: expect offer 573 landing page hp upgrade paragraph to be$/ do |str|
  expect(WhiteLabel.common_page.offer_573_p2.text_value.strip).to eql(str)
end

Then /^WL: expect offer 573 landing page shipping labels img is present$/ do
  expect(WhiteLabel.common_page.offer_573_img).to be_present
end

#..........................Offer 592 Landing Page.............................#
Then /^WL: expect offer 592 landing page header to be (.*)$/ do |str|
  SdcPage.browser.alert.close if SdcPage.browser.alert.exists?

  offer_592_header = WhiteLabel.common_page.offer_592_header
  offer_592_header.wait_until_present(timeout: 50)
  step 'pause for 1 second'
  expect(offer_592_header.text_value.strip).to eql(str)
end

Then /^WL: expect offer 592 landing page paragraph index (\d+) to be$/ do |index, str|
  expect(WhiteLabel.common_page.offer_592_p[index-1].inner_text.strip).to eql(str)
end

Then /^WL: click offer 592 landing page continue button$/ do
  WhiteLabel.common_page.offer_592_continue.click
end

Then /^WL: expect offer 592 landing page avery img is present$/ do
  SdcPage.browser.alert.close if SdcPage.browser.alert.exists?

  offer_592_avery = WhiteLabel.common_page.offer_592_avery
  offer_592_avery[0].wait_until_present(timeout: 50)
  step 'pause for 1 second'
  expect(offer_592_avery[0]).to be_present
  expect(SdcPage.browser.url).to include("avery.com/myavery")
end

#.............................Printing Landing Page..............................#
Then /^WL: expect user is navigated to print page for (.*)$/ do |str|
  step 'pause for 2 second'
  if SdcPage.browser.alert.exists?
    SdcPage.browser.alert.close
  end

  common_page= WhiteLabel.common_page

  if TestSession.env.local_browser == :edge
  common_page.print_edge_detail_link.safe_wait_until_present(timeout: 10)
  common_page.print_edge_detail_link.click if common_page.print_edge_detail_link.present?
  common_page.print_edge_go_on_link.click if common_page.print_edge_go_on_link.present?
  end

  common_page.print_stamps_logo.wait_until_present(timeout: 120) rescue false

  case TestSession.env.url
    when :qacc
      if str == 'stamps'
      expect(SdcPage.browser.url).to include('https://printext.qacc.stamps.com')
      else
        expect(SdcPage.browser.url).to include('https://print.qacc.endicia.com')
      end
    when :stg
      if str == 'stamps'
        expect(SdcPage.browser.url).to include('https://print.staging.stamps.com')
      else
        expect(SdcPage.browser.url).to include('https://print.staging.endicia.com')
      end
    when ''
      if str == 'stamps'
        expect(SdcPage.browser.url).to include('https://printext.stamps.com')
      else
        expect(SdcPage.browser.url).to include('https://print.endicia.com')
      end
  end
  # if SdcGlobal.scenario.tags[0].name == "@sdcwr_choose_supplies_page_not_present_workflow"
  #   #Todo Bug: Offer that has no atg promotion redirects to web postage without user not logged in.
  #   # When fixed, remove this conditions and just keep: expect(common_page.print_username.attribute_value('title').strip).to eql(TestData.hash[:username])
  # else
  #   expect(common_page.print_username.attribute_value('title').strip).to eql(TestData.hash[:username])
  # end
end


################ Header ############
Then /^WL: expect registration navigation bar stamps logo exists$/ do
  common = WhiteLabel.common_page

  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common.stamps_logo_xs.wait_until_present(timeout: 60)
    expect(common.stamps_logo_xs).to be_present
  else
    common.stamps_logo.wait_until_present(timeout: 60)
    expect(common.stamps_logo).to be_present
  end
end

Then /^WL: expect registration navigation bar usps logo exists$/ do
  usps_logo = WhiteLabel.common_page.usps_logo
  usps_logo.wait_until_present(timeout: 2)
  expect(usps_logo).to be_present
end

Then /^WL: expect registration navigation bar header text exists$/ do
  expect(WhiteLabel.common_page.header_text).to be_present
end

Then /^WL: expect registration navigation bar endicia logo exists$/ do
  endicia_logo = WhiteLabel.common_page.ew_logo
  endicia_logo.wait_until_present(timeout: 60)
  expect(endicia_logo).to be_present
end

############ Footer ###########

#### privacy policy ####
Then /^WL: expect registration container privacy policy link exists$/ do
  'pause for 1 second'
  expect(WhiteLabel.common_page.privacy_policy).to be_present
end

Then /^WL: click registration container privacy policy link$/ do
  pp = WhiteLabel.common_page.privacy_policy
  pp.wait_until_present(timeout: 5)
  pp.scroll_into_view
  pp.click
end

Then /^WL: expect privacy policy modal header is (.*)$/ do |str|
  pp_header = WhiteLabel.common_page.pp_header
  pp_header.wait_until_present(timeout: 5)
  pp_header.scroll_into_view
  str ||= TestData.hash[:pp_header]
  expect(pp_header.text_value.strip).to eql(str)
end

Then /^WL: expect privacy policy modal body header is (.*)$/ do |str|
  pp_body_header = WhiteLabel.common_page.pp_body_header
  pp_body_header.wait_until_present(timeout: 5)
  pp_body_header.scroll_into_view
  'pause for 1 second'
  str ||= TestData.hash[:pp_body_header]
  expect(pp_body_header.text_value.strip).to eql(str)
end

#### copyright ####
Then /^WL: expect registration container copyright exists$/ do
  expect(WhiteLabel.common_page.copyright).to be_present
end

Then /^WL: click registration container copyright link$/ do
  copyright = WhiteLabel.common_page.copyright
  copyright.wait_until_present(timeout: 5)
  copyright.scroll_into_view
  copyright.click
end

Then /^WL: expect copyright modal header is (.*)$/ do |str|
  copyright_header = WhiteLabel.common_page.copyright_header
  copyright_header.wait_until_present(timeout: 5)
  copyright_header.scroll_into_view
  'pause for 1 second'
  str ||= TestData.hash[:copyright_header]
  expect(copyright_header.text_value.strip).to eql(str)
end

Then /^WL: expect registration container norton logo exists$/ do
  expect(WhiteLabel.common_page.norton_logo).to be_present
end

#### live chat ####
Then /^WL: expect registration contact live chat button exists$/ do
  expect(WhiteLabel.common_page.live_chat).to be_present
end

Then /^WL: click live chat button$/ do
  WhiteLabel.common_page.live_chat.click
  step "pause for 1 second"
end

Then /^WL: expect registration chat launch modal is present$/ do
  SdcPage.browser.windows.last.use
  chat_launch = WhiteLabel.common_page.chat_launch
  chat_launch.wait_until_present(timeout: 5)
  expect(WhiteLabel.common_page.chat_launch).to be_present
end

Then /^WL: expect registration chat launch modal header is (.*)$/ do |str|
  chat_header = WhiteLabel.common_page.chat_header
  chat_header.wait_until_present(timeout: 5)
  chat_header.scroll_into_view
  'pause for 1 second'
  str ||= TestData.hash[:chat_header]
  expect(chat_header.text_value.strip).to eql(str)
end

Then /^WL: close chat launch modal$/ do
  SdcPage.browser.windows.last.close
end

#### proactive chat ####
Then /^WL: expect proactive chat dialog exists$/ do
  pro_chat = WhiteLabel.common_page
  pro_chat.sdc_chat
  pro_chat.proactive_chat.wait_until_present(timeout: 15)
  expect(pro_chat.proactive_chat).to be_present
end

Then /^WL: expect proactive chat header is (.*)$/ do |str|
  proactive_chat_header = WhiteLabel.common_page.proactive_chat_header
  proactive_chat_header.wait_until_present(timeout: 5)
  str ||= TestData.hash[:proactive_chat_header]
  expect(proactive_chat_header.text_value.strip).to eql(str)
end

Then /^WL: expect proactive chat logo exists$/ do
  expect(WhiteLabel.common_page.stamps_icon).to be_present
end

Then /^WL: expect proactive chat accept button exists$/ do
  expect(WhiteLabel.common_page.accept).to be_present
end

Then /^WL: expect proactive chat decline button exists$/ do
  expect(WhiteLabel.common_page.decline).to be_present
end

Then /^WL: click decline button$/ do
  WhiteLabel.common_page.decline.click
end

Then /^WL: expect proactive chat header label is (.*)$/ do |str|
  proactive_chat_header_label = WhiteLabel.common_page.proactive_chat_header_label
  proactive_chat_header_label.wait_until_present(timeout: 5)
  str ||= TestData.hash[:proactive_chat_header_label]
  expect(proactive_chat_header_label.text_value.strip).to eql(str)
end