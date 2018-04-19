class Dog
  attr_accessor :name, :breed, :id

  def initialize(name: nil, breed: nil, id: nil)
    @name = name
    @breed = breed
    @id = nil
  end

end
