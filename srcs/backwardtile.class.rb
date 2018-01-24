#* ************************************************************************** */
#*                                                                            */
#*    backwardtile.class.rb  _             _              :::      ::::::::   */
#*    By: mlu               | |           | |           :+:      :+:    :+:   */
#*     ___  __ _  __ _ _ __ | | __ _ _ __ | |_        +:+ +:+         +:+     */
#*    / _ \/ _` |/ _` | '_ \| |/ _` | '_ \| __|     +/+  +:+       +/+        */
#*   |  __/ (_| | (_| | |_) | | (_| | | | | |_    +/+/+/+/+/+   +/+           */
#*    \___|\__, |\__, | .__/|_|\__,_|_| |_|\__|        /+/    /+/             */
#*          __/ | __/ | |                             ///   ////////.fr       */
#*         |___/ |___/|_|                                                     */
#* ************************************************************************** */

class Backward < Tile

	def initialize(x, y)
		super(x, y)
		@shape = '<'
	end

	def getX
		return @x
	end

	def getY
		return @y
	end

	def tileEvent
		i = rand(-4..-1)
		print " stepped stepped on a backward tile, oh no! You moved backwards " + i.to_s + " spaces!"
		return i
	end

	def getShape
		return @shape
	end
end
