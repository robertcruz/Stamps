module PartnerPortal
  class Common < SdcPage
    #Global header
    page_object(:global_header) { {xpath: '//a[@class="header ng-star-inserted"]'} }

    #stamps endicia logo
    page_objects(:sdc_endicia_logo_mobile, index: 0)  { {xpath: '//img[@alt="Stamps.com Endicia | Partner Portal logo"]'} }
    page_objects(:sdc_endicia_logo_browser, index: 1)  { {xpath: '//img[@alt="Stamps.com Endicia | Partner Portal logo"]'} }

    #Partner Portal logo
    page_object(:partner_portal_logo)  { {xpath:  '//h3[contains(text(), "Partner Portal")]'} }

    #Panel Dashboard
    page_object(:panel_dashboard) { {xpath: '//a[contains(text(), "Dashboard")]'} }

    #xs viewport
    #hamburger button
    page_object(:hamburger_button_xs)  { {class:  'hamburger hamburger-slider visible-xs'} }

    #x button
    page_object(:x_button)  { {class:  'hamburger hamburger-slider is-active visible-xs'} }

    #Left Panel
    page_object(:panel_collapsed_xs)  { {class:  'sidebar'} }
    page_object(:panel_expanded_xs)  { {class:  'sidebar sidebar_expanded-xs'} }

    #Normal viewport left panel
    page_object(:panel_hamburger) { {class: 'hamburger hamburger-slider hamburger-arrow hamburger-sidebar'} }
    page_object(:panel_arrow) { {class: 'hamburger hamburger-slider is-active hamburger-arrow hamburger-sidebar'} }

    page_object(:panel_collapsed_lg)  { {class:  'sidebar sidebar_collapsed'} }
    page_object(:panel_expanded_lg)  { {class:  'sidebar'} }

    #footer
    page_object(:footer)  { {class:  'footer'} }


    def user_table_query(user, column)
      user = PartnerPortal.db_connection.execute("select * from [dbo].[sdct_PartnerPortal_User] where EmailAddress = '#{user}'")
      user.each do |item|
        return item["#{column}"]
      end

    end

    def log_table_query(user_id, column )
      log = PartnerPortal.db_connection.execute(
          "select *
           from [dbo].[sdct_PartnerPortal_Log]
           where DateCreated = (
           Select MAX(DateCreated) from [dbo].[sdct_PartnerPortal_Log] where PartnerUserId = #{user_id})"
      )
      log.each do |item|
        return item["#{column}"]
      end
    end

    def contract_table_query(account_id, column)
      contract = PartnerPortal.db_connection.execute(
          "select *
           from [dbo].[sdct_PartnerPortal_Contract]
           where PartnerAccountId = #{account_id}")

      contract.each do |item|
        return item["#{column}"]
      end

     def chart_data(email, chart_title, month)
       "select  pp_user.PartnerUserId, pp_account.PartnerAccountId, pp_contract.ContractId,
        pp_user.EmailAddress,pp_account.AccountName, pp_contract.DisplayName as 'ContractName',
        pp_contract.DateLastUpdated as 'ContractLastUpdated', pp_chartdata.Month, pp_chartdata.Amount,
        pp_chartdata.Count, pp_chartdatatype.ChartDataType as 'ChartTitle'
        from [dbo].[sdct_PartnerPortal_User] as pp_user
        inner join [dbo].[sdct_PartnerPortal_Account] as pp_account on pp_user.PartnerAccountId = pp_account.PartnerAccountId
        inner join [dbo].[sdct_PartnerPortal_Contract] as pp_contract on pp_user.PartnerAccountId = pp_contract.PartnerAccountId
        inner join [dbo].[sdct_PartnerPortal_ChartData] as pp_chartdata on pp_contract.ContractId = pp_chartdata.ContractId
        inner join [sdct_PartnerPortal_ChartDataType]as pp_chartdatatype on pp_chartdata.ChartDataTypeId = pp_chartdatatype.ChartDataTypeId
        where pp_user.EmailAddress = '#{email}' and pp_chartdatatype.ChartDataType = '#{chart_title}' and (DatePart(yy, pp_chartdata.Month)) = #{month}"
     end
    end

  end
end
