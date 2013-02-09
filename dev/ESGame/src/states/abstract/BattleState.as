package states.abstract 
{
	import globals.BattleUIPositions;
	import mechanics.battle.BattleManager;
	import mechanics.characters.BattleCharacter;
	import mechanics.characters.Party;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	import ui.battle.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class BattleState extends FlxState
	{
		private var bg: BattleBg;
		//private var battlePointer: BattlePointer;
		//private var commandPointer: BattlePointer;
		private var msgBox: BattleMessage;
		//private var commandSelector: BattleSelector;
		private var statOverlay: Array = new Array(4);
		
		private var isSelectingCommands: Boolean = true;
		private var isAmbush: Boolean = false;
		private var isPreemptive: Boolean = false;
		
		public var battleManager: BattleManager;
		
		public function BattleState(playerParty: Party, enemyParty: Party, background: Class) 
		{
			var index: uint = 0;
			var overlayOffset: uint = 0;
			
			battleManager = new BattleManager();
			
			bg = new BattleBg(background);
			msgBox = new BattleMessage(BattleUIPositions.PADDING, BattleUIPositions.PADDING, 
									   FlxG.width - BattleUIPositions.PADDING * 2, BattleUIPositions.MESSAGE_BOX_HEIGHT);
			msgBox.setText("Preemptive strike!"); // test message
			add(bg);
			add(enemyParty);
			add(playerParty);
			add(msgBox);
			for each (var playerMember:BattleCharacter in playerParty.members) {
				statOverlay[index] = new PlayerStatOverlay(BattleUIPositions.PADDING + overlayOffset, BattleUIPositions.STAT_OVERLAY_Y, playerMember);
				add(statOverlay[index]);
				overlayOffset += BattleUIPositions.STAT_OVERLAY_WIDTH + 35;
				index++;
			}
		}
		
		override public function update(): void {
			
			if (isSelectingCommands) {
				
			}
			else {
				battleManager.getBattleOrder(playerParty, enemyParty);
			}
			
			super.update();
		}
		
		private function attack(attacker: BattleCharacter, defender: BattleCharacter): void {
			
		}
		
	}

}