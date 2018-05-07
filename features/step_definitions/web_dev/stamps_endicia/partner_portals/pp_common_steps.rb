
Then /^[Pp]P: set window to small viewport$/ do
  if SdcEnv.browser
    SdcPage.browser.window.resize_to(320, 480)
  end
end

Then /^[Pp]P: set window to medium viewport$/ do
  if SdcEnv.browser
    SdcPage.browser.window.resize_to(992, 1080)
  end
end

Then /^[Pp]P: set window to large viewport$/ do
  if SdcEnv.browser
    SdcPage.browser.window.resize_to(1200, 1080)
  end
end

Then /^[Pp]P: scroll to top of the page$/ do
  SdcPage.browser.execute_script('document.documentElement.scrollTop = 0')
end

Then /^[Pp]P: scroll to middle of the page$/ do
  SdcPage.browser.execute_script('window.scrollTo(screen.width/2, screen.height/2)');
end

Then /^[Pp]P: scroll to buttom of the page$/ do
    SdcPage.browser.execute_script( 'window.scrollBy(0,document.body.scrollHeight)' )
end


Then /^[Pp]P: navigate back to previous page$/ do
  SdcPage.browser.back
end

Then /^[Pp]P: click on global header$/ do
  PartnerPortal.pp_common_page.global_header.click
end

Then /^[Pp]P: [Ee]xpect global  header exists$/ do
  PartnerPortal.pp_common_page.global_header.wait_until_present(timeout: 10)
  expect(PartnerPortal.pp_common_page.global_header).to be_present, "Global header DOES NOT exist"
end

Then /^[Pp]P: [Ee]xpect [Pp]artner [Pp]ortal logo exists$/ do
  expect(PartnerPortal.pp_common_page.partner_portal_logo).to be_present, "Partner Portal logo DOES NOT exist"
end

Then /^[Pp]P: [Ee]xpect Stamps Endicia Partner Portal Logo exists$/ do
    expect(PartnerPortal.pp_common_page.sdc_endicia_logo_browser). to be_present, "Stamps Endicia Partner Portal Logo header DOES NOT exist browser mode"
end

Then /^[Pp]P: [Ee]xpect Stamps Endicia Partner Portal Logo exists for mobile$/ do
    expect(PartnerPortal.pp_common_page.sdc_endicia_logo_mobile). to be_present, "Stamps Endicia Partner Portal Logo header DOES NOT exist mobile mode"
end

Then /^[Pp]P: [Ee]xpect [Hh]amburger button exists for mobile$/ do
  PartnerPortal.pp_common_page.hamburger_button_xs.wait_until_present(timeout: 10)
  expect(PartnerPortal.pp_common_page.hamburger_button_xs).to be_present, "Hamburger button DOES NOT exist mobile mode"
end

Then /^[Pp]P: [Ee]xpect [Hh]amburger button does not exists for browser$/ do
  expect(PartnerPortal.pp_common_page.panel_hamburger).not_to be_present, "Hamburger button IS PRESENT"
end

Then /^[Pp]P: [Ee]xpect [Hh]amburger button does not exists for mobile$/ do
  expect(PartnerPortal.pp_common_page.hamburger_button_xs).not_to be_present, "Hamburger button IS PRESENT"
end

Then /^[Pp]P: [Cc]lick on [Hh]amburger button$/ do
  PartnerPortal.pp_common_page.hamburger_button_xs.wait_until_present(timeout: 10)
  PartnerPortal.pp_common_page.hamburger_button_xs.click
end

Then /^[Pp]P: [Ee]xpect [Xx] button exists$/ do
  PartnerPortal.pp_common_page.x_button.wait_until_present(timeout: 10)
  expect(PartnerPortal.pp_common_page.x_button).to be_present, "X button DOES NOT exist on mobile mode"
end

Then /^[Pp]P: [Cc]lick on [Xx] button$/ do
    PartnerPortal.pp_common_page.x_button.wait_until_present(timeout: 10)
    PartnerPortal.pp_common_page.x_button.click
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard on left panel exists$/ do
  PartnerPortal.pp_common_page.panel_dashboard.wait_until_present(timeout: 10)
  expect(PartnerPortal.pp_common_page.panel_dashboard).to be_present, "Dashboard on panel DOES NOT exist mobile mode"
end

Then /^[Pp]P: [Ee]xpect left panel to expand for mobile$/ do
  PartnerPortal.pp_common_page.panel_expanded_xs.wait_until_present(timeout: 10)
  expect(PartnerPortal.pp_common_page.panel_expanded_xs).to be_present, "Expanded Panel DOES NOT exist mobile mode"
end

Then /^[Pp]P: [Ee]xpect left panel to collapse for mobile$/ do
  PartnerPortal.pp_common_page.panel_collapsed_xs.wait_until_present(timeout: 10)
  expect(PartnerPortal.pp_common_page.panel_collapsed_xs).to be_present, "Collapsed Panel DOES NOT exist mobile mode"
end
