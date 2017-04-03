#Zombie Apocalypse

class Zombie

@@horde [] #will contain collection of all zombies
@@plague_level = 10 #increase over time
@@max_speed = 5 #won't change
@@max_strength = 8 #won't change
@@default_speed = 1 #won't change
@@default_strength = 3 #won't change

  def self.all
    @@horde
  end

  def self.new_day
    self.some_die_off
    self.spawn
    self.increase_plague_level
    return @@horde
  end

  def self.some_die_off
    rand(11).times do |number|
      @@horde.delete_at(number-1)
    end
    return @@horde
  end

  def self.spawn
    rand(@@plague_level).times do
      zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde.push(zombie)
    end

  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end

  def initialize(speed, strength)
    if speed > @@maxx_speed
      @speed = @@default_speed
    else
      @speed = speed
    end
    if strength > @@max_strength
      @strength = @@default_strength
    else
      @strength = strength
    end
    @@horde << self
  end

  def encounter
    if self.outrun_zombie?
      puts "you got away!"
    elsif self.survive_attack?
      @@horde << Zombie.new()
      puts "You caught the plague. You're a zombie :("
    else
      puts "You're dead."
    end
  end

  def outrun_zombie?
    rand(@@max_speed + 1) > @speed
  end

  def survive_attack?
    rand(@@max_strength + 1) > @strength
  end

end
