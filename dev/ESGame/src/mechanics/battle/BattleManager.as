package mechanics.battle 
{
	import globals.battle.BattleTypes;
	import globals.battle.BattleFlags;
	import mechanics.characters.*;
	import mechanics.classes.GameClass;
	import globals.Elements;
	import mechanics.characters.Party;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class BattleManager 
	{
		private var _playerParty: Array;
		private var _enemyParty: Array;
		private var _battleMessageRef:*;
		
		public function BattleManager(playerParty: Party, enemyParty: Party, battleMessage:*) 
		{
			_playerParty = playerParty.members;
			_enemyParty = enemyParty.members;
			_battleMessageRef = battleMessage;
		}
		
		public function getNormalBattleOrder(): Array {
			var order: Array = new Array(_playerParty.length + _enemyParty.length);
			
			//adding all members into one array
			for (var i: int = 0; i < _playerParty.length; i++) {
				order[i] = _playerParty[i];
			}
			for (i = 0; i < _enemyParty.length; i++) {
				order[i] = _enemyParty[i];
			}
			
			order.sortOn("agility");
			return order;
		}
		
		public function getRiggedBattleOrder(battleType: String): Array {
			
			var order: Array;
			
			if (battleType == BattleTypes.AMBUSH) {
				order = _enemyParty;
			}
			if (battleType == BattleTypes.AMBUSH) {
				order = _playerParty;
			}
			
			order.sortOn("agility");
			return order;
		}

		//reads a command taken from the state
		public function readCommand(skillCategory: String, skill: String): void {
			
		}
		
		public function startBattleStep(attacker: BattleCharacter): int {
			var defender:BattleCharacter = _enemyParty[0];
			//NON-ELEMENTAL CALCULATION
			var damage: int = attacker.attack(false) - defender.defend(false);
			
			//IF NON-ELEMENTAL AND ENEMY DOES LESS THAN 0 DAMAGE, THEN THERE IS NO DAMAGE
			(damage < 0) ? damage = 0 : damage;
			
			//WEAKNESS CALCULATION: defense is bypassed and elemental damage applies
			if ((attacker.weapon.element.elementName == Elements.SUN && defender.armor.element.elementName == Elements.MOON)
			|| (attacker.weapon.element.elementName == Elements.MOON && defender.armor.element.elementName == Elements.STAR)
			|| (attacker.weapon.element.elementName == Elements.STAR && defender.armor.element.elementName == Elements.SUN)) {
				damage = attacker.attack(true) - defender.defend(false);
			}
			
			//STRENGTH CALCULATION: defense is multiplied by elemental multiplier, elemental damage doesn't apply
			if ((attacker.weapon.element.elementName == Elements.SUN && defender.armor.element.elementName == Elements.STAR)
			|| (attacker.weapon.element.elementName == Elements.STAR && defender.armor.element.elementName == Elements.MOON)
			|| (attacker.weapon.element.elementName == Elements.MOON && defender.armor.element.elementName == Elements.SUN)) {
				damage = attacker.attack(false) - defender.defend(true);
			}
			
			if ((defender.currenthp = defender.currenthp - damage) == 0) {
				defender.alive = false;
			}
			_battleMessageRef.setText(attacker.characterName + " attacks " + defender.characterName + " for " + damage + " damage!");
			BattleFlags.TURN++;
			return damage;
		}
		
		//true: game over
		public function isPlayerPartyDead(): Boolean {
			var count: uint = 0;
			
			for each(var player: FlxSprite in _playerParty) {
				if (!player.alive)
					count++;
			}
			
			return (count == _playerParty.length);
		}
		
		//true: battle end
		public function isEnemyPartyDead(): Boolean {
			var count: uint = 0;
			
			for each(var enemy: FlxSprite in _enemyParty) {
				if (!enemy.alive)
					count++;
			}
			
			return (count == _enemyParty.length);
		}
	}

}