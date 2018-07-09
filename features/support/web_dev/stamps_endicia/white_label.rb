module WhiteLabel
  class ProfilePage < SdcPage
    text_field(:email, tag: :text_field, required: true) { { id: 'email' } }
    text_field(:username, tag: :text_field, required: true) { { id: 'username' } }
    text_field(:password, tag: :text_field, required: true) { { id: 'password' } }
    text_field(:confirm_password, tag: :text_field, required: true) { { id: 'confirmPassword' } }
    selection(:survey) { { id: 'usageType' } }

  end

  class << self

    def profile_page
      ProfilePage.new
    end
    def common_page
      Common.new
    end

    def sdcw_website
      SDCWWebsite.new
    end

    def ew_website
      EWWebsite.new
    end

  end

end