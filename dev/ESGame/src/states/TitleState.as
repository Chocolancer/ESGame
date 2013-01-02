package states
{
	import org.flixel.*;
	import ui.*;
 
	/**
	 * The state that represents the title screen menu of the game.
	 * 
	 * @author Jason Bolanos
	 */
	public class TitleState extends FlxState
	{
		private var title: FlxText;
		private var newgame: FlxButton;
		private var loadgame: FlxButton;
		private var copyright: FlxText; //don't touch for now
		private var warning: TextBox;
			
		override public function create():void
		{
			title = new FlxText(0, 16, FlxG.width, "Grimoire of the Destined (working title)");
			title.setFormat (null, 16, 0xFFFFFFFF, "center");
			
			newgame = new FlxButton((FlxG.width / 2), (FlxG.height / 2) - (FlxG.height / 12), "New Game", onStartNewGame);
			newgame.label.setFormat(null, 8, 0, "center");
			newgame.scale = new FlxPoint(FlxG.width / 10, (FlxG.width / 10) * 2);
			loadgame = new FlxButton((FlxG.width / 2), (FlxG.height / 2) + (FlxG.height / 12), "Load Game", onLoadGame);
			loadgame.label.setFormat(null, 8, 0, "center");
			loadgame.scale = newgame.scale = new FlxPoint(2, 2);
			newgame.x = loadgame.x -= (newgame.width / 2);
			warning = new TextBox(FlxG.width / 4, FlxG.height, FlxG.width / 2, FlxG.height / 2, "No Save Files", "There are currently no save files to load.");
			
			add(title);
			add(newgame);
			add(loadgame);
			add(warning);
		}
 
		override public function update():void
		{
			super.update();
		}
		
		private function onStartNewGame(): void {
			
		}
		
		private function onLoadGame(): void {
			if (FlxG.saves == null) {
				warning.show();
			}
			else {
				//enter load game state
			}
		}
 
		public function TitleState()
		{
			super();
		}
	}
}