package;

import GoldenCookie;
import NecoArc;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.FlxBaseKeyList;
import flixel.input.mouse.FlxMouseButton;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;
import openfl.text.Font;

class PlayState extends FlxState
{
	public static var score:Int = 0;

	var scoreText:FlxText;
	var cookie:FlxButton;
	var goldenCookie:GoldenCookie;
	var alwaysRight:Bool = NecoArc.alwaysRight;
	var necoTimer:FlxTimer;
	// var necoTimer:FlxTimer = NecoArc.necoTimer;
	// var handButton:FlxButton;
	var bg:FlxSprite;
	var hud:FlxSprite;
	var shine:FlxSprite;
	var crunchSound:FlxSound;

	var neco:NecoArc;

	// var menuButton:FlxButton;

	override public function create()
	{
		super.create();

		crunchSound = FlxG.sound.load("assets/sounds/crunch.ogg");

		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/placeholder.jpg");
		bg.screenCenter();
		add(bg);

		hud = new FlxSprite(0, 0);
		hud.loadGraphic("assets/images/hud.png");
		hud.screenCenter();
		add(hud);

		shine = new FlxSprite(0, 0);
		shine.loadGraphic("assets/images/shine.png");
		shine.screenCenter();
		add(shine);

		// menuButton = new FlxButton(100, 100, "Hello mom", onMenuButtonClick);
		// menuButton.loadGraphic("assets/images/clickBuy.jpg");
		// add(menuButton);

		scoreText = new FlxText(250, 0, "0 Cookies");
		scoreText.size = 16;
		// scoreText.screenCenter();
		scoreText.setFormat("assets/fonts/font.ttf", 20);
		add(scoreText);

		cookie = new FlxButton(100, 100, "", onCookieButtonClick);
		cookie.loadGraphic("assets/images/cookie.png");
		cookie.screenCenter();
		add(cookie);

		goldenCookie = new GoldenCookie(onGoldenCookieClicked);
		add(goldenCookie);

		neco = new NecoArc(0, 310);
		add(neco);

		// addNecoCookies();
	}

	var cookieTween:FlxTween;

	function onCookieButtonClick()
	{
		// crunchSound.play();
		score += 1;
		scoreText.text = score + " Cookies";

		if (cookieTween == null)
			cookieTween = FlxTween.tween(cookie.scale, {x: 0.9, y: 0.9}, 1, {ease: FlxEase.quadInOut, type: FlxTweenType.BACKWARD});
		else
			cookieTween.start();

		// neco.animation.play("drinking");
	}

	/*function onMenuButtonClick()
		{
			score -= 10;

			if (score < 0)
			{
				score = 0;
			}
	}*/
	override public function update(elapsed:Float)
	{
		cookie.angle++;
		shine.angle--;

		super.update(elapsed);
		// Check if the left mouse button was just clicked
		if (FlxG.mouse.justPressed)
		{
			// Check if the mouse pointer is over the goldenCookie sprite
			if (FlxG.mouse.x >= goldenCookie.x
				&& FlxG.mouse.x <= goldenCookie.x + goldenCookie.width
				&& FlxG.mouse.y >= goldenCookie.y
				&& FlxG.mouse.y <= goldenCookie.y + goldenCookie.height)
			{
				// The mouse clicked the goldenCookie, so you can perform some actions here
				onGoldenCookieClicked();
				// score += 10;
			}
		}

		// addNecoCookies();
	}

	private function onGoldenCookieClicked():Void
	{
		// Handle the goldenCookie click event here
		// trace("Golden Cookie Clicked!");
		crunchSound.play();
		score += 10;
		scoreText.text = score + " Cookies";
		goldenCookie.exists = false;
		// spawnGoldenCookie();
	}
	/*private function addNecoCookies():Void
		{
			necoTimer.start(5);
			{
				score += 100;
				scoreText.text = score + " Cookies";
			}
	}*/
}
