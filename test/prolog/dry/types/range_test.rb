# frozen_string_literal: true

require 'test_helper'

require 'prolog/dry/types/range'

# Cnntainer namespace for use with Dry::Types.
module Types
  include Dry::Types.module
end

describe 'Types::Range' do
  let(:attribute_class) do
    Class.new(Dry::Types::Value) do
      attribute :range, Types::Range
    end
  end
  let(:source_range) { 0..20 }
  let(:strict_attribute_class) do
    Class.new(Dry::Types::Value) do
      attribute :range, Types::Strict::Range
    end
  end

  describe 'supports initialisation with a Range in' do
    after do
      obj = @klass.new range: source_range
      expect(obj.range).must_equal source_range
    end

    it 'non-Strict mode' do
      @klass = attribute_class
    end

    it 'Strict mode' do
      @klass = strict_attribute_class
    end
  end # describe 'supports initialisation with a Range in'
end # describe 'Types::Range'
