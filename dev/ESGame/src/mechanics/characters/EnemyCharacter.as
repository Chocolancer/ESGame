package mechanics.characters 
{
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class EnemyCharacter extends BattleCharacter
	{
		
		public function EnemyCharacter(name: String, spritePath: String, str: uint, agl: uint, intl: uint, hp: uint, tp: uint)
		{
			super(name, null, null, str, agl, intl, hp, tp);
		}
		
	}

}