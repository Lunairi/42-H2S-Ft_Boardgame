#* ************************************************************************** */
#*                                                                            */
#*    example2.rb            _             _              :::      ::::::::   */
#*    By: mlu               | |           | |           :+:      :+:    :+:   */
#*     ___  __ _  __ _ _ __ | | __ _ _ __ | |_        +:+ +:+         +:+     */
#*    / _ \/ _` |/ _` | '_ \| |/ _` | '_ \| __|     +/+  +:+       +/+        */
#*   |  __/ (_| | (_| | |_) | | (_| | | | | |_    +/+/+/+/+/+   +/+           */
#*    \___|\__, |\__, | .__/|_|\__,_|_| |_|\__|        /+/    /+/             */
#*          __/ | __/ | |                             ///   ////////.fr       */
#*         |___/ |___/|_|                                                     */
#* ************************************************************************** */

# A regular string
puts "Hello world"

# Class method extension
class String

	def red		
		"\e[31m#{self}\e[0m" 
	end

	def bg_cyan	
		"\e[46m#{self}\e[0m" 
	end

end

output = "Hello World"

puts output.red
puts output.red.bg_cyan

# # Creating a module, something outside of a class 
# module Clear

# 	def clear
# 		system "clear"
# 	end

# 	def hello
# 		puts "Hello World!"
# 	end

# end

# # A test class
# class Example

# 	include Clear #without this you can't use the module Clear

# 	def clearScreen
# 		clear
# 	end

# 	def talk
# 		hello
# 	end

# end

# example = Example.new

# puts "", "Now using the module that is linked to my class"

# example.talk
# example.clear

# example.talk