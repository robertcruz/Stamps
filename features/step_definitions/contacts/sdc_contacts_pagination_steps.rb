
Then /^set per page drop down of pagination on contacts toolbar to (\d+)$/ do |number|
  pagination = SdcContacts.pagination
  pagination.selection_pagination(value: number)
  pagination.perpage_drop_down.click unless pagination.selection.present?
  pagination.selection.safe_click
  expect(pagination.perpage_textbox.text_value).to include(number.to_s)
end

Then /^expect first and prev page arrows are disabled$/ do
  step 'expect first page is disabled'
  step 'expect prev page is disabled'
end

Then /^expect first and prev page arrows are enabled$/ do
  step 'expect first page is enabled'
  step 'expect prev page is enabled'
end

Then /^expect next and last page arrows are enabled$/ do
  step 'expect next page is enabled'
  step 'expect last page is enabled'
end

Then /^expect (.*) page is enabled$/ do |value|
  pagination = SdcContacts.pagination
  SdcLogger.info "#{value} Page disabled #{pagination.page_arrow_disabled(value)}"
  expect(pagination.page_arrow_disabled(value)).to be(false)
end

Then /^expect next and last page arrows are disabled$/ do
  step 'expect next page is disabled'
  step 'expect last page is disabled'
end

Then /^expect (.*) page is disabled$/ do|value|
  pagination = SdcContacts.pagination
  SdcLogger.info "#{value}Page disabled #{pagination.page_arrow_disabled(value)}"
  expect(pagination.page_arrow_disabled(value)).to be(true)
end

Then /^expect all the page arrows are disabled$/ do
  pagination = SdcContacts.pagination
  SdcLogger.info "First Page disabled #{pagination.page_arrow_disabled('first')}"
  expect(pagination.page_arrow_disabled('first')).to be(true)
  SdcLogger.info "Last Page disabled #{pagination.page_arrow_disabled('last')}"
  expect(pagination.page_arrow_disabled('last')).to be(true)
  SdcLogger.info "Previous Page disabled #{pagination.page_arrow_disabled('prev')}"
  expect(pagination.page_arrow_disabled('prev')).to be(true)
  SdcLogger.info "Next Page disabled #{pagination.page_arrow_disabled('next')}"
  expect(pagination.page_arrow_disabled('next')).to be(true)
end

Then /^expect contacts on contacts grid is reflected according to the selected pagination$/ do
  pagination = SdcContacts.pagination
  all_contacts_count = pagination.all_contacts_count.text_value
  pagination_count =pagination.perpage_textbox.text_value
  total_selected_count = 0
  current_page = pagination.current_page.text_value
  max_pages_text = pagination.max_pages.text_value
  max_pages_text = max_pages_text.split(" ")
  max_pages = max_pages_text[1]
  SdcLogger.info "max_pages #{max_pages}"

  if all_contacts_count.to_i > pagination_count.to_i
    while current_page.to_i <= max_pages.to_i
      #if current_page.to_i < max_pages.to_i
      step 'check row header in contacts grid'
      current_selected_count = pagination.selected_contacts_count.text_value
      step 'uncheck row header in contacts grid'
      total_selected_count = total_selected_count+ current_selected_count.to_i
      SdcLogger.info "total grid count #{total_selected_count}"
      SdcLogger.info "remaining grid count #{current_selected_count}"
      if current_page.to_i == 1
        step 'expect next and last page arrows are enabled'
        step 'expect first and prev page arrows are disabled'
        step 'click on the pagination next button of contacts page'
      elsif current_page.to_i == max_pages.to_i
        step 'expect next and last page arrows are disabled'
        step 'expect first and prev page arrows are enabled'
      elsif current_page.to_i < max_pages.to_i
        step 'expect next and last page arrows are enabled'
        step 'expect first and prev page arrows are enabled'
        step 'click on the pagination next button of contacts page'
      end
      #end
      current_page = current_page.to_i + 1
    end

  else
    expect(current_page).to eql(max_pages)
    step 'expect all the page arrows are disabled'
  end

end

Then /^click on the pagination next button of contacts page$/ do
  pagination = SdcContacts.pagination
  all_contacts_count = pagination.all_contacts_count.text_value
  pagination_count =pagination.perpage_textbox.text_value
  pagination.page_next.wait_until_present(timeout: 15)
  if all_contacts_count.to_i > pagination_count.to_i
    TestData.hash[:clicked_arrow] = 'next'
    TestData.hash[:current_page] = pagination.current_page.text_value
    if pagination.current_page.text_value.to_i.eql?TestData.hash[:max_pages_count]
      step 'expect next and last page arrows are disabled'
      SdcLogger.info 'As the current page is max next arrow is disabled'
    else
      pagination.page_next.click
      step 'expect current page text box is reflected accordingly'
    end
  end

end

Then /^click on the pagination prev button of contacts page$/ do
  pagination = SdcContacts.pagination
  all_contacts_count = pagination.all_contacts_count.text_value
  pagination_count =pagination.perpage_textbox.text_value
  pagination.page_previous.wait_until_present(timeout: 15)
  if all_contacts_count.to_i > pagination_count.to_i
    TestData.hash[:clicked_arrow] = 'prev'
    TestData.hash[:current_page] = pagination.current_page.text_value
    if pagination.current_page.text_value.to_i.eql?1
      step 'expect first and prev page arrows are disabled'
      SdcLogger.info 'As the current page is 1 prev arrow is disabled'
    else
      pagination.page_previous.click
      step 'expect current page text box is reflected accordingly'
    end
  end

end

Then /^click on the pagination first button of contacts page$/ do
  pagination = SdcContacts.pagination
  all_contacts_count = pagination.all_contacts_count.text_value
  pagination_count =pagination.perpage_textbox.text_value
  pagination.page_first.wait_until_present(timeout: 15)
  if all_contacts_count.to_i > pagination_count.to_i
    TestData.hash[:clicked_arrow] = 'first'
    TestData.hash[:current_page] = pagination.current_page.text_value
    if pagination.current_page.text_value.to_i.eql?1
      step 'expect first and prev page arrows are disabled'
      SdcLogger.info 'As the current page is 1 first arrow is disabled'
    else
      pagination.page_first.click
      step 'expect current page text box is reflected accordingly'
    end
  end
end

Then /^click on the pagination last button of contacts page$/ do
  pagination = SdcContacts.pagination
  all_contacts_count = pagination.all_contacts_count.text_value
  pagination_count =pagination.perpage_textbox.text_value
  pagination.page_last.wait_until_present(timeout: 15)
  if all_contacts_count.to_i > pagination_count.to_i
    TestData.hash[:clicked_arrow] = 'last'
    TestData.hash[:current_page] = pagination.current_page.text_value
    if pagination.current_page.text_value.to_i.eql?TestData.hash[:max_pages_count]
      step 'expect next and last page arrows are disabled'
      SdcLogger.info 'As the current page is max last arrow is disabled'
    else
      pagination.page_last.click
      step 'expect current page text box is reflected accordingly'
    end
  end

end

Then /^set current page text box on contacts pagination to (.*)$/ do |number|
  pagination = SdcContacts.pagination
  pagination.current_page.wait_until_present(timeout: 15)
  if number.eql? 'random'
    if TestData.hash[:max_pages_count].to_i > 1
      pagination.current_page.send_keys(Random.rand(2..TestData.hash[:max_pages_count]))
      pagination.current_page.send_keys(:enter)
    end
  else
    pagination.current_page.send_keys(number)
    pagination.current_page.send_keys(:enter)
  end
  TestData.hash[:current_page] = pagination.current_page.text_value
end

Then /^fetch the maximum page count in contacts pagination$/ do
  pagination = SdcContacts.pagination
  max_pages_text = pagination.max_pages.text_value
  max_pages_text = max_pages_text.split(" ")
  max_pages = max_pages_text[1]
  SdcLogger.info "max_pages #{max_pages}"
  TestData.hash[:max_pages_count] = max_pages.to_i
end

Then /^expect current page text box is reflected accordingly$/ do
  pagination = SdcContacts.pagination
  case TestData.hash[:clicked_arrow]
  when 'prev'
    expect(pagination.current_page.text_value.to_i).to eql(TestData.hash[:current_page].to_i - 1)
  when 'first'
    expect(pagination.current_page.text_value.to_i).to eql(1)
  when 'next'
    expect(pagination.current_page.text_value.to_i).to eql(TestData.hash[:current_page].to_i + 1)
  when 'last'
    expect(pagination.current_page.text_value.to_i).to eql(TestData.hash[:max_pages_count].to_i)
  else
    SdcLogger.info 'All the arrows are disabled'
  end
end
