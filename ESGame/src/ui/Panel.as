package ui 
{
	import org.flixel.*;
	/**
	 * Panel to be used in various menus as a component.
	 * 
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Panel extends FlxGroup
	{
		public static var borderColor: uint = 0xff0a141f; //default value
		public static var panelColor: uint = 0xff336699; //default value
		
		private var outerPanel: FlxSprite;
		private var innerPanel: FlxSprite;
		
		public var height: uint;
		public var width: uint;
		
		public function Panel(x: int, y: int, width: int, height: int): void
		{
			super();
			
			outerPanel = new FlxSprite(x, y);
			innerPanel = new FlxSprite(x + 5, y + 5);
			outerPanel.makeGraphic(width, height, borderColor);
			innerPanel.makeGraphic(width - 10, height - 10, panelColor);
			
			this.height = outerPanel.height;
			this.width = outerPanel.width;
			
			add(outerPanel);
			add(innerPanel);
		}
	}
}