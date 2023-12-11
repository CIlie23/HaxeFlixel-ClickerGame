package;

import PlayState;
import flixel.FlxState;
import flixel.util.FlxTimer;

class ClickHand extends FlxState
{
	var score:PlayState = new PlayState();

	public function clickTimerComplete():Void
	{
		// score.score += 10;
	}
}
