package states
{
	import mechanics.characters.Character;
	import mechanics.battle.*;
	import globals.EquipmentCollection;
	import org.flixel.*;
	import ui.*;
 
	public class TestState extends FlxState
	{
		private var sampleCharacter: Character;
		private var enemyCharacter: Character;
		private var bsampleCharacter: BattleCharacter;
		private var benemyCharacter: BattleCharacter;
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
			
			sampleCharacter = new Character("TestCharacter", "Thaumaturge");
			sampleCharacter.getClass().setBaseStats(sampleCharacter);
			sampleCharacter.setWeapon(equipmentCollection.weaponCollection.Orichalcon);
			sampleCharacter.setArmor(equipmentCollection.armorCollection.TravellingClothes);
			
			enemyCharacter = new Character("EnemyCharacter", "Enemy", 5, 5, 5, 1000, 20);
			enemyCharacter.setWeapon(equipmentCollection.weaponCollection.Orichalcon);
			enemyCharacter.setArmor(equipmentCollection.armorCollection.TravellingClothes);
			
			bsampleCharacter = new BattleCharacter(sampleCharacter);
			benemyCharacter = new BattleCharacter(enemyCharacter);
			
			
			add(text1);
			add(text2);
			add(text3);
			add(attackButton);
			add(levelupButton);
			add(resetButton);
		}
		
		public function attack(): void {
			text1.text = "You attack for " + battleManager.startBattleStep(bsampleCharacter, benemyCharacter) + " damage! Enemy HP: " + enemyCharacter.getCurrentHp();
			text2.text = "Enemy attacks for " + battleManager.startBattleStep(benemyCharacter, bsampleCharacter) + " damage! Your HP: " + sampleCharacter.getCurrentHp();
		}
		
		public function levelup(): void {
			LevelUpper.levelUp(sampleCharacter);
			text3.text = "Strength: " + sampleCharacter.getStrength() + " Agility: " + sampleCharacter.getAgility() + " Intelligence: " + sampleCharacter.getIntelligence() + " HP: " + sampleCharacter.getMaxHp() + " TP: " + sampleCharacter.getMaxTp() + " TP Recover: " + sampleCharacter.getTpRecovery();
		}
		
		public function reset(): void {
			sampleCharacter.getClass().setBaseStats(sampleCharacter);
			enemyCharacter = new Character("EnemyCharacter", "Enemy", 20, 20, 20, 1000, 20);
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