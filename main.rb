require './usecases/field_factory'
require './ui/char_view'

field = FieldFactory.instance.create(:block)
field.add_observer(CharView.instance)

loop do
  field.step_up
  sleep 2
end
