
module SdcOrders
  class SdcOrdersFilterAwaitingShip < SdcPage
    page_object(:count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-first")]//div[@class="sdc-badge"])[2]'} }
    link(:link) { {xpath: '(//*[contains(@class, "sdc-badgebutton-first")])[2]'} }
  end

  class SdcOrdersFilterSearch < SdcPage
    page_object(:count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-widget")]//div[contains(@class, "sdc-badge")])[1]'} }
    page_object(:label) { {xpath: '(//*[contains(@class, "sdc-badgebutton-first")])[1]'} }
    page_object(:x_btn) { {xpath: '//*[contains(@class, "remove")]'} }


    page_object(:search_orders, tag: :checkbox) { {xpath: '//input[@placeholder="Search Orders"]'} }
  end

  class SdcOrdersFilterPanel < SdcPage
    text_field(:search_orders, tag: :text_field) { {xpath: '//*[@placeholder="Search Orders"]'} }
    page_object(:search) { {xpath: '//*[contains(@class, "search-trigger-grey")]'} }
    link(:search_bar) { {xpath: '//*[@placeholder="Search Orders"]'} }
    link(:shipped) { {xpath: '//*[text()="Shipped"]'} }
    link(:canceled) { {xpath: '//*[text()="Canceled"]'} }
    link(:on_hold) { {xpath: '//*[text()="On Hold"]'} }
    link(:collapse) { {xpath: '//*[contains(@class, "sdc-icon-collapse")]'} }
    link(:expand) { {xpath: '//*[contains(@class, "expand")]'} }

    def awaiting_shipment
      SdcOrdersFilterAwaitingShip.new
    end

    def search_results
      SdcOrdersFilterSearch.new
    end
  end
end