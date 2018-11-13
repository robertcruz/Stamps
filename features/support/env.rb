$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('lib/features/orders', __FILE__)
$LOAD_PATH << File.expand_path('features/support/lib', __FILE__)

#require 'appium_lib'
require 'data_magic'
require 'rake'
require 'logger'
require 'rspec'
require 'date'
require 'fileutils'
require 'rbconfig'
require 'rubygems'
require 'open3'
require 'measured'
require 'holidays'
require 'watir'
require 'watir_drops'
require 'socket'
require 'csv'
require 'em/pure_ruby'

require_relative 'sdc_core/sdc_patch'
require_relative 'sdc_core/sdc_core'
require_relative 'sdc_core/sdc_test'
require_relative 'sdc_core/db_connections'
require_relative 'sdc_apps/sdc_website'
require_relative 'sdc_apps/navigation/sdc_navigation'
require_relative 'sdc_apps/orders/sdc_orders'
require_relative 'sdc_apps/mail/sdc_mail'

# web dev
require_relative 'web_dev/stamps_endicia/partner_portal'
require_relative 'web_dev/stamps_endicia/white_label'
require_relative 'web_dev/shipworks/shipworks_webreg'
require_relative 'web_dev/stamps_endicia/stamps_website'

World SdcCore, SdcWebsite, SdcOrders, SdcMail, SdcNavigation, PartnerPortal
