# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'valid_factories' do |factory|
  it "#{factory} is valid" do
    expect(build(factory)).to be_valid
  end

  FactoryBot.factory_by_name(factory).defined_traits.each do |trait|
    it "#{factory} with trait #{trait} is valid" do
      expect(build(factory, trait.name)).to be_valid
    end
  end
end
