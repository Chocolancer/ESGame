package states
{
	import org.flixel.*;
	import ui.*;
 
	public class TestState extends FlxState
	{
		private var talkBox: TextBox;
		private var panelBox: TextBox;
		private var warningBox: TextBox;
			
		override public function create():void
		{
			talkBox = new TextBox(0, 0, FlxG.width, (FlxG.height / 4), "Character", "I am speaking this line.");
			panelBox = new TextBox(0, (FlxG.height / 4), (FlxG.width / 4), (FlxG.height - (FlxG.height / 4)), "Panel", "This is a panel.");
			warningBox = new TextBox((FlxG.width / 4), (FlxG.height / 4), 200, 150, "Fixed Warning", "This is a fixed warning box.");
			
			
			add(talkBox);
			add(panelBox);
			add(warningBox);
		}
 
		override public function update():void
		{
			talkBox.show();
			panelBox.show();
			warningBox.show();
			super.update();
		}
 
		public function TestState()
		{
			super();
		}
	}
}