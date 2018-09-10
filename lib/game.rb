# class Game

  Prompt = "INPUT> "

  Starting_classes = [
    {lvl:1,total_exp:1,lvl_exp:1,vit:5,pwr:1,mnd:5,agl:1},
    {lvl:1,total_exp:1,lvl_exp:1,vit:5,pwr:5,mnd:1,agl:5},
    {lvl:1,total_exp:1,lvl_exp:1,vit:2,pwr:4,mnd:1,agl:5},
    {lvl:1,total_exp:1,lvl_exp:1,vit:2,pwr:1,mnd:7,agl:2},
    {lvl:1,total_exp:1,lvl_exp:1,vit:1,pwr:1,mnd:1,agl:1}
  ]

  #TODO EXP GROWTH BASED ON LEVEL

  def initialize_character
    puts "You have been BORN. What is your NAME."
    print Prompt
    user_name = gets.chomp
    pronouns = check_pronouns.to_i
    starting_class = check_starting_class.to_i
    @user = Character.new(name:user_name, gender:pronouns)
    @player_stats = Stat.new(Starting_classes[starting_class-1])
    @user.stat = @player_stats
  end

  def check_pronouns
    puts "What are your character's PRONOUNS."
    puts "1. she/her/hers"
    puts "2. he/him/his"
    puts "3. they/them/theirs"
    print Prompt
    while input = gets.chomp.to_i
      case input
      when 1, 2, 3
        break
      else
        puts "Please input a valid number."
        print Prompt
      end
    end
    input
  end

  def check_starting_class
  puts <<-FOO
What is your character's BACKGROUND.
1. PALADIN - VIT: 5, PWR: 1, MND: 5, AGL: 1
2. WARRIOR - VIT: 5, PWR: 5, MND: 1, AGL: 1
3. THIEF - VIT: 2, PWR: 4, MND: 1, AGL: 5
4. MAGE - VIT: 2, PWR: 1, MND: 7, AGL: 2
5. SQUIRE - VIT: 1, PWR: 1, MND: 1, AGL: 1
  FOO
  print Prompt
  while input = gets.chomp.to_i
    case input
    when 1, 2, 3, 4, 5
      break
    else
      puts "Please input a valid number."
      print Prompt
    end
  end
  input
  end

  def print_character_sheet(character)
    puts <<-FOO
NAME: #{character.name}
LVL: #{character.stat.lvl} | HP: #{character.stat.max_hp} | MP: #{character.stat.max_mp}
------------------
VIT: #{character.stat.vit}
PWR: #{character.stat.pwr}
MND: #{character.stat.mnd}
AGL: #{character.stat.agl}
------------------
END: #{character.stat.end}
STM: #{character.stat.stm}
DEF: #{character.stat.def}
RES: #{character.stat.res}
PHY: #{character.stat.phy}
MGK: #{character.stat.mgk}
PTN: #{character.stat.ptn}
CHR: #{character.stat.chr}
SPD: #{character.stat.spd}
LCK: #{character.stat.lck}
FOO
  end

  def if_they_s
    if @user.gender != 3
      "s"
    end
  end

  def pronoun_test
    puts "#{@user.pronouns[0]} put#{if_they_s} on #{@user.pronouns[2]} gauntlet"
  end

# end
