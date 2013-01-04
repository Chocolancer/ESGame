package ui 
{
	import org.flixel.*;
	/**
	 * Panel to be used in various menus as a component.
	 * 
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Panel extends FlxSprite
	{
		public function Panel(x: int, y: int, width: int, height: int, color: uint): void
		{
			super(x, y);
			
			makeGraphic(width, height, color);
			immovable = true;
		}
		
		override public function update(): void
		{
			super.update();
		}
	}
}