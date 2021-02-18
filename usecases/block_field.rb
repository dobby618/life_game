require_relative '../entities/field'

class BlockField < Field
  def initialize
    super(4, 4)

    @cells = [
      @factory.create('Dead'), @factory.create('Dead'),   @factory.create('Dead'),   @factory.create('Dead'),
      @factory.create('Dead'), @factory.create('Living'), @factory.create('Living'), @factory.create('Dead'),
      @factory.create('Dead'), @factory.create('Living'), @factory.create('Living'), @factory.create('Dead'),
      @factory.create('Dead'), @factory.create('Dead'),   @factory.create('Dead'),   @factory.create('Dead')
    ]
  end
end
