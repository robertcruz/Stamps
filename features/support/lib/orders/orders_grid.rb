module Stamps
  module Orders
    module Grid
      class Column < Browser::Modal
        MONTH_ARRAY = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
        TIME_UNITS_ARRAY = ['minute','minutes','hour','hours','day','days']
        GRID_COLUMNS ||= {
            check_box: " ",
            store: "Store",
            ship_cost: "Ship Cost",
            age: "Age",
            order_id: "Order ID",
            order_date: "Order Date",
            recipient: "Recipient",
            company: "Company",
            address: "Address",
            city: "City",
            state: "State",
            zip: "Zip",
            country: "Country",
            phone: "Phone",
            email: "Email",
            qty: "Qty.",
            item_sku: "Item SKU",
            item_name: "Item Name",
            ship_from: "Ship From",
            service: "Service",
            requested_service: "Requested Service",
            weight: "Weight",
            insured_value: "Insured Value",
            tracking_service: "Tracking Service",
            reference_no: "Reference No.",
            cost_code: "Cost Code",
            order_status: "Order Status",
            date_printed: "Date Printed",
            ship_date: "Ship Date",
            tracking_no: "Tracking #",
            order_total: "Order Total",
            source: "Source"
        }

        def sort_order column, sort_order
          scroll column

          column_span = browser.span text: GRID_COLUMNS[column]
          column_field = ElementWrapper.new column_span
          sort_order = (sort_order==:sort_ascending)?"ASC":"DESC"

          10.times do
            column_field.scroll_into_view
            column_field.safe_click
            2.times do
              sleep 1
              return sort_order if column_span.parent.parent.parent.parent.parent.attribute_value("class").include? sort_order
            end
          end
          sort_order
        end

        def grid_text_by_id column, order_id
          scroll column
          row = row_number order_id
          scroll column
          logger.info "Retrieving #{GRID_COLUMNS[column]} for Order ID #{order_id}...."
          data = grid_text column, row
          logger.info "Column:  #{GRID_COLUMNS[column]}, Order ID #{order_id}, Row #{row}, Data #{data}"
          data
        end

        def row_count
          tables = browser.tables css: "div[id^=ordersGrid]>div>div>table"
          count = tables.size
          #logger.info "Total Number of Orders on Grid:  #{count}"
          count.to_i
        end

        def scroll column
          element_helper.scroll_into_view browser, column_name_field(column)
        end

        def column_name_field column
          browser.span text: GRID_COLUMNS[column]
        end

        def empty?
          size == 0
        end

        def size
          browser.tables(:css=>"div[id^=ordersGrid]>div>div>table").size
        end

        def parameter_helper
          ParameterHelper
        end

        def grid_text column, row
          scroll :order_total
          scroll column
          data = element_helper.text grid_field(column, row)
          logger.info "Column #{GRID_COLUMNS[column]} Row #{row}: #{data}"
          data
        end

        def grid_field column_number, row
          column = column_number(column_number).to_s
          row = row.to_s
          css = "div[id^=ordersGrid]>div>div>table:nth-child(#{row})>tbody>tr>td:nth-child(#{column})>div"
          browser.div(css: css)
        end

        def grid_field_column_name column_name, row
          grid_text column_number(column_name), row
        end

        def column_number column_name
          column_str = GRID_COLUMNS[column_name]
          columns = column_fields
          columns.each_with_index do |column_field, index|
            column_text = element_helper.text column_field
            if column_text == column_str
              logger.info "Grid:  #{column_str} is in column #{index+1}"
              return index+1
            end
          end
        end

        def column_fields
          @column_fields ||= browser.spans(css: "div[componentid^=gridcolumn]>div>div>div>div>span")
        end

        def row_number order_id
          scroll :order_id
          row = 0
          column_num = column_number(:order_id)
          css = "div[id^=ordersGrid]>div>div>table>tbody>tr>td:nth-child(#{column_num})>div"
          #logger.info "Order ID: #{order_id} CSS: #{css}"
          fields = browser.divs css: css
          fields.each_with_index { |div, index|
            row_text = element_helper.text div
            if row_text.include? order_id
              row = index + 1 #row offset
              logger.info "Order ID #{order_id} is in Row #{row}"
              break
            end
          }
          row
        end

        def row_div number
          number.should be_truthy
          div = browser.div css: "div[id^=ordersGrid]>div>div>table:nth-child("+ (number.to_s) +")>tbody>tr>td>div>div[class=x-grid-row-checker]"
          "Orders Grid Row number #{number} is not present".should eql "" unless div.present?
          div
        end
      end

      class OrderId < Column
        def exist? order_id
          row_number(order_id) > 0
        end

        def scroll_into_view
          scroll :order_id
        end

        def sort_ascending
          sort_order :order_id, :sort_ascending
        end

        def sort_descending
          sort_order :order_id, :sort_descending
        end

        def row_num order_id
          row_number order_id
        end

        def row row
          scroll_into_view
          8.times{
            break if size > 0
            sleep 1
          }

          if size == 0
            return ""
          end

          begin
            grid_text :order_id, row
          rescue
            return ""
          end
        end

      end

      class Store < Column
        def scroll_into_view
          scroll :store
        end

        def row row
          grid_text :store, row
        end

        def data order_id
          grid_text_by_id :store, order_id
        end

        def sort_ascending
          sort_order :store, :sort_ascending
        end

        def sort_descending
          sort_order :store, :sort_descending
        end
      end

      class Age < Column

        def scroll_into_view
          scroll :age
        end

        def sort_ascending
          sort_order :age, :sort_ascending
        end

        def sort_descending
          sort_order :age, :sort_descending
        end

        def row row
          grid_text :age, row
        end

        def data order_id
          grid_text_by_id :age, order_id
        end
      end

      class OrderDate < Column
        def scroll_into_view
          scroll :order_date
        end

        def sort_ascending
          sort_order :order_date, :sort_ascending
        end

        def sort_descending
          sort_order :order_date, :sort_descending
        end

        def row row
          grid_text :order_date, row
        end

        def data order_id
          grid_text_by_id :order_date, order_id
        end
      end

      class Recipient < Column
        def scroll_into_view
          scroll :recipient
        end

        def sort_ascending
          sort_order :recipient, :sort_ascending
        end

        def sort_descending
          sort_order :recipient, :sort_descending
        end

        def data order_id
          scroll_into_view
          sleep 1
          grid_text_by_id :recipient, order_id
        end

        def row row
          grid_text :recipient, row
        end

      end

      class Company < Column
        def scroll_into_view
          scroll :company
        end

        def sort_ascending
          sort_order :company, :sort_ascending
        end

        def sort_descending
          sort_order :company, :sort_descending
        end

        def row row
          grid_text :company, row
        end

        def data order_id
          grid_text_by_id :company, order_id
        end
      end

      class Address < Column
        def scroll_into_view
          scroll :address
        end

        def sort_ascending
          sort_order :address, :sort_ascending
        end

        def sort_descending
          sort_order :address, :sort_descending
        end

        def row row
          grid_text :address, row
        end

        def data order_id
          grid_text_by_id :address, order_id
        end
      end

      class City < Column
        def scroll_into_view
          scroll :city
        end

        def sort_ascending
          sort_order :city, :sort_ascending
        end

        def sort_descending
          sort_order :city, :sort_descending
        end

        def row row
          grid_text :city, row
        end

        def data order_id
          grid_text_by_id :city, order_id
        end
      end

      class State < Column
        def scroll_into_view
          scroll :state
        end

        def sort_ascending
          sort_order :state, :sort_ascending
        end

        def sort_descending
          sort_order :state, :sort_descending
        end

        def row row
          grid_text :state, row
        end

        def data order_id
          grid_text_by_id :state, order_id
        end
      end

      class Zip < Column
        def scroll_into_view
          scroll :zip
        end

        def sort_ascending
          sort_order :zip, :sort_ascending
        end

        def sort_descending
          sort_order :zip, :sort_descending
        end

        def row row
          grid_text :zip, row
        end

        def data order_id
          grid_text_by_id :zip, order_id
        end
      end

      class Phone < Column
        def scroll_into_view
          scroll :phone
        end

        def sort_ascending
          sort_order :phone, :sort_ascending
        end

        def sort_descending
          sort_order :phone, :sort_descending
        end

        def row row
          grid_text :phone, row
        end

        def data order_id
          grid_text_by_id :phone, order_id
        end
      end

      class Email < Column
        def scroll_into_view
          scroll :email
        end

        def sort_ascending
          sort_order :email, :sort_ascending
        end

        def sort_descending
          sort_order :email, :sort_descending
        end

        def row row
          grid_text :email, row
        end

        def data order_id
          grid_text_by_id :email, order_id
        end
      end

      class Qty < Column
        def scroll_into_view
          scroll :qty
        end

        def sort_ascending
          sort_order :qty, :sort_ascending
        end

        def sort_descending
          sort_order :qty, :sort_descending
        end

        def row row
          grid_text :qty, row
        end

        def data order_id
          grid_text_by_id :qty, order_id
        end
      end

      class ItemSKU < Column
        def scroll_into_view
          scroll :item_sku
        end

        def sort_ascending
          sort_order :item_sku, :sort_ascending
        end

        def sort_descending
          sort_order :item_sku, :sort_descending
        end

        def row row
          grid_text :item_sku, row
        end

        def data order_id
          grid_text_by_id :item_sku, order_id
        end
      end

      class ItemName < Column
        def scroll_into_view
          scroll :item_name
        end

        def sort_ascending
          sort_order :item_name, :sort_ascending
        end

        def sort_descending
          sort_order :item_name, :sort_descending
        end

        def row row
          grid_text :item_name, row
        end

        def data order_id
          grid_text_by_id :item_name, order_id
        end
      end

      class Weight < Column
        def scroll_into_view
          scroll :weight
        end

        def sort_ascending
          sort_order :weight, :sort_ascending
        end

        def sort_descending
          sort_order :weight, :sort_descending
        end

        def row row
          grid_text :weight, row
        end

        def data order_id
          grid_text_by_id :weight, order_id
        end

        def lbs order_id
          data(order_id).scan(/\d+ lbs./).first.scan(/\d/).first
        end

        def oz order_id
          data(order_id).scan(/\d+ oz./).first.scan(/\d/).first
        end
      end

      class InsuredValue < Column
        def scroll_into_view
          scroll :insured_value
        end

        def sort_ascending
          sort_order :insured_value, :sort_ascending
        end

        def sort_descending
          sort_order :insured_value, :sort_descending
        end

        def row row
          grid_text :insured_value, row
        end

        def data order_id
          ParameterHelper.remove_dollar_sign grid_text_by_id(:insured_value, order_id)
        end
      end

      class OrderStatus < Column
        def scroll_into_view
          scroll :order_status
        end

        def sort_ascending
          sort_order :order_status, :sort_ascending
        end

        def sort_descending
          sort_order :order_status, :sort_descending
        end

        def row row
          grid_text :order_status, row
        end

        def data order_id
          grid_text_by_id :order_status, order_id
        end
      end

      class ShipDate < Column
        def scroll_into_view
          scroll :ship_date
        end

        def sort_ascending
          sort_order :ship_date, :sort_ascending
        end

        def sort_descending
          sort_order :ship_date, :sort_descending
        end

        def row row
          grid_text :ship_date, row
        end

        def data order_id
          grid_text_by_id :ship_date, order_id
        end
      end

      class ShipFrom < Column
        def scroll_into_view
          scroll :ship_from
        end

        def row row
          grid_text :ship_from, row
        end

        def data order_id
          grid_text_by_id :ship_from, order_id
        end
      end

      class Country < Column
        def scroll_into_view
          scroll :country
        end

        def sort_ascending
          sort_order :country, :sort_ascending
        end

        def sort_descending
          sort_order :country, :sort_descending
        end

        def row row
          grid_text :country, row
        end

        def data order_id
          grid_text_by_id :country, order_id
        end
      end

      class ShipCost < Column
        def scroll_into_view
          scroll :ship_cost
        end

        def row row
          grid_text :ship_cost, row
        end

        def data order_id
          cost = grid_text_by_id :ship_cost, order_id
          (cost.include? "$")?ParameterHelper.remove_dollar_sign(cost):cost
        end

        def ship_cost_error order_id
          scroll_into_view
          row = row_number(order_id)
          logger.info "Order ID: #{order_id} = Row #{row}"

          ship_cost_field = grid_field :ship_cost, row

          begin
            div = ship_cost_field.div
            data_error = div.attribute_value "data-qtip"
          rescue
            data_error = ""
          end

          logger.info "#{order_id} data-qtip error:  #{(data_error.length==0)?"None":data_error}"
          data_error
        end

      end

      class Company < Column
        def scroll_into_view
          scroll :company
        end

        def row row
          grid_text :company, row
        end

        def data order_id
          grid_text_by_id :company, order_id
        end
      end

      class GridService < Column
        def scroll_into_view
          scroll :service
        end

        def sort_ascending
          sort_order :service, :sort_ascending
        end

        def sort_descending
          sort_order :service, :sort_descending
        end

        def row row
          grid_text :service, row
        end

        def data order_id
          grid_text_by_id :service, order_id
        end
      end

      class RequestedService < Column
        def scroll_into_view
          scroll :requested_service
        end

        def row row
          grid_text :requested_service, row
        end

        def data order_id
          grid_text_by_id :requested_service, order_id
        end
      end

      class ReferenceNo < Column
        def scroll_into_view
          scroll :reference_no
        end

        def row row
          grid_text :reference_no, row
        end

        def data order_id
          grid_text_by_id :reference_no, order_id
        end
      end

      class CostCode < Column
        def scroll_into_view
          scroll :cost_code
        end

        def row row
          grid_text :cost_code, row
        end

        def data order_id
          grid_text_by_id :cost_code, order_id
        end
      end

      class Tracking < Column
        def scroll_into_view
          scroll :tracking_no
        end

        def row row
          grid_text :tracking_no, row
        end

        def data order_id
          grid_text_by_id :tracking_no, order_id
        end
      end

      class DatePrinted < Column
        def scroll_into_view
          scroll :date_printed
        end

        def sort_ascending
          sort_order :date_printed, :sort_ascending
        end

        def sort_descending
          sort_order :date_printed, :sort_descending
        end

        def data_at_row row
          grid_field_column_name :date_printed, row
        end

        def data order_id
          grid_text_by_id :date_printed, order_id
        end
      end

      class GridCheckBox < Column
        private
        def checkbox_header
          scroll_into_view

          checkbox_field = (browser.spans css: "div[componentid^=gridcolumn]").first
          check_verify_field = browser.div css: "div[class*=x-column-header-checkbox]"
          attribute = "class"
          attrib_value_check = "checker-on"
          Stamps::Browser::CheckboxElement.new checkbox_field, check_verify_field, attribute, attrib_value_check
        end

        public

        def scroll_into_view
          field = ElementWrapper.new((browser.spans css: "div[componentid^=gridcolumn]").first)
          field.scroll_into_view
          field
        end

        def row row
          grid_text :check_box, row
        end

        def edit order_id
          check row_number order_id
        end

        def edit_order order_id
          edit order_id
        end

        def check_order order_id
          check row_number(order_id)
        end

        def uncheck_order order_id
          uncheck row_number(order_id)
        end

        def check number
          scroll_into_view
          if size > 0
            checkbox_field = row_div number
            verify_field = browser.table css: "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
            checkbox = CheckboxElement.new checkbox_field, verify_field, "class", "grid-item-selected"
            checkbox.check
            logger.info "Row #{number} #{(checkbox.checked?)?"checked":"unchecked"}."
          else
            logger.info "Grid is empty"
          end
        end

        def uncheck number
          scroll_into_view
          if size > 0
            checkbox_field = row_div number
            verify_field = browser.table css: "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
            checkbox = CheckboxElement.new checkbox_field, verify_field, "class", "grid-item-selected"
            checkbox.uncheck
            logger.info "Row #{number} #{(checkbox.checked?)?"checked":"unchecked"}."
          else
            logger.info "Grid is empty"
          end
        end

        def checked? number
          scroll_into_view
          checkbox_field = row_div number
          verify_field = browser.table css: "div[id^=ordersGrid]>div>div>table:nth-child(#{number})"
          checkbox = CheckboxElement.new checkbox_field, verify_field, "class", "grid-item-selected"
          checkbox.checked?
        end

        def order_checked? order_number
          scroll_into_view
          checked? row_number order_number
        end

        def check_all *args
          scroll_into_view
          if args.length==1
            if args[0].is_a? Hash
              rows = args[0]
              logger.info "Restoring #{} checked orders..."
            else
              stop_test "Invalid parameter exception.  This method expects a Hash of Web Elements."
            end

            rows.each do |hash_element|
              row_number = hash_element[0]
              checked = hash_element[1]
              if checked
                check row_number
                logger.info "Row #{row_number} #{checked? row_number}"
              end

            end
          else
            checkbox_header.check
          end
        end

        def uncheck_all
          scroll_into_view
          checkbox_header.uncheck
        end

        def checked_rows *args
          cache_count = 5
          if args.length == 1
            cache_count = args[0]
          end

          logger.info "Caching checked rows..."
          checked_rows = Hash.new
          grid_total = row_count
          if cache_count > 2 && cache_count < grid_total
            cache_item_count = cache_count
          elsif cache_count > grid_total
            cache_item_count = grid_total
          else
            cache_item_count = cache_count
          end
          logger.info "Number of rows to check:  #{cache_item_count}"
          1.upto(cache_item_count) { |row|
            checked = checked? row
            if checked
              checked_rows[row] = checked
            end
            logger.info "Row #{row} Checked? #{checked}.  Stored:  #{checked_rows[row]}"
          }
          logger.info "Checked rows cached."
          checked_rows
        end

      end

      class GridColumns < Column
        def is_next_to? left, right
          left_column_sym = GRID_COLUMNS.key left
          right_column_sym = GRID_COLUMNS.key right

          left_column_sym.should be_truthy
          right_column_sym.should be_truthy

          left_column_num = column_number left_column_sym
          right_column_num = column_number right_column_sym
          left_column_num + 1 == right_column_num
        end
      end

      class TrackingService < Column
        def scroll_into_view
          scroll :tracking_service
        end

        def sort_ascending
          sort_order :tracking_service, :sort_ascending
        end

        def sort_descending
          sort_order :tracking_service, :sort_descending
        end

        def row row
          grid_text :tracking_service, row
        end

        def data order_id
          grid_text_by_id :tracking_service, order_id
        end
      end

      class OrderTotal < Column
        def scroll_into_view
          scroll :order_total
        end

        def sort_ascending
          sort_order :order_total, :sort_ascending
        end

        def sort_descending
          sort_order :order_total, :sort_descending
        end

        def row row
          grid_text :order_total, row
        end

        def data order_id
          grid_text_by_id :order_total, order_id
        end
      end

      class GridSource < Column
        def scroll_into_view
          scroll :source
        end

        def sort_ascending
          sort_order :source, :sort_ascending
        end

        def sort_descending
          sort_order :source, :sort_descending
        end

        def row row
          grid_text :source, row
        end

        def data order_id
          grid_text_by_id :source, order_id
        end
      end

      # Orders Grid
      class OrdersGrid < Browser::Modal
        attr_reader :anchor_element, :column, :checkbox, :store, :order_id, :ship_cost, :order_date, :age, :recipient,
                    :company, :address, :city, :state, :zip, :country, :phone, :email, :qty, :item_sku, :item_name,
                    :service, :weight, :insured_value, :reference_no, :cost_code, :order_status, :date_printed, :tracking_service,
                    :ship_date, :tracking_no, :requested_service, :source

        def initialize param
          super param

          @anchor_element ||= ElementWrapper.new browser.div css: "div[id=appContent]>div>div>div[id^=ordersGrid]"

          @column ||= GridColumns.new param

          @checkbox ||= GridCheckBox.new param
          @store ||= Store.new param
          @order_id ||= OrderId.new param
          @ship_cost ||= ShipCost.new param
          @age ||= Age.new param
          @order_date ||= OrderDate.new param
          @recipient ||= Recipient.new param
          @company ||= Company.new param
          @country ||= Country.new param
          @address ||= Address.new param
          @city ||= City.new param
          @state ||= State.new param
          @zip ||= Zip.new param
          @phone ||= Phone.new param
          @email ||= Email.new param
          @qty ||= Qty.new param
          @item_sku ||= ItemSKU.new param
          @item_name ||= ItemName.new param
          @ship_from ||= ShipFrom.new param
          @service ||= GridService.new param
          @requested_service ||= RequestedService.new param
          @weight ||= Weight.new param
          @insured_value ||= InsuredValue.new param
          @tracking_service ||= TrackingService.new param
          @order_status ||= OrderStatus.new param
          @date_printed ||= DatePrinted.new param
          @ship_date ||= ShipDate.new param
          @tracking_no ||= Tracking.new param
          @order_total ||= OrderTotal.new param
          @source ||= GridSource.new param
          # todo-rob These two are no longer a column in orders grid
          @reference_no ||= ReferenceNo.new param
          @cost_code ||= CostCode.new param
          @toolbar ||= Orders::Toolbar::Toolbar.new param
        end

        def present?
          anchor_element.present?
        end

        def wait_until_present *args
          anchor_element.safely_wait_until_present *args
        end
      end
    end
  end
end