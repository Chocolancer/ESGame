package flxpong 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ChocobuckleEX
	 */
	public class Ball extends FlxSprite
	{
		private var cx: int;
		private var cy: int;
		
		public function Ball(x: Number, y: Number):void
		{
			cx = x;
			cy = y;
			super(x, y);
			makeGraphic(5, 5);
			velocity.x = Math.random() * 300;
			velocity.y = 100;
			elasticity = 1;
		}
		
		override public function update():void
		{
			super.update();
			
			if (velocity.y == 0) {
				if (velocity.x < 0) {
					velocity.y = -100;
				}
				if (velocity.x > 0) {
					velocity.y = 100;
				}
			}
		}
		
		public function resetBall(turn:Number):void {
			x = cx;
			y = cy;
			if (turn == 1) {
				velocity.x = -(Math.random() * 300);
			}
			if (turn == 2) {
				velocity.x = Math.random() * 300;
			}
			velocity.y = 100;
		}
		
	}

}