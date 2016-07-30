# frozen_string_literal: true

require 'test_helper'

require 'prolog/dry/types/integer_range'

describe 'Types::IntegerRange' do
  let(:attribute_class) do
    Class.new(Dry::Types::Value) do
      attribute :range, Types::IntegerRange
    end
  end
  let(:init_range) { 5..25 }
  let(:top_end) { 8 }

  describe 'can be initialised with' do
    it 'a Range' do
      expect { attribute_class.new range: init_range }.must_be_silent
    end

    it 'an integer' do
      expect { attribute_class.new range: 42 }.must_be_silent
    end
  end # describe 'can be initialised with'

  describe 'when initialised with' do
    it 'a Range, is equal to that Range' do
      obj = attribute_class.new range: init_range
      expect(obj.range).must_equal init_range
    end

    it 'an Integer, is a Range from 0 to that value' do
      obj = attribute_class.new range: top_end
      expect(obj.range).must_equal 0..top_end
    end
  end # describe 'when initialised with'
end
