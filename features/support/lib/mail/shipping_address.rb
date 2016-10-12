# encoding: utf-8
module Stamps
  module Mail
    class MailManageShippingAddresses < Browser::Modal
      attr_reader :window_title, :close_btn

      def initialize param
        super param
        @window_title ||= ElementWrapper.new (browser.span text: "Manage Mailing Addresses")
        @close_btn ||= ElementWrapper.new browser.img(css: "img[class*=close]")
      end

      def close
        close_btn.click_while_present
      end

      def wait_until_present
        window_title.wait_until_present
      end

      def present?
        window_title.present?
      end
    end
  end
end