#* ************************************************************************** */
#*                                                                            */
#*    main.rb                _             _              :::      ::::::::   */
#*    By: mlu               | |           | |           :+:      :+:    :+:   */
#*     ___  __ _  __ _ _ __ | | __ _ _ __ | |_        +:+ +:+         +:+     */
#*    / _ \/ _` |/ _` | '_ \| |/ _` | '_ \| __|     +/+  +:+       +/+        */
#*   |  __/ (_| | (_| | |_) | | (_| | | | | |_    +/+/+/+/+/+   +/+           */
#*    \___|\__, |\__, | .__/|_|\__,_|_| |_|\__|        /+/    /+/             */
#*          __/ | __/ | |                             ///   ////////.fr       */
#*         |___/ |___/|_|                                                     */
#* ************************************************************************** */

require_relative "display.container"
require_relative "tile.class"
require_relative "forwardtile.class"
require_relative "backwardtile.class"
require_relative "eventtile.class"
require_relative "string.util"
require_relative "player.class"
require_relative "card.class"
require_relative "pointcard.class"
require_relative "stealcard.class"
require_relative "swapcard.class"
require_relative "speedcard.class"

test = Display.new
test.startGame