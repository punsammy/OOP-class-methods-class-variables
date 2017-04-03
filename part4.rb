#Vampires
require 'pry'
class Vampire

  attr_accessor :in_coffin
  attr_reader :name

  @@coven = []

  def initialize(name, age)
    @age = age
    @name = name
    @in_coffin = true
    @drank_blood_today = false
  end

  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@coven << new_vampire
    return new_vampire
  end

  def drink_blood
    @drank_blood_today == true
    puts "yummy blood"
  end

  def self.sunrise
    @@coven.delete_if do |vampire|
      if vampire.in_coffin == false
        puts "#{vampire.name} has been removed"
        true
      end
    end
    @@coven.delete_if do |vampire|
      if vampire.in_coffin == false
        puts "#{vampire.name} has been removed"
        true
      end
    end
  end

  def self.sunset
    @@coven.each do |vampire|
      vampire.in_coffin = false
      @drank_blood_today = false
      puts "go out drink blood and return home!"
    end
  end

  def go_home
    @in_coffin = true
    puts "#{@name} returned to coffin"
  end
end


edward = Vampire.create('edward',20)
bella = Vampire.create('bella', 21)
Vampire.sunset
edward.drink_blood
edward.go_home
bella.drink_blood
Vampire.sunrise
