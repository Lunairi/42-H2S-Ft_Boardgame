#* ************************************************************************** */
#*                                                                            */
#*    card.class.rb          _             _              :::      ::::::::   */
#*    By: mlu               | |           | |           :+:      :+:    :+:   */
#*     ___  __ _  __ _ _ __ | | __ _ _ __ | |_        +:+ +:+         +:+     */
#*    / _ \/ _` |/ _` | '_ \| |/ _` | '_ \| __|     +/+  +:+       +/+        */
#*   |  __/ (_| | (_| | |_) | | (_| | | | | |_    +/+/+/+/+/+   +/+           */
#*    \___|\__, |\__, | .__/|_|\__,_|_| |_|\__|        /+/    /+/             */
#*          __/ | __/ | |                             ///   ////////.fr       */
#*         |___/ |___/|_|                                                     */
#* ************************************************************************** */

class Card

	def initialize(nameput)
		@name = nameput
	end

	def getName
		return @name
	end

	def description
		if @name == "Point Card"
			puts ") " + @name + ": Gain one point using this card"
		elsif @name == "Steal Card"
			puts ") " + @name + ": Steal one point from another player"
		elsif @name == "Speed Card"
			puts ") " + @name + ": You get one point and immediately get to roll twice"
		else
			puts ") " + @name + ": Swap points with another player"
		end
	end


end
