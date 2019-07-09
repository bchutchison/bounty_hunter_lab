require ('pg')

class BountyHunter

  attr_accessor :id, :name, :species, :bounty_value, :homeworld

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value'].to_i
    @homeworld = options['homeworld']
  end

  def save
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
    sql = "INSERT INTO bounty_hunters (name, species, bounty_value, homeworld)
    VALUES ($1, $2, $3, $4)
    RETURNING id;"
    db.prepare('save', sql)
    values = [@name, @species, @bounty_value, @homeworld]
    bounties = db.exec_prepared('save', values)
    @id = bounties.first['id']
    db.close()
  end

  def update
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
    sql = "UPDATE bounty_hunters
    SET (name, species, bounty_value, homeworld) = ($1, $2, $3, $4)
    WHERE id = $5;"
    values = [@name, @species, @bounty_value, @homeworld, @id]
    db.prepare('update', sql)
    db.exec_prepared('update', values)
    db.close
  end

def self.delete_all
  db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
  sql = "DELETE FROM bounty_hunters;"
  db.prepare('delete_all', sql)
  db.exec_prepared('delete_all')
  db.close
end

def self.find_by_name(name)
  db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
  sql = "SELECT * FROM bounty_hunters
  WHERE name = $1;"
  values = [name]
  db.prepare('find', sql)
  bounty_hunters = db.exec_prepared('find', values)
  db.close
  return bounty_hunters.map { |bounty_hunter| BountyHunter.new(bounty_hunter)}
end

def self.find_by_id(id)
  db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
  sql = "SELECT * FROM bounty_hunters
  WHERE id = $1;"
  values = [id]
  db.prepare('find', sql)
  bounty_hunters = db.exec_prepared('find', values)
  db.close
  return bounty_hunters.map { |bounty_hunter| BountyHunter.new(bounty_hunter)}
end


end
