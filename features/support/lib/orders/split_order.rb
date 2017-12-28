module Stamps
  module Orders

      class SplitOrderModal < Browser::Base

        def window_title
          (cache[:window_title].nil?||!cache[:window_title].present?)?cache[:window_title]=StampsField.new(browser.div(css: "div[id^=splitorderwindow-][id$=innerCt]")):cache[:window_title]
        end

        def new_order_id
          (cache[:new_order_id].nil?||!cache[:new_order_id].present?)?cache[:new_order_id]=StampsTextbox.new(browser.text_field(css: "div[id^=splitorderwindow-][class*=dialogue-content]>div>div>div>div>div>div>div>div>div>div>div>input")):cache[:new_order_id]
        end

        def confirm
          (cache[:confirm].nil?||!cache[:confirm].present?)?cache[:confirm]=StampsField.new(browser.span(text: "Confirm")):cache[:confirm]
        end

        def id
          (cache[:id].nil?||!cache[:id].present?)?cache[:id]=StampsField.new(browser.div(css: "div[id^=splitorderwindow-][id$=targetEl]>div>div")):cache[:id]
        end

        def original_order_id
          /\d+/.match(id.text).to_s
        end

        def present?
          window_title.present?
        end

        def item(number)
          (cache[:item].nil?||!cache[:item].present?)?cache[:item]=SplitItemDetails.new(param, number):cache[:item]
        end

        def confirm_order_split
          confirm.click
          sleep 5
        end



        class SplitItemDetails < Browser::Base

          attr_reader :index
          def initialize(param, number)
            super(param)
            @index=number
          end

          def inc_btn
            browser.divs(css: "div[id^=singlesplitorderitem-][id$=-targetEl]>div>div>div>div>div[class*=up]")[@index]
          end

          def dec_btn
            browser.divs(css: "div[id^=singlesplitorderitem-][id$=-targetEl]>div>div>div>div>div[class*=down]")[@index]
          end

          def original_item_id #item id for order that is getting split
            StampsField.new(browser.divs(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>label")[@index*3 + 1]).text

          end

          def original_item_description
            StampsField.new(browser.divs(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>label")[@index*3]).text

          end

          def original_item_qty
            StampsField.new(browser.labels(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>label")[@index*3 + 2]).text
          end

          def new_item_qty
            StampsTextbox.new(browser.text_fields(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>div>input")[@index])
          end
        end


      end


  end
end
