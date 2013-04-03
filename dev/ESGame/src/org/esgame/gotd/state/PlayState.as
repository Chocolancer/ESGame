package  org.esgame.gotd.state
{
	import org.esgame.gotd.room.BaseRoom;
	import org.flixel.*
	import org.esgame.gotd.room.*;
	import org.esgame.gotd.entity.Player;
	import org.esgame.gotd.assets.*;
	
	/**
	 * ...
	 * @author Matthew Fisher
	 */
	public class PlayState extends FlxState
	{
		
		//generate all the Class references to each room
		public var s1:Class = Room1;
		public var s2:Class = Room2;
		
		//make an array out of the Class references of the rooms
		public static var rooms:Array;
		
		//make one room object that the rooms can be loaded into
		private var _currentRoom:BaseRoom;
		
		//make the player object
		public var player:Player = new Player;
		
		//set the room counter at 0
		private var _currentRoomNumber:int = 0;
		
		override public function create():void
		{
			rooms = [s1, s2];
			FlxG.bgColor = 0xff000000;
			
			makeRoom();
			makePlayer();
			
			FlxG.log(_currentRoom.roomNumber);
			
			FlxG.worldBounds = new FlxRect(0, 0, _currentRoom.roomWidth, _currentRoom.roomHeight);
			
			FlxG.camera.setBounds(0, 0, _currentRoom.roomWidth, _currentRoom.roomHeight);
			FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN);
		}
		
		//check for collisions between objects and all that jazz
		override public function update():void
		{	
			super.update();
			
			// make the player collide with walls
			FlxG.collide(player, _currentRoom.wallMap);
			
			if (getDoorTile() != 0)
			{
				changeRooms(getDoorTile());
			}
		}
		
		// change to another room
		public function changeRooms(whichRoom:uint):void
		{
			
			_currentRoomNumber = whichRoom - 1;
			
			// remove old objects from the view
			remove(_currentRoom.floorMap);
			remove(_currentRoom.wallMap);
			remove(player);
			
			// generate the new room
			makeRoom();
			
			//create the player
			makePlayer();
			
			// make a flash transition
			FlxG.camera.flash(0xff000000, 1, null, false);
		}
		
		//generate the room
		public function makeRoom():void
		{
			_currentRoom = new rooms[_currentRoomNumber];
			
			// add room objects to the view
			add(_currentRoom.floorMap);
			add(_currentRoom.wallMap);
		}
		
		//creates the player and adds him to the current room
		public function makePlayer():void
		{
			player.reset(_currentRoom.roomWidth / 2, _currentRoom.roomHeight / 2);
			FlxG.worldBounds.make(0, 0, _currentRoom.roomWidth, _currentRoom.roomHeight);
			add(player);
		}
		
		// retrieve the value of the tile the player is standing on
		// from the current room's door map.
		public function getDoorTile():int
		{
			// grab the position on the map where the player is
			var playerPositionInTiles:FlxPoint = new FlxPoint(
													player.x / RoomData.ROOM_TILE_WIDTH,
													player.y / RoomData.ROOM_TILE_HEIGHT);
			
			// grab the value of the tile that the player is standing on
			var tilePlayerIsStandingOn:int = _currentRoom
											.doorsMap
											.getTile(playerPositionInTiles.x, playerPositionInTiles.y);
											
			return tilePlayerIsStandingOn;
		}
	}
}