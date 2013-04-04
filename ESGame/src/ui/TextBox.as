package ui 
{
	import org.flixel.*;
	
	/**
	 * All-purpose text box.
	 * Can currently only proceed and delete using Z key.
	 * 
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class TextBox extends Panel
	{
		private var text: FlxText;
		private var caption: FlxText;
		private var prompt: FlxText;
		
		public var width: int;
		public var height: int;
		public var x: int;
		public var y: int;
		
		
		public var keepAlive: Boolean = false;
		
		public function TextBox(x: int, y: int, width: int, height: int, captionStr: String, textStr: String): void
		{
			super(x, y, width, height);
			
			caption = new FlxText((x + 5) + 10, y + (height / 12), 200, captionStr);
			text = new FlxText((x + 5) + 20, y + ((height / 12) * 4), 300, textStr);
			prompt = new FlxText(x + (width / 2) - 50, y + height - 18, 200, "(Press Z to continue)");
			visible = false;
			
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