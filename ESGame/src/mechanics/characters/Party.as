package mechanics.characters 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxBasic;
	import mechanics.formations.Formation;
	
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Party extends FlxGroup
	{
		private var _formation: Formation;
		private var _x: uint;
		private var _y: uint;
		private var _height: uint;
		private var _width: uint;
		
		public function Party(x: uint, y: uint, width: uint, height: uint, formation: String)
		{
			super();
			
			this._x = x;
			this._y = y;
			this._width = width;
			this._height = height;
			this._formation = Formation.getFormation(formation, width, height);
		}
		
		override public function add(object: FlxBasic): FlxBasic {
			super.add(object);
			
			for (var i: uint = 0; i < members.length; i++ ) {
				if (members[i] != null) {
					members[i].x = _x + _formation.formationx[i];
					members[i].y = _y + _formation.formationy[i];
				}
			}
			
			return object;
		}
		
	}

}