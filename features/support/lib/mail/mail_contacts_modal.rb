module Stamps
  module Mail
    class MailSearchContactsModal < Browser::StampsModal
      attr_accessor :window_title, :x_btn

      def initialize(param)
        super
        @window_title=StampsField.new(browser.div(text: 'Search Contacts'))
        @x_btn=StampsField.new(browser.img(css: "img[class*='x-tool-img x-tool-close']"))
      end

      def close
        x_btn.click_while_present
      end

      def wait_until_present(*args)
        window_title.wait_until_present(args[0])
      end

      def present?
        window_title.present?
      end
    end

  end
end