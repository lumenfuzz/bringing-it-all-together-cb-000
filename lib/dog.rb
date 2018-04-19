class Dog
  attr_accessor :name, :breed, :id

  def initialize(name: nil, breed: nil, id: nil)
    @name = name
    @breed = breed
    @id = nil
  end

  def self.create_table
  sql = <<-SQL
  CREATE TABLE IF NOT EXISTS dogs (
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT
  )
  SQL

  DB[:conn].execute(sql)
end

def self.drop_table
  sql = "DROP TABLE IF EXISTS dogs"
  DB[:conn].execute(sql)
end

end
