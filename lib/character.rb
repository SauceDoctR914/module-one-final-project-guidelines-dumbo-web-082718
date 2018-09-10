class Character < ActiveRecord::Base
  has_one :stat

  attr_reader :pronouns

  Pronouns = [
    ["she", "her", "her", "hers", "herself"],
    ["he", "him", "his", "his", "himself"],
    ["they", "them", "their", "theirs", "themselves"]
  ]

  def initialize(args)
    super
    @pronouns = Pronouns[self.gender-1]
  end

  def attack
      attack = self.crit_check? * (weapon_damage * ((100 + weapon_affinity_value) / 100))
  end

  def cure
    #same as attack but heals self
  end

  def take_damage(attack)
    if dodge_check?
      ##call Miss and return 0
    else
      damage_taken = attack * (100/(100 + damage_type_stat))
    end
  end

  def dodge_check? #checks if player dodges based on speed stat
    rand(1..100) < self.stat.spd
  end

  def crit_check? #checks if crit based on lck and log function, returns modifier
    crit_chance = Math.log10((0.1) * self.stat.lck)
    if self.stat.lck <= 10
      if rand(1..100) < 0.05
        return crit_multiplier
      else
        1.0
      end
    else
      if rand(1..100) < crit_chance * 100
        return crit_multiplier
      else
        1.0
      end
    end
  end

  def weapon_affinity_value
    ## checks weapon type
    ## outputs either PHY or MGK value
  end

  def crit_multiplier #defaults to 1.5 unless lck is over lvl 10
    if self.stat.lck <= 10
      1.5
    else
      1.5 + Math.log10((0.1) * self.stat.lck)
    end
  end

end
