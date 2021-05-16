require 'singleton'
require_relative 'beacon_field'

class FieldFactory
  include Singleton

  def create(name)
    eval "#{name.to_s.capitalize}Field.new"
  end
end
