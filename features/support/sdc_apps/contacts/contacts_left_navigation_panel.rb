module SdcContacts
  class ContactsLeftNavigation < SdcPage
    page_object(:left_nav) { {xpath: '//*[@id="left_navigation_items"]'} }
    text_field(:search_bar, tag: :text_field) { {xpath: '//*[@placeholder="Search Contacts"]'} }
    page_object(:search_icon) { {xpath: '//*[contains(@class, "search-trigger-grey")]'} }
    page_object(:search_results) { {xpath: '//*[contains(@class, "sdc-badgebutton-default")]//div[text()="Search Results"]'} }
    page_object(:selected) { {xpath: '//*[contains(@class, "sdc-badgebutton-default")]//div[text()="Selected"]'} }
    page_object(:all_contacts) { {xpath: '//*[contains(@class, "sdc-badgebutton-default")]//div[text()="All Contacts"]'} }
    page_object(:groups) { {xpath: '//*[contains(@class, "groups-filters")]'} }
    page_object(:cost_codes)   { {xpath: '//*[contains(@class, "cost-codes-filters")]'} }
    link(:collapse,required: true, timeout: 45 ) { {xpath: '//*[contains(@class, "sdc-icon-collapse")]'} }
    link(:expand,required: true, timeout: 45 ) { {xpath: '//*[contains(@class, "expand-right")]'} }
    #page_object(:left_nav_collapsed){{xpath: '//*[@id="filter-nav-collapsed-left"]'}}
  end

  class SearchResults < SdcPage
    #page_object(:results){{xpath: '//*[@id="total_search_result"]'}}
    #page_object(:search_results_count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-widget")]//div[@class="sdc-badge"])'} }
    #page_object(:search_results_text) { {xpath: '(//*[contains(@class, "sdc-badgebutton-text")])'} }
    #page_object(:search_results_remove) { {xpath: '//*[contains(@class, "sdc-icon-remove")]'} }
    page_object(:search_results_remove) { {xpath: '//*[contains(@class, "sdc-badgebutton-default")]//a[contains(@class,"sdc-icon-remove")]'} }
    page_object(:search_results_count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-widget")]//div[contains(@class, "sdc-badge")])[1]'} }
    page_object(:search_results) { {xpath: '(//*[contains(@class, "sdc-badgebutton-text")])[1]'} }

  end

  class LeftNavigationSelected <SdcPage
    #page_object(:selected){{xpath: '//*[@id=""]'}}
    #page_object(:selected_count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-widget")]//div[@class="sdc-badge"])'} }
    #page_object(:selected_text) { {xpath: '(//*[contains(@class, "sdc-badgebutton-text")])'} }
    page_object(:selected) { {xpath: '(//*[contains(@class, "sdc-badgebutton sdc-badgebutton-first")])[2]'} }
    page_object(:selected_count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-widget")]//div[contains(@class, "sdc-badge")])[2]'} }
    page_object(:label) { {xpath: '(//*[contains(@class, "sdc-badgebutton-text")])[2]'} }
  end

  class LeftNavigationAllContacts <SdcPage
    #page_object(:all_contacts){{xpath: '//*[@id="total_contacts"]'}}
    #page_object(:all_contacts_count) { {xpath: '(//*[@id="total_contacts"]//div[contains(@class, "sdc-badgebutton-widget")]//div[@class="sdc-badge"])'} }
    #page_object(:all_contacts_text) { {xpath: '([@id="total_contacts"]//div[contains(@class, "sdc-badgebutton-text")])'} }
    page_object(:all_contacts) { {xpath: '(//*[contains(@class, "sdc-badgebutton-default")])[3]'} }
    page_object(:all_contacts_count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-widget")]//div[contains(@class, "sdc-badge")])[3]'} }
    page_object(:all_contacts_label) { {xpath: '(//*[contains(@class, "sdc-badgebutton-text")])[3]'} }
  end

  class LeftNavigationGroups <SdcPage
    page_object(:groups) { {xpath: '//*[contains(@class, "groups-filters")]'} }
    page_object(:left_nav_add_groups, required: true, timeout: 20) { { xpath: '//*[contains(@class, "groups-filters")]//following::img[@class="x-tool-img x-tool-plus"]'} }
    page_object(:left_nav_add_edit_groups, required: true, timeout: 20) { { xpath: '(//*[contains(@class, "groups-filters")]//following::img[@class="x-tool-img x-tool-gear"])[1]'} }
    page_object(:left_nav_groups, required: true, timeout: 20) { { xpath: '//*[contains(@class, "groups-filters")]//div[text()="Groups"]'} }
    page_object(:groups_expand_button,required: true, timeout: 45 ) { {   xpath: '//*[contains(@class, "groups-filters")]//img[contains(@class, "-expand-bottom")]'} }
    page_object(:groups_collapse_button,required: true, timeout: 45 ) { { xpath: '//*[contains(@class, "groups-filters")]//img[contains(@class, "-collapse-top")]'} }
    page_objects(:total_groups) { {xpath: '//*[contains(@class, "groups")]//table[@class="sdc-badgebutton x-box-item sdc-badgebutton-default"]'} }

    def group_element(row)
      xpath="(//*[contains(@class, 'groups-filters')]//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default'])[#{row}]"
      page_object(:group_element) { {xpath: xpath} }
    end

    def group(value,row)
      xpath_label = "(//*[contains(@class, 'groups-filters')]//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[1]/div[@class='table-cell-inner sdc-badgebutton-text'])[#{row}]"
      group_name = page_object(:name, required: true, timeout: 10) { { xpath: xpath_label } }

      xpath_widget= "(//*[contains(@class, 'groups-filters')]//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[2]/div[@class='table-cell-inner sdc-badgebutton-widget'])[#{row}]"
      xpath_count ="#{xpath_widget}/div"
      group_count = page_object(:count, required: true, timeout: 10) { { xpath: xpath_count} }

      xpath_edit="#{xpath_widget}/a[@class='sdc-badge-preset-btn sdc-icon-pencil']"
      #edit = page_object(:group_edit, required: true, timeout: 10){ { xpath: xpath_edit}}

      xpath_delete="#{xpath_widget}/a[@class='sdc-badge-preset-btn sdc-icon-trash-bin']"
      #delete = page_object(:group_delete, required: true, timeout: 10){ { xpath: xpath_delete}}

      case value
      when 'name'
        group_name.text_value
      when 'count'
        group_count.text_value
      end
    end

  end

  class LeftNavigationCostCodes <SdcPage
    #page_object(:cost_codes_expand_button,required: true, timeout: 45 ) { { xpath: '//*[@id="left_nav_costcodes_fieldset"]//*[@class="x-tool-img x-tool-expand-bottom"]'} } - Id changed
    page_object(:cost_codes_results_count) { {xpath: '(//*[@id="left_nav_costcodes_fieldset"]//div[@class="sdc-badge"])'} }
    page_object(:cost_codes_results_text) { {xpath: '(//*[@id="left_nav_costcodes_fieldset"]//div[@class="table-cell-inner sdc-badgebutton-text"])'} }
    #page_objects(:total_costcodes) { {xpath: '(//*[@id="left_nav_costcodes_fieldset-targetEl"]//table[@class="sdc-badgebutton x-box-item sdc-badgebutton-default"])'} }
    #chooser_xpath_value = "//*[@id='left_nav_costcodes_fieldset-targetEl']//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']"
    page_object(:cost_codes) { {xpath: '//*[contains(@class, "cost-codes-filters")]'} }
    page_object(:cost_codes_expand_button,required: true, timeout: 45 ) { {   xpath: '//*[contains(@class, "cost-codes-filters")]//img[contains(@class, "-expand-bottom")]'} }
    page_object(:cost_codes_collapse_button,required: true, timeout: 45 ) { { xpath: '//*[contains(@class, "cost-codes-filters")]//img[contains(@class, "-collapse-top")]'} }
    page_object(:left_nav_add_edit_costcodes, required: true, timeout: 20) { { xpath: '(//*[contains(@class, "cost-codes-filters")]//following::img[@class="x-tool-img x-tool-gear"])'} }
    page_objects(:total_costcodes) { {xpath: '//*[contains(@class, "cost-codes-filters")]//table[@class="sdc-badgebutton x-box-item sdc-badgebutton-default"]'} }

    def cost_code_element(position)
      xpath="(//*[contains(@class, 'cost-codes-filters')]//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default'])[#{position}]"
      page_object(:costcode_element) { {xpath: xpath} }
    end

    def cost_code_name(position)
      #xpath_text = "(//*[@id='left_nav_costcodes_fieldset-targetEl']//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[1]/div[@class='table-cell-inner sdc-badgebutton-text'])[#{position}]"
      xpath_text = "(//*[contains(@class, 'cost-codes-filters')]//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[1]/div[@class='table-cell-inner sdc-badgebutton-text'])[#{position}]"
      label = page_object(:cost_code_text, required: true, timeout: 10) { { xpath: xpath_text } }
      label.text_value
    end

    def cost_code_count(row)
      #xpath_count = "(//*[@id='left_nav_costcodes_fieldset-targetEl']//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[2]/div[@class='table-cell-inner sdc-badgebutton-widget'])[#{row}]"
      xpath_count = "(//*[contains(@class, 'cost-codes-filters')]//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[2]/div[@class='table-cell-inner sdc-badgebutton-widget'])[#{row}]"
      value = page_object(:cost_codes_value, required: true, timeout: 10) { { xpath: xpath_count } }
      value.text_value
    end

  end

  class << self
    def contacts_left_navigation_panel
      ContactsLeftNavigation.new
    end

    def contacts_left_navigation_search_results
      SearchResults.new
    end

    def contacts_left_navigation_selected_contacts
      LeftNavigationSelected.new
    end

    def contacts_left_navigation_all_contacts
      LeftNavigationAllContacts.new
    end

    def contacts_left_nav_cost_code
      LeftNavigationCostCodes.new
    end

    def contacts_left_nav_group
      LeftNavigationGroups.new
    end

  end


end