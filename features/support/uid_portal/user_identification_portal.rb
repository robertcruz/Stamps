module UserIdPortal
  class Page < SdcPage
    page_object(:title, tag: :text_field) { { xpath: '//div[text()="User Identification Portal"]' } }
    page_object(:username, tag: :text_field) { { xpath: '//input[@id="user"]' } }
    page_object(:password, tag: :text_field) { { xpath: '//input[@name="passwd"]' } }
    page_object(:login) { { xpath: '//input[@id="submit"]' } }
  end

  class << self
    def page
      Page.new
    end
  end
end