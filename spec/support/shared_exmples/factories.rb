# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'valid_factories' do |factory|
  it "#{factory.to_s.camelize} has valid factories" do
    expect(build(factory)).to be_valid

    FactoryBot.factory_by_name(factory).defined_traits.each do |trait|
      expect(build(factory, trait.name)).to be_valid
    end
  end
end
