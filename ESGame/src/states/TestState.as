package states
{
	import mechanics.characters.*;
	import mechanics.battle.*;
	import globals.EquipmentCollection;
	import org.flixel.*;
	import ui.*;
 
	public class TestState extends FlxState
	{
		private var mainParty: Party;
		private var enemyParty: Party;
		private var sampleCharacter: PlayableCharacter;
		private var enemyCharacter: EnemyCharacter;
		private var battleManager: BattleManager;
		private var equipmentCollection: EquipmentCollection;
		
		private var text1: FlxText;
		private var text2: FlxText;
		private var text3: FlxText;
		private var attackButton: FlxButton;
		private var levelupButton: FlxButton;
		private var resetButton: FlxButton;
			
		override public function create():void
		{
			battleManager = new BattleManager();
			equipmentCollection = new EquipmentCollection();
			FlxG.mouse.show();
			text1 = new FlxText(0, 0, FlxG.width, "Attack");
			text2 = new FlxText(0, 10, FlxG.width, "Damage");
			text3 = new FlxText(0, 20, FlxG.width, "Levelup");
			attackButton = new FlxButton(0, 40, "Attack", attack);
			levelupButton = new FlxButton(0, 60, "Levelup", levelup);
			resetButton = new FlxButton(0, 80, "Reset", reset);
			
			sampleCharacter = new PlayableCharacter("You", null, "Soldier", 5, 5, 5, 5, 5);
			sampleCharacter.classType.setBaseStats(sampleCharacter);
			sampleCharacter.weapon = equipmentCollection.weaponCollection.Orichalcon;
			sampleCharacter.armor = equipmentCollection.armorCollection.LucidGarb;
			
			enemyCharacter = new EnemyCharacter("Dummy Goblin", null, 20, 20, 20, 1000, 200);
			enemyCharacter.weapon = equipmentCollection.weaponCollection.BGlaive;
			enemyCharacter.armor = equipmentCollection.armorCollection.TravellingClothes;

			add(text1);
			add(text2);
			add(text3);
			add(attackButton);
			add(levelupButton);
			add(resetButton);
		}
		
		public function attack(): void {
			var battleOrder: Array = battleManager.getBattleOrder(mainParty, enemyParty);
			text1.text = sampleCharacter.characterName + " attacks for " + battleManager.startBattleStep(sampleCharacter, enemyCharacter) + " damage! Enemy HP: " + enemyCharacter.currhp + " / " + enemyCharacter.maxhp;
			text2.text = enemyCharacter.characterName + " attacks for " + battleManager.startBattleStep(enemyCharacter, sampleCharacter) + " damage! Your HP: " + sampleCharacter.currhp + " / " + sampleCharacter.maxhp;
		}
		
		public function levelup(): void {
			LevelUpper.levelUp(sampleCharacter);
			text3.text = "Strength: " + sampleCharacter.strength + " Agility: " + sampleCharacter.agility + " Intelligence: " + sampleCharacter.intelligence + " HP: " + sampleCharacter.maxhp + " TP: " + sampleCharacter.maxtp + " TP Recover: " + sampleCharacter.tpRecovery;
		}
		
		public function reset(): void {
			sampleCharacter.classType.setBaseStats(sampleCharacter);
			enemyCharacter = new EnemyCharacter("Dummy Goblin", null, 20, 20, 20, 1000, 200);
		}
 
		override public function update():void
		{
			super.update();
		}
 
		public function TestState()
		{
			super();
		}
	}
}