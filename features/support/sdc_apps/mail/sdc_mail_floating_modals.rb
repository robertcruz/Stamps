module SdcMail
  module SdcMailFloatingModals

    class PrintModalPrinter < SdcPage
      page_object(:text_field) { { xpath: '//input[contains(@name, "printers")]' } }
      page_object(:drop_down) { { xpath: '//input[contains(@name, "printers")]/parent::*/parent::*/div[contains(@id, "trigger-picker")]' } }

      def selection_element(name: :selection, value: 'factory')
        page_object(name) { { xpath: "//li[text()='#{value}']" } }
      end
    end

    class PrintModalPaperTray < SdcPage
      page_object(:text_field, tag: :text_field) { { id: 'sdc-printpostagewindow-printerdroplist-inputEl' } }
      page_object(:drop_down) { { id: 'sdc-printpostagewindow-printerdroplist-trigger-picker' } }

      def selection_element(name: :selection, value: 'factory')
        page_object(name) { { xpath: "//li[text()='#{value}']" } }
      end
    end

    class MailPrintModal < SdcPage
      page_object(:title) { { xpath: '//div[contains(@id, "title")]//div[contains(text(),"Print")]' } }
      page_object(:button) { { xpath: '//span[contains(@id, "sdc-printwin-printbtn-btnInnerEl")]' } }
      page_object(:close) { { xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]' } }

      def paper_tray
        PrintModalPaperTray.new
      end

      def printer
        PrintModalPrinter.new
      end
    end

    class SdcNotificationBar < SdcPage
      page_object(:close) { { xpath: '//span[contains(@class, "sdc-icon-message-close-dark")]' } }
      page_object(:settings_link) { { xpath: '//span[text()="Settings"]' } }
    end

    class SdcManagePrintOptions < SdcPage
      page_object(:search, tag: :text_field) { { xpath: '//input[@placeholder="Search"]' } }
      page_object(:save) { { xpath: '//span[contains(text(), "Save")]' } }
      page_object(:close) { { xpath: '//span[contains(@class, "x-btn-icon-el")]' } }
      page_object(:search_button) { { xpath: '//div[contains(@class, "x-form-search-trigger-grey")]' } }
      page_object(:search_option) { { xpath: '//span[contains(@class, "x-btn-icon-el")]' } }
      page_object(:print_verify) { { xpath: '//table[contains(@id, "tableview")]' } }
      page_object(:print_chooser) { { xpath: '//table[contains(@id, "tableview")]//tbody//tr//td[1]//div//div' } }
      checkbox(:print_option_checkbox, :print_chooser, :print_verify, 'class', 'selected')
      page_object(:single_grid_item) { { xpath: '//table[contains(@id, "tableview")]//tbody//tr//td[2]//div' } }
      page_object(:grid) { { xpath: '//table[contains(@id, "tableview")]' } }
    end

    class SdcManageShippingAddresses < SdcPage
    end

    class SdcEditMailingAddress < SdcPage
    end

    class MailSettingsModal < SdcPage
      page_object(:title) { { xpath: '//div[text()="Settings"]' } }
      page_object(:postdate_text_field) { { xpath: '(//*[contains(@id, "generaltabview")]//input[contains(@class, "x-form-text")])[2]' } }
      page_object(:postdate_drop_down) { { xpath: '(//*[contains(@id, "generaltabview")]//div[contains(@class, "x-form-arrow-trigger")])[2]' } }

      page_object(:logoff_text_field) { { xpath: '(//*[contains(@id, "generaltabview")]//input[contains(@class, "x-form-text")])[1]' } }
      page_object(:logoff_drop_down) { { xpath: '(//*[contains(@id, "generaltabview")]//div[contains(@class, "x-form-arrow-trigger")])[1]' } }

      page_object(:balance_text_field) { { xpath: '(//*[contains(@id, "generaltabview")]//input[contains(@class, "x-form-text")])[3]' } }
      page_object(:balance_drop_down) { { xpath: '(//*[contains(@id, "generaltabview")]//div[contains(@class, "x-form-arrow-trigger")])[3]' } }
      page_object(:close) { { xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]' } }
      def selection(str)
        page_object(:selection_obj) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    class SdcValueMustBeShown < SdcPage
      page_object(:title) { { xpath: '//div[text()="Value Must be Shown"]' } }
      page_object(:continue) { { xpath: '//*[text()="Continue"]/../..' } }
      page_object(:cancel) { { xpath: '//div[text()="Cancel"]' } }
      page_object(:x_btn) { { xpath: '//div[text()="Value Must be Shown"]/../..//*[contains(@class, "close")]' } }
    end

    class SdcExtraServices < SdcPage

      page_object(:window) { { xpath: '//div[contains(@class, "app-window-extra-services")]' } }
      page_object(:title) { { xpath: '//div[contains(@class, "app-window-extra-services")]//div[contains(@class, "x-title-text-default")]' } }
      page_object(:x_btn) { { xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]' } }

      page_object(:rr_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-rrcheckbox-displayEl"]' } }
      page_object(:rr_verify) { { xpath: '//div[@id="sdc-extraserviceswin-rrcheckbox"]' } }
      checkbox(:return_receipt, :rr_chooser, :rr_verify, 'class', 'checked')

      page_object(:rd_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-rdcheckbox-displayEl"]' } }
      page_object(:rd_verify) { { xpath: '//div[@id="sdc-extraserviceswin-rdcheckbox"]' } }
      checkbox(:restricted_delivery, :rd_chooser, :rd_verify, 'class', 'checked')

      text_field(:value_text_field, tag: :text_field) { { xpath: '//input[@id="sdc-extraserviceswin-valuenumberfield-inputEl"]' } }
      page_object(:val_inc) { { xpath: '//*[@id="sdc-extraserviceswin-valuenumberfield-trigger-spinner"]//*[contains(@class,"up")]' } }
      page_object(:val_dec) { { xpath: '//*[@id="sdc-extraserviceswin-valuenumberfield-trigger-spinner"]//*[contains(@class,"down")]' } }
      sdc_number(:value, :value_text_field, :val_inc, :val_dec)

      text_field(:cod_text_field, tag: :text_field) { { xpath: '//input[@id="sdc-extraserviceswin-codnumberfield-inputEl"]' } }
      page_object(:cod_inc) { { xpath: '//*[@id="sdc-extraserviceswin-codnumberfield-trigger-spinner"]//*[contains(@class,"up")]' } }
      page_object(:cod_dec) { { xpath: '//*[@id="sdc-extraserviceswin-codnumberfield-trigger-spinner"]//*[contains(@class,"down")]' } }
      sdc_number(:cod, :cod_text_field, :cod_inc, :cod_dec)

      page_object(:nrect_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-notrectangularcheckbox-displayEl"]' } }
      page_object(:nrect_verify) { { xpath: '//div[@id="sdc-extraserviceswin-notrectangularcheckbox"]' } }
      checkbox(:non_rectangular, :nrect_chooser, :nrect_verify, 'class', 'checked')

      page_object(:hpu_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-hfpucheckbox-displayEl"]' } }
      page_object(:hpu_verify) { { xpath: '//div[@id="sdc-extraserviceswin-hfpucheckbox"]' } }
      checkbox(:hold_for_pickup, :hpu_chooser, :hpu_verify, 'class', 'checked')

      page_object(:frag_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-shcheckbox-displayEl"]' } }
      page_object(:frag_verify) { { xpath: '//div[@id="sdc-extraserviceswin-shcheckbox"]' } }
      checkbox(:fragile, :frag_chooser, :frag_verify, 'class', 'checked')

      page_object(:rrmerch_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-rrmcheckbox-displayEl"]' } }
      page_object(:rrmerch_verify) { { xpath: '//div[@id="sdc-extraserviceswin-rrmcheckbox"]' } }
      checkbox(:return_receipt_merchandise, :rrmerch_chooser, :rrmerch_verify, 'class', 'checked')

      page_object(:nnd_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-nndcheckbox-displayEl"]' } }
      page_object(:nnd_verify) { { xpath: '//div[@id="sdc-extraserviceswin-nndcheckbox"]' } }
      checkbox(:notice_non_delivery, :nnd_chooser, :nnd_verify, 'class', 'checked')

      page_object(:security_price) { { xpath: '//label[@id="sdc-extraserviceswin-securitypricelabel"]' } }
      page_object(:return_receipt_price) { { xpath: '//label[@id="sdc-extraserviceswin-rrpricelabel"]' } }
      page_object(:restricted_delivery_price) { { xpath: '//label[@id="sdc-extraserviceswin-rdpricelabel"]' } }
      page_object(:cod_price) { { xpath: '//label[@id="sdc-extraserviceswin-codpricelabel"]' } }
      page_object(:notice_non_delivery_price) { { xpath: '//label[@id="sdc-extraserviceswin-nndpricelabel"]' } }
      page_object(:handling_price) { { xpath: '//label[@id="sdc-extraserviceswin-contentpricelabel"]' } }
      page_object(:fragile_price) { { xpath: '//label[@id="sdc-extraserviceswin-shpricelabel"]' } }
      page_object(:return_receipt_m_price) { { xpath: '//label[@id="sdc-extraserviceswin-rrmpricelabel"]' } }
      page_object(:hold_for_pickup_price) { { xpath: '//label[@id="sdc-extraserviceswin-hfpupricelabel"]' } }

      page_object(:form_3811) { { xpath: '//span[@id="sdc-extraserviceswin-rrformbtn-btnInnerEl"]//u' } }
      page_object(:label_200_or_200n) { { xpath: '//span[@id="sdc-extraserviceswin-securityformbtn-btnInnerEl"]/u' } }
      page_object(:total) { { xpath: '//*[@id="sdc-extraservices-totalcostlabel"]' } }
      page_object(:save) { { xpath: '//span[@id="sdc-extraservices-savebtn-btnInnerEl"]' } }

      def security
        SdcExtraServicesSecurity.new
      end

      def handling
        SdcExtraServicesHandling.new
      end

      def value_must_be_shown
        SdcValueMustBeShown.new
      end

    end

    class SdcExtraServicesSecurity < SdcPage
      page_object(:drop_down) { { id: 'sdc-extraserviceswin-securitydroplist-trigger-picker' } }
      page_object(:text_field, tag: :text_field) { { id: 'sdc-extraserviceswin-securitydroplist-inputEl' } }

      def selection_element(name, value)
        page_object(name) { { xpath: "//li[text()='#{value}']" } }
      end
    end

    class SdcExtraServicesHandling < SdcPage
      page_object(:drop_down) { { id: 'sdc-extraserviceswin-contentdroplist-trigger-picker' } }
      page_object(:text_field, tag: :text_field) { { id: 'sdc-extraserviceswin-contentdroplist-inputEl' } }

      def selection_element(name, str)
        page_object(name) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    class SdcLabel200 < SdcPage
      page_object(:title) { { xpath: '//div[text()="Label 200 or 200-N"]' } }
      page_object(:x_btn) { { xpath: '//div[text()="Label 200 or 200-N"]/../..//*[contains(@class, "close")]' } }
    end

    class SdcForm3811 < SdcPage
      page_object(:title) { { xpath: '//div[text()="Form 3811"]' } }
      page_object(:x_btn) { { xpath: '//div[text()="Form 3811"]/../..//*[contains(@class, "close")]' } }
    end

    class SdcSpecialContentsWarning < SdcPage
      page_object(:title) { { xpath: '//*[text()="Special Contents Warning"]' } }
      page_object(:i_agree) { { xpath: '//*[text()="I Agree"]' } }
      page_object(:more_info) { { xpath: '//*[text()="More Info"]' } }
      page_object(:x_btn) { { xpath: '//div[text()="Special Contents Warning"]/../..//*[contains(@class, "close")]' } }
    end

    class SdcSearchContacts < SdcPage
      page_object(:title) { { xpath: '//*[text()="Search Contacts"]' } }
      page_object(:cancel) { { id: 'modalCancel' } }
      page_object(:x_btn) { { xpath: '//div[text()="Search Contacts"]/../..//*[contains(@class, "close")]' } }

    end

    class SdcServiceCommitments < SdcPage
      page_object(:title) { { xpath: '//*[text()="Priority Mail Express Service Commitments"]' } }
      page_object(:x_btn) { { xpath: '//div[text()="Priority Mail Express Service Commitments"]/../..//*[contains(@class, "close")]' } }
    end

    class SdcSaveAsFavorite < SdcPage
      page_object(:title) { { xpath: '//div[text()="Save as Favorite"]' } }
      page_object(:save) { { xpath: '//*[text()="Save"]' } }
      page_object(:name, tag: :text_field) { { id: 'sdc-favorites-namefield-inputEl' } }
      page_object(:x_btn) { { xpath: '//div[text()="Save as Favorite"]/../..//*[contains(@class, "close")]' } }

      page_object(:include_delivery_adr_chooser) { { id: 'sdc-favorites-delivery-address-checkbox-displayEl' } }
      page_object(:include_delivery_adr_verify) { { xpath: '//*[@id="sdc-favorites-delivery-address-checkbox-bodyEl"]/..' } }
      checkbox(:include_delivery_adr, :include_delivery_adr_chooser, :include_delivery_adr_verify, 'class', 'checked')
    end

    class SdcManageFavoritesRename < SdcPage
      page_object(:title) { { xpath: '//div[text()="Rename Favorite"]' } }
      page_object(:save) { { xpath: '//*[text()="Save"]' } }
      page_object(:name, tag: :text_field) { { id: 'sdc-favorites-rename-namefield-inputEl' } }
      page_object(:x_btn) { { xpath: '//div[text()="Rename Favorite"]/../..//*[contains(@class, "close")]' } }
    end

    class SdcManageFavoritesDelete < SdcPage
      page_object(:title) { { xpath: '//div[text()="Delete Favorite"]' } }
      page_object(:delete) { { xpath: '//*[text()="Delete"][contains(@class, "primary")]' } }
      page_object(:x_btn) { { xpath: '//div[text()="Delete Favorite"]/../..//*[contains(@class, "close")]' } }
    end

    class SdcManageFavorites < SdcPage
      page_object(:title) { { xpath: '//div[text()="Manage Favorites"]' } }
      page_object(:rename) { { xpath: '//*[text()="Rename"]' } }
      page_object(:delete) { { xpath: '//*[text()="Delete"]' } }
      page_object(:x_btn) { { xpath: '//div[text()="Manage Favorites"]/../..//*[contains(@class, "close")]' } }

      def selection_element(name, num)
        page_object(name) { { xpath: "(//*[contains(@id, 'managefavoritesmodal')]//img)[#{num}]" } }
      end

      def rename_favorite
        SdcManageFavoritesRename.new
      end

      def delete_favorite
        SdcManageFavoritesDelete.new
      end
    end

    class SdcFeedback < SdcPage
      page_object(:title) { { xpath: '//div[text()="Feedback"]' } }
      page_object(:x_btn) { { xpath: '//div[text()="Feedback"]/../..//*[contains(@class, "close")]' } }
    end

    class SdcSettings < SdcPage
      page_object(:title) { { xpath: '//div[text()="Settings"]' } }
      page_object(:x_btn) { { xpath: '//div[text()="Settings"]/../..//*[contains(@class, "close")]' } }
    end

    class MailToAddAddress < SdcPage
      page_object(:window) { { xpath: '//div[starts-with(@id, "addeditaddressmodal")][contains(@id,"-outerCt")]' } }
      page_object(:title) { { xpath: '//div[starts-with(@id, "addeditaddressmodal-")][contains(@id,"_header-innerCt")]//div[contains(@class, "x-title-text")]' } }
      page_object(:address, tag: :textarea) { { xpath: '//div[starts-with(@id, "addeditaddressmodal")]//textarea[@name="freeFormAddEditAddress"]' } }
      page_object(:email, tag: :text_field) { { xpath: '//div[starts-with(@id, "addeditaddressmodal")][contains(@id,"-outerCt")]//input[@placeholder="Optional"]' } }
      page_object(:ok) { { xpath: '//span[text()="OK"]' } }
      page_object(:cancel) { { xpath: '//span[text()="Cancel"]' } }
      page_object(:x_button) { { xpath: '//span[contains(@class, "icon-mobile-close-light")]' } }

      def list_of_values(name, company)
        page_object(:mail_to_lov) { { xpath: "//div[text()='#{name}, #{company}']" } }
      end
    end

    class IncompleteFields < SdcPage
      page_object(:window) { { xpath: '//div[starts-with(@id, "dialoguemodal")][contains(@class,"x-window-closable")]' } }
      page_object(:title) { { xpath: '//div[contains(@class, "x-window-header-title")]//div[@class="x-title-text x-title-text-default x-title-item"]' } }
      page_object(:x_button) { { xpath: '//span[contains(@class, "icon-mobile-close-light")]' } }
      page_object(:close) { { xpath: '//span[text()="Close"]' } }
    end


    class << self
      def notification_bar
        SdcNotificationBar.new
      end

      def manage_print_options
        SdcManagePrintOptions.new
      end

      def manage_shipping_addresses
        SdcManageShippingAddresses.new
      end

      def edit_mailing_address
        SdcEditMailingAddress.new
      end

      def settings
        MailSettingsModal.new
      end

      def extra_services
        SdcExtraServices.new
      end

      def label_200_or_200n
        SdcLabel200.new
      end

      def form_3811
        SdcForm3811.new
      end

      def special_contents_warning
        SdcSpecialContentsWarning.new
      end

      def service_commitments
        SdcServiceCommitments.new
      end

      def save_as_favorite
        SdcSaveAsFavorite.new
      end

      def manage_favorites
        SdcManageFavorites.new
      end

      def feedback
        SdcFeedback.new
      end

      def search_contacts
        SdcSearchContacts.new
      end

      def print
        MailPrintModal.new
      end

      def add_address
        MailToAddAddress.new
      end

      def incomplete_fields
        IncompleteFields.new
      end
      # def settings
      #   SdcSettings.new
      # end
    end

  end
end

