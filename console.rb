require('pry')
require_relative('./models/bounty_hunter.rb')

BountyHunter.delete_all()

bounty1 = BountyHunter.new({
  'name' => 'Chris',
  'species' => 'human',
  'bounty_value' => 5,
  'homeworld' => 'Scotland'
  })

bounty1.save()
bounty1.bounty_value = 8
bounty1.update()
#
BountyHunter.find_by_name('Chris')
BountyHunter.find_by_id(22)

binding.pry
nil
