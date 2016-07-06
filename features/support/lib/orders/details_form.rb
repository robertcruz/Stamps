module Stamps
  module Orders
    module Details
      class OrderForm < Browser::Modal
        def blur_out

          item_label = BrowserElement.new browser.label text: 'Insure For $:'
          10.times {
            begin
              item_label.element.click
              item_label.element.double_click
            rescue
              logger.error e.backtrace.join "\n"
            end
          }
        end
      end

      class ShipToFields < OrderForm

        class ShipToCountry < OrderForm

          def drop_down
            divs = browser.divs css: "div[id^=combo-][id$=-trigger-picker]"
            domestic = BrowserElement.new divs.first
            international = BrowserElement.new divs.last

            if domestic.present?
              domestic
            elsif international.present?
              international
            else
              stop_test "Unable to located Ship-To drop-down button."
            end
          end

          def text_box
            BrowserTextBox.new (browser.text_fields name: "ShipCountryCode")[1]
          end

          def select country
            logger.info "Select Country #{country}"

            selection_1 = BrowserElement.new browser.li text: country
            selection_2 = BrowserElement.new browser.li text: "#{country} "

            text_box = self.text_box
            drop_down = self.drop_down
            10.times {
              begin
                drop_down.safe_click unless selection_1.present? || selection_2.present?
                if selection_1.present?
                  selection_1.scroll_into_view
                  selection_1.safe_click
                elsif selection_2.present?
                  selection_2.scroll_into_view
                  selection_2.safe_click
                end

                logger.info "Selection #{text_box.text} - #{(text_box.text.include? country)?"was selected": "not selected"}"
                break if text_box.text.include? country
              rescue
                #ignore
              end
            }
            logger.info "#{country} selected."
            ShipToInternational.new param unless country.include? "United States"
          end
        end

        def country
          ShipToCountry.new param
        end

        def text_area
          field = browser.textarea name: "freeFormAddress"
          error_field = browser.a css: "a[data-errorqtip*=address]" #This is the field containing data error property data-errorqtip
          error_field_attribute = "data-errorqtip"
          BrowserTextBox.new field, error_field, error_field_attribute
        end

        def less
          BrowserElement.new (browser.spans text: "Less").first
        end

        def hide
          blur_out
          less.click_while_present
        end

        def expand
          blur_out
          ship_to_dd = BrowserElement.new browser.span css: "div[id=shiptoview-addressCollapsed-innerCt]>a>span>span>span:nth-child(1)"

          5.times {
            ship_to_dd.safe_click
            break unless ship_to_dd.present?
          }
        end

        def email
          expand
          field = browser.text_field name: 'BuyerEmail'
          error_field = (browser.divs css: "div[data-errorqtip*=email]")[0]
          error_field_attribute = "data-errorqtip"
          BrowserTextBox.new field, error_field, error_field_attribute
        end

        def phone
          expand
          BrowserTextBox.new browser.text_field name: "ShipPhone"
        end
      end

      class ShipToInternationalFields < OrderForm

        def present?
          BrowserTextBox.new(browser.text_field name: "FullName").present?
        end

        def name
          field = browser.text_field name: "ShipName"
          error_field = browser.div css: "div[data-anchortarget^=autosuggest][data-anchortarget$=inputEl]"
          error_field_attribute = "data-errorqtip"
          BrowserTextBox.new field, error_field, error_field_attribute
        end

        def company
          field = browser.text_field name: "ShipCompany"
          error_field = browser.divs(css: "div[data-anchortarget^=textfield][data-anchortarget$=inputEl]")[2]
          error_field_attribute = "data-errorqtip"
          BrowserTextBox.new field, error_field, error_field_attribute
        end

        def address_1
          field = browser.text_field name: "ShipStreet1"
          error_field = browser.divs(css: "div[data-anchortarget^=textfield][data-anchortarget$=inputEl]")[3]
          error_field_attribute = "data-errorqtip"
          BrowserTextBox.new field, error_field, error_field_attribute
        end

        def address_2
          BrowserTextBox.new browser.text_field name: "ShipStreet2"
        end

        def city
          field = browser.text_field name: "ShipCity"
          error_field = browser.divs(css: "div[data-anchortarget^=textfield][data-anchortarget$=inputEl]")[5]
          error_field_attribute = "data-errorqtip"
          BrowserTextBox.new field, error_field, error_field_attribute
        end

        def phone
          field = (browser.text_fields name: "ShipPhone").last
          error_field = browser.divs(css: "div[data-anchortarget^=textfield][data-anchortarget$=inputEl]")[8]
          error_field_attribute = "data-errorqtip"
          BrowserTextBox.new field, error_field, error_field_attribute
        end

        def province
          BrowserTextBox.new browser.text_field name: "ShipState"
        end

        def postal_code
          BrowserTextBox.new browser.text_field name: "ShipPostalCode"
        end

        def email
          BrowserTextBox.new (browser.text_fields name: "BuyerEmail").last
        end
      end

      class AutoSuggestPopUp < Browser::Modal

        def present?
          (BrowserElement.new self.name_fields[0]).present?
        end

        def size
          (browser.lis css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=main]").size
        end

        def select number
          selection = BrowserElement.new name_fields[number.to_i-1]
          selection.safe_click
          selection.safe_click
          selection.safe_click
        end

        def name_fields
          (browser.lis css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=main]")
        end

        def address_fields
          (browser.lis css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=sub]")
        end
      end

      class AutoSuggestInternational < ShipToInternationalFields

        def set address
          text_field = self.name
          auto_suggest_box = AutoSuggestPopUp.new param

          20.times{
            begin
              text_field.set address
              return auto_suggest_box if auto_suggest_box.present?
              text_field.safe_click
              sleep 1
              return auto_suggest_box if auto_suggest_box.present?
              ship_to_area1.safe_double_click
              return auto_suggest_box if auto_suggest_box.present?
            rescue
              #ignore
            end
          }
        end
      end

      class ShipToInternational < ShipToInternationalFields
        def auto_suggest
          AutoSuggestInternational.new param
        end
      end

      class ShipToDomestic < ShipToFields

        class AmbiguousAddress < ShipToFields

          class AddressNotFound < Browser::Modal

            def present?
              browser.div(text: 'Exact Address Not Found').present?
            end

            def row number
              row = number.to_i<=0?0:number.to_i-1
              checkbox_field = browser.input css: "input[name=addrAmbig][value='#{row}']"

              checkbox = BrowserCheckbox.new checkbox_field, checkbox_field, "checked", "checked"
              checkbox.check

              accept_button = BrowserElement.new browser.span text: "Accept"
              accept_button.click_while_present
            end

            def set partial_address_hash
              exact_address_not_found_field = browser.div text: 'Exact Address Not Found'
              form = DetailsForm.new param
              form.validate_address_link
              country_drop_down = self.country
              #single_order_form.expand
              form.ship_to.set ParameterHelper.format_address(partial_address_hash)
              30.times {
                begin
                  item_label.click
                  country_drop_down.drop_down.safe_click
                  country_drop_down.drop_down.safe_click
                  item_label.click

                  break if (exact_address_not_found_field.present?) || (form.validate_address_link.present?)
                rescue
                  #ignore
                end
              }
              #single_order_form.hide_ship_to
              self
            end
          end

          def address_not_found
            AddressNotFound.new param
          end

          def set address
            suggested_address_corrections = BrowserElement.new browser.span(text: "View Suggested Address Corrections")

            exact_address_not_found = address_not_found
            country_drop_down = self.country
            text_box = self.text_area

            orders_grid = Orders::Grid::OrdersGrid.new param
            phone = self.phone
            email = self.email

            20.times{
              text_box.send_keys address
              text_box.set address

              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              text_box.safe_double_click
              text_box.safe_double_click
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              text_box.safe_double_click
              text_box.safe_double_click
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              country_drop_down.drop_down.safe_click
              country_drop_down.drop_down.safe_click
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              country_drop_down.drop_down.safe_click
              country_drop_down.drop_down.safe_click
              phone.set ParameterHelper.random_phone
              phone.send_keys :enter
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              country_drop_down.drop_down.safe_click
              country_drop_down.drop_down.safe_click
              phone.send_keys :tab
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              email.set ParameterHelper.random_email
              email.send_keys :enter
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              email.send_keys :tab
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              text_box.safe_double_click
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              text_box.safe_double_click
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              text_box.safe_double_click
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              text_box.safe_double_click
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              orders_grid.recipient.scroll_into_view
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              text_box.safe_double_click
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              phone.send_keys :tab
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              email.send_keys :enter
              orders_grid.recipient.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.company.scroll_into_view
              break if exact_address_not_found.present?
              text_box.safe_double_click
              break if exact_address_not_found.present?
              phone.send_keys :tab
              break if exact_address_not_found.present?
              email.send_keys :enter
              break if exact_address_not_found.present?
              text_box.safe_double_click
              break if exact_address_not_found.present?
              phone.set ParameterHelper.random_phone
              break if exact_address_not_found.present?
              email.set ParameterHelper.random_email
              break if exact_address_not_found.present?
              phone .safe_double_click
              break if exact_address_not_found.present?
              email .safe_double_click
              break if exact_address_not_found.present?
              orders_grid.checkbox.scroll_into_view
              break if exact_address_not_found.present?
              orders_grid.recipient.scroll_into_view
              break if exact_address_not_found.present?
              phone.send_keys :tab
              break if exact_address_not_found.present?
            }

            phone.set ""
            email.set ""
            if exact_address_not_found.present?
              exact_address_not_found
            else
              stop_test "Exact Address Not Found module did not appear."
            end
          end

          def data_error
            self.text_area.data_error_qtip
          end

        end

        class AutoSuggestDomestic < ShipToFields

          def set address
            text_area = self.text_area
            auto_suggest_box = AutoSuggestPopUp.new param

            20.times{
              begin
                text_area.set address
                return auto_suggest_box if auto_suggest_box.present?
                text_area.safe_click
                sleep 1
                return auto_suggest_box if auto_suggest_box.present?
                ship_to_area1.safe_double_click
                return auto_suggest_box if auto_suggest_box.present?
              rescue
                #ignore
              end
            }
          end
        end

        def ambiguous
          AmbiguousAddress.new param
        end

        def auto_suggest
          AutoSuggestDomestic.new param
        end

        def set address
          less = self.less
          ship_to_country = self.country
          phone = self.phone
          email = self.email
          text_area = self.text_area

          orders_grid = Orders::Grid::OrdersGrid.new param

          ship_to_area1 = BrowserElement.new browser.div css: "div[id=shiptoview-domestic-targetEl]>div:nth-child(2)>div>div>div:nth-child(1)"
          ship_to_area2 = BrowserElement.new browser.div css: "div#shiptoview-domestic-innerCt"

          ship_to_drop_down = BrowserElement.new browser.span css: "span[class*=sdc-icon-down-arrow]"

          text_area.set address

          20.times{
            begin
              text_area.safe_send_keys :enter
              text_area.safe_send_keys :tab
              text_area.send_keys address
              text_area.set address
              break if less.present?

              ship_to_country.select "United States"
              break if less.present?
              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              break if less.present?

              email.safe_send_keys :enter
              break if less.present?
              phone.safe_send_keys :tab
              break if less.present?
              sleep 1
              email.safe_send_keys :enter
              phone.safe_send_keys :tab
              break if less.present?
              ship_to_country.select "United States"
              break if less.present?
              orders_grid.order_total.scroll_into_view
              orders_grid.recipient.scroll_into_view

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              orders_grid.order_total.scroll_into_view
              break if less.present?
              orders_grid.checkbox.scroll_into_view
              orders_grid.order_total.scroll_into_view
              orders_grid.address.scroll_into_view
              break if less.present?
              orders_grid.order_total.scroll_into_view
              orders_grid.company.scroll_into_view

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              ship_to_area1.safe_click
              ship_to_area2.safe_click
              break if less.present?
              less.safe_double_click
              less.safe_click
              break if less.present?
              text_area.safe_double_click
              text_area.safe_click
              ship_to_area1.safe_double_click
              ship_to_area2.safe_double_click
              ship_to_country.select "United States"
              break if less.present?

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if (orders_grid.company.row 1).length > 1
              break if less.present?
              less.safe_double_click
              less.safe_click
              text_area.safe_double_click
              text_area.safe_click
              phone.set ParameterHelper.random_phone
              email.safe_send_keys :enter

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              phone.safe_send_keys :tab
              sleep 1
              email.safe_send_keys :enter
              phone.safe_send_keys :tab
              email.set ParameterHelper.random_email
              sleep 1
              ship_to_country.select "United States"
              break if less.present?
              break if less.present?

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if (orders_grid.company.row 1).length > 1
              ship_to_area1.safe_click
              ship_to_area2.safe_click
              text_area.safe_double_click
              text_area.safe_double_click
              ship_to_area1.safe_double_click
              ship_to_area2.safe_double_click
              orders_grid.order_total.scroll_into_view
              orders_grid.recipient.scroll_into_view

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              orders_grid.order_total.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.order_total.scroll_into_view
              orders_grid.address.scroll_into_view

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              orders_grid.order_total.scroll_into_view
              orders_grid.company.scroll_into_view
              orders_grid.order_total.scroll_into_view

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if (orders_grid.company.row 1).length > 1
              less.safe_double_click
              less.safe_click
              text_area.safe_double_click
              text_area.safe_click
              ship_to_country.select "United States"
              break if less.present?
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if (orders_grid.company.row 1).length > 1
              ship_to_area1.safe_click

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              ship_to_area2.safe_click
              ship_to_area1.safe_double_click
              ship_to_area2.safe_double_click
              break if less.present?
              ship_to_country.select "United States"
              break if less.present?
              email.safe_send_keys :enter
              phone.safe_send_keys :tab
              sleep 1
              email.safe_send_keys :enter
              phone.safe_send_keys :tab
              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              sleep 1
              text_area.safe_double_click
              text_area.safe_double_click

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              ship_to_area1.safe_double_click
              ship_to_area2.safe_double_click
              orders_grid.order_total.scroll_into_view

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              orders_grid.recipient.scroll_into_view
              less.safe_double_click
              less.safe_click
              text_area.safe_double_click
              text_area.safe_click
              ship_to_country.select "United States"
              break if less.present?
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if (orders_grid.company.row 1).length > 1
              ship_to_area1.safe_click
              ship_to_area2.safe_click
              orders_grid.order_total.scroll_into_view
              orders_grid.checkbox.scroll_into_view

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              orders_grid.order_total.scroll_into_view
              orders_grid.address.scroll_into_view
              orders_grid.order_total.scroll_into_view
              orders_grid.company.scroll_into_view
              less.safe_double_click
              less.safe_click
              text_area.safe_double_click
              text_area.safe_click
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if (orders_grid.company.row 1).length > 1
              break if less.present?
              ship_to_area1.safe_click

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              ship_to_area2.safe_click
              ship_to_area1.safe_double_click
              ship_to_area2.safe_double_click
              text_area.set address
              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              email.safe_send_keys :enter
              phone.safe_send_keys :tab
              sleep 1
              email.safe_send_keys :enter
              phone.safe_send_keys :tab
              sleep 1
              orders_grid.order_total.scroll_into_view

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              orders_grid.recipient.scroll_into_view
              orders_grid.order_total.scroll_into_view
              orders_grid.checkbox.scroll_into_view
              orders_grid.order_total.scroll_into_view

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if (orders_grid.company.row 1).length > 1
              orders_grid.address.scroll_into_view
              orders_grid.order_total.scroll_into_view
              orders_grid.company.scroll_into_view
              break if less.present?
              ship_to_area1.safe_click
              ship_to_area2.safe_click
              ship_to_area1.safe_double_click
              ship_to_area2.safe_double_click
              less.safe_double_click
              less.safe_click
              text_area.safe_double_click
              text_area.safe_click
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if (orders_grid.company.row 1).length > 1
              text_area.send_keys address
              text_area.set address
              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              email.safe_send_keys :enter
              phone.safe_send_keys :tab
              sleep 1
              email.safe_send_keys :enter
              phone.safe_send_keys :tab
              sleep 1
              ship_to_country.select "United States"
              break if less.present?
              break if less.present?
              phone.set ParameterHelper.random_phone
              phone.send_keys :enter
              less.safe_double_click
              less.safe_click

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if (orders_grid.company.row 1).length > 1
              text_area.safe_double_click
              text_area.safe_click
              ship_to_country.select "United States"
              break if less.present?
              break if less.present?
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if (orders_grid.company.row 1).length > 1
              text_area.send_keys address
              text_area.set address
              orders_grid.recipient.scroll_into_view
              orders_grid.order_total.scroll_into_view
              break if less.present?
              orders_grid.checkbox.scroll_into_view
              less.safe_click
              text_area.safe_double_click
              text_area.safe_click
              ship_to_country.select "United States"
              break if less.present?
              break if less.present?
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if less.present?
              break if (orders_grid.company.row 1).length > 1
              ship_to_area1.safe_click
              ship_to_area2.safe_click

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              break if (orders_grid.recipient.row 1).length > 1
              break if less.present?
              break if (orders_grid.address.row 1).length > 1
              break if (orders_grid.company.row 1).length > 1
              ship_to_area1.safe_double_click
              ship_to_area2.safe_double_click
              text_area.set address
              break if less.present?
              ship_to_country.select "United States"
              break if less.present?
              break if less.present?
              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              email.safe_send_keys :enter
              phone.safe_send_keys :tab
              sleep 1
              email.safe_send_keys :enter
              phone.safe_send_keys :tab
              sleep 1
              email.send_keys :tab
              break if less.present?
              orders_grid.order_total.scroll_into_view
              orders_grid.recipient.scroll_into_view
              orders_grid.order_total.scroll_into_view
              break if less.present?
              orders_grid.checkbox.scroll_into_view

              browser.window.move_to 0, 0
              browser.window.resize_to 1250, 850
              browser.window.maximize
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if less.present?
              break if (orders_grid.company.row 1).length > 1
              orders_grid.order_total.scroll_into_view
              orders_grid.address.scroll_into_view
              break if less.present?
              orders_grid.order_total.scroll_into_view
              orders_grid.company.scroll_into_view
              less.safe_double_click
              less.safe_click
              break if less.present?
              text_area.safe_double_click
              text_area.safe_click
              break if less.present?
              ship_to_country.select "United States"
              less.safe_click
              text_area.safe_double_click
              text_area.safe_click
              ship_to_country.select "United States"
              break if less.present?
              break if less.present?
              break if less.present?
              break if (orders_grid.recipient.row 1).length > 1
              break if (orders_grid.address.row 1).length > 1
              break if (orders_grid.company.row 1).length > 1
              ship_to_area1.safe_click
              ship_to_area2.safe_click
              ship_to_area1.safe_double_click
              break if less.present?
              ship_to_area2.safe_double_click
              break if less.present?
              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              break if less.present?
              email.safe_send_keys :enter
              phone.safe_send_keys :tab
              sleep 1
              email.safe_send_keys :enter
              break if less.present?
              phone.safe_send_keys :tab
              email.set ParameterHelper.random_email
              email.safe_send_keys :enter
              break if less.present?
              phone.safe_send_keys :tab
              sleep 1
              email.safe_send_keys :enter
              phone.safe_send_keys :tab
              sleep 1
              email.send_keys :enter
              ship_to_area1.safe_click
              ship_to_area2.safe_click
              break if less.present?
              ship_to_area1.safe_double_click
              ship_to_area2.safe_double_click
              break if less.present?
              phone.set ParameterHelper.random_phone
              email.set ParameterHelper.random_email
              sleep 1
              orders_grid.recipient.scroll_into_view
              break if less.present?
              phone.send_keys :tab
              break if less.present?
              phone.safe_set ""
              email.safe_set ""
            rescue
              #ignore
            end
          }
          ship_to_drop_down.safe_click unless phone.present?
          phone.safe_set ""
          ship_to_drop_down.safe_click unless email.present?
          email.safe_set ""
          less.safe_click if phone.present?
        end
      end

      class ShipTo < ShipToFields

        def international
          Orders::Details::ShipToInternational.new param
        end

        def address
          ShipToDomestic.new param
        end
      end

      class AddShippingAdress < Browser::Modal
        #todo FIX ME!!
        public
        def shipping_address=(table)
          self.origin_zip = table["ship_from_zip"]
          self.name = table['name']
          self.company = table['company']
          self.street_address1 = table["street_address"]
          self.street_address2 = table["street_address2"]
          self.city = table['city']
          self.state = table["state"]
          self.zip = table["zip"]
          self.phone = table['phone']
          self.save
        end

        def origin_zip=(zip)
          browser_helper.set origin_zip_field, zip, "origin_zip"
        end

        def origin_zip
          browser_helper.text origin_zip_field
        end

        def name=(name)
          browser_helper.set name_field, name, "name_field"
        end

        def company=(company)
          browser_helper.set company_field, company, "company_field"
        end

        def street_address1=(street)
          browser_helper.set street_address1_field, street, "street_address1_field"
        end

        def street_address2=(street)
          browser_helper.set street_address2_field, street, "street_address2_field"
        end

        def state_dd_button
          browser.div css: "div[id^=statecombobox-][id$=-trigger-picker]"
        end

        def city=(city)
          browser_helper.set city_text_field, city, "state_field"
        end

        def state_field
          browser.text_field name: 'State'
        end

        def state=(state)
          browser_helper.drop_down @browser, state_dd_button, :li, state_field, state
        end

        def zip=(code)
          browser_helper.set zip_field, code, "zip_field"
        end

        def phone=(number)
          browser_helper.set phone_field, number, "phone_field"
        end

        def save
          10.times{
            begin
              browser_helper.safe_click save_button
              sleep 1
              break unless save_button.present?
            rescue
              #ignore
            end
          }
        end

        def present?
          save_button.present?
        end

        #todo FIX ME!!
        private
        def origin_zip_field
          browser.text_field name: 'OriginZip'
        end

        def name_field
          text_fields = browser.text_fields name: 'FullName'
          text_fields.last
        end

        def company_field
          text_fields = browser.text_fields name: 'Company'
          text_fields.last
        end

        def street_address1_field
          browser.text_field name: 'Street1'
        end

        def street_address2_field
          browser.text_field name: 'Street2'
        end

        def city_text_field
          text_fields = browser.text_fields name: 'City'
          text_fields.last
        end

        def zip_field
          browser.text_field name: 'Zip'
        end

        def phone_field
          (browser.text_fields css: "input[name=Phone]").last
        end

        def save_button
          browser.span text: 'Save'
        end
      end

      class DeleteShippingAddress < Browser::Modal

        def window_title
          browser.div text: "Delete Shipping Address"
        end

        def delete
          5.times {
            begin
              logger.info "Delete Shipping Address :: #{message_field.text}"
              browser_helper.safe_click delete_button
            rescue
              #ignore
            end
            break unless present?
          }
        end

        def present?
          window_title.present?
        end

        def close
          field = browser.elements(css: 'img[class$=close]').last
          present = field.present?
          field.click if present
        end

        def message_field
          browser.div css: "div[class=x-autocontainer-innerCt][id^=dialoguemodal]"
        end

        def delete_button
          field = browser.elements(text: 'Delete').last
          present = field.present?
          field
        end
      end

      class ViewRestrictions < Browser::Modal
        def browser_ok_button
          BrowserElement.new browser.span text: "OK"
        end

        def present?
          browser_ok_button.present?
        end

        def ok
          browser_ok_button.safe_click
        end
      end

      class ManageShippingAddresses < Browser::Modal

        def window_title
          browser.div css: 'div[class*=x-window-header-title-default]>div'
        end

        def grid_cell(row, column)
          browser.td css: "div[id^=grid-][class*=x-panel-body-default]>div>div>table:nth-child(#{row.to_i})>tbody>tr>td:nth-child(#{column.to_i})"
        end

        def grid_cell_text(row, column)
          browser_helper.text grid_cell(row, column), "grid.row#{row}.column#{column})"
        end

        def close_button
          browser.image css: "img[class*='x-tool-close']"
        end

        def checked?(row)
          field = browser.table css: "div[id^=manageShipFromWindow][class^=x-window-body]>div>div[id$=body]>div[id^=gridview]>div[class=x-grid-item-container]>table[data-recordindex='#{row.to_i-1}']"
          value = browser_helper.attribute_value field, "class"
          checked = value.include? "selected"
          logger.info "Row #{row} selected? #{checked}"
          checked
        end

        def add_button
          browser.link css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(1)"
        end

        def edit_button
          browser.link css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(2)"
        end

        def delete_button
          browser.link css: "div[id^=manageShipFromWindow]>div[id^=toolbar]>div>div>a:nth-child(3)"
        end

        def name row
          sleep(1)
          grid_cell_text row, 1
        end

        def company row
          sleep(1)
          grid_cell_text row, 2
        end

        def city row
          sleep 1
          grid_cell_text row, 3
        end

        def state row
          sleep 1
          grid_cell_text row, 4
        end

        def locate_ship_from name, company, city
          rows = shipping_address_count
          1.upto rows do |row|
            browser_helper.safe_click window_title
            grid_name = name row
            grid_company = company row
            grid_city = city row
            grid_state = state row
            if (grid_name.casecmp(name)==0) && (grid_company.casecmp(company)==0) && (grid_city.casecmp(city)==0)
              logger.info "Match found! - Row #{row} :: Name=#{grid_name} :: Company=#{grid_company} :: City=#{grid_city} ::  State=#{grid_state} :: "
              return row
            else
              logger.info "No match - Row #{row} :: Name=#{grid_name} :: Company=#{grid_company} :: City=#{grid_city} ::  State=#{grid_state} :: "
            end
          end
          0
        end

        def present?
          add_button.present?
        end

        def click_delete_button
          begin
            browser_helper.safe_click delete_button if delete_button.present?
            browser_helper.safe_click window_title
          rescue
            #ignore
          end
        end

        def delete *args
          case args.length
            when 1
              address = args[0]
              if address.is_a? Hash
                delete_row(locate_ship_from(address['name'], address['company'], address['city']))
              else
                stop_test "Address format is not yet supported for this delete call."
              end

            else
              stop_test "Parameter Exception: Paramter not supported."
          end
        end

        def delete_row number
          @delete_shipping_address = DeleteShippingAddress.new param
          5.times {
            select_row number
            click_delete_button
            break if @delete_shipping_address.present?
          }
          @delete_shipping_address.delete
          @delete_shipping_address.close if @delete_shipping_address.present?
          self
        end

        def add *args
          @shipping_address_form = AddShippingAdress.new param
          add_shipping_address_window
          case args.length
            when 0
              @shipping_address_form
            when 1
              address = args[0]
              case address
                when Hash
                  @shipping_address_form.shipping_address = address
                else
                  stop_test "Illegal Ship-to argument"
              end
            else
              stop_test "add_address:  Illegal number of arguments #{args.length}"
          end
        end

        def add_shipping_address_window
          @shipping_address_form = AddShippingAdress.new param
          5.times {
            begin
              break if @shipping_address_form.present?
              browser_helper.safe_click add_button
              add_button.wait_until
            rescue
              #ignore
            end
          }
        end

        def edit_address(name, company, city, new_address_details)
          row_num = locate_ship_from(name, company, city)
          if row_num > 0
            select_row row_num
            self.edit new_address_details
          end
          #@test_status = locate_address(new_address_details[:name], new_address_details[:company], new_address_details[:city])
          close_window
          self
        end

        def address_located? * args #name, company, city
          case args.length
            when 1
              if args[0].is_a? Hash
                address_hash = args[0]
                name = address_hash['name']
                company = address_hash['company']
                city = address_hash['city']
              else
                stop_test "Wrong number of arguments for locate_address" unless args.length == 3
              end
            when 3
              name = args[0]
              company = args[1]
              city = args[2]
            else
              stop_test "Wrong number of arguments for locate_address" unless args.length == 3
          end
          locate_ship_from(name, company, city) > 0
        end

        def edit *args
          shipping_address = AddShippingAdress.new param
          edit_button.when_present.click
          case args.length
            when 0
              shipping_address
            when 1
              shipping_address.shipping_address = args[0]
            else
              stop_test "Illegal number of arguments."
          end
          self
        end

        def select_row(row_num)
          click_row_until_selected(row_num, "class", "x-grid-item-selected")
          browser_helper.safe_click window_title
        end

        def click_row_until_selected(row_num, attibute, attribute_value)
          cell = grid_cell(row_num, 1)
          5.times do
            begin
              browser_helper.safe_click cell
              break if checked? row_num
            rescue
              #ignore
            end
          end
        end

        def deleted?
          @deleted
        end

        def delete_all
          begin
            count = shipping_address_count
            if count > 1
              for row in 1..(count)
                browser_helper.safe_click window_title
                delete_row 1
                logger.info "Row #{row} :: Deleting row 1..."
                break if shipping_address_count == 1
              end
            end
          rescue
            #
          end
          @deleted = shipping_address_count == 1
          self
        end

        def close_window
          begin
            10.times{
              sleep 1
              break unless close_button.present?
              browser_helper.safe_click close_button
            }
          rescue
            #ignore
          end
        end

        def wait_until_present
          add_button.wait_until_present
        end

        def shipping_address_count
          wait_until_present
          rows = browser.trs(css: "div[id^=grid-][class*=x-panel-body-default]>div>div>table")
          logger.info "Manage Shipping Address:: row count = #{rows.length.to_i}"
          rows.length.to_i
        end

      end

      class ShipFromAddress < OrderForm

        def text_box
          BrowserTextBox.new browser.text_field name: "ShipFrom"
        end

        def drop_down
          BrowserElement.new browser.div css: "div[id^=shipfromdroplist][id$=trigger-picker]"
        end

        def select service
          @manage_shipping_adddress = ManageShippingAddresses.new param

          return @manage_shipping_adddress if @manage_shipping_adddress.present?

          ship_from_default_selection_field = (browser.lis css: "li[data-recordindex='0']").first
          ship_from_dropdown = drop_down
          ship_from_textbox = text_box

          if service.downcase == "default"
            ship_from_selection_field = ship_from_default_selection_field
          elsif service.downcase.include? "manage shipping"
            ship_from_selection_field = browser.li text: "Manage Shipping Addresses..."
          else
            ship_from_selection_field = browser.div text: "#{service}"
          end

          selection_label = BrowserElement.new ship_from_selection_field
          service_text = ""
          if service.downcase.include? "manage shipping"
            10.times{
              begin
                ship_from_dropdown.safe_click unless selection_label.present?
                selection_label.scroll_into_view
                selection_label.safe_click
                return @manage_shipping_adddress if @manage_shipping_adddress.present?
              rescue
                #ignore
              end
              blur_out
            }
          else
            ship_from_dropdown.safe_click unless selection_label.present?
            if selection_label.present?
              selection_label.scroll_into_view
              service_text = selection_label.text
            end
            10.times do
              ship_from_dropdown.safe_click unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              sleep 1
              text_box_text = ship_from_textbox.text
              return if text_box_text.include? service_text
            end
          end
          stop_test "Unable to select service #{service}"
        end
      end

      class TrackingDropDown < OrderForm
        def text_box
          BrowserTextBox.new browser.text_field(name: 'Tracking')
        end

        def drop_down
          BrowserElement.new browser.div css: "div[id^=trackingdroplist-][id$=-trigger-picker]"
        end

        def select selection
          box = text_box
          button = drop_down
          selection_label = BrowserElement.new browser.td text: selection
          5.times {
            begin
              button.safe_click unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              sleep 1
              blur_out
              break if box.text.include? selection
            rescue
              #ignore
            end
          }
          selection_label
        end

        def cost *args
          case args.length
            when 0
              cost_label = BrowserElement.new (browser.label css: "label[class*=selected_tracking_cost]")
              10.times do
                begin
                  cost = cost_label.text
                rescue
                  #ignore
                end
                break if cost.include? "$"
              end
              ParameterHelper.remove_dollar_sign(cost_label.text)

            when 1
              button = drop_down
              selection_label = browser.td text: args[0]
              5.times do
                begin
                  button.safe_click unless selection_label.present?
                  if selection_label.present?
                    selection_cost = selection_label.parent.tds[1].text
                    logger.info "#{selection_cost}"
                    return selection_cost
                  end
                rescue
                  #ignore
                end
              end
          end
        end

        def tooltip selection
          button = drop_down
          selection_label = browser.td text: selection
          5.times {
            begin
              button.safe_click unless selection_label.present?
              if selection_label.present?
                qtip = selection_label.parent.parent.parent.parent.attribute_value "data-qtip"
                logger.info "#{qtip}"
                return qtip
              end
            rescue
              #ignore
            end
          }
        end
      end

      class Service < OrderForm
        def text_box
          BrowserTextBox.new (browser.text_field name: "Service"), (browser.div css: "div[data-anchortarget^=servicedroplist-]"), "data-errorqtip"
        end

        def drop_down
          BrowserElement.new browser.div css: "div[id^=servicedroplist][id$=trigger-picker][class*=arrow-trigger-default]"
        end

        def select selection
          logger.info "Select Service #{selection}"
          box = text_box
          button = drop_down

          @details_services ||= data_for(:details_services, {})

          selection_field = browser.li(id: "#{@details_services[selection]}")
          selection_label = BrowserElement.new selection_field
          20.times do
            begin
              button.safe_click unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              blur_out
              selected_service = box.text
              logger.info "Selected Service #{selected_service} - #{(selected_service.include? selection)?"success": "service not selected"}"
              break if selected_service.include? selection
            rescue
              #ignore
            end
          end
          logger.info "#{selection} service selected."
          selection_label # selection_label.field.table.tbody.tr.tds[2].text
        end

        def cost *args
          case args.length
            when 0
              cost_label = BrowserElement.new (browser.label css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div:nth-child(5)>div>div>label[style*='60px']")
              10.times do
                begin
                  cost = cost_label.text
                rescue
                  #ignore
                end
                break if cost.include? "$"
              end
              ParameterHelper.remove_dollar_sign(cost_label.text)

            when 1
              button = drop_down
              cost_label = BrowserElement.new browser.td css: "tr[data-qtip*='#{args[0]}']>td:nth-child(3)"
              10.times {
                begin
                  button.safe_click unless cost_label.present?
                  if cost_label.present?
                    service_cost = ParameterHelper.remove_dollar_sign cost_label.text
                    logger.info "Service Cost for \"#{args[0]}\" is #{service_cost}"
                    button.safe_click if cost_label.present?
                    return service_cost
                  end
                rescue
                  #ignore
                end
              }
            else
              stop_test "Illegal number of arguments for Service Cost"

          end
          #click_form
        end

        def tooltip selection
          button = drop_down
          selection_label = BrowserElement.new browser.tr css: "tr[data-qtip*='#{selection}']"
          10.times {
            begin
              button.safe_click unless selection_label.present?
              sleep 1
              if selection_label.present?
                tooltip = selection_label.attribute_value "data-qtip"
                logger.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
                return tooltip if tooltip.include? "<strong>"
              end
            rescue
              #ignore
            end
          }
          blur_out
        end

        def disabled? service

          @details_services ||= data_for(:details_services, {})

          dd_btn = self.drop_down
          selection_field = browser.li(id: "#{@details_services[service]}")
          #selection_element = browser.tr css: "tr[data-qtip*='#{service}']"
          selection_label = BrowserElement.new selection_field

          10.times do |index|
            dd_btn.safe_click unless selection_label.present?
            sleep 1
            if selection_field.present?
              disabled_field = BrowserElement.new (selection_field.parent.parent.parent)
              begin
                if selection_label.present?
                  if disabled_field.present?
                    result = disabled_field.attribute_value("class").include? "disabled"
                    sleep 1
                    result = disabled_field.attribute_value("class").include? "disabled"
                    result = disabled_field.attribute_value("class").include? "disabled"
                    dd_btn.safe_click
                    return result
                  end
                end
              rescue
                #ignore
              end
            else
              sleep 1
              return true if index == 5 #try to look for service in Service selection drop-down 3 times before declaring it's disabled.
            end
          end

          blur_out
        end

        def enabled? service
          !(self.disabled? service)
        end

      end

      class Weight < Browser::Modal
        class Pounds < Browser::Modal
          def text_box
            BrowserTextBox.new (browser.text_field name: 'WeightLbs'), "data-errorqtip"
          end

          def set value
            text_field = text_box
            value = value.to_i
            max = value + text_field.text.to_i
            max.times do
              current_value = text_field.text.to_i
              break if value == current_value
              if value > current_value
                increment 1
              else
                decrement 1
              end
              break if value == current_value
            end
            sleep 1
            logger.info "Pounds set to #{text_field.text}"
          end

          def increment value
            button = BrowserElement.new (browser.divs css: "div[id^=weightview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=up]").first
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = BrowserElement.new (browser.divs css: "div[id^=weightview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=down]").first
            value.to_i.times do
              button.safe_click
            end
          end
        end

        class Ounces < Browser::Modal
          def text_box
            BrowserTextBox.new (browser.text_field name: 'WeightOz'), "data-errorqtip"
          end

          def set value
=begin
          text_field = text_box
          value = value.to_i
          max = value + text_field.text.to_i
          max.times do
            current_value = text_field.text.to_i
            break if value == current_value
            if value > current_value
              increment 1
            else
              decrement 1
            end
            break if value == current_value
          end
          sleep 1
=end
            self.text_box.set value
            logger.info "Ounces set to #{text_box.text}"
          end

          def increment value
            button = BrowserElement.new (browser.divs css: "div[id^=weightview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=up]").last
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = BrowserElement.new (browser.divs css: "div[id^=weightview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=down]").last
            value.to_i.times do
              button.safe_click
            end
          end
        end

        def lbs
          Pounds.new param
        end

        def oz
          Ounces.new param
        end
      end

      class Dimensions < Browser::Modal

        class Length < Browser::Modal
          def text_box
            BrowserTextBox.new browser.text_field name: 'Length'
          end

          def set value
            text_field = text_box
            value = value.to_i
            max = value + text_field.text.to_i
            max.times do
              current_value = text_field.text.to_i
              break if value == current_value
              if value > current_value
                increment 1
              else
                decrement 1
              end
              break if value == current_value
            end
            sleep 1
            logger.info "Length set to #{text_field.text}"
          end

          def increment value
            button = BrowserElement.new (browser.divs css: "div[id^=dimensionsview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=up]").first
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = BrowserElement.new (browser.divs css: "div[id^=dimensionsview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=down]").first
            value.to_i.times do
              button.safe_click
            end
          end
        end

        class Width < Browser::Modal
          def text_box
            BrowserTextBox.new browser.text_field name: 'Width'
          end

          def set value
            text_field = text_box
            value = value.to_i
            max = value + text_field.text.to_i
            max.times do
              current_value = text_field.text.to_i
              break if value == current_value
              if value > current_value
                increment 1
              else
                decrement 1
              end
              break if value == current_value
            end
            sleep 1
            logger.info "Width set to #{text_field.text}"
          end

          def increment value
            button = BrowserElement.new ((browser.divs css: "div[id^=dimensionsview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=up]")[1])
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = BrowserElement.new ((browser.divs css: "div[id^=dimensionsview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=down]")[1])
            value.to_i.times do
              button.safe_click
            end
          end
        end

        class Height < Browser::Modal
          def text_box
            BrowserTextBox.new browser.text_field name: 'Height'
          end

          def set value
            text_field = text_box
            value = value.to_i
            max = value + text_field.text.to_i
            max.times do
              current_value = text_field.text.to_i
              break if value == current_value
              if value > current_value
                increment 1
              else
                decrement 1
              end
              break if value == current_value
            end
            sleep 1
            logger.info "Height set to #{text_field.text}"
          end

          def increment value
            button = BrowserElement.new (browser.divs css: "div[id^=dimensionsview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=up]").last
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = BrowserElement.new (browser.divs css: "div[id^=dimensionsview-][id$=-targetEl]>div>div>div>div[id^=numberfield-][id$=-trigger-spinner]>div[class*=down]").last
            value.to_i.times do
              button.safe_click
            end
          end
        end

        def length
          Length.new param
        end

        def width
          Width.new param
        end

        def height
          Height.new param
        end
      end

      class InsureFor < Browser::Modal
        def checkbox
          #element = (browser.inputs(css: "input[id^=checkbox-][id$=-inputEl][class*=checkbox]").last)
          field = (browser.input(css: "div[id^=singleOrderDetailsForm-][id$=-innerCt]>div>div:nth-child(6)>div>div>div>div[id^=container]>div>div>div>div>input"))
          verify = field.parent.parent.parent
          BrowserCheckbox.new field, verify, "class", "checked"
        end

        def text_box
          BrowserTextBox.new browser.text_field name: "InsuredValue"
        end

        def set value
          checkbox.check
          text_box.set_until value
        end

        def increment value
          button = BrowserElement.new (browser.div css: "div[id^=insurancefield-][id$=-trigger-spinner]>div[class*=up]")
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = BrowserElement.new (browser.div css: "div[id^=insurancefield-][id$=-trigger-spinner]>div[class*=down]")
          value.to_i.times do
            button.safe_click
          end
        end

        def cost
          cost_label = BrowserElement.new (browser.label css: 'div[id^=singleOrderDetailsForm-][id$=-targetEl]>div:nth-child(6)>div>div>label')
          10.times do
            begin
              cost = cost_label.text
            rescue
              #ignore
            end
            break if cost.include? "$"
          end
          ParameterHelper.remove_dollar_sign(cost_label.text).to_f
        end
      end




      class DetailsItemGrid < Browser::Modal


        class DetailsStoreItem < Browser::Modal



        end

        def item_details_header
          BrowserElement.new (browser.div text: "Items Ordered")
        end

        def expand
          button = BrowserElement.new (browser.img css: "img[class*='x-tool-expand-bottom']")
          button.safe_click
        end

        def collapse_store_item
          button = BrowserElement.new (browser.imgs css: "img[class*='x-tool-collapse-top']")[1]
          button.safe_click
        end

        def collapse_item
          button = BrowserElement.new (browser.img css: "img[class*='x-tool-collapse-top']")
          button.safe_click
        end

        class DetailsItem < Browser::Modal

          class Qty < Browser::Modal
            def initialize param, number
              super param
              @index = number
            end

            def text_box
              BrowserTextBox.new ((browser.text_fields name: "Quantity")[@index-1]), "data-errorqtip"
            end

            def set value
              text_field = text_box
              value = value.to_i
              max = value + text_field.text.to_i
              max.times do
                current_value = text_field.text.to_i
                break if value == current_value
                if value > current_value
                  increment 1
                else
                  decrement 1
                end
                break if value == current_value
              end
              logger.info "Qty set to #{text_field.text}"
            end

            def increment value
              button = BrowserElement.new (browser.divs css: "div[id^=singleorderitem-][id$=-targetEl]>div>div>div>div>div[class*=up]")[@index-1]
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = BrowserElement.new (browser.divs css: "div[id^=singleorderitem-][id$=-targetEl]>div>div>div>div>div[class*=down]")[@index-1]
              value.to_i.times do
                button.safe_click
              end
            end
          end

          def initialize param, number
            super param
            @index = number
          end

          def present?
            ((browser.text_fields name: "SKU")[@index-1]).present?
          end

          def qty
            Qty.new param, @index
          end

          def id
            BrowserTextBox.new (browser.text_fields name: "SKU")[@index-1]
          end

          def description
            BrowserTextBox.new (browser.text_fields name: "Description")[@index-1]
          end

          def delete
            BrowserElement.new (browser.spans css: "span[class*=sdc-icon-remove]")[@index-1]
          end
        end

        def size
          (browser.divs css: "div[id^=singleorderitem-][id$=-targetEl]").size
        end

        def store_item
          DetailsStoreItem.new param
        end

        def item number
          add_button = BrowserElement.new (browser.span css: "span[class*=sdc-icon-add]")
          logger.info "Item Count: #{size}"

          20.times{
            break if size >= number
            sleep 1
            break if size >= number
            add_button.safe_click if number > size
            logger.info "Item Count: #{size}"
          }

          DetailsItem.new param, number
        end
      end

      class DetailsCollapsible < Browser::Modal
        def field
          browser.img(class: "x-tool-img x-tool-expand-left")
        end

        def present?
          field.present?
        end

        def open
          button = BrowserElement.new field
          5.times do
            button.safe_click
            break unless button.present?
          end
        end
      end

      class DetailsToolbar < Browser::Modal
        class ToolbarMenu < Browser::Modal
          def drop_down
            BrowserElement.new (browser.spans(css: "span[class*='sdc-icon-more']").first)
          end

          def collapse
            selection = BrowserElement.new browser.span(text: "Collapse Panel")
            dd = drop_down
            collapsed_details = DetailsCollapsible.new param
            10.times do
              dd.safe_click unless selection.present?
              selection.safe_click
              break if collapsed_details.present?
            end
          end

          def tooltip
            btn = drop_down
            tooltip_element = BrowserElement.new (browser.div id: 'ext-quicktips-tip-innerCt')
            btn.hover
            btn.hover
            15.times do
              btn.hover
              sleep 1
              if tooltip_element.present?
                logger.info tooltip_element.text
                return tooltip_element.text
              end
            end
          end
        end

        def menu
          ToolbarMenu.new param
        end

        def order_id
          order_id_label = BrowserElement.new browser.bs(css: "label>b").first
          5.times{
            begin
              order_id_str = order_id_label.text
              return order_id_str.split('#').last if order_id_str.include? '#'
            rescue
              #ignroe
            end
          }

          stop_test "Unable to obtain Order ID from Single Order Details Form"
        end
      end

      class DetailsFooter < Browser::Modal
        def label
          BrowserElement.new browser.strong(text: 'Total Ship Cost:')
        end

        def cost
          cost_label = BrowserElement.new (browser.labels css: "label[class*=total_cost]")[0]
          10.times do
            begin
              cost = cost_label.text
              logger.info "Cost is #{cost}"
            rescue
              #ignore
            end
            break unless cost.include? "$"
          end
          ParameterHelper.remove_dollar_sign cost_label.text
        end

        def multiple_order_cost
          cost_label = BrowserElement.new (browser.labels css: "label[class*=total_cost]")[1]
          10.times do
            begin
              cost = cost_label.text
              logger.info "Cost is #{cost}"
            rescue
              #ignore
            end
            break unless cost.include? "$"
          end
          ParameterHelper.remove_dollar_sign cost_label.text
        end
      end

      class DetailsForm < OrderForm
        #todo add more accessors
        attr_accessor :insure_for

        def initialize param
          super param
          @insure_for ||= InsureFor.new param
        end

        def present?
          (browser.div css: "div[id^=singleOrderDetailsForm][id$=body]").present?
        end

        def expand
          collapsed_details = DetailsCollapsible.new param
          5.times do
            if collapsed_details.present?
              collapsed_details.open
            end
            break if self.present?
          end
        end

        def toolbar
          DetailsToolbar.new param
        end

        def ship_from
          ShipFromAddress.new param
        end

        def ship_to
          ShipTo.new param
        end

        def weight
          Weight.new param
        end

        def service
          Service.new param
        end

        def tracking
          TrackingDropDown.new param
        end

        def dimensions
          Dimensions.new param
        end

        def total
          DetailsFooter.new param
        end

        def item_grid
          DetailsItemGrid.new param
        end

        def customs
          CustomsFields.new param
        end

        def reference_no
          BrowserTextBox.new (browser.input css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div:nth-child(9)>div>div>div>div>div>div>input")
        end

        def customs_form
          CustomsForm.new param
        end

        def item line_item
          DetailsItem.new param, line_item
        end

        # ------------------------check if below are valid

        def items_count
          begin
            count = (browser.text_fields css: "div[id^=singleorderitem][id$=innerCt]").size
            logger.info "Order Details Item Count: #{count}"
            count
          rescue
            0
          end
        end

        def add_item
          add_item = BrowserElement.new browser.span text: "Add Item"
          stop_test "Add Item button is not present in Order Details form!" unless add_item.present?
          count = items_count
          5.times do
            add_item.safe_click
            sleep 1
            return if items_count == count + 1
          end
        end

        def auto_suggest_name_array
          browser.divs css: 'div[class*=main-title]'
        end

        def auto_suggest_location_array
          browser.divs css: 'div[class*=sub-title]'
        end

        def wait_until_present
          (BrowserElement.new browser.label text: "Ship From:").wait_until_present
        end

        def pounds_max_value
          pounds_qtip_error.scan(/The maximum value for this field is ([^>]*)<\/li><\/ul>/).last.first
        end

        def pounds_qtip_error_displayed?(message) # "The maximum value for this field is 70"
          pounds_qtip_error.include?(message)
        end

        def pounds_qtip_error
          pounds_textbox.attribute_value('data-errorqtip')
        end

        def ounces_qtip_error
          ounces_textbox.attribute_value('data-errorqtip')
        end

        def ounces_max_value
          ounces_qtip_error.scan(/The maximum value for this field is ([^>]*)<\/li><\/ul>/).last.first
        end

        def validate_address_link
          browser.span text: 'Validate Address'
        end

      end
    end
  end
end