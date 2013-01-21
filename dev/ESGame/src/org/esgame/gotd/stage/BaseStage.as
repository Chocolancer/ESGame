package org.esgame.gotd.stage 
{
	import org.esgame.gotd.assets.*;
	import org.flixel.*;
	
	/**
	 * A basic stage class.
	 * 
	 * @author Matthew Fisher
	 */
	public class BaseStage extends FlxGroup
	{
		// the data of all the stages
		public var stagedata:StageData;
		
		// CSV files for the floor, the interactible objects, and the walls
		public var floorCSV:Class;
		public var wallCSV:Class;
		public var interactiveCSV:Class;
		
		//the Tilemaps for the floor
		public var floorMap:FlxTilemap;

		//the Tilemap for the background
		public var wallMap:FlxTilemap;
		
		// the Tilemap for the interactive objects
		public var interactiveMap:FlxTilemap;
		
		// the player's starting position
		public var playerStartX:int;
		public var playerStartY:int;
		
		// the stage dimensions
		public var stageWidth:int;
		public var stageHeight:int;
		
		// the stage name
		public var stageName:String;
		
		public function BaseStage():void
		{
			stagedata = new StageData();
			setData();
			createFloorMap();
			createWallMap();
			createInteractiveMap();
			setDimensions();
			exists = true;
		}
		
		//this assigns the data to the variables used in map creation. Override it to generate different stages
		public function setData():void
		{
			floorCSV = stagedata.floor1;
			wallCSV = stagedata.walls1;
			stageName = "Base Stage";
		}
		
		//this just loads the floorMap from whatever you set floorCSV to
		public function createFloorMap():void
		{
			floorMap = recycle(FlxTilemap) as FlxTilemap;
			floorMap.loadMap(new floorCSV, Assets.FLOORS_TILE, 16, 16);
		}

		//this just loads the backgroundMap from whatever you set backgroundCSV to
		public function createWallMap():void
		{
			wallMap = recycle(FlxTilemap) as FlxTilemap;
			wallMap.loadMap(new wallCSV, Assets.WALLS_TILE, 16, 16);
		}
		
		//this just loads the interactiveMap from whatever you set interactiveCSV to
		public function createInteractiveMap():void
		{
			interactiveMap = recycle(FlxTilemap) as FlxTilemap;
			
			// FLOORS_TILE does not matter, it is just used as a placeholder
			interactiveMap.loadMap(new interactiveCSV, Assets.FLOORS_TILE, 16, 16);
			
			//scan the y axis
			for (var ty:int = 0; ty < interactiveMap.heightInTiles; ty++)
			{
				//scan the x axis
				for (var tx:int = 0; tx < interactiveMap.widthInTiles; tx++)
				{			
					//check for the player start tile and store the values so the PlayState knows where to place the player on startup
					if (interactiveMap.getTile(tx, ty) == 1)
					{
						playerStartX = tx*16;
						playerStartY = ty*16;
					}
				}
			}
		}
		
		public function setDimensions():void
		{
			stageWidth = floorMap.width;
			stageHeight = floorMap.height;
		}
	}
}