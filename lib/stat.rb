class Stat < ActiveRecord::Base

  belongs_to :character
  attr_accessor :max_hp, :end, :def, :phy, :stm, :res, :mgk, :ptn, :max_mp, :spd, :chr, :lck

  def initialize(args)
    super
    self.update_stats
  end

  def update_stats
    # VIT STATS
    @max_hp = self.vit * 25
    @end = self.vit * 2
    @def = self.vit * 2
    # PWR STATS
    @phy = self.pwr * 2
    @stm = self.pwr * 2
    @res = self.pwr * 2
    # MND STATS
    @mgk = self.mnd * 2
    @ptn = self.mnd * 2
    @max_mp = self.mnd * 10
    # AGL STATS
    @spd = self.agl * 2
    @chr = self.agl * 2
    @lck = self.agl * 2
  end

    ##max_exp = 100^(self.lvl/2)

end
