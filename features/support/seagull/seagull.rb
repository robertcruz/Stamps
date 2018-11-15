module SeaGull
  class SeaGullPage < SdcPage
    page_object(:back) { { xpath: '//img[contains(@src,"concept-car-opel-back")]' } }
    page_object(:side_closed) { { xpath: '//img[contains(@src,"concept-car-opel-side-closed")]' } }
    page_object(:front_above) { { xpath: '//img[contains(@src,"exterior_frontabove")]' } }
    page_object(:left_rear) { { xpath: '//img[contains(@src,"exterior_leftrear")]' } }

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