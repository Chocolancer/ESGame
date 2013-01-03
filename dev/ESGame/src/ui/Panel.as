package ui 
{
	import org.flixel.*;
	/**
	 * Panel with a border and an inner panel to be used in various menus as a component.
	 * 
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Panel extends FlxSprite
	{
		public static var borderColor: uint = 0xff0a141f; //default value
		public static var panelColor: uint = 0xff336699; //default value
		
		public function Panel(x: int, y: int, width: int, height: int): void
		{
			super(x, y);
			
			makeGraphic(width, height, borderColor);
			makeGraphic(width - 5, height - 5, panelColor);
			immovable = true;
		}
		
		override public function update(): void
		{
			super.update();
		}
	}
}