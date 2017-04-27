module Stamps
  module Registration
    class DownloadPage < Browser::StampsModal
      def element
        StampsElement.new browser.h1 css: "div>h1"
      end

      def present?
        element.present?
      end

      def wait_until_present(*args)
        element.wait_until_present(*args)
      end

      def text
        element.text
      end
    end
  end
end