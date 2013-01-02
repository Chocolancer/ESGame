package flxpong 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Boundary extends FlxSprite
	{
		public function Boundary(x: Number, y: Number):void
		{
			super(x, y);
			makeGraphic(FlxG.width, 8);
			immovable = true;
		}
	}

}