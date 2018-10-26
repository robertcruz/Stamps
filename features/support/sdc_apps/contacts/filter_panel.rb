module SdcContacts
  module FilterPanel

    class ContactsFilter < SdcPage
      page_object(:left_nav){{xpath: '//*[@id="left_navigation_items"]'}}
      text_field(:search_bar, tag: :text_field) { {xpath: '//*[@placeholder="Search Contacts"]'} }
      page_object(:search_icon) { {xpath: '//*[contains(@class, "search-trigger-grey")]'} }
      page_object(:search_results) { {xpath: '//*[contains(@class, "sdc-badgebutton-default")]//div[text()="Search Results"]'} }
      page_object(:selected) { {xpath: '//*[contains(@class, "sdc-badgebutton-default")]//div[text()="Selected"]'} }
      page_object(:all_contacts) { {xpath: '//*[contains(@class, "sdc-badgebutton-default")]//div[text()="All Contacts"]'} }
      page_object(:groups) { {xpath: '//*[contains(@class, "groups-filters")]'}}
      page_object(:cost_codes)   { {xpath: '//*[contains(@class, "cost-codes-filters")]'}}
      link(:collapse,required: true, timeout: 45 ) { {xpath: '//*[contains(@class, "sdc-icon-collapse")]'} }
      link(:expand,required: true, timeout: 45 ) { {xpath: '//*[contains(@class, "expand-right")]'} }
      #page_object(:left_nav_collapsed){{xpath: '//*[@id="filter-nav-collapsed-left"]'}}
    end

    class SearchResults < SdcPage
      page_object(:search_results_remove) { {xpath: '//*[contains(@class, "sdc-badgebutton-default")]//a[contains(@class,"sdc-icon-remove")]'}}
      page_object(:search_results_count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-widget")]//div[contains(@class, "sdc-badge")])[1]'} }
      page_object(:search_results) { {xpath: '(//*[contains(@class, "sdc-badgebutton-text")])[1]'} }
    end

    class Selected <SdcPage
      page_object(:selected) { {xpath: '(//*[contains(@class, "sdc-badgebutton sdc-badgebutton-first")])[2]'}}
      page_object(:selected_count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-widget")]//div[contains(@class, "sdc-badge")])[2]'} }
      page_object(:label) { {xpath: '(//*[contains(@class, "sdc-badgebutton-text")])[2]'} }
    end

    class AllContacts <SdcPage
      page_object(:all_contacts) { {xpath: '(//*[contains(@class, "sdc-badgebutton-default")])[3]'}}
      page_object(:all_contacts_count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-widget")]//div[contains(@class, "sdc-badge")])[3]'} }
      page_object(:all_contacts_label) { {xpath: '(//*[contains(@class, "sdc-badgebutton-text")])[3]'} }
    end

    class Groups <SdcPage
      page_object(:groups) { {xpath: '//*[contains(@class, "groups-filters")]'}}
      page_object(:left_nav_add_groups, required: true, timeout: 20) { { xpath: '//*[contains(@class, "groups-filters")]//following::img[@class="x-tool-img x-tool-plus"]'}}
      page_object(:left_nav_add_edit_groups, required: true, timeout: 20) { { xpath: '(//*[contains(@class, "groups-filters")]//following::img[@class="x-tool-img x-tool-gear"])[1]'}}
      page_object(:left_nav_groups, required: true, timeout: 20) { { xpath: '//*[contains(@class, "groups-filters")]//div[text()="Groups"]'}}
      page_object(:groups_expand_button,required: true, timeout: 45 ) { {   xpath: '//*[contains(@class, "groups-filters")]//img[contains(@class, "-expand-bottom")]'} }
      page_object(:groups_collapse_button,required: true, timeout: 45 ) { { xpath: '//*[contains(@class, "groups-filters")]//img[contains(@class, "-collapse-top")]'} }
      page_objects(:total_groups) { {xpath: '//*[contains(@class, "groups")]//table[@class="sdc-badgebutton x-box-item sdc-badgebutton-default"]'} }

      def group_element(row)
        xpath="(//*[contains(@class, 'groups-filters')]//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default'])[#{row}]"
        page_object(:group_element){{xpath: xpath}}
      end

      def group(value,row)
        xpath_edit="#{xpath_widget}/a[@class='sdc-badge-preset-btn sdc-icon-pencil']"
        #edit = page_object(:group_edit, required: true, timeout: 10){ { xpath: xpath_edit}}

        xpath_delete="#{xpath_widget}/a[@class='sdc-badge-preset-btn sdc-icon-trash-bin']"
        #delete = page_object(:group_delete, required: true, timeout: 10){ { xpath: xpath_delete}}

        case value
        when 'name'
          xpath_label = "(//*[contains(@class, 'groups-filters')]//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[1]/div[@class='table-cell-inner sdc-badgebutton-text'])[#{row}]"
          page_object(:name, required: true, timeout: 10){ { xpath: xpath_label }}
        when 'count'
          xpath_widget= "(//*[contains(@class, 'groups-filters')]//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[2]/div[@class='table-cell-inner sdc-badgebutton-widget'])[#{row}]"
          xpath_count ="#{xpath_widget}/div"
          page_object(:count, required: true, timeout: 10){ { xpath: xpath_count}}
        end
      end

    end

    class CostCodes <SdcPage
      #page_object(:cost_codes_expand_button,required: true, timeout: 45 ) { { xpath: '//*[@id="left_nav_costcodes_fieldset"]//*[@class="x-tool-img x-tool-expand-bottom"]'} } - Id changed
      page_object(:cost_codes_results_count) { {xpath: '(//*[@id="left_nav_costcodes_fieldset"]//div[@class="sdc-badge"])'} }
      page_object(:cost_codes_results_text) { {xpath: '(//*[@id="left_nav_costcodes_fieldset"]//div[@class="table-cell-inner sdc-badgebutton-text"])'} }
      #page_objects(:total_costcodes) { {xpath: '(//*[@id="left_nav_costcodes_fieldset-targetEl"]//table[@class="sdc-badgebutton x-box-item sdc-badgebutton-default"])'} }
      #chooser_xpath_value = "//*[@id='left_nav_costcodes_fieldset-targetEl']//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']"
      page_object(:cost_codes) { {xpath: '//*[contains(@class, "cost-codes-filters")]'}}
      page_object(:cost_codes_expand_button,required: true, timeout: 45 ) { {   xpath: '//*[contains(@class, "cost-codes-filters")]//img[contains(@class, "-expand-bottom")]'} }
      page_object(:cost_codes_collapse_button,required: true, timeout: 45 ) { { xpath: '//*[contains(@class, "cost-codes-filters")]//img[contains(@class, "-collapse-top")]'} }
      page_object(:left_nav_add_edit_costcodes, required: true, timeout: 20) { { xpath: '(//*[contains(@class, "cost-codes-filters")]//following::img[@class="x-tool-img x-tool-gear"])'}}
      page_objects(:total_costcodes) { {xpath: '//*[contains(@class, "cost-codes-filters")]//table[@class="sdc-badgebutton x-box-item sdc-badgebutton-default"]'} }

      def cost_code_element(position)
        xpath="(//*[contains(@class, 'cost-codes-filters')]//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default'])[#{position}]"
        page_object(:costcode_element){{xpath: xpath}}
      end

      def cost_code_name(position)
        #xpath_text = "(//*[@id='left_nav_costcodes_fieldset-targetEl']//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[1]/div[@class='table-cell-inner sdc-badgebutton-text'])[#{position}]"
        xpath_text = "(//*[contains(@class, 'cost-codes-filters')]//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[1]/div[@class='table-cell-inner sdc-badgebutton-text'])[#{position}]"
        page_object(:cost_code_text, required: true, timeout: 10){ { xpath: xpath_text }}

      end

      def cost_code_count(row)
        #xpath_count = "(//*[@id='left_nav_costcodes_fieldset-targetEl']//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[2]/div[@class='table-cell-inner sdc-badgebutton-widget'])[#{row}]"
        xpath_count = "(//*[contains(@class, 'cost-codes-filters')]//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[2]/div[@class='table-cell-inner sdc-badgebutton-widget'])[#{row}]"
        page_object(:cost_codes_value, required: true, timeout: 10){ { xpath: xpath_count }}
      end

    end

    class << self
      def filter_panel
        ContactsFilter.new
      end

      def search_results
        SearchResults.new
      end

      def selected
        Selected.new
      end

      def all_contacts
        AllContacts.new
      end

      def cost_code
        CostCodes.new
      end

      def group
        Groups.new
      end

    end

  end
end