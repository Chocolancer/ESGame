package mechanics 
{
	/**
	 * Generic class to handle all characters, whether they 
	 * be player characters (PC's), non-player characters (NPC's),
	 * or monsters.
	 * 
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Character 
	{
		/**
		 * The name of the character.
		 */
		private var characterName: String;
		
		/**
		 * The character's maximum hitpoints. This is a constant that
		 * only gets increased when leveling up.
		 */
		private var maxHP: int;
		
		/**
		 * The character's current hitpoints. This cannot exceed the value
		 * of maxHP, unless otherwise stated (such as a temporary buff).
		 * If the value of currentHP hits zero, the character "dies".
		 */
		private var currentHP: int;
		
		/**
		 * The character's strength attribute.
		 */
		private var strength: int;
		
		/**
		 * The character's agility attribute.
		 */
		private var agility: int;
		
		/**
		 * The character's intelligence attribute.
		 */
		private var intelligence: int;
		
		/**
		 * The character's maximum tech points. This is a constant that
		 * only gets increased when leveling up.
		 */
		private var maxTP: int;
		
		/**
		 * The character's current hitpoints. This cannot exceed the value
		 * of maxTP, unless otherwise stated (such as a temporary buff).
		 */
		private var currentTP: int;
		
		public function Character(name:int, hp:int, str:int, agi:int, wis:int, tp:int) 
		{	
			characterName = name;
			maxHP = hp;
			currentHP = hp;
			strength = str;
			agility = agi;
			intelligence = wis;
			maxTP = tp;
			currentTP = tp;
		}
		
		public function getName(): String
		{
			return characterName;
		}
		
		public function getMaxHP(): int
		{
			return maxHP;
		}
		
		public function getCurrentHP(): int
		{
			return currentHP;
		}
		
		public function getStrength(): int
		{
			return strength;
		}
		
		public function getAgility(): int
		{
			return agility;
		}
		
		public function getIntelligence(): int
		{
			return intelligence;
		}
		
		public function getMaxTP(): int
		{
			return maxTP;
		}
		
		public function getCurrentTP(): int
		{
			return currentTP;
		}
		
		public function setCharacterName(name:String): void
		{
			characterName = name;
		}
		
		public function setMaxHP(hp:int): void
		{
			maxHP = hp;
		}
		
		public function setCurrentHP(hp:int): void
		{
			currentHP = hp;
		}
		
		public function setStrength(str:int): void
		{
			strength = str;
		}
		
		public function setAgility(agi:int): void
		{
			agility = agi;
		}
		
		public function setintelligence(wis:int): void
		{
			intelligence = wis;
		}
		
		public function setMaxTP(tp:int): void
		{
			maxTP = tp;
		}
		
		public function setCurrentTP(tp:int): void
		{
			currentTP = tp;
		}
	}
}