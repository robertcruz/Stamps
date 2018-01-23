module Stamps
  class StampsDotCom < Browser::BaseCache
    assign({})

    def navigation_bar
      cache[:navigation].nil? ? cache[:navigation] = Navigation::NavigationBar.new(param) : cache[:navigation]
    end

    def orders
      cache[:orders].nil? ? cache[:orders] = WebOrders.new(param) : cache[:orders]
    end

    def mail
      cache[:mail].nil? ? cache[:mail] = WebMail.new(param) : cache[:mail]
    end
  end
end

