module Stamps
  module Orders
    class SuccessModal < Browser::Base
      def window_title
        StampsField.new(browser.div(css: "div[id^=dialoguemodal-][id$=_header-innerCt]")).text
      end

      def present?
        browser.div(text: "Success").present?
      end

      def wait_until_present
          (browser.div(text: "Success")).wait_until_present(120)
      end

      def message
        StampsTextbox.new browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]").text
      end

      def ok
        button = StampsField.new(browser.spans(text: "OK").last)
        5.times do
          button.click
          break unless button.present?
        end
      end
    end

    class ImportOrders < Browser::Base
      attr_reader :title

      def initialize(param)
        super
        @title = StampsField.new browser.div(text: "Import Orders")
      end

      def present?
        title.present?
      end

      def filename_label
        StampsField.new(browser.label(id: "fileNameLabel")).text
      end

      def textbox
        StampsTextbox.new browser.text_field(id: "files-inputEl")
      end

      def import
        success = SuccessModal.new(param)
        button = StampsField.new browser.span(text: "Import")
        server_error = Orders::Stores::ServerError.new(param)

        button.click
        begin_time = Time.now

        if server_error.present?
          error_str = server_error.message
          logger.info error_str
          server_error.ok
          expect("Server Error: \n#{error_str}").to eql ""
        end

        success.wait_until_present
        end_time = Time.now
        import_time = end_time - begin_time # in seconds
        import_time if success.present?
      end

      def confirm_success
        success = SuccessModal.new(param)
        success if success.present?
      end

      def cancel
        button = StampsField.new browser.span(text: "Cancel")
        5.times do
          button.click
          button.click
          button.click
          button.click
          break unless present?
        end
      end

      def select_csv_file
        button = StampsField.new browser.span(text: "Select CSV File")
        open_file = Windows::OpenFile.new(param.browser)
        10.times do
          button.field.parent.click
          button.click
          sleep(2)
          return open_file if open_file.present?
        end
      end

      def download_sample_file
        StampsField.new(browser.a(text: "Download sample file")).click
      end
    end
  end
end