package ui 
{
	import org.flixel.*;
	
	/**
	 * All-purpose text box.
	 * Can currently only proceed and delete using Z key.
	 * 
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class TextBox extends FlxGroup
	{
		private var text: FlxText;
		private var caption: FlxText;
		private var prompt: FlxText;
		private var panel: Panel;
		private var border: Panel;
		
		public var width: int;
		public var height: int;
		public var x: int;
		public var y: int;
		
		public static var borderColor: uint = 0xff0a141f; //default value
		public static var panelColor: uint = 0xff336699; //default value
		public var keepAlive: Boolean = false;
		
		public function TextBox(x: int, y: int, width: int, height: int, captionStr: String, textStr: String): void
		{
			super();
			panel = new Panel(x, y, width, height, borderColor);
			border = new Panel(x + 5, y + 5, width - 10, height - 10, panelColor);
			
			caption = new FlxText((x + 5) + 10, y + (height / 12), 200, captionStr);
			text = new FlxText((x + 5) + 20, y + ((height / 12) * 4), 300, textStr);
			prompt = new FlxText(x + (width / 2) - 50, y + height - 18, 200, "(Press Z to continue)");
			visible = false;
			
			add(panel);
			add(border);
			add(caption);
			add(text);
			add(prompt);
		}
		
		override public function update():void
		{
			//key press
			if (FlxG.keys.Z) {
				if (!keepAlive) {
					visible = false;
				}
				else {
					nextText();
				}
			}
			
			super.update();
		}
		
		private function nextText(): void {
			
		}
		
		public function show(): void {
			visible = true;
		}
		
		public function hidePrompt(): void {
			prompt.visible = false;
		}
		
		public function toggleActiveComponents(buttonCollection: Object): void {
			
			var toggle: Boolean = true;
			if (visible) {
				toggle = false;
			}
			
			for (var key: String in buttonCollection) {
				buttonCollection[key].active = toggle;
			}
		}
	}

}