package ui 
{
	import org.flixel.*;
	
	/**
	 * All-purpose text box with configurable colours
	 * Can currently only proceed and delete using Z key.
	 * 
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class TextBox extends FlxSprite
	{
		public var text: FlxText;
		public var caption: FlxText;
		private var prompt: FlxText;
		
		public static var borderColor: uint = 0x0A141F; //default value
		public static var panelColor: uint = 0x336699; //default value
		
		public function TextBox(x: int, y: int, width: int, height: int, captionStr: String, textStr: String): void
		{
			super(x, y);
			
			makeGraphic(width, height, borderColor);
			makeGraphic(width - 5, height - 5, panelColor);
			
			caption = new FlxText((width / 2) - captionStr.length, height / 3, 200, captionStr);
			text = new FlxText((width / 2) - textStr.length, height / 3, 200, textStr);
			prompt = new FlxText(width - 200, height - 8, 200, "(Press Z to continue)");
			alive = false;
		}
		
		override public function update():void
		{
			//key press
			if (FlxG.keys.Z) {
				alive = false;
				exists = false;
			}
			
			this.caption.draw();
			this.text.draw();
			this.prompt.draw();
			
			super.update();
		}
		
		public function changeColors(newBorder: uint, newPanel: uint) {
			borderColor
		}
		
		public function show(): void {
			alive = true;
		}
	}

}