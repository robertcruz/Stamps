module SdcContacts
  module ContactsPagination

    class Pagination < SdcPage
    page_object(:perpage_drop_down) { { xpath: '//*[@name="perpage"]/following::div[contains(@class,"arrow-trigger")]' } }
    text_field(:perpage_textbox, tag: :text_field) { { xpath: '//*[@name="perpage"]'} }
    page_object(:page_first, required: true, timeout: 20) { { xpath: '//*[contains(@class,"page-first")]'}}
    page_object(:page_previous, required: true, timeout: 20) { { xpath: '//*[contains(@class,"page-prev")]'}}
    page_object(:page_next, required: true, timeout: 20) { { xpath: '//*//*[contains(@class,"page-next")]'}}
    page_object(:page_last, required: true, timeout: 20) { { xpath: '//*[contains(@class,"page-last")]'}}
    page_objects(:contacts_grid, required: true, timeout: 20) { { xpath: '//*[@id="contactsGrid-normal-body"]//table'}}
    page_object(:all_contacts_count, required: true, timeout: 20) { { xpath: '//*[contains(@class,"sdc-badgebutton-selected")]//*[@class="sdc-badge"]'}}
    page_object(:selected_contacts_count, required: true, timeout: 20) { { xpath: '//*[contains(@class,"sdc-badgebutton-first")][2]//*[@class="sdc-badge"]'}}
    page_object(:max_pages, required: true, timeout: 20) { { xpath: '//*[contains(@id,"numberfield")]/following::div[contains(@id,"tbtext")][1]'}}
    page_object(:current_page, required: true, timeout: 20) { { xpath: '//*[@name="inputItem"]'}}

    def selection_pagination(name: 'selection', value: 'None')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end

    def page_arrow_disabled(arrow_name)
      xpath="//*[contains(@class,'page-#{arrow_name}')]/ancestor::a[contains(@class,'x-toolbar-item')]"
      item=page_object(:parent_item){{xpath: xpath}} #todo-Aloha this method should only return this page object
      class_value =  item.attribute_value("class") #todo-Aloha move this API call to step definition
      class_value.include?("disabled") #todo-Aloha move this API call to step definition
    end

    end

  end

end