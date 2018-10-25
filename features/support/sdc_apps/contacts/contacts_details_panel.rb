module SdcContacts
  class ContactsDetailsPanel < SdcPage
    #page_object(:contacts_detail_panel, required: true, timeout:20){{xpath: '//*[@id="contactDetailsPanel"]'}} - ID Changed
    #page_object(:title, required: true, timeout: 20) { { xpath: '//label[contains(@class, "panel-header-text")]' } } - ID Changed
    #contact_detail_body_xpath="//div[contains(@id, 'contactDetailsPanel')][contains(@class,'x-panel-body ')] "
    page_object(:contacts_detail_panel, required: true, timeout:20){{xpath:'//div[contains(@id, "contactDetailsPanel")]'}}
    page_object(:title, required: true, timeout: 20) { { xpath: '//*[contains(@id,"contactDetailsPanel")]//div[contains(@id,"singlecontactdetails")]//div[contains(@class,"x-title-text")]'}}

    #Name Fields
    #page_object(:name, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="Name-inputEl"]' } }-ID Changed
    #page_object(:name_expand,  required: true, timeout: 10) { { xpath: '//*[@id="Name-labelEl"][contains(@class, "nmExpandable" )]' } }- ID Changed
    #page_object(:name_collapse,  required: true, timeout: 10) { { xpath: '//*[@id="Name-labelEl"][contains(@class, "nmCollapsible" )]' } }- ID Changed
    page_object(:name, tag: :text_field,  required: true, timeout: 10) { { xpath: '//input[@name="Name"]' } }
    page_object(:name_expand,  required: true, timeout: 10) { { xpath: '//*[contains(@id,"labelEl")][contains(@class, "nmExpandable" )]' } }
    page_object(:name_collapse,  required: true, timeout: 10) { { xpath: '//*[contains(@id,"labelEl")][contains(@class, "nmCollapsible" )]' } }

    #page_object(:first_name, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="FirstName-inputEl"]' } }- ID Changed
    #page_object(:error_first_name,  required: true, timeout: 10){{xpath: '//*[@id="FirstName-errorEl"]'} } - ID Changed

    #page_object(:middle_name, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="MiddleName-inputEl"]' } }- ID Changed
    #page_object(:error_middle_name,  required: true, timeout: 10){{xpath: '//*[@id="MiddleName-errorEl"]'} }- ID Changed

    #page_object(:last_name, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="LastName-inputEl"]' } }- ID Changed
    #page_object(:error_last_name,  required: true, timeout: 10){{xpath: '//*[@id="LastName-errorEl"]'} }- ID Changed

    #page_object(:name_suffix, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="Suffix-inputEl"]' } }- ID Changed
    #page_object(:error_suffix,  required: true, timeout: 10){{xpath: '//*[@id="Suffix-errorEl"]'} }- ID Changed

    page_object(:first_name, tag: :text_field,  required: true, timeout: 10) { { xpath: '//input[@name="FirstName"]' } }
    page_object(:error_first_name,  required: true, timeout: 10){{xpath: '//*[@id="FirstName-errorEl"]'} }#- change

    page_object(:middle_name, tag: :text_field,  required: true, timeout: 10) { { xpath: '//input[@name="MiddleName"]' } }
    page_object(:error_middle_name,  required: true, timeout: 10){{xpath: '//*[@id="MiddleName-errorEl"]'} }#- change

    page_object(:last_name, tag: :text_field,  required: true, timeout: 10) { { xpath: '//input[@name="LastName"]' } }
    page_object(:error_last_name,  required: true, timeout: 10){{xpath: '//*[@id="LastName-errorEl"]'} }#- change

    page_object(:name_suffix, tag: :text_field,  required: true, timeout: 10) { { xpath: '//input[@name="Suffix"]' } }
    page_object(:error_suffix,  required: true, timeout: 10){{xpath: '//*[@id="Suffix-errorEl"]'} }#- change

    #Company Fields
    #page_object(:company, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="Company-inputEl"]' } }
    #page_object(:company_expand,  required: true, timeout: 10) { { xpath: '//*[@id="Company-labelEl"][contains(@class, "cmpnyExpandable" )]' } }
    #page_object(:company_collapse,  required: true, timeout: 10) { { xpath: '//*[@id="Company-labelEl"][contains(@class, "cmpnyCollapsible" )]' } }

    #page_object(:department, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="Department-inputEl"]' } }
    #page_object(:error_department,  required: true, timeout: 10){{xpath: '//*[@id="Department-errorEl"]'} }

    #page_object(:title, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="Title-inputEl"]' } }
    #page_object(:error_title,  required: true, timeout: 10){{xpath: '//*[@id="Title-errorEl"]'} }

    page_object(:company, tag: :text_field,  required: true, timeout: 20) { { xpath: '//input[@name="Company"]' } }
    page_object(:company_expand,  required: true, timeout: 10) { { xpath: '//*[contains(@id,"labelEl")][contains(@class, "cmpnyExpandable" )]' } }
    page_object(:company_collapse,  required: true, timeout: 10) { { xpath: '//*[contains(@id,"labelEl")][contains(@class, "cmpnyCollapsible" )]' } }

    page_object(:department, tag: :text_field,  required: true, timeout: 10) { { xpath: '//input[@name="Department"]' } }
    page_object(:error_department,  required: true, timeout: 10){{xpath: '//*[@id="Department-errorEl"]'} } #-Change

    page_object(:title, tag: :text_field,  required: true, timeout: 10) { { xpath: '//input[@name="Title"]' } }
    page_object(:error_title,  required: true, timeout: 10){{xpath: '//*[@id="Title-errorEl"]'} } #-Change

    #Address Fields
    #page_object(:street_address, required: true, timeout: 20) { { xpath: '//*[@id="StreetAddress-inputEl"]' } ) - ID Changed
    #page_object(:city, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="City-inputEl"]' } } - ID Changed
    #page_object(:province, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="Province-inputEl"]'} } - ID Changed
    #page_object(:postal_code, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="PostalCode-inputEl"]' } } - ID Changed
    page_object(:street_address, required: true, timeout: 20) { { xpath: '//*[@name="StreetAddress"]' } }
    page_object(:error_street_address, required: true, timeout: 20) { { xpath: '//*[@name="StreetAddress"]//following::div[contains(@class,"x-form-error-msg x-form-invalid-icon")][1]' } }
    page_object(:city, tag: :text_field,  required: true, timeout: 20) { { xpath: '//input[@name="City"]' } }
    page_object(:province, tag: :text_field,  required: true, timeout: 20) { { xpath: '//input[@name="Province"]'} }
    page_object(:postal_code, tag: :text_field,  required: true, timeout: 20) { { xpath: '//input[@name="PostalCode"]' } }

    #Email
    #page_object(:email, tag: :text_field, required: true, timeout: 20) { { xpath: '//*[@id="Email-inputEl"]' } } - ID Changed
    page_object(:email, tag: :text_field, required: true, timeout: 20){ { xpath: '//input[@name="Email"]'}}

    #Phone
    #page_object(:phone, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="Phone-inputEl"]' } } - ID Changed
    #page_object(:phone_ext, tag: :text_field,  required: true, timeout: 20){ { xpath: '//*[@id="PhoneExt-inputEl"]' } } - ID Changed
    page_object(:phone, tag: :text_field,  required: true, timeout: 20) { { xpath: '//input[@name="Phone"]' } }
    page_object(:phone_ext, tag: :text_field,  required: true, timeout: 20){ { xpath: '//input[@name="PhoneExt"]' } }

    #Refrence Number
    #page_object(:reference_number , tag: :text_field, required: true, timeout: 20) { { xpath: '//*[@id="ReferenceNumber-inputEl"]' } } - ID Changed
    page_object(:reference_number , tag: :text_field, required: true, timeout: 20) { { xpath: '//input[@name="ReferenceNumber"]' } }

    #def expand_collapsed_panel
      page_object(:expand_button, required: true, timeout: 20) { { xpath: '//*[@class="x-tool-img x-tool-expand-left"]'}}
    #end

    page_object(:clear_all_link, required: true, timeout: 20) { { xpath: '//span[text()="(Clear All)"]'}}
  end

  class ContactsDetailsToolBarMenu < SdcPage
    #page_object(:menu_button, required: true, timeout: 20) { { xpath: '//a[contains(@class, "x-btn toolbar-menu")]' } }
    page_object(:menu_button, required: true, timeout: 10) { { xpath: '//div[@id="contactDetailsPanel_header-innerCt"]//a'}}
    page_object(:menu_print_postage, required: true, timeout: 10) { { xpath: '//span[contains(@id, "menuitem-")][text()="Print Postage"]'}}
    page_object(:menu_delete, required: true, timeout: 10) { { xpath: '//span[contains(@id, "menuitem-")][text()="Delete"]'}}
    page_object(:menu_collapse_panel, required: true, timeout: 10) { { xpath: '//span[contains(@id, "menuitem-")][text()="Collapse Panel"]'}}
  end

  class ContactsNamePrefix < SdcPage
    #text_field(:prefix_text_field, tag: :text_field) { { xpath: '//*[@id="Prefix-inputEl"]' } } - ID Changed
    #page_object(:prefix_drop_down) { { xpath: '//*[@id="Prefix-trigger-picker"]' } } - ID Changed

    text_field(:prefix_text_field, tag: :text_field) { { xpath: '//input[@name="Prefix"]' } }
    page_object(:prefix_drop_down) { { xpath: '//input[@name="Prefix"]/following::div[contains(@id,"-trigger-picker")]' } }

    def prefix_selection(name: 'selection', value: 'None')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end
  end

  class ContactsCountry < SdcPage

    #text_field(:text_field, tag: :text_field) { { xpath: '//input[contains(@id, "countryContactDetailsCmb")]' } } - ID Changed
    #page_object(:drop_down) { { xpath: '//*[contains(@id, "countryContactDetailsCmb")][contains(@class, "arrow")]' } } - ID Changed

    text_field(:text_field, tag: :text_field) { { xpath: '//input[@name="CountryId"]' } }
    page_object(:drop_down) { { xpath: '//input[@name="CountryId"]/following::div[contains(@id,"-trigger-picker")]' } }

    def selection_country(name: 'selection', value: 'None')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end

  end

  class ContactsState < SdcPage

    #text_field(:text_field, tag: :text_field) { { xpath: '//input[contains(@id, "stateContactDetailsCmb")]' } } - ID Changed
    #page_object(:drop_down) { { xpath: '//*[contains(@id, "stateContactDetailsCmb")][contains(@class, "arrow")]' } } - ID Changed

    text_field(:text_field, tag: :text_field) { { xpath: '//input[@name="State"]' } }
    page_object(:drop_down) { { xpath: '//input[@name="State"]/following::div[contains(@id,"-trigger-picker")]' } }

    def selection_state(name: 'selection', value: 'None')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end

  end

  class ContactsGroup < SdcPage

    text_field(:text_field, tag: :text_field) { { xpath: '//input[contains(@id, "groupsContactDetailsCmb")]' } }
    text_field(:text_list, tag: :text_field) { { xpath: '//input[contains(@id, "groupsContactDetailsCmb-itemList")]' } }
    page_object(:drop_down) { { xpath: '//*[contains(@id, "groupsContactDetailsCmb")][contains(@class, "arrow")]' } }

    def selection_group(name: 'selection', value: 'None')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end

  end

  class ContactsCostCode < SdcPage

    #text_field(:text_field, tag: :text_field) { { xpath: '//input[contains(@id, "costCodesContactDetailsCmb")]' } } - ID Changed
    #page_object(:drop_down) { { xpath: '//*[contains(@id, "costCodesContactDetailsCmb")][contains(@class, "arrow")]' } } - ID Changed

    text_field(:text_field, tag: :text_field) { { xpath: '//input[@name="CostCodeId"]' } }
    page_object(:drop_down) { { xpath: '//input[@name="CostCodeId"]/following::div[contains(@id,"-trigger-picker")]' } }

    def selection_costcode(name: 'selection', value: 'None')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end

  end

  class ContactsEmailErrorMessage < SdcPage
    page_object(:email_error,  required: true, timeout: 20){{xpath: '//*[@id="Email-errorEl"]//ul'}}
    page_object(:email_error_message){{xpath: '//div[@id="Email-errorEl"]//li'}}
  end

  class << self
  def contacts_detail
    ContactsDetailsPanel.new
  end

  def contacts_detail_toolbar_menu
    ContactsDetailsToolBarMenu.new
  end

  def contacts_name_prefix
    ContactsNamePrefix.new
  end

  def contacts_country
    ContactsCountry.new
  end

  def contacts_group
    ContactsGroup.new
  end

  def contacts_cost_code
    ContactsCostCode.new
  end

  def contacts_state
    ContactsState.new
  end

  def contacts_email_error
    ContactsEmailErrorMessage.new
  end

  def contacts_column
    ContactsGridColumnBase.new
  end

  def contacts_gridcolumn
    SdcContactsGridColumn.new
  end

  def reference_message_box
    AddReferenceMessageBox.new
  end
end

end