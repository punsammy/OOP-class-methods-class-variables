
class Zombie

  @@horde= [] #should start as an empty array and will eventually contain the collection of all zombies.
  @@plague_level = 10 #used to determine the rate at which new zombies are spawned. This value will increase over time.
  @@max_speed = 5 #indicates the maximum value for the speed attribute of any zombie. This value won't change.
  @@max_strength = 8 #indicates the maximum value for the strength attribute of any zombie. This value won't change.
  @@default_speed = 1 #This value won't change.
  @@default_strength = 3 #This value won't change.

  attr_reader :speed, :strength

  def initialize(speed, strength)
    if speed > @@max_speed
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

  def self.all
    @@horde
  end

  def self.spawn
    @@plague_level.times do # |num|
      speed = rand(@@max_speed + 1)
      strength = rand(@@max_strength + 1)
      # puts "Zom #{num}: Speed: #{speed}, Strength: #{strength}"
      zombie = Zombie.new(speed, strength)
    end
    return @@horde
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end

  def self.some_die_off
    rand(11).times do |num|
      @@horde.delete_at(num-1)
    end
    @@horde
  end

  def Zombie.new_day
    self.spawn
    self.some_die_off
    self.increase_plague_level
    return @@horde
  end

  def encounter
    puts "Outrun: #{self.outrun_zombie?}"
    puts "Survive Attack: #{self.survive_attack?}"
    # if self.outrun_zombie? == true && self.survive_attack? == true
    #   puts "You got away"
    # elsif self.outrun_zombie? == true && self.survive_attack? != true
    #   puts "You were killed by the zombie"
    # # elsif self.outrun_zombie? != true
    # #   @@horde << Zombie.new(rand(@@max_speed + 1), rand(@@max_strength + 1))
    # #   puts "You became a zombie"
    # else
    #   puts "You died!"
    # end

    if self.outrun_zombie?
      puts "You ran away"
    else
      if self.survive_attack?
        puts "You killed the zombie"
      else
        @@horde << Zombie.new(rand(@@max_speed + 1), rand(@@max_strength + 1))
        puts "You became a zombie"
      end
    end
  end

  def outrun_zombie?
    rand(@@max_speed + 1) > @speed
  end

  def survive_attack?
    rand(@@max_strength + 1) > @strength
  end

end
