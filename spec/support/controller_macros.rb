# frozen_string_literal: true

module ControllerMacros
  # dynamicaly define macroses for easy spec logining

  User::ROLES.each do |role|
    define_method(:"login_#{role}") do
      before(:each) do
        sign_in FactoryBot.create(:user, role)
      end
    end
  end

  def authorize_api(api_client)
    ac = api_client || FactoryBot.create(:api_client)

    @request.headers['HTTP_AUTHORIZATION'] = "Token token=#{ac.access_token}"
  end

  def api_response
    @api_response ||= JSON.parse(response.body)
  end
end
