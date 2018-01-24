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

	def intialize(nameput)
		@name = nameput
	end

	def getName
		return @name
	end

	def description
		DESC[@name]
	end

	DESC = {
		"Point Card" => "Gain one point using this card",
		"Steal Card" => "Steal one point from another player",
		"Precise Card" => "Pick how much to move between 1 and 6",
		"Swap Card" => "Swap points with another player"
	}

end
