# frozen_string_literal: true

require 'prolog/dry/types/version'

# must be included before `Types` module is defined
require_relative './types/range'

# `Types` as a top-level namespace module seems to be a `dry-types` convention.
module Types
  include Dry::Types.module
end

require_relative './types/error_array'
require_relative './types/integer_range'

# Why not use DateTime as was done before? Recently-updated community guidelines
# recommend against use of `DateTime` unless a need exists "to account for
# historical calendar reform".
# * See: https://github.com/bbatsov/ruby-style-guide#no-datetime
# * See: https://github.com/bbatsov/ruby-style-guide/pull/587
# * See: https://github.com/bbatsov/rubocop/issues/1952
require_relative './types/time_or_now'
require_relative './types/uuid'
