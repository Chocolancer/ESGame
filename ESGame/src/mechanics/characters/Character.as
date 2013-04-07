package mechanics.characters 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Character extends FlxSprite
	{
		protected var _characterName: String;
		protected var _dialogue: Array;
				
		public function Character(name: String, spritePath: Class)
		{
			super();
			this._characterName = name;
		}
		
		public function get characterName():String 
		{
			return _characterName;
		}
		
		public function set characterName(value:String):void 
		{
			_characterName = value;
		}
		
		public function get dialogue():Array 
		{
			return _dialogue;
		}
		
		public function set dialogue(value:Array):void 
		{
			_dialogue = value;
		}
	}
}