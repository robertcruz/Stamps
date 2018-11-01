module SdcContacts
  module Toolbar

    class Toolbar < SdcPage
      page_object(:add, tag: :span, required: true, timeout: 45) { { xpath: '//span[text()="Add"]' } }
      page_object(:delete) { { xpath: '//span[contains(@id, "button-")][text()="Delete"]' } }
      page_object(:print_postage) { { xpath: '//span[contains(@id, "button-")][text()="Print Postage"]' } }
      page_object(:groups, required: true, timeout: 20) { { xpath: '//span[contains(@id, "button-")][text()="Groups"]' } }
      page_object(:cost_codes, required: true, timeout: 20) { { xpath: '//span[contains(@id, "button-")][text()="Cost Codes"]' } }
      page_object(:ref) { { xpath: '//span[contains(@id,"button-")][text()="Ref #"]' } }
      page_object(:import) { { xpath: '//*[contains(@class, "sdc-icon-import")]' } }
      page_object(:export) { { xpath: '//*[contains(@class, "sdc-icon-export")]' } }
      page_object(:feedback) { { xpath: '//*[contains(@class, "sdc-icon-feedback")]' } }
      page_object(:settings) { { xpath: '//*[contains(@class, "sdc-icon-settings")]' } }

      def groups_dropdown
        GroupsDropdown.new
      end

      def cost_codes_dropdown
        CostCodesDropdown.new
      end

      def toolbar_settings
        ToolbarSettings.new
      end

    end

    class GroupsDropdown< SdcPage
      page_object(:toolbar_groups_change_groups, required: true, timeout: 20) { { xpath: '//span[contains(@id, "menuitem-")][text()="Change Groups"]' } }
      page_object(:toolbar_groups_add_edit_groups, required: true, timeout: 20) { { xpath: '//span[contains(@id, "menuitem-")][text()="Add/Edit Groups"]' } }
    end

    class CostCodesDropdown< SdcPage
      page_object(:cost_codes_change_costcode, required: true, timeout: 10) { { xpath: '//span[contains(@id,"menuitem-")][text()="Change Cost Code"]' } }
      page_object(:cost_codes_add_edit_costcode, required: true, timeout: 10) { { xpath: '//span[contains(@id,"menuitem-")][text()="Add/Edit Cost Codes"]' } }
    end

    class ToolbarSettings< SdcPage
      page_object(:settings_columns, required: true, timeout: 10) { { xpath: '//div[contains (@class,"x-menu-item")]/a/span[contains(@class, "x-menu-item-indent-left-arrow")][text()="Columns"]' } }
      page_object(:settings_freeze_columns,required: true, timeout: 10) { { xpath: '//*[text()="Freeze Columns"]' } }

      def column_menu(column)
        "//span[contains(@id,'menucheckitem-')][text()='#{column}']"
      end

      def column_menu_checkbox(column)
        #chooser
        chooser_xpath = "#{column_menu(column)}/following-sibling::div[1]"
        chooser_name = "men_item_chooser_name"
        page_object(chooser_name) { { xpath: chooser_xpath } }
        #verify
        verify_xpath = "#{column_menu(column)}/ancestor::div[contains(@class,'x-menu-item-default')]"
        verify_name = "grid_verify_name"
        page_object(verify_name) { { xpath: verify_xpath } }
        #checkbox page object
        menu_item_checkbox_name = "grid_checkbox_name_test"
        SdcPage.chooser(menu_item_checkbox_name, chooser_name, verify_name, :class, 'unchecked')
        instance_eval(menu_item_checkbox_name)
      end

      # def checkbox_checked(column)
      #   xpath="//span[text()='#{column}']/ancestor::div[contains(@class,'x-menu-item')]"
      #   item=page_object(:parent_item){{xpath: xpath}}
      #   class_value =  item.attribute_value("class")
      #   class_value.include?("unchecked")
      # end

    end

  end
end