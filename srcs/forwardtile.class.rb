#* ************************************************************************** */
#*                                                                            */
#*    forwardtile.class.rb   _             _              :::      ::::::::   */
#*    By: mlu               | |           | |           :+:      :+:    :+:   */
#*     ___  __ _  __ _ _ __ | | __ _ _ __ | |_        +:+ +:+         +:+     */
#*    / _ \/ _` |/ _` | '_ \| |/ _` | '_ \| __|     +/+  +:+       +/+        */
#*   |  __/ (_| | (_| | |_) | | (_| | | | | |_    +/+/+/+/+/+   +/+           */
#*    \___|\__, |\__, | .__/|_|\__,_|_| |_|\__|        /+/    /+/             */
#*          __/ | __/ | |                             ///   ////////.fr       */
#*         |___/ |___/|_|                                                     */
#* ************************************************************************** */

class Forward < Tile

	def initialize(x, y)
		super(x, y)
		@shape = '>'
	end

	def getX
		return @x
	end

	def getY
		return @y
	end

	def tileEvent
		i = rand(1..4)
		print " stepped on a special forward tile! You moved forward " + i.to_s + " spaces!"
		return i
	end

	def getShape
		return @shape
	end
end
