package;

import PlayState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

class NecoArc extends FlxSprite
{
	public static var necoTimer:FlxTimer;

	public static var alwaysRight:Bool = true;

	public static var gameScore:PlayState;

	var score:Int = PlayState.score;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		necoTimer = new FlxTimer();
		necoTimer.start(5, addNecoCookies, 0);

		loadGraphic("assets/images/necoarc.png");
		frames = FlxAtlasFrames.fromSparrow("assets/images/necoarc.png", "assets/images/necoarc.xml");
		animation.addByPrefix("drinking", "neco arc drinking", 24);
		animation.addByPrefix("chilling", "neco arc glass", 24, true);
		animation.play("chilling");
	}

	public function addNecoCookies(timer:FlxTimer):Void
	{
		score += 100;
	}
}
// https://stackoverflow.com/questions/74081405/how-do-i-create-an-animation-using-an-xml-file-with-haxeflixel
