module SdcAccountServices

  class ContactsAddCostCodes < SdcPage

    page_object(:add_cost_code, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@name="newReferenceCode"]' } }
    page_object(:add_cost_code_button, required: true, timeout: 45 ) { { xpath: '//*[@id="addLrg"]'} }
    page_object(:add_cost_code_table, required: true, timeout: 45 ) { { xpath: '//*[@id="codeTable"]'} }
    page_objects(:cost_code_table_rows, required: true, timeout: 45 ) { { xpath: '//*[@id="codeTable"]//tr'} }
    page_object(:done_cost_code_button, required: true, timeout: 45 ) { { xpath: '//*[@id="done"]'} }
    page_object(:remove_cost_code_button, required: true, timeout: 45 ) { { xpath: '//*[@id="remove"]'} }
    page_object(:error_cost_code, required: true, timeout: 45 ) { { xpath: '//*[@id="errorBox"]'} }
    page_object(:cost_codes_page, required: true, timeout: 45 ) { { xpath: '//*[@id="pageBreadcrumbs"]'}}
    page_object(:cost_codes_accounts_page, required: true, timeout: 45 ) { { xpath: '//*[@id="pageHeaderTextForAccount"]'}}
    page_object(:cost_codes_checkbox, required: true, timeout: 45 ) { { xpath: '//*[@name="removeCodeCheckbox"]'}}
    page_object(:cost_code_table_value, required: true, timeout: 45 ) { { xpath: '//*[@id="codeTable"]//tr/td[2]'} }

    def count
      xpath = "#{contacts_grid_container}//table"
      grid_row_ct = page_object(:contacts_grid_row_ct) { { xpath: xpath } }
      begin
        ct = grid_row_ct.size.to_i
        return ct if ct > 0
      rescue
        # ignore
      end
      0
    end

  end

  class << self

    def cost_codes
      ContactsAddCostCodes.new
    end
  end

end
