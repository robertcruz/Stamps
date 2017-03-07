module Stamps
  module Orders
    class SuccessModal < Browser::StampsBrowserElement
      def window_title
        element_helper.text browser.div(css: "div[id^=dialoguemodal-][id$=_header-innerCt]")
      end

      def present?
        browser.div(text: "Success").present?
      end

      def message
        box = StampsTextbox.new browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
        box.text
      end

      def ok
        button = StampsElement.new(browser.spans(text: "OK").last)
        5.times do
          button.safe_click
          break unless button.present?
        end
      end
    end

    class ImportOrders < Browser::StampsBrowserElement
      attr_reader :title

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.div(text: "Import Orders")
      end

      def present?
        title.present?
      end

      def filename_label
        element_helper.text browser.label(id: "fileNameLabel")
      end

      def text_box
        StampsTextbox.new browser.text_field(id: "files-inputEl")
      end

      def import
        success = SuccessModal.new(param)
        button = StampsElement.new browser.span(text: "Import")
        server_error = Orders::Stores::ServerError.new(param)
        4.times do
          button.safe_click
          logger.info "Success modal is #{(success.present?)?"Present":"Not Present"}"
          sleep(0.35)
          return success if success.present?
          if server_error.present?
            error_str = server_error.message
            logger.info error_str
            server_error.ok
            expect("Server Error: \n#{error_str}").to eql ""
          end
        end
      end

      def cancel
        button = StampsElement.new browser.span(text: "Cancel")
        5.times do
          button.safe_click
          button.safe_click
          button.safe_click
          button.safe_click
          break unless present?
        end
      end

      def select_csv_file
        button = StampsElement.new browser.span(text: "Select CSV File")
        open_file = Windows::OpenFile.new
        10.times do
          button.safe_click
          button.send_keys(:enter)
          sleep(2)
          return open_file if open_file.present?
        end
      end

      def download_sample_file
        element_helper.safe_click browser.a(text: "Download sample file")
      end
    end
  end
end