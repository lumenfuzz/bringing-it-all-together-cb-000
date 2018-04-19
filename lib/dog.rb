class Dog
  attr_accessor :name, :breed, :id, :saved

  def initialize(name: nil, breed: nil, id: nil, saved: false)
    @name = name
    @breed = breed
    @id = nil
    @saved = false
  end

  def self.create(name: , breed:)
    dog = self.new(name: name, breed: breed)
    dog.save
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

  def self.find_by_id(id)
  # find the student in the database given a name
  # return a new instance of the Student class
  row = DB[:conn].execute("SELECT * FROM dogs WHERE id = (?)", id)[0]
  dog = self.new_from_db(row)
  return dog
end

  def save
    if @saved
      DB[:conn].execute("UPDATE dogs SET name = ? WHERE id = ?", @name, @id)
    else
      DB[:conn].execute("INSERT INTO dogs (name, breed) VALUES (?, ?)", @name, @breed)
      @id = DB[:conn].execute("SELECT id FROM dogs WHERE name = (?)", @name)[0][0]
      @saved = true
    end
    return self
  end

end
