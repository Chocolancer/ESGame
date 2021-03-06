package states
{
	import globals.Assets;
	import globals.RoomData;
	import mechanics.characters.FieldCharacter;
	import overworld.*;
	import overworld.room.*;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matthew Fisher
	 */
	public class TestFieldState extends FlxState
	{
		
		//generate all the Class references to each room
		public var s1:Class = Room1;
		public var s2:Class = Room2;
		
		//make an array out of the Class references of the rooms
		public static var rooms:Array;
		
		//make one room object that the rooms can be loaded into
		private var _currentRoom:BaseRoom;
		
		//make the player object
		public var player: FieldCharacter = new FieldCharacter;
		
		//set the room counter at 0
		private var _currentRoomNumber:int = 0;
		
		override public function create():void
		{
			rooms = [s1, s2];
			FlxG.bgColor = 0xff000000;
			
			makeRoom();
			
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
		}
		
		//generate the room
		public function makeRoom():void
		{
			_currentRoom = new rooms[_currentRoomNumber];
			
			add(_currentRoom.floorMap);
			add(_currentRoom.wallMap);
			
			player.reset(_currentRoom.roomWidth / 2, _currentRoom.roomHeight / 2);
			FlxG.worldBounds.make(0, 0, _currentRoom.roomWidth, _currentRoom.roomHeight);
			add(player);
			
			FlxG.camera.flash(0xff000000, 1, null, false);
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