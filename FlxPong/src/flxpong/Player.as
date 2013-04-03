package flxpong 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ChocobuckleEX
	 */
	public class Player extends FlxSprite
	{
		public var player: int;
		
		public function Player(x: int, y: int, player: int):void
		{
			super(x, y);
			this.player = player;
			makeGraphic(8, 32);
		}
		
		override public function update():void
		{
			velocity.x = 0;
			velocity.y = 0;
			
			//key press
			if (FlxG.keys.UP) {
				velocity.y -= 300;
				
			}
			else if (FlxG.keys.DOWN) {
				velocity.y += 300;
			}
			
			super.update();
		}
		
	}

}