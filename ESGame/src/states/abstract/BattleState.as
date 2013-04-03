package states.abstract 
{
	import globals.battle.BattleUIPositions;
	import globals.battle.BattleFlags;
	import globals.battle.BattleTypes;
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
		private var _bg: BattleBg;
		//private var battlePointer: BattlePointer;
		//private var commandPointer: BattlePointer;
		private var _msgBox: BattleMessage;
		private var _commandSelector: BattleCommandSelector;
		private var _statOverlay: Array = new Array(4);
		
		private var _order: Array;
		private var _isSelectingCommands: Boolean = true;
		private var _battleType: String;
		
		private var _battleManager: BattleManager;
		
		private var _elapsed = 0;
		
		public function BattleState(playerParty: Party, enemyParty: Party, background: Class, battleType: String = BattleTypes.NORMAL) 
		{
			var index: uint = 0;
			var overlayOffset: uint = 0;
			
			_battleType = battleType;
			
			_bg = new BattleBg(background);
			_msgBox = new BattleMessage(BattleUIPositions.PADDING, BattleUIPositions.PADDING, 
									   FlxG.width - BattleUIPositions.PADDING * 2, BattleUIPositions.MESSAGE_BOX_HEIGHT);
			_commandSelector = new BattleCommandSelector(BattleUIPositions.PADDING, BattleUIPositions.PADDING * 2 + BattleUIPositions.MESSAGE_BOX_HEIGHT,
														FlxG.width / 2, FlxG.height / 2 + 15, _msgBox);
			
			_battleManager = new BattleManager(playerParty, enemyParty, _msgBox);
			
			add(_bg);
			add(enemyParty);
			add(playerParty);
			add(_msgBox);
			add(_commandSelector);
			for each (var playerMember:BattleCharacter in playerParty.members) {
				_statOverlay[index] = new PlayerStatOverlay(BattleUIPositions.PADDING + overlayOffset, BattleUIPositions.STAT_OVERLAY_Y, playerMember);
				add(_statOverlay[index]);
				overlayOffset += BattleUIPositions.STAT_OVERLAY_WIDTH + 35;
				index++;
			}
			
			if (battleType == BattleTypes.AMBUSH) {
				_commandSelector.visible = false;
				_isSelectingCommands = false;
				_order = _battleManager.getRiggedBattleOrder(BattleTypes.AMBUSH);
				_msgBox.setText("Ambush!");
			}
			
			if (battleType == BattleTypes.PREEMP) {
				_order = _battleManager.getRiggedBattleOrder(BattleTypes.PREEMP);
				_msgBox.setText("Preemptive strike!");
			}
		}
		
		override public function update(): void {
			_elapsed++;
			if (_elapsed % 120 == 0 && !BattleFlags.IS_BATTLE_END) {
				_commandSelector.visible = false;
				if (_battleType == BattleTypes.NORMAL && BattleFlags.TURN == 0)
					_order = _battleManager.getNormalBattleOrder();
					
				_battleManager.startBattleStep(_order[BattleFlags.TURN]);
				if (_battleManager.isPlayerPartyDead()) {
					_msgBox.setText("You've been annihilated!");
					BattleFlags.IS_BATTLE_END = true;
				}
				
				if (_battleManager.isEnemyPartyDead()) {
					_msgBox.setText("Victory!");
					BattleFlags.IS_BATTLE_END = true;
				}
				
				if (BattleFlags.TURN == _order.length - 1) {
					BattleFlags.TURN = 0;
				}
			}
			//if (!_isSelectingCommands) {
				//_commandSelector.visible = false;
				
					
				
				
				//attack logic based on turn
			//}
			
			super.update();
		}
		
		private function attack(attacker: BattleCharacter, defender: BattleCharacter): void {
			
		}
		
	}

}