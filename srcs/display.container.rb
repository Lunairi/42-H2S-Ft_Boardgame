#* ************************************************************************** */
#*                                                                            */
#*    display.container.rb   _             _              :::      ::::::::   */
#*    By: mlu               | |           | |           :+:      :+:    :+:   */
#*     ___  __ _  __ _ _ __ | | __ _ _ __ | |_        +:+ +:+         +:+     */
#*    / _ \/ _` |/ _` | '_ \| |/ _` | '_ \| __|     +/+  +:+       +/+        */
#*   |  __/ (_| | (_| | |_) | | (_| | | | | |_    +/+/+/+/+/+   +/+           */
#*    \___|\__, |\__, | .__/|_|\__,_|_| |_|\__|        /+/    /+/             */
#*          __/ | __/ | |                             ///   ////////.fr       */
#*         |___/ |___/|_|                                                     */
#* ************************************************************************** */

class Display
	attr_accessor :tiles
	attr_accessor :players

	include Test

	def initialize
		@tiles = []
		@players = []
		generateBoard
		@c = -1
	end

	def newPlayer(nameput, symput)
		@players << Player.new(nameput, symput)
	end

	def clear
		system "clear"
	end

	def cardEvent
		puts @players[@c].getName + " got a event card added to their hand"
	end

	def delay(length)
		i = 0;
		while (i < length)
			sleep 1;
			print ".";
			i += 1
		end
	end

	def performEvent(i)
		puts "EVENT HAS BEEN TRIGGERED"
		print @players[@c].getName
		x = @tiles[i].tileEvent
		if (x == 0)
			cardEvent
		end
		delay(3)
		clear
		@players[@c].move(x)
		refresh
		print @players[@c].getName
		@tiles[i].tileEvent
		clear
		refresh
	end

	def checkEvent
		i = 0; k = 0
		while i < @tiles.size and k == 0
			if @players[@c].getX == @tiles[i].getX and @players[@c].getY == @tiles[i].getY
				performEvent(i)
				k = 1
			end
			i += 1
		end
	end

	def movePlayer
		clear
		refresh
		puts @players[@c].getName + " rolls their dice"
		@players[@c].roll
		delay(3)
		clear
		refresh
		checkEvent
		gameLoop
	end

	def playCard
		puts "Coming soon"
		menu
	end

	def getSymbol(nameput)
		puts "Please provide one character (letter or number or symbol) for your board piece "
		print "> "
		symput = gets.chomp
		if (symput.length != 1)
			puts "You must provide only one character!"
			getSymbol(nameput)
		else
			@players << Player.new(nameput, symput)
			gameLoop
		end
	end

	def addPlayer
		puts "Please provide a name for the player you are adding: "
		print "> "
		nameput = gets.chomp
		getSymbol(nameput)
	end

	def listPlayer
		i = 0
		while (i < @players.size)
			puts "Player: " + @players[i].getName + " || Board Piece: " + @players[i].getSymbol
			i += 1
		end
		menu
	end

	def menu
		puts "It's currently " + @players[@c].getName + " turn to play",
			"(Please type the numeric value equal to what you want to do",
			"1. Roll Dice", 
			"2. Play Card",
			"3. Add Players",
			"4. List Players",
			"5. Exit"
		print "> "
		input = gets.chomp
		if input.to_s == "1"
			movePlayer
		elsif input.to_s == "2"
			playCard
		elsif input.to_s == "3"
			addPlayer
		elsif input.to_s == "4"
			listPlayer
		elsif input.to_s == "5"
			puts "Exiting boardgame"
			exit
		else
			menu
		end
	end

	def startGame
		addPlayer
		clear
		refresh
		gameLoop
	end

	def gameLoop
		@c += 1
		if @c >= @players.size
			@c = 0
		end
		menu
	end

	def refresh
		x = 0; y = 0; i = 0; k = 0; l = 0
		while x <= 20
			while y <= 20
				while i < @tiles.size and k == 0
					while l < @players.size and k == 0
						if k == 0 and @players[l].getX == x and @players[l].getY == y
							print " ".bg_gray + @players[l].getSymbol.underline.blue.bg_gray + " ".bg_gray
							k = 1
						end
						l += 1
					end
					l = 0
					if k == 0 and @tiles[i].getX == x and @tiles[i].getY == y
						print " ".bg_gray + @tiles[i].getShape.bold.blue.bg_gray + " ".bg_gray
						k = 1
					end
					i += 1
				end
				i = 0
				if k != 1 and (x == 0 or x == 20)
					print " o ".bold.green.bg_gray
				elsif k != 1 and (y == 0 or y == 20)
					print " o ".bold.green.bg_gray
				elsif k != 1
					print "   ".bg_blue
				end
				k = 0
				y += 1
			end
			y = 0
			x += 1
			puts ""
		end
	end

	def drawTop
		x = 0; y = 0
		while y <= 20
			i = 1 + rand(10)
			if i == 1
				@tiles << Forward.new(x, y)
			elsif i == 2
				@tiles << Backward.new(x, y)
			elsif i == 3 or i == 4 or i == 5 or i == 6
				@tiles << Event.new(x, y)
			end
			y += 1
		end
		# draws from 0,0 to 0,20
	end

	def drawLeft
		y = 0; x = 1
		while x < 20 do
			i = 1 + rand(10)
			if i == 1
				@tiles << Forward.new(x, y)
			elsif i == 2
				@tiles << Backward.new(x, y)
			elsif i == 3 or i == 4 or i == 5 or i == 6
				@tiles << Event.new(x, y)
			end
			x += 1
		end
		# draws from 1,0 to 19,0
	end

	def drawRight
		x = 1; y = 20
		while x < 20 do
			i = 1 + rand(10)
			if i == 1
				@tiles << Forward.new(x, y)
			elsif i == 2
				@tiles << Backward.new(x, y)
			elsif i == 3 or i == 4 or i == 5 or i == 6
				@tiles << Event.new(x, y)
			end
			x += 1
		end
		# draws from 1, 20 to 19, 20
	end

	def drawBottom
		x = 20; y = 0
		while y < 21 do
			i = 1 + rand(10)
			if i == 1
				@tiles << Forward.new(x, y)
			elsif i == 2
				@tiles << Backward.new(x, y)
			elsif i == 3 or i == 4 or i == 5 or i == 6
				@tiles << Event.new(x, y)
			end
			y += 1
		end
		# draws from 20,0 to 20,20
	end

	def generateBoard
		drawTop
		drawLeft
		drawRight
		drawBottom
	end
end
