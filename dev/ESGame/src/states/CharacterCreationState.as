package states 
{
	import org.flixel.*;
	import states.abstract.MenuState;
	import ui.*;
	
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class CharacterCreationState extends MenuState
	{
		//private var nameBox: TextField;
		private var cletusFall: FlxSprite;
		
		private var strength: int = 15;
		private var agility: int = 10;
		private var intelligence: int = 5;
			
		override public function create():void
		{
			panelCollection.namePanel = new TextBox(0, 0, FlxG.width / 2, FlxG.height / 4, "Your Name", "");
			panelCollection.statsPanel = new TextBox(0, FlxG.height / 4, FlxG.width / 2, FlxG.height / 6, "Base Stats", "");
			panelCollection.typePanel = new TextBox(FlxG.width / 2, FlxG.height / 4, FlxG.width / 2, FlxG.height / 6, "Attack Class", "");
			panelCollection.namePanel.hidePrompt();
			panelCollection.statsPanel.hidePrompt();
			panelCollection.typePanel.hidePrompt();
			
			textCollection.strLabel = new FlxText();
			textCollection.aglLabel = new FlxText();
			textCollection.intLabel = new FlxText();
			textCollection.classLabel = new FlxText();
			
			buttonCollection.strengthButton = new FlxButton(panelCollection.statsPanel.x + panelCollection.statsPanel.width, panelCollection.statsPanel.y + panelCollection.statsPanel.height, "Soldier", choseStr);
			buttonCollection.aglButton = new FlxButton(panelCollection.statsPanel.x + panelCollection.statsPanel.width, panelCollection.statsPanel.y + panelCollection.statsPanel.height, "Tactician", choseAgl);
			buttonCollection.intButton = new FlxButton(panelCollection.statsPanel.x + panelCollection.statsPanel.width, panelCollection.statsPanel.y + panelCollection.statsPanel.height, "Thaumaturge", choseInt);
			buttonCollection.hybridButton = new FlxButton(panelCollection.statsPanel.x + panelCollection.statsPanel.width, panelCollection.statsPanel.y + panelCollection.statsPanel.height, "Sentinel", choseHybrid);
			buttonCollection.readyButton = new FlxButton(panelCollection.statsPanel.x + panelCollection.statsPanel.width, panelCollection.statsPanel.y + panelCollection.statsPanel.height, "Ready", characterReady);
			
			addAllCoreComponents();
		}
 
		override public function update():void
		{
			super.update();
		}
		
		private function choseStr(): void {
			textCollection.classLabel.setFormat("Soldier", 10, 0xff00ff00, "center", 0);
			strength = 20;
			agility = 10;
			intelligence = 5;
		}
		
		private function choseAgl(): void {
			textCollection.classLabel.setFormat("Tactician", 10, 0xffffff00, "center", 0);
			strength = 15;
			agility = 5;
			intelligence = 15;
		}
		
		private function choseInt(): void {
			textCollection.classLabel.setFormat("Thaumaturge", 10, 0xffff0000, "center", 0);
			strength = 5;
			agility = 10;
			intelligence = 20;
		}
		
		private function choseHybrid(): void {
			textCollection.classLabel.setFormat("Sentinel", 10, 0xffff66ff, "center", 0);
			strength = 10;
			agility = 15;
			intelligence = 10;
		}
		
		private function characterReady(): void {
			//set Cletus starting stats and push starting state
		}
		
		public function CharacterCreationState() 
		{
			super();
		}
	}
}