class Pokemon

  attr_accessor :type, :name, :id, :db

  def initialize(props=[])
    @name = props["name"]
    @type = props["type"]
    @id = props["id"]
    @db = props["db"]

  end

  def self.save(name, type, db)
      sql_string = <<-SQL_STRING
        INSERT INTO pokemon(name, type) VALUES (?, ?)
      SQL_STRING
      db.execute(sql_string, name, type)
  end

  def self.find(id, db)
      sql_string = <<-SQL_STRING
        SELECT * FROM pokemon WHERE id= ?
      SQL_STRING
      pokemon_array = db.execute(sql_string, id)
      pika = Pokemon.new(name: pokemon_array[0][1], type: pokemon_array[0][2], id: pokemon_array[0][0], db: db)
binding.pry
      # Pokemon.new(pokemon_hash)
      # Pokemon.new(pokem)
  end

end
