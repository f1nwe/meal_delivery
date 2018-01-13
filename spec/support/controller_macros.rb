# frozen_string_literal: true

module ControllerMacros
  # dynamicaly define macroses for easy spec logining
  User::ROLES.each do |role|
    define_method(:"login_#{role}") do
      before(:each) do
        sign_in FactoryGirl.create(:user, role)
      end
    end
  end
end
