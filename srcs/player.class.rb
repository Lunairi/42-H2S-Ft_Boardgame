#* ************************************************************************** */
#*                                                                            */
#*    player.class.rb        _             _              :::      ::::::::   */
#*    By: mlu               | |           | |           :+:      :+:    :+:   */
#*     ___  __ _  __ _ _ __ | | __ _ _ __ | |_        +:+ +:+         +:+     */
#*    / _ \/ _` |/ _` | '_ \| |/ _` | '_ \| __|     +/+  +:+       +/+        */
#*   |  __/ (_| | (_| | |_) | | (_| | | | | |_    +/+/+/+/+/+   +/+           */
#*    \___|\__, |\__, | .__/|_|\__,_|_| |_|\__|        /+/    /+/             */
#*          __/ | __/ | |                             ///   ////////.fr       */
#*         |___/ |___/|_|                                                     */
#* ************************************************************************** */

class Player

	def initialize(nameput, symput)
		@score = 0
		@cards = []
		@x = 0
		@y = 0
		@name = nameput
		@symbol = symput
	end

	def getName
		return @name
	end

	def getSymbol
		return @symbol
	end

	def getX
		return @x
	end

	def getY
		return @y
	end

	def move(i)
		if (@x == 0)
			@y += i
		elsif (@x == 20)
			@y -= i
		elsif (@y == 0)
			@x -= i
		else
			@x += i
		end
		if @y >= 21 and @x == 0 	# moving right across board
			e = @y - 20
			@y = 20
			@x += e
		end 
		if @y < 0 and @x == 0 	# moving right across board backwards
			e = 0 - @y
			@y = 0
			@x += e
		end 
		if @x >= 21 and @y == 20 	# moving down across board
			e = @x - 20
			@x = 20
			@y -= e
		end
		if @x < 0 and @y == 20 	# moving down across board backwards
			e = 0 - @x
			@x = 0
			@y -= e
		end
		if @y < 0 and @x == 20 	# movign left across board
			e = 0 - @y
			@y = 0
			@x -= e
		end
		if @y >= 21 and @x == 20 	# movign left across board backwards
			e = @y - 20
			@y = 20
			@x -= e
		end
		if @x < 0 and @y == 0 	# moving up across board
			e = 0 - @x
			@x = 0
			@y += e
		end
		if @x >= 21 and @y == 0 	# moving up across board backwards
			e = @x - 20
			@x = 20
			@y += e
		end
	end

	def roll
		i = 1 + rand(6)
		print @name + " rolled a " + i.to_s
		move(i)
	end
end
