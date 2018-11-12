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
      chooser(:print_option_checkbox, :print_chooser, :print_verify, 'class', 'selected')
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
      page_object(:x_btn) { { xpath: '//div[starts-with(@id,"extraserviceswindow")]//span[contains(@class, "close")]' } }

      page_object(:security_label) { { xpath: '//label[text()="Security:"]' } }
      page_object(:cod_label) { { xpath: '//label[text()="COD:"]' } }
      page_object(:handling_label) { { xpath: '//label[text()="Handling:"]' } }
      page_object(:other_label) { { xpath: '//label[text()="Other:"]' } }

      page_object(:rr_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-rrcheckbox-displayEl"]' } }
      page_object(:rr_verify) { { xpath: '//div[@id="sdc-extraserviceswin-rrcheckbox"]' } }
      chooser(:return_receipt, :rr_chooser, :rr_verify, 'class', 'checked')
      page_object(:return_receipt_cost) { { xpath: '//label[@id="sdc-extraserviceswin-rrpricelabel"]' } }

      page_object(:rd_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-rdcheckbox-displayEl"]' } }
      page_object(:rd_verify) { { xpath: '//div[@id="sdc-extraserviceswin-rdcheckbox"]' } }
      chooser(:restricted_delivery, :rd_chooser, :rd_verify, 'class', 'checked')
      page_object(:restricted_delivery_cost) { { xpath: '//label[@id="sdc-extraserviceswin-rdpricelabel"]' } }

      text_field(:value_text_field, tag: :text_field) { { xpath: '//input[@id="sdc-extraserviceswin-valuenumberfield-inputEl"]' } }
      page_object(:val_inc) { { xpath: '//*[@id="sdc-extraserviceswin-valuenumberfield-trigger-spinner"]//*[contains(@class,"up")]' } }
      page_object(:val_dec) { { xpath: '//*[@id="sdc-extraserviceswin-valuenumberfield-trigger-spinner"]//*[contains(@class,"down")]' } }
      sdc_number(:value, :value_text_field, :val_inc, :val_dec)

      text_field(:cod_text_field, tag: :text_field) { { xpath: '//input[@id="sdc-extraserviceswin-codnumberfield-inputEl"]' } }
      page_object(:cod_inc) { { xpath: '//*[@id="sdc-extraserviceswin-codnumberfield-trigger-spinner"]//*[contains(@class,"up")]' } }
      page_object(:cod_dec) { { xpath: '//*[@id="sdc-extraserviceswin-codnumberfield-trigger-spinner"]//*[contains(@class,"down")]' } }
      sdc_number(:cod, :cod_text_field, :cod_inc, :cod_dec)
      page_object(:cod_cost) { { xpath: '//label[@id="sdc-extraserviceswin-codpricelabel"]' } }

      page_object(:hpu_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-hfpucheckbox-displayEl"]' } }
      page_object(:hpu_verify) { { xpath: '//div[@id="sdc-extraserviceswin-hfpucheckbox"]' } }
      chooser(:hold_for_pickup, :hpu_chooser, :hpu_verify, 'class', 'checked')
      page_object(:hold_for_pickup_cost) { { xpath: '//label[@id="sdc-extraserviceswin-hfpupricelabel"]' } }

      page_object(:frag_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-shcheckbox-displayEl"]' } }
      page_object(:frag_verify) { { xpath: '//div[@id="sdc-extraserviceswin-shcheckbox"]' } }
      chooser(:fragile, :frag_chooser, :frag_verify, 'class', 'checked')
      page_object(:fragile_cost) { { xpath: '//label[@id="sdc-extraserviceswin-shpricelabel"]' } }

      page_object(:rrmerch_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-rrmcheckbox-displayEl"]' } }
      page_object(:rrmerch_verify) { { xpath: '//div[@id="sdc-extraserviceswin-rrmcheckbox"]' } }
      chooser(:return_receipt_for_merchandise, :rrmerch_chooser, :rrmerch_verify, 'class', 'checked')
      page_object(:return_receipt_for_merchandise_cost) { { xpath: '//label[@id="sdc-extraserviceswin-rrmpricelabel"]' } }

      page_object(:nrect_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-notrectangularcheckbox-displayEl"]' } }
      page_object(:nrect_verify) { { xpath: '//div[@id="sdc-extraserviceswin-notrectangularcheckbox"]' } }
      chooser(:non_rectangular, :nrect_chooser, :nrect_verify, 'class', 'checked')

      page_object(:nnd_chooser) { { xpath: '//span[@id="sdc-extraserviceswin-nndcheckbox-displayEl"]' } }
      page_object(:nnd_verify) { { xpath: '//div[@id="sdc-extraserviceswin-nndcheckbox"]' } }
      chooser(:notice_non_delivery, :nnd_chooser, :nnd_verify, 'class', 'checked')
      page_object(:notice_non_delivery_cost) { { xpath: '//label[@id="sdc-extraserviceswin-nndpricelabel"]' } }

      page_object(:form_3811) { { xpath: '//u[text()="Form 3811"]' } }
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

    class SdcSearchContactsFilterPanel < SdcPage
      page_object(:search_contacts) { { xpath: '//input[@placeholder="Search Contacts"]' } }
      page_object(:selected) { { xpath: '//div[text()="Selected"][contains(@class,"sdc-badgebutton-text")]' } }
      page_object(:selected_count) { { xpath: '//div[text()="Selected"]/../following-sibling::td//div[@class="sdc-badge"]' } }
      page_object(:all_contacts) { { xpath: '//div[text()="All Contacts"][contains(@class,"sdc-badgebutton-text")]' } }
      page_object(:all_contacts_count) { { xpath: '//div[text()="All Contacts"]/../following-sibling::td//div[@class="sdc-badge"]' } }

      page_object(:groups_drop_down) { { xpath: '//div[contains(@class,"sdc-badgebuttongroup-header-title-default")]//div[text()="Groups"]' } }
      page_object(:cost_codes_drop_down) { { xpath: '//div[contains(@class,"sdc-badgebuttongroup-header-title-default")]//div[text()="Cost Codes"]' } }

      page_object(:ungrouped) { { xpath: '//div[text()="Ungrouped"]' } }
      page_object(:ungrouped_count) { { xpath: '//div[text()="Ungrouped"]/../following-sibling::td//div[@class="sdc-badge"]' } }

      page_object(:none) { { xpath: '//div[text()="None"]' } }
      page_object(:none_count) { { xpath: '//div[text()="None"]/../following-sibling::td//div[@class="sdc-badge"]' } }
    end

    class SdcSearchContactsToolbar < SdcPage
      page_object(:select) { { xpath: '//span[@class="x-btn-inner x-btn-inner-primary-medium"][contains(text(),"Select")]' } }
      page_object(:cancel) { { xpath: '//span[@class="x-btn-inner x-btn-inner-secondary-medium"][text()="Cancel"]' } }
    end

    class SdcSearchContactsGrid < SdcPage
      page_objects(:names) { { xpath: '//div[@id="contactsGrid-normal-body"]//table[starts-with(@id,"tableview-")]//tr[contains(@class,"x-grid-row")]//td[2]' } }

      def count
        page_objects(:count) { { xpath: '//div[@id="contactsGrid-normal-body"]//table[starts-with(@id,"tableview-")]//tr[contains(@class,"x-grid-row")]' } }.size
      end

      def name(str, index: 0)
        page_objects(:contacts_grid_name, index: index) { { xpath: "//div[text()='#{str}'][contains(@class,'x-grid-cell-inner')]" } }
      end

      def row_number_for_name(name)
        names.each_with_index { |field, index| return index if SdcElement.new(field).text_value.eql? name }
      end

      def checkbox_for_row(num)
        page_objects("chooser#{num}", index: num) { { xpath: '//div[@id="contactsGrid-normal-body"]//div[@class="x-grid-row-checker"]' } }
        page_objects("verify#{num}", index: num) { { xpath: '//div[@id="contactsGrid-normal-body"]//table' } }
        checkbox("checkbox_for_row#{num}", "chooser#{num}", "verify#{num}", 'class', 'selected')
      end
    end

    class SdcSearchContactsModal < SdcPage
      page_object(:window) { { xpath: '//div[contains(@class,"search-contacts-modal")]' } }
      page_object(:title) { { xpath: '//*[text()="Search Contacts"]' } }
      page_object(:cancel) { { id: 'modalCancel' } }
      page_object(:x_btn) { { xpath: '//div[text()="Search Contacts"]/../..//*[contains(@class, "close")]' } }

      text_field(:search_text, tag: :text_field) { { xpath: '//input[@placeholder="Search Contacts"]' } }
      page_object(:search_icon) { { xpath: '//*[contains(@class, "search-trigger-grey")]' } }

      def grid
        SdcSearchContactsGrid.new
      end

      def filter_panel
        SdcSearchContactsFilterPanel.new
      end

      def toolbar
        SdcSearchContactsToolbar.new
      end
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
      chooser(:include_delivery_adr, :include_delivery_adr_chooser, :include_delivery_adr_verify, 'class', 'checked')
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

    class ContactsView < SdcPage
      page_object(:container) { { xpath: '//div[starts-with(@id,"multiplecontactsview-")][contains(@id,"-innerCt")]' } }
      page_objects(:contacts_list) { { xpath: '//div[starts-with(@id,"multiplecontactsview-")][contains(@id,"-innerCt")]//li[@id="ContactId"]//div[@class="x-tagfield-item-text"]' } }
    end

    class MailToAddAddress < SdcPage
      page_object(:window) { { xpath: '//div[starts-with(@id, "addeditaddressmodal")][contains(@id,"-outerCt")]' } }
      page_object(:title) { { xpath: '//div[starts-with(@id, "addeditaddressmodal-")][contains(@id,"_header-innerCt")]//div[contains(@class, "x-title-text")]' } }
      page_object(:address, tag: :textarea) { { xpath: '//div[starts-with(@id, "addeditaddressmodal")]//textarea[@name="freeFormAddEditAddress"]' } }
      page_object(:email, tag: :text_field) { { xpath: '//div[starts-with(@id, "addeditaddressmodal")][contains(@id,"-outerCt")]//input[@placeholder="Optional"]' } }
      page_object(:add) { { xpath: '//span[text()="Add"]' } }
      page_object(:cancel) { { xpath: '//span[text()="Cancel"]' } }
      page_object(:x_button) { { xpath: '//span[contains(@class, "icon-mobile-close-light")]' } }
      page_object(:email_label) { { xpath: '//div[starts-with(@id, "addeditaddressmodal-")][contains(@id, "innerCt")]//span[text()="Email:"]' } }
      page_object(:address_label) { { xpath: '//div[starts-with(@id, "addeditaddressmodal-")][contains(@id, "innerCt")]//span[text()="Address:"]' } }
      page_object(:email_error_message) { { xpath: '//div[contains(@data-errorqtip,"email")]' } }
      page_object(:selected_contacts_count) { { xpath: '//label[contains(text()," Contacts")]' } }

      def list_of_values(name, company)
        SdcElement.new(page_objects(:mail_to_lov) { { xpath: "//div[text()='#{name}, #{company}']" } }.last)
      end

      def contacts_view
        ContactsView.new
      end
    end

    class MailToInvalidContactSelected < SdcPage
      page_objects(:window, index: 0) { { xpath: '//div[starts-with(@id, "dialoguemodal")][contains(@class,"x-window-closable")]' } }
      page_objects(:title, index: 0) { { xpath: '//div[starts-with(@id, "dialoguemodal-")][contains(@id,"_header-targetEl")]' } }
      page_objects(:body, index: 0) { { xpath: '//div[starts-with(@id, "dialoguemodal-")][@class="x-autocontainer-innerCt"]' } }
      page_objects(:x_buttons) { { xpath: '//div[starts-with(@id, "dialoguemodal-")][contains(@id,"_header-targetEl")]//a//span[contains(@class, "sdc-icon-mobile-close-light")]' } }
      page_objects(:close_buttons) { { xpath: '//span[text()="Close"]' } }
    end

    class IncompleteFields < SdcPage
      page_object(:window) { { xpath: '//div[starts-with(@id, "dialoguemodal")][contains(@class,"x-window-closable")]' } }
      page_object(:title) { { xpath: '//div[contains(@class, "x-window-header-title")]//div[@class="x-title-text x-title-text-default x-title-item"]' } }
      page_object(:error_message) { { xpath: '//div[starts-with(@id, "dialoguemodal-")][@class="x-autocontainer-innerCt"]' } }
      page_object(:x_button) { { xpath: '//span[contains(@class, "icon-mobile-close-light")]' } }
      page_object(:close) { { xpath: '//span[text()="Close"]' } }
    end


    class AddressCleansingModal < SdcPage
      page_object(:title) { { xpath: '//div[contains(@class, "x-window-header-title")]//div[contains(text(),"Address Cleansing")][@class="x-title-text x-title-text-default x-title-item"]' } }
      page_object(:x_button) { { xpath: '//span[contains(@class, "icon-mobile-close-light")]' } }
      page_object(:address, tag: :textarea) { { xpath: '//textarea[@name="invalidAddressTextArea"]' } }
      page_object(:address_close_icon, tag: :span) { { xpath: '//span[contains(@class,"sdc-icon-stop")]' } }
      page_object(:accept_button) { { xpath: '//span[text()="Accept"]' } }
      page_object(:exclude_all_button) { { xpath: '//span[text()="//span[text()="Exclude All"]"]' } }
      page_object(:exclude_button) { { xpath: '//span[text()="//span[text()="Exclude"]"]' } }
    end

    class CleansingAcceptErrorModal < SdcPage
      page_object(:title) { { xpath: '//div[text()="Invalid Address"]' } }
      page_object(:close_icon) { { xpath: '//div[text()="Invalid Address"]/following::span[contains(@class, "icon-mobile-close-light")]' } }
      page_object(:error_message) { { xpath: '//div[starts-with(@id, "dialoguemodal-")][@class="x-autocontainer-innerCt"]' } }
      page_object(:close_button) { { xpath: '//span[text()="Close"]' } }
    end

    class CleansingExcludeErrorModal < SdcPage
      page_object(:title) { { xpath: '//div[text()="Exclude Contact"]' } }
      page_object(:close_icon) { { xpath: '//div[text()="Exclude Contact"]/following::span[contains(@class, "icon-mobile-close-light")]' } }
      page_object(:error_message) { { xpath: '//div[starts-with(@id, "dialoguemodal-")][@class="x-autocontainer-innerCt"]' } }
      page_object(:yes_button) { { xpath: '//span[text()="Yes"]' } }
      page_object(:no_button) { { xpath: '//span[text()="No"]' } }
    end

    class CleansingExcludeAllErrorModal < SdcPage
      page_object(:title) { { xpath: '//div[text()="Exclude Remaining Contacts"]' } }
      page_object(:close_icon) { { xpath: '//div[text()="Exclude Remaining Contacts"]/following::span[contains(@class, "icon-mobile-close-light")]' } }
      page_object(:error_message) { { xpath: '//div[starts-with(@id, "dialoguemodal-")][@class="x-autocontainer-innerCt"]' } }
      page_object(:yes_button) { { xpath: '//span[text()="Yes"]' } }
      page_object(:no_button) { { xpath: '//span[text()="No"]' } }
    end

    class MailConfirmPrint < SdcPage
      page_object(:window) { { xpath: '//div[starts-with(@id, "dialoguemodal")][contains(@class,"x-window-closable")]' } }
      page_object(:title) { { xpath: '//div[contains(@class, "x-window-header-title")]//div[@class="x-title-text x-title-text-default x-title-item"]' } }
      page_object(:body) { { xpath: '//label[@class="x-component x-box-item x-window-item x-component-default"]' } }
      page_object(:x_button) { { xpath: '//span[contains(@class, "icon-mobile-close-light")]' } }

      page_object(:checkbox) { { xpath: '//div[starts-with(@id, "dialoguemodal-")][contains(@id, "-targetEl")]//input[starts-with(@id, "checkbox-")][contains(@id, "-inputEl")]' } }
      page_object(:verify) { { xpath: '//div[starts-with(@id, "dialoguemodal-")][contains(@id, "-targetEl")]//div[contains(@class, "x-form-type-checkbox")]' } }
      chooser(:dont_show_this_again, :checkbox, :verify, 'class', 'checked')

      page_object(:continue) { { xpath: '//span[text()="Continue"][@class="x-btn-inner x-btn-inner-primary-medium"]' } }
    end

    class MailServerError < SdcPage
      page_object(:title) { { xpath: '//*[text()="Server Error"]' } }
      page_object(:body) { { xpath: '//div[contains(@class, "sdc-warning")]//div[contains(@id, "-innerCt")]' } }
      page_object(:ok) { { xpath: '//span[text()="OK"]' } }
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
        SdcSearchContactsModal.new
      end

      def print
        MailPrintModal.new
      end

      def add_address
        MailToAddAddress.new
      end

      def invalid_contact_selected
        MailToInvalidContactSelected.new
      end

      def incomplete_fields
        IncompleteFields.new
      end

      def comfirm_print
        MailConfirmPrint.new
      end

      def server_error
        MailServerError.new
      end

      def address_cleansing
        AddressCleansingModal.new
      end

      def address_cleansing_exclude
        CleansingExcludeErrorModal.new
      end

      def address_cleansing_exclude_all
        CleansingExcludeAllErrorModal.new
      end

      def address_cleansing_accept
        CleansingAcceptErrorModal.new
      end

      # def settings
      #   SdcSettings.new
      # end
    end

  end
end

