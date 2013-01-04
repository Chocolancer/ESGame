package states
{
	import org.flixel.*;
	import states.abstract.MenuState;
	import ui.*;
 
	/**
	 * The state that represents the title screen menu of the game.
	 * 
	 * @author Jason Bolanos
	 */
	public class TitleState extends MenuState
	{
		private var warning: TextBox;
			
		override public function create():void
		{
			FlxG.mouse.show();
			textCollection.title = new FlxText(0, 16, FlxG.width, "Grimoire of the Destined (working title)");
			textCollection["title"].setFormat (null, 16, 0xFFFFFFFF, "center");
			
			buttonCollection.newgame = new FlxButton((FlxG.width / 2), (FlxG.height / 2) - (FlxG.height / 12), "New Game", onStartNewGame);
			buttonCollection["newgame"].label.setFormat(null, 8, 0, "center");
			buttonCollection["newgame"].scale = new FlxPoint(FlxG.width / 10, (FlxG.width / 10) * 2);
			buttonCollection.loadgame = new FlxButton((FlxG.width / 2), (FlxG.height / 2) + (FlxG.height / 12), "Load Game", onLoadGame);
			buttonCollection["loadgame"].label.setFormat(null, 8, 0, "center");
			buttonCollection["loadgame"].scale = buttonCollection["newgame"].scale = new FlxPoint(2, 2);
			buttonCollection["newgame"].x = buttonCollection["loadgame"].x -= (buttonCollection["newgame"].width / 2);
			warning = new TextBox(FlxG.width / 4, FlxG.height / 4, FlxG.width / 2, FlxG.height / 10, "No Save Files", "There are currently no save files to load.");
			
			addAllCoreComponents();
			add(warning);
		}
 
		override public function update():void
		{
			warning.toggleActiveComponents(buttonCollection);
			super.update();
		}
		
		private function onStartNewGame(): void {
			//FlxG.switchState(new CharacterCreationState()); //should be an interlude state, returning here
			//FlxG.switchState(new CharacterCreationState());
		}
		
		private function onLoadGame(): void {
			if (FlxG.saves == null) {
				warning.show();
			}
			else {
				//FlxG.switchState(new LoadState());
			}
		}
 
		public function TitleState()
		{
			super();
		}
	}
}