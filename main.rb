require_relative 'usecases/field_factory'
require_relative 'ui/char_view'

field = FieldFactory.instance.create(:beacon)
field.add_observer(CharView.instance)

field.changed
field.notify_observers(field)
loop do
  field.step_up
  sleep 1
end
