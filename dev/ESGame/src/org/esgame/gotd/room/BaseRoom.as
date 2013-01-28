package org.esgame.gotd.room 
{
	import org.esgame.gotd.assets.*;
	import org.flixel.*;
	
	/**
	 * A basic room class.
	 * 
	 * @author Matthew Fisher
	 */
	public class BaseRoom extends FlxGroup
	{
		// the data of all the rooms
		public var roomData:RoomData;
		
		// CSV files for the floor, the interactible objects, and the walls
		public var floorCSV:Class;
		public var wallCSV:Class;
		public var doorsCSV:Class;
		
		//the Tilemaps for the floor
		public var floorMap:FlxTilemap;

		//the Tilemap for the background
		public var wallMap:FlxTilemap;
		
		// the Tilemap for the doors
		public var doorsMap:FlxTilemap;
		
		// the player's starting position
		public var playerStartX:int;
		public var playerStartY:int;
		
		// the room's dimensions
		public var roomWidth:int;
		public var roomHeight:int;
		
		// the room number
		public var roomNumber:uint;
		
		public function BaseRoom():void
		{
			roomData = new RoomData();
			setData();
			createFloorMap();
			createWallMap();
			createDoorsMap();
			setDimensions();
			exists = true;
		}
		
		//this assigns the data to the variables used in map creation. Override it to generate different rooms
		public function setData():void
		{
			floorCSV = roomData.floor1;
			wallCSV = roomData.walls1;
			doorsCSV = roomData.doors1;
			roomNumber = 0;
		}
		
		//this just loads the floorMap from whatever you set floorCSV to
		public function createFloorMap():void
		{
			floorMap = recycle(FlxTilemap) as FlxTilemap;
			floorMap.loadMap(new floorCSV, Assets.FLOORS_TILE, RoomData.ROOM_TILE_WIDTH, RoomData.ROOM_TILE_HEIGHT);
		}

		//this just loads the backgroundMap from whatever you set backgroundCSV to
		public function createWallMap():void
		{
			wallMap = recycle(FlxTilemap) as FlxTilemap;
			wallMap.loadMap(new wallCSV, Assets.WALLS_TILE, RoomData.ROOM_TILE_WIDTH, RoomData.ROOM_TILE_HEIGHT);
		}
		
		//this just loads the doorsMap from whatever you set interactiveCSV to
		public function createDoorsMap():void
		{
			doorsMap = recycle(FlxTilemap) as FlxTilemap;
			// FLOORS_TILE does not matter, it is just used as a placeholder
			doorsMap.loadMap(new doorsCSV, Assets.FLOORS_TILE, RoomData.ROOM_TILE_WIDTH, RoomData.ROOM_TILE_HEIGHT);
		}
		
		public function setDimensions():void
		{
			roomWidth = floorMap.width;
			roomHeight = floorMap.height;
		}
	}
}