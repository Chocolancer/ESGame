package ui.battle 
{
	import org.flixel.FlxButton;
	import org.flixel.FlxGroup;
	import mechanics.skills.Skill;
	import ui.Panel;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class BattleCommandSelector extends FlxGroup
	{
		private var _backPanel: Panel;
		private var _buttonCommand: FlxButton;
		private var _refMsgBox:*;
		
		public function BattleCommandSelector(x: uint, y: uint, width: uint, height: uint, refMsgBox:*) 
		{
			_refMsgBox = refMsgBox;
			_backPanel = new Panel(x, y, width, height);
			
			add(_backPanel);
		}
		
		public function setPlayerCommands(skillCollection: Array = null): void {
			//buttonCommand = FlxButton(_backPanel.x + 10, _backPanel.y + 15, "Fight: dummy weapon", clickSkill);
		}
		
		public function clickSkill(): void {
			
		}
		
	}

}