require ('pg')

class BountyHunter

  attr_accessor = :id, :name, :species, :bounty_value, :homeworld

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



end
