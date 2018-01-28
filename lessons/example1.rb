#* ************************************************************************** */
#*                                                                            */
#*    example1.rb            _             _              :::      ::::::::   */
#*    By: mlu               | |           | |           :+:      :+:    :+:   */
#*     ___  __ _  __ _ _ __ | | __ _ _ __ | |_        +:+ +:+         +:+     */
#*    / _ \/ _` |/ _` | '_ \| |/ _` | '_ \| __|     +/+  +:+       +/+        */
#*   |  __/ (_| | (_| | |_) | | (_| | | | | |_    +/+/+/+/+/+   +/+           */
#*    \___|\__, |\__, | .__/|_|\__,_|_| |_|\__|        /+/    /+/             */
#*          __/ | __/ | |                             ///   ////////.fr       */
#*         |___/ |___/|_|                                                     */
#* ************************************************************************** */

# Defining a class
class Parent

	def initialize(value)
		@health = 42
		@attack = value
	end

	def getHealth
		return @health
	end

	def getAttack
		return @attack
	end

	def takeDamage(attack)		# New method to take damage
		@health -= attack		# Attack will be the a diff class attack
	end
end


# Inheritance
class	Children < Parent

	def initialize(value)
		super(value)
	end

	def displayHealth
		puts "Health: " + @health.to_s
	end

	def displayAttack
		puts "Attack: " + @attack.to_s
	end
end


# Creating a container
class	Container
	attr_accessor :array		

	def initialize
		@array = []			
	end

	def add(i)
		add = Children.new(i)
		@array << add			
	end

	def attack(one, two)
		@array[one].takeDamage(@array[two].getAttack)
		puts "",
		"Children " + two.to_s + " attacked children " + one.to_s + " for " + @array[two].getAttack.to_s + " amounts of damage.",
				"Children " + one.to_s + " has only " + @array[one].getHealth.to_s + " health left"
	end

	def deleteArray(i)
		@array.delete(@array[i])
	end

end



# Showing container behavior
example = Container.new

i = 0
while i < 10 do
	example.add(i)
	puts "Adding children to container. Its value is " + example.array[i].getAttack.to_s
	i += 1
end

puts "Container contains " + example.array.size.to_s + " children", ""

# Deleting array from the list
example.deleteArray(2)
example.deleteArray(4)
example.deleteArray(6)

i = 0
while i < example.array.size do
	puts "Listing off contained stuff values to show deletion " + example.array[i].getAttack.to_s
	i += 1
end
puts "Container contains " + example.array.size.to_s + " children"






