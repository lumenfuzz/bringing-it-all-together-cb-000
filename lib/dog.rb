class Dog
  attr_accessor :name, :breed, :id, :saved

  def initialize(name: nil, breed: nil, id: nil, saved: false)
    @name = name
    @breed = breed
    @id = nil
    @saved = false
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

  def save
    if @saved
      DB[:conn].execute("UPDATE dogs SET name = ? WHERE id = ?", @name, @id)
    else
      DB[:conn].execute("INSERT INTO students (name, grade) VALUES (?, ?)", @name, @grade)
      @id = DB[:conn].execute("SELECT id FROM students WHERE name = (?)", @name)[0][0]
      @saved = true
    end
  end

end
