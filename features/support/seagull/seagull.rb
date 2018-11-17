module SeaGull

  class SeaGullExternalImages < SdcPage
    page_object(:header) { { xpath: '//h1[text()="Exterior Images"]' } }
  end

  class SeaGullMoreInfo < SdcPage
    page_object(:first_name, tag: :text_field) { { xpath: '//input[@placeholder="First Name"]' } }
    page_object(:last_name, tag: :text_field) { { xpath: '//input[@placeholder="Last Name"]' } }
    page_objects(:submit, index: 1) { { xpath: '//input[@value="Submit"]' } }

    def email
      (page_objects(:email, tag: :text_field) { { xpath: '//input[@placeholder="Your Email"]' } }).last
    end
  end

  class SeaGullPage < SdcPage
    page_object(:back) { { xpath: '//img[contains(@src,"concept-car-opel-back")]' } }
    page_object(:side_closed) { { xpath: '//img[contains(@src,"concept-car-opel-side-closed")]' } }
    page_object(:front_above) { { xpath: '//img[contains(@src,"exterior_frontabove")]' } }
    page_object(:left_rear) { { xpath: '//img[contains(@src,"exterior_leftrear")]' } }

    page_object(:first_name, tag: :text_field) { { xpath: '//input[@aria-label="First name"]' } }
    page_object(:last_name, tag: :text_field) { { xpath: '//input[@aria-label="Last name"]' } }
    page_object(:email, tag: :text_field) { { xpath: '//input[@placeholder="Your Email"]' } }
    page_object(:phone, tag: :text_field) { { xpath: '//input[@placeholder="Phone"]' } }
    page_object(:zip_code, tag: :text_field) { { xpath: '//input[@placeholder="Zip Code"]' } }
    page_object(:submit) { { xpath: '//input[@value="Submit"]' } }

    def more_info
      SeaGullMoreInfo.new
    end

    def external_images
      SeaGullExternalImages.new
    end

    #
  end

  class << self
    def visit
      SdcPage.browser.goto 'https://sea-gull.herokuapp.com'
    end

    def car
      SeaGullPage.new
    end
  end
end