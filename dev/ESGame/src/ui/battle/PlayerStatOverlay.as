package ui.battle 
{
	import globals.BattleUIPositions;
	import mechanics.characters.BattleCharacter;
	import mx.core.FlexTextField;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.plugin.photonstorm.FlxBar;
	import ui.Panel;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class PlayerStatOverlay extends FlxGroup
	{
		private var characterPhoto: FlxSprite;
		private var backPanel: Panel;
		private var hpBar: FlxBar;
		private var tpBar: FlxBar;
		private var name: FlxText;
		private var hpNum: FlxText;
		private var tpNum: FlxText;
		
		public function PlayerStatOverlay(x: uint, y: uint, characterRef:*) 
		{
			backPanel = new Panel(x, y, BattleUIPositions.STAT_OVERLAY_WIDTH - BattleUIPositions.PADDING, BattleUIPositions.STAT_OVERLAY_HEIGHT);
			hpBar = new FlxBar(x + 5, y + backPanel.height / 3, FlxBar.FILL_LEFT_TO_RIGHT, backPanel.width - 5, 15, characterRef, "currhp", 0, characterRef.maxhp);
			hpBar.createFilledBar(0xff000000, 0xffff0000);
			tpBar = new FlxBar(x + 5, y + (backPanel.height / 3) + hpBar.height + 5, FlxBar.FILL_LEFT_TO_RIGHT, backPanel.width - 5, 15, characterRef, "currtp", 0, characterRef.maxtp);
			tpBar.createFilledBar(0xff000000, 0xff0000ff);
			name = new FlxText(x, y, backPanel.width, characterRef.characterName);
			name.size = 15;
			hpNum = new FlxText(hpBar.x + hpBar.height, hpBar.y, backPanel.width, characterRef.currhp);
			tpNum = new FlxText(tpBar.x + tpBar.height, tpBar.y, backPanel.width, characterRef.currtp);
			
			//add(backPanel);
			add(hpBar);
			add(tpBar);
			add(hpNum);
			add(tpNum);
			add(name);
		}
		
		//override public function update(): void {
			//hpNum.text = (characterRef as BattleCharacter).currHp;
			//tpNum.text = (characterRef as BattleCharacter).currTp;
			//
			//super.update();
		//}
	}

}