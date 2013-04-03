package flxpong
{
	import org.flixel.*;
	/**
	 * Simple Pong game. No sounds.
	 * 
	 * @author ChocobuckleEX
	 */
	public class PlayState extends FlxState
	{
		private var player1: Player;
		private var player2: Player;
		private var ball: Ball;
		private var player1ScoreText: FlxText;
		private var player2ScoreText: FlxText;
		private var topboundary: Boundary;
		private var bottomboundary: Boundary;
		
		private var player1Score: int;
		private var player2Score: int;
		
		
		override public function create():void
		{
			player1 = new Player(FlxG.width / 10, FlxG.height / 3, 1);
			player2 = new Player((FlxG.width / 10) * 9, FlxG.height / 3, 2);
			topboundary = new Boundary(0, 32);
			bottomboundary = new Boundary(0, FlxG.height - 32);
			ball = new Ball(FlxG.width / 2, FlxG.height / 2);
			
			player1Score = 0;
			player2Score = 0;
			
			player1ScoreText = new FlxText(FlxG.width / 4, 0, 200, player1Score.toString());
			player1ScoreText.setFormat(null, 32, 0xFFFFFFFF, "left");
			player2ScoreText = new FlxText((FlxG.width / 4) * 2, 0, 200, player2Score.toString());
			player2ScoreText.setFormat(null, 32, 0xFFFFFFFF, "right");
			
			add(player1);
			add(player2);
			add(ball);
			add(topboundary);
			add(bottomboundary);
			add(player1ScoreText);
			add(player2ScoreText);
			
			//creates state
			super.create();
		}
		override public function update():void
		{
			//ball collides with pong
			FlxG.collide(player1, ball, collidePong);
			FlxG.collide(player2, ball, collidePong);
			
			//to prevent ball from going out of bounds
			FlxG.collide(topboundary, ball);
			FlxG.collide(bottomboundary, ball);
			
			//to prevent pongs from going out of bounds
			FlxG.collide(topboundary, player1);
			FlxG.collide(topboundary, player2);
			FlxG.collide(bottomboundary, player1);
			FlxG.collide(bottomboundary, player2);
			
			//if ball goes on either side, score accordingly and reset ball.
			if (ball.x > player2.x) {
				player1ScoreText.text = (++player1Score).toString();
				ball.resetBall(1);
			}
			if (ball.x < player1.x) {
				player2ScoreText.text = (++player2Score).toString();
				ball.resetBall(2);
			}

			if (FlxG.keys.ENTER)
			{
				FlxG.resetGame();
			}
			
			super.update();
		}
		
		private function collidePong(player: Player, ball: Ball): void {
			if (player.player == 1) {
				ball.velocity.x = Math.random() * 300;
			}
			if (player.player == 2) {
				ball.velocity.x = -(Math.random() * 300);
			}
		}
	}
}