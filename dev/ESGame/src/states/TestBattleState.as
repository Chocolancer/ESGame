package states 
{
	import org.flixel.FlxG;
	import mechanics.characters.BattleCharacter;
	import mechanics.characters.Party;
	import mechanics.formations.player.FreeFight;
	import states.abstract.BattleState;
	import globals.Classes;
	import globals.Assets;
	import globals.FormationNames;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class TestBattleState extends BattleState
	{
		private var playerParty: Party;
		private var enemyParty: Party;
		private var player1: BattleCharacter;
		private var player2: BattleCharacter;
		private var player3: BattleCharacter;
		private var player4: BattleCharacter;
		private var enemy1: BattleCharacter;
		
		public function TestBattleState() 
		{
			player1 = new BattleCharacter("Test", null, Classes.SOLDIER);
			player2 = new BattleCharacter("Test2", null, Classes.RANGER);
			player3 = new BattleCharacter("Test3", null, Classes.SIN);
			player4 = new BattleCharacter("Test4", null, Classes.MAGE);
			enemy1 = new BattleCharacter("Test2", null, Classes.SIN);
			
			player1.classType.setBaseStats(player1);
			player2.classType.setBaseStats(player2);
			player3.classType.setBaseStats(player3);
			player4.classType.setBaseStats(player4);
			enemy1.classType.setBaseStats(enemy1);
			
			playerParty = new Party(FlxG.width / 2, FlxG.height / 10, FlxG.width / 2, FlxG.height / 2, FormationNames.FREEFIGHT);
			enemyParty = new Party(0, FlxG.height / 10, FlxG.width / 2, FlxG.height / 2, FormationNames.FREEFIGHT);
			
			playerParty.add(player1);
			playerParty.add(player2);
			playerParty.add(player3);
			playerParty.add(player4);
			enemyParty.add(enemy1);
			
			super(playerParty, enemyParty, Assets.DESERT_BG);
		}
		
	}

}