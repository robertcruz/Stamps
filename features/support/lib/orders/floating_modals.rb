module Stamps
  module Orders
    module Printing
      class TermsAndConditions < Browser::StampsModal
        def i_agree_button
          #(@i_agree_button.nil? || !@i_agree_button.present?)?@i_agree_button = StampsInput.new(browser.input())
        end

        def i_agree

        end

        def form_body

        end

        def close

        end
      end
    end
  end
end