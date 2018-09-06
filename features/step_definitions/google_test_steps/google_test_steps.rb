
Then /^visit (.+)$/ do |str|
  Google.visit(str)
end

Then /^search for (.+)$/ do |str|
  Google.search_page.text_field.set(str)
  Google.search_page.google_image.click
  Google.search_page.google_search.click
  Google.search_page.google_image.wait_while_present(timeout: 10)
end

Then /^Then verify result page contains (.+)$/ do |str|
  expect(Google.page_source).to include str
end