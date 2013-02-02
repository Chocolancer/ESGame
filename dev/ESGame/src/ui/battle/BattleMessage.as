package ui.battle 
{
	import org.flixel.FlxText;
	import ui.Panel;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class BattleMessage extends Panel
	{
		private var text: FlxText;
		
		public function BattleMessage(x: uint, y: uint, width: uint, height: uint) 
		{
			super(x, y, width, height);
			
			text = new FlxText(x + 10, y + 15, width);
			text.size = 15;
			add(text);
		}
		
		public function setText(str: String): void{
			text.text = str;
		}
		
	}

}