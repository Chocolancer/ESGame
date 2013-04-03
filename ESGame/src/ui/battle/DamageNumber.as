package ui.battle 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class DamageNumber extends FlxSprite
	{
		private var text: FlxText;
		
		public function DamageNumber(x: uint, y: uint, damage: uint) 
		{
			text = new FlxText(x, y, 100, damage.toString());
		}
		
		override public function update(): void {
			text.update();
			super.update();
		}
	}

}