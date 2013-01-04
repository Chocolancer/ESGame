package states 
{
	import mx.core.FlexTextField;
	import org.flixel.*;
	import ui.Panel;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class CharacterCreationState extends FlxState
	{
		private var nameLabel: FlxText;
		private var statsLabel: FlxText;
		private var typeLabel: FlxText;
		
		private var namePanel: Panel;
		private var statsPanel: Panel;
		private var typePanel: Panel;
		
		//private var nameBox: FlexTextField;
		private var randomRollButton: FlxButton;
		private var strengthButton: FlxButton;
		private var intButton: FlxButton;
		private var hybridButton: FlxButton;
		private var characterReadyButton: FlxButton;
		
		//player sprite
			
		override public function create():void
		{
			
		}
 
		override public function update():void
		{
			super.update();
		}
		
		private function characterReady(): void {
			
		}
		
		public function CharacterCreationState() 
		{
			super();
		}
		
	}

}