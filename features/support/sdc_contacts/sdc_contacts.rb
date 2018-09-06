module SdcContacts

  def loading_contacts
    klass = Class.new(SdcPage) do
      page_object(:loading) { { xpath: '//*[contains(text(), "Loading contacts...")]' } }
    end
    klass.new.loading
  end
  module_function :loading_contacts

  def verifying_account
    klass = Class.new(SdcPage) do
      page_object(:verifying_account) { {xpath: '//*[contains(text(), "Verifying")]'} }
    end
    klass.new.verifying_account
  end
  module_function :verifying_account

  def contacts_left_navigation_panel
    ContactsLeftNavigation.new
  end
  module_function :contacts_left_navigation_panel

  def contacts_left_navigation_search_results
    SearchResults.new
  end
  module_function :contacts_left_navigation_search_results

  def contacts_filter_panel
    ContactsFilter.new
  end

  #-----Contacts Tool Bar---------
  def contacts_toolbar
    ContactsToolbar.new
  end
  module_function :contacts_toolbar

  def contacts_delete_message_box
    DeleteContactMessageBox.new
  end
  module_function :contacts_delete_message_box

  def contacts_toolbar_cost_codes
    ContactsToolbarCostCodes.new
  end
  module_function :contacts_toolbar_cost_codes

  def contacts_popup_cost_code
    ContactsPopupCostCode.new
  end
  module_function :contacts_popup_cost_code

  def contact_toolbar_settings
    ContactsToolSettings.new
  end
  module_function :contact_toolbar_settings

  #--------Details Panel---------
  def contacts_detail
    ContactsDetailsPanel.new
  end
  module_function :contacts_detail

  def contacts_detail_toolbar_menu
    ContactsDetailsToolBarMenu.new
  end
  module_function :contacts_detail_toolbar_menu

  def contacts_name_prefix
    ContactsNamePrefix.new
  end
  module_function :contacts_name_prefix

  def contacts_country
    ContactsCountry.new
  end
  module_function :contacts_country

  def contacts_group
    ContactsGroup.new
  end
  module_function :contacts_group

  def contacts_cost_code
    ContactsCostCode.new
  end
  module_function :contacts_cost_code

  def contacts_state
    ContactsState.new
  end
  module_function :contacts_state

  def contacts_email_error
    ContactsEmailErrorMessage.new
  end
  module_function :contacts_email_error

  def contacts_column
    ContactsGridColumnBase.new
  end
  module_function :contacts_column

  def contacts_gridcolumn
    SdcContactsGridColumn.new
  end
  module_function :contacts_gridcolumn

  def reference_message_box
  AddReferenceMessageBox.new
  end
  module_function :reference_message_box
end
