package org.esgame.gotd.entity 
{
	import org.flixel.*;
	import org.esgame.gotd.assets.Assets;
	
	/**
	 * Player-controlled entity
	 * @author Matthew Fisher
	 */
	public class Player extends FlxSprite
	{
			public static const RUNSPEED:uint = 120; // the max speed that the player can run at
			
			public static const SPRITE_SIZE:FlxPoint = new FlxPoint(16, 18); // size in pixels
		
		/**
		 * Constructor
		 * @param	X	X location of the player
		 * @param	Y	Y location of the player
		 */
		public function Player(X:Number = 0, Y:Number = 0):void
		{
			super(X, Y);
			
			loadGraphic
			(
				Assets.RANGER_SPRITE, // image to use
				true, // animated
				false, // don't generate "flipped" images since they're already in the image
				SPRITE_SIZE.x, // width of each frame (in pixels)
				SPRITE_SIZE.y // height of each frame (in pixels)
			);

			maxVelocity = new FlxPoint(RUNSPEED, RUNSPEED);
			drag = new FlxPoint(RUNSPEED * 4, RUNSPEED * 4); // decelerate to a stop within 1/4 of a second
			
			createAnimations();
		}
		
		/**
		 * Update each timestep
		 */
		public override function update():void
		{
			updateControls();
			updateAnimations();
			super.update();
		}
		
		/**
		 * Create the animations for this entity
		 * NOTE: these will be different if your art is different
		 */
		protected function createAnimations():void
		{
			addAnimation("idle_up", [1]);
			addAnimation("idle_right", [5]);
			addAnimation("idle_down", [9]);
			addAnimation("idle_left", [13]);
			addAnimation("walk_up", [0, 1, 2], 12); // 12 = frames per second for this animation
			addAnimation("walk_right", [4, 5, 6], 12);
			addAnimation("walk_down", [8, 9, 10], 12);
			addAnimation("walk_left", [12, 13, 14], 12);
			addAnimation("attack_up", [16, 17, 18, 19], 12, false); // false = don't loop the animation
			addAnimation("attack_right", [20, 21, 22, 23], 12, false);
			addAnimation("attack_down", [24, 25, 26, 27], 12, false);
			addAnimation("attack_left", [28, 29, 30, 31], 12, false);
		}
		
		/**
		 * Check for user input to control this entity
		 */
		protected function updateControls():void
		{
			var movement:FlxPoint = new FlxPoint();
			
			// no acceleration or drag
			acceleration = new FlxPoint();
			
			// check keys
			// NOTE: this accounts for someone pressing multiple arrow keys at the same time (even in opposite directions)
			if (FlxG.keys.pressed("LEFT"))
				movement.x -= 1;
			if (FlxG.keys.pressed("RIGHT"))
				movement.x += 1;
			if (FlxG.keys.pressed("UP"))
				movement.y -= 1;
			if (FlxG.keys.pressed("DOWN"))
				movement.y += 1;
			// check final movement direction
			if (movement.x < 0)
				moveLeft();
			else if (movement.x > 0)
				moveRight();
			if (movement.y < 0)
				moveUp();
			else if (movement.y > 0)
				moveDown();
		}
		
		/**
		 * Based on current state, show the correct animation
		 * FFV: use state machine if it gets more complex than this
		 */
		protected function updateAnimations():void
		{
			// use abs() so that we can animate for the dominant motion
			// ex: if we're moving slightly up and largely right, animate right
			var absX:Number = Math.abs(velocity.x);
			var absY:Number = Math.abs(velocity.y);
			// determine facing
			if (velocity.y < 0 && absY >= absX)
				facing = UP;
			else if (velocity.y > 0 && absY >= absX)
				facing = DOWN;
			else if (velocity.x > 0 && absX >= absY)
				facing = RIGHT;
			else if (velocity.x < 0 && absX >= absY)
				facing = LEFT
			// up
			if (facing == UP) {
				if (velocity.y != 0 || velocity.x != 0)
					play("walk_up");
				else
					play("idle_up");
			}
			// down
			else if (facing == DOWN) {
				if (velocity.y != 0 || velocity.x != 0)
					play("walk_down");
				else
					play("idle_down");
			}
			// right
			else if (facing == RIGHT) {
				if (velocity.x != 0)
					play("walk_right");
				else
					play("idle_right");
			}
			// left
			else if (facing == LEFT) {
				if (velocity.x != 0)
					play("walk_left");
				else
					play("idle_left");
			}
		}
		
		/**
		 * Move player left
		 */
		public function moveLeft():void
		{
			facing = LEFT;
			acceleration.x = -RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
		}
		
		/**
		 * Move player right
		 */
		public function moveRight():void
		{
			facing = RIGHT;
			acceleration.x = RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
		}
		
		/**
		 * Move player up
		 */
		public function moveUp():void
		{
			facing = UP;
			acceleration.y = -RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
		}
		
		/**
		 * Move player down
		 */
		public function moveDown():void
		{
			facing = DOWN;
			acceleration.y = RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
		}
	}
}
