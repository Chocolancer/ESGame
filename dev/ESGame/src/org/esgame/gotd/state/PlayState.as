package  org.esgame.gotd.state
{
	import org.flixel.*
	import org.esgame.gotd.stage.*;
	import org.esgame.gotd.entity.Player;
	
	/**
	 * ...
	 * @author Matthew Fisher
	 */
	public class PlayState extends FlxState
	{
		
		//generate all the Class references to each room
		public var s1:Class = Room1;
		public var s2:Class = Room2;
		
		//make an array out of the Class references of the stages
		public static var stages:Array;
		
		//make one stage object that the stages can be loaded into
		public var stage:BaseStage;
		
		//make the player object
		public var player:Player;
		
		//set the stage counter at 0
		public static var stageCount:int = 0;
		
		//reset boolean, might be a better way to do this
		public var reset:Boolean = false;
		
		public function PlayState() 
		{
			player = new Player();
		}
		
		override public function create():void
		{
			stages = [s1, s2];
			FlxG.bgColor = 0xff000000;
			
			makeStage();
			
			FlxG.log(stage.stageName);
			
			FlxG.worldBounds = new FlxRect(0, 0, stage.stageWidth, stage.stageHeight);
			
			FlxG.camera.setBounds(0, 0, stage.stageWidth, stage.stageHeight);
			FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN);
		}
		
		//check for collisions between objects and all that jazz
		override public function update():void
		{
			super.update();
			
			// make the player collide with walls
			FlxG.collide(player, stage.wallMap);
		}
		
		//load the next stage
		public function nextStage():void
		{
			FlxG.resetState();
			stageCount++;
			if (stageCount > (stages.length - 1))
			{
				stageCount = 0;
			} else {
				makeStage();
			}
		}
		
		//generate the stage
		public function makeStage():void
		{
			stage = new stages[stageCount];
			
			add(stage.floorMap);
			add(stage.wallMap);
			
			player.reset(stage.stageWidth / 2, stage.stageHeight / 2);
			FlxG.worldBounds.make(0, 0, stage.stageWidth, stage.stageHeight);
			add(player);
			
			FlxG.camera.flash(0xff000000, 1, null, false);
			
		}
		
	}
	

}