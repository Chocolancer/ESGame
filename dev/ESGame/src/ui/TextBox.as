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
		
		public function TextBox(x: int, y: int, width: int, height: int, captionStr: String, textStr: String): void
		{
			super();
			panel = new Panel(x, y, width, height);
			
			caption = new FlxText((width / 2) - 100, (height / 2) - (height / 12), 200, captionStr);
			text = new FlxText((width / 2) - 80, (height / 2) + (height / 12), 300, textStr);
			prompt = new FlxText(width - 200, height - 8, 200, "(Press Z to continue)");
			visible = false;
			
			add(panel);
			add(caption);
			add(text);
			add(prompt);
		}
		
		override public function update():void
		{
			//key press
			if (FlxG.keys.Z) {
				visible = false;
			}
			
			super.update();
		}
		
		public function show(): void {
			visible = true;
		}
	}

}