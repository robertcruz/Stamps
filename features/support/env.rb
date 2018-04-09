$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('lib/features/orders', __FILE__)
$LOAD_PATH << File.expand_path('features/support/lib', __FILE__)

require_relative 'sdc_core/sdc_test'
SdcTest.require_default_gems

require_relative 'sdc_core/sdc_core'

# web dev
require_relative 'web_dev/partner_portals/stamps_endicia/sdc_endicia_pp'

# Old Framework
require_relative 'lib/core/stamps_element'
require_relative 'lib/core/user_credentials'
require_relative 'lib/apps/registration_app'
require_relative 'lib/apps/pam_app'
require_relative 'lib/pam/pam_page_header'
require_relative 'lib/apps/stores_app'
require_relative 'helpers/test_helpers'
require_relative 'lib/core/old_web_apps_core'
require_relative 'lib/apps/web_apps'
require_relative 'lib/common/stamps_dot_com'
require_relative 'lib/orders/orders_modals'
require_relative 'lib/orders/orders'
require_relative 'lib/mail/mail_sign_in'
require_relative 'lib/orders/store_management'
require_relative 'lib/mail/print_form_panel_elements'
require_relative 'lib/mail/print_form_panel'

World Stamps
