require('pry')
require_relative('./models/bounty_hunter.rb')

bounty1 = BountyHunter.new({
  'name' => 'Chris',
  'species' => 'human',
  'bounty_value' => 5,
  'homeworld' => 'Scotland'
  })

bounty1.save()


binding.pry
nil
