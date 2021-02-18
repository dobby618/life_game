require 'singleton'
require_relative 'block_field'

class FieldFactory
  include Singleton

  def create(field_name)
    eval "#{field_name.to_s.capitalize}Field.new"
  end
end
