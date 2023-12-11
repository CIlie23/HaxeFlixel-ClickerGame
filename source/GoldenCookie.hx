import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxTimer;

class GoldenCookie extends FlxSprite
{
	var cookieSpawnTimer:FlxTimer;
	var onCookieClicked:Void->Void;
	var score:Int;

	public function new(onCookieClicked:Void->Void)
	{
		super(0, 0);

		this.onCookieClicked = onCookieClicked; // Set the callback function
		cookieSpawnTimer = new FlxTimer();
		spawnGoldenCookie();

		loadGraphic("assets/images/cookiegolden.png");
		exists = false; // we set it to false so it doesn't instantly appear
	}

	private function spawnGoldenCookie():Void
	{
		// Stolen from cookie clicker hehe 26 78
		var minInterval:Float = 26;
		var maxInterval:Float = 78;
		var randomInterval:Float = Math.random() * (maxInterval - minInterval) + minInterval;

		// Set the timer to call the spawn function after the random interval
		cookieSpawnTimer.start(randomInterval, function(timer:FlxTimer):Void
		{
			// Set the golden cookie's position to a random location on the screen
			x = Math.random() * (FlxG.width - width);
			y = Math.random() * (FlxG.height - height);
			exists = true;

			// Reset the timer for the next spawn
			spawnGoldenCookie();
		});
	}
	/*private function onGoldenCookieClicked():Void
		{
			score += 10;
			exists = false;
			spawnGoldenCookie();
			// onCookieClicked(); // Call the callback function
	}*/
}
