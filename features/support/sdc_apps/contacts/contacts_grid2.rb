module SdcContacts
  module Grid
    class GridBase < SdcPage
      @@column_number = {}

      def self.set(property, value)
        @@column_number[property] = value
      end

      def self.get(property)
        @@column_number[property]
      end

      def self.column_names
        @@column_names ||= {
            checkbox: ' ',
            name: 'Name',
            prefix: 'Prefix',
            first_name: 'First Name',
            middle: 'Middle',
            last_name: 'Last Name',
            suffix: 'Suffix',
            company: 'Company',
            title: 'Title',
            department: 'Department',
            country: 'Country',
            email: 'Email',
            phone: 'Phone',
            phone_ext: 'Ext.',
            city: 'City',
            state_prv: 'State/Prv',
            street_address: 'Street Address',
            postal_code: 'Postal Code',
            cost_code: 'Cost Code',
            reference_no: 'Reference #',
            groups: 'Groups'
        }
      end

      def grid_container
        '//div[@class="x-grid-item-container"]'
      end

      def column_xpath(column)
        column = column_names[column] if column.class.eql?(Symbol)
        "//span[text()='#{column}']"
      end

      def header_element(column)
        if column.eql? :checkbox
          xpath = '//div[contains(@class, "x-column-header-checkbox")]'
          page_object(:header_element_checkbox) { { xpath: xpath } }
        else
          xpath = column_xpath(column)
          page_object("header_element_#{column}") { { xpath: xpath } }
        end
      end

      def scroll_to(column)
        field = header_element(column)
        field.scroll_into_view
        field
      end

      def text_for_id(column, tracking_number)
        row = row_num(tracking_number)
        text_at(column, row)
      end

      def columns
        page_objects(:columns) { { xpath: '//span[@class="x-column-header-text-inner"]' } }
      end

      def row_count
        xpath = "#{grid_container}//table"
        grid_row_ct = page_object(:grid_row_ct) { { xpath: xpath } }
        begin
          ct = grid_row_ct.size.to_i
          return ct if ct > 0
        rescue
          # ignore
        end
        0
      end

      def empty?
        size.zero?
      end

      def text_at(column, row)
        scroll_to(column)
        element = element_at_row(column, row)
        element.text_value
      end

      def element_at_row(column, row)
        column_num = column_number(column).to_s
        xpath = "#{grid_container}//table[#{row.to_s}]//tbody//td[#{column_num}]//div"
        coordinate = "col#{column}xrow#{row}"
        element = page_object(coordinate.to_sym) { { xpath: xpath } }
        element.scroll_into_view
        element
      end

      def element_for_id(column, tracking_number)
        row = row_num(tracking_number)
        element_at_row(column, row)
      end

      def grid_field_column_name(column, row)
        col = column_number(column)
        text_at(col, row)
      end

      def column_number(name)
        col_num = get(name)
        return col_num if col_num

        columns.each_with_index do |field, index|
          element = ::SdcElement.new(field)
          element.scroll_into_view
          text = element.text_value
          key = if index.zero?
                  :checkbox
                else
                  column_names.key(text)
                end
          set(key, index + 1)
          return get(name) if key.eql?(name)
        end

        error_message = "Cannot find column number for #{name}"
        raise ArgumentError, error_message
      end

      def row_num(tracking_number)
        scroll_to(:tracking_number)
        col_num = column_number(:tracking_number)
        xpath = "#{grid_container}//tbody//td[#{col_num}]//div"
        divs = page_objects(:row_number_divs) { { xpath: xpath } }
        divs.each_with_index do |field, index|
          element = SdcElement.new(field)
          element.scroll_into_view
          return index + 1 if element.text.include?(tracking_number)
        end

        raise ArgumentError, "Cannot locate Order ID #{tracking_number}"
      end

      def get(property)
        self.class.get(property)
      end

      def set(property, value)
        self.class.set(property, value)
      end

      def column_names
        self.class.column_names
      end
    end

    class GridCheckBox < GridBase
      sdc_param(:chooser_xpath) { '//*[@id="sdc-mainpanel-calculatepostageradio-displayEl"]' }
      page_object(:chooser) { { xpath: '//div[contains(@class, "x-column-header-checkbox")]//span' } }
      page_object(:verify) { { xpath: '//div[contains(@class, "x-column-header-checkbox")]' } }
      chooser(:checkbox_header, :chooser, :verify, :class, 'checker-on')

      def scroll_into_view
        scroll_to(:checkbox)
      end

      def checkbox_row(row)
        scroll_into_view
        chooser_xpath = "//table[#{row}]//div[@class='x-grid-row-checker']"
        chooser_name = "grid_chooser_#{row}"
        page_object(chooser_name) { { xpath: chooser_xpath } }
        verify_xpath = "#{grid_container}//table[#{row}]"
        verify_name = "grid_verify_#{row}"
        page_object(verify_name) { { xpath: verify_xpath } }
        grid_checkbox_name = "grid_checkbox_#{row}"
        SdcPage.chooser(grid_checkbox_name, chooser_name, verify_name, :class, 'selected')
        instance_eval(grid_checkbox_name)
      end
    end

    class GridColumn < GridBase
      def initialize(column)
        @column = column
      end

      def header_text
        element = scroll_into_view
        element.text_value
      end

      def present?
        element = scroll_into_view
        element.present?
      end

      def scroll_into_view
        scroll_to(@column)
      end

      def text_at_row(row)
        text_at(@column, row)
      end

      def data(tracking_number)
        text_for_id(@column, tracking_number)
      end

      def element(row)
        element_at_row(@column, row)
      end

      def element_for_id(tracking_number)
        super(@column, tracking_number)
      end

      # def sort_ascending
      #   sort_order(@column, :sort_ascending)
      # end
      #
      # def sort_descending
      #   sort_order(@column, :sort_descending)
      # end
    end

    class << self
      def body
        xpath = '//div[@id="contactsGrid"]'
        klass = Class.new(SdcPage) do
          page_object(:body) { { xpath: xpath } }
        end
        klass.new.body
      end

      def columns
        xpath = '//span[@class="x-column-header-text-inner"]'
        klass = Class.new(SdcPage) do
          page_objects(:columns) { { xpath: xpath } }
        end
        klass.new.columns
      end

      def grid_column(column)
        body.wait_until_present(timeout: 15)

        unless GridBase.column_names.key? column
          raise ArgumentError, "Invalid grid column: #{column}"
        end

        case column
        when :checkbox
          GridCheckBox.new

        else
          GridColumn.new(column)
        end
      end
    end

  end
end