require 'singleton'
require_relative 'block_field'

class FieldFactory
  include Singleton

  def create(field_name)
    case field_name.to_sym
    in :block
      BlockField.new
    end
  end
end
