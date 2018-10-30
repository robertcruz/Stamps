module SdcContacts
  module Modals

    class DeleteContact < SdcPage
      page_object(:title) { {xpath: '//*[contains(text(), "Delete Contact")]'} }
      page_object(:close){ { xpath: '//*[@class="x-tool-img x-tool-close"]'} }
      page_object(:yes_button, tag: :span, required: true, timeout: 45 ) { { xpath: '//span[text()="Yes"]'} }
      page_object(:no_button, tag: :span, required: true, timeout: 45 ) { { xpath: '//span[text()="No"]'} }
    end

    class AddReference < SdcPage
      page_object(:add_reference_window){{xpath: '//*[@id="contacts-ref"]'} }
      page_object(:title) { {xpath: '//*//div[contains(@id,"title-")][text() = "Change Reference #"]'} }
      page_object(:close){ { xpath: '//div[contains(@id,"title-")][text() = "Change Reference #"]//following::span[contains(@class,"x-btn-icon-")][contains(@class,"-close")]'} }
      page_object(:reference_num, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@name="ref-number"]' } }
      page_object(:reference_error, required: true, timeout: 10) { { xpath: '//div[contains(@id,"title-")][text() = "Change Reference #"]//following::div[contains(@class,"-error-msg")]'} }
      page_object(:save_button, tag: :span, required: true, timeout: 45 ) { { xpath: '//div[contains(@id,"title-")][text() = "Change Reference #"]//following::span[text()="Save"]'} }
    end

    class ChangeCostCode < SdcPage
      page_object(:drop_down) { { xpath: '//div[text()="Change Cost Code"]//following::div[contains(@id, "trigger-picker")][contains(@class, "arrow")]' } }
      text_field(:text_field, tag: :text_field) { { xpath: '//div[text()="Change Cost Code"]//following::input[contains(@id, "-inputEl")]' } }
      page_object(:save_button, tag: :span, required: true, timeout: 45 ) { { xpath: '//div[text()="Change Cost Code"]//following::span[text()="Save"]'} }

      def selection_costcode(name: 'selection', value: 'None')
        page_object(name) { { xpath: "//li[text()='#{value}']" } }
      end

    end

    class ManageGroups < SdcPage
      page_object(:manage_groups_title, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Manage Groups"]'}}
      page_object(:manage_groups_add_icon, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Manage Groups"]/following::span[contains(@class,"sdc-icon-add")]' } }
      page_object(:manage_groups_add_button, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Manage Groups"]/following::span[text()="Add"]' } }
      page_object(:manage_groups_edit_button, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Manage Groups"]/following::span[text()="Edit"]' } }
      page_object(:manage_groups_delete_button, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Manage Groups"]/following::span[text()="Delete"]' } }
      page_objects(:manage_groups_table, required: true, timeout: 10) { {xpath: '//*[contains(@id,"title-")][text() = "Manage Groups"]/following::div[contains(@id,"tableview-")]//*[@class="x-grid-item-container"]//table'} }
      page_object(:edit_groups_row, required: true, timeout: 10) { { xpath: '(//*[@id="manage_groups_grid_toolbar-body"]//*[@class="x-grid-item-container"]//table[@class="x-grid-item"]//*[@class="x-grid-cell-inner "])[2]'}}

      page_object(:manage_groups_close, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Manage Groups"]/following::span[contains(@class,"-close-")]' } }

      def group_name(row)
        xpath_text = "//*[contains(@id,'title-')][text() = 'Manage Groups']/following::div[contains(@id,'tableview-')]//*[@class='x-grid-item-container']//table[#{row}]/tbody/tr/td"
        label = page_object(:group_text, required: true, timeout: 10){ { xpath: xpath_text }}
        label.text_value
      end

      def add_groups
        AddGroups.new
      end

      def edit_groups
        EditGroups.new
      end

      def delete_groups
        DeleteGroups.new
      end

    end

    class AddGroups< SdcPage
      text_field(:add_groups_group_name_textbox, tag: :text_field) { { xpath: '//*[contains(@id,"title-")][text() = "Add Group"]//following::input[contains(@name,"textfield-")]'} }
      page_object(:add_groups_save_button, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Add Group"]/following::span[text()="Save"]' } }
      page_object(:add_groups_error_message, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Add Group"]//following::div[contains(@class,"-error-msg")]//ul'} }
      page_object(:error_message_text, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Add Group"]//following::div[contains(@class,"-error-msg")]//ul/li'} }
      page_object(:add_groups_title, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Add Group"]' } }
      page_object(:add_groups_close, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Add Group"]/following::span[contains(@class,"-close-")]' } }
    end

    class EditGroups < SdcPage
      page_object(:edit_group_window, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Edit Group"]/following::span[text()="Group Name:"]'}}
      text_field(:edit_groups_group_name_textbox, tag: :text_field) { {xpath: '//*[contains(@id,"title-")][text() = "Edit Group"]/following::span[text()="Group Name:"]//following::input[contains(@name,"textfield-")]'} }
      page_object(:edit_groups_save_button, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Edit Group"]/following::span[@class="x-btn-inner x-btn-inner-primary-medium"][text()="Save"]'}}
      page_object(:edit_groups_error_message, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Edit Group"]/following::div[contains(@class,"-error-msg")]//ul'} }
      page_object(:error_message_text, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Edit Group"]/following::div[contains(@class,"-error-msg")]//ul/li'} }
      page_object(:edit_groups_title, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Edit Group"]' } }
      page_object(:edit_groups_close, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Edit Group"]/following::span[contains(@class,"-close-")]' } }
    end

    class DeleteGroups < SdcPage
      page_object(:groups_delete_popup) { { xpath: '//*[contains(@id,"dialoguemodal-")]' } }
      page_object(:groups_delete_yes_button, required: true, timeout: 45 ) { { xpath: '//*[contains(@id,"title-")][text() = "Delete Group"]/following::span[text()="Yes"]'} }
      page_object(:delete_groups_title, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Delete Group"]' } }
      page_object(:delete_groups_close, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Delete Group"]/following::span[contains(@class,"-close-")]' } }
      page_object(:delete_groups_no_button, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Delete Group"]/following::span[text()="No"]'} }
      page_object(:delete_groups_message, required: true, timeout: 10){ { xpath: ' //*[contains(@id,"title-")][text() = "Delete Group"]/following::div[contains(@id,"dialoguemodal")]/div[contains(@id,"-innerCt")]'} }
    end

    class ChangeGroups < SdcPage
      page_object(:change_groups_title, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Change Groups"]'}}
      text_field(:change_groups_search, tag: :text_field) { {xpath: '//*[@placeholder="Search Groups"]'} }
      page_object(:change_groups_grid_body, required: true, timeout: 10) { {xpath: '//*[contains(@id,"grid-")]'} }
      page_object(:groups_save_button, tag: :span, required: true, timeout: 45 ) { { xpath: '//span[text()="Save"]'} }
      page_objects(:change_groups_table, required: true, timeout: 10) { {xpath: '//*[contains(@id,"title-")][text() = "Change Groups"]//following::div[contains(@id,"tableview-")]//*[@class="x-grid-item-container"]//table'} }
      page_objects(:change_groups_empty_table, required: true, timeout: 10) { {xpath: '//*[contains(@id,"title-")][text() = "Change Groups"]//following::div[contains(@id,"tableview-")]//*[@class="x-grid-empty"]'}}
      text_field(:details_groups, tag: :text_field) { {xpath: ' //*[@name="Groups"]'} }
      page_objects(:details_groups_list, required: true, timeout: 10) { {xpath: '//*[@class="x-tagfield-list"]//li'} }

      def group_list_name(position)
        xpath_text = "//*[@class='x-tagfield-list']//li[#{position}]//div[1]"
        page_object(:group_text, required: true, timeout: 10){ { xpath: xpath_text }}
      end

      def groups_checkbox_row(row)
        #chooser
        chooser_xpath = "//*[contains(@id,'title-')][text() = 'Change Groups']//following::div[contains(@id,'group-multiselector-search-')]//*[contains(@id,'tableview-')]//table[#{row}]//div[@class='x-grid-row-checker']"
        chooser_name = "grid_chooser_#{row}"
        page_object(chooser_name) { { xpath: chooser_xpath } }
        # verify
        verify_xpath = "//*[contains(@id,'title-')][text() = 'Change Groups']//following::div[contains(@id,'group-multiselector-search-')]//*[contains(@id,'tableview-')]//div[@class='x-grid-item-container']//table[#{row}]"
        verify_name = "grid_verify_#{row}"
        page_object(verify_name) { { xpath: verify_xpath } }
        #checkbox object
        groups_checkbox_name = "grid_checkbox_#{row}"
        SdcPage.chooser(groups_checkbox_name, chooser_name, verify_name, :class, 'selected')
        instance_eval(groups_checkbox_name)
      end

      def group_name(row)
        xpath_text = "//*[contains(@id,'title-')][text() = 'Change Groups']//following::div[contains(@id,'tableview-')]//*[@class='x-grid-item-container']//table[#{row}]//tbody//tr//td[2]"
        page_object(:group_text, required: true, timeout: 10){ { xpath: xpath_text }}
      end

    end

    class ClearContacts < SdcPage
      page_object(:title, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text()="Clear Contacts"]'}}
      page_object(:close_icon, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text()="Clear Contacts"]/following::span[contains(@class,"-close-")]' } }
      page_object(:window_text, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text()="Clear Contacts"]/following::div[@class="x-autocontainer-innerCt"]' } }
      page_object(:yes_button, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text()="Clear Contacts"]/following::span[text()="Yes"]' } }
      page_object(:no_button, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text()="Clear Contacts"]/following::span[text()="No"]' } }
    end

    class ContactsImport <SdcPage
      page_object(:window){{xpath: '//div[@id="iFrameHolderIdParent_header"]'}}
      page_object(:header){{xpath: '//*//*[contains(@class,"x-window-header-title")]//div[text()="Import Contacts"]'}}
      page_object(:close_icon){{xpath: '//*[contains(@class,"sdc-icon-mobile-close-light")]'}}

      page_object(:body_iframe){{xpath:'//div[@id="iFrameHolderIdParent-body"]/iframe'}}
      page_object(:select_file_button){{xpath:'//span(text()="Select a CSV File")'}}

      def file_has_header()
        page_object(:chooser){{xpath:'xxxxxxxx'}}
        page_object(:verify){{xpath:'xxxxxxxx'}}
        checkbox('file_has_header_checkbox',:chooser,:verify,:class,"selected")
      end

      page_object(:group_drop_down){ { xpath: '//select[@id="mapTemplate"]' } }

      def group_drop_down_option(str)
        page_object(:group_selected){{xpath:"//select[@id='mapTemplate']/option[contains(text(),'#{str}')]" }}
      end

      def import_contacts_iframe
        '//div[@id="iFrameHolderIdParent-body"]/iframe'
      end
      #
      def import_contacts_iframe_elements
        import_contacts_iframe.span(text: "Select a CSV File")
        #page_object(:select_file_button){{xpath:'//span(text()="Select a CSV File")'}}
      end

    end

    class << self

      def delete_contact
        DeleteContact.new
      end

      def add_reference
        AddReference.new
      end

      def change_cost_code
        ChangeCostCode.new
      end

      def manage_groups
        ManageGroups.new
      end

      def change_groups
        ChangeGroups.new
      end

      def import_contacts
        ContactsImport.new
      end

    end

  end
end
