package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	private var startButton:FlxButton;
	
	override public function create():Void
	{
		
		FlxG.cameras.bgColor = 0xff131c1b;
		
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();
		#end
		
		startButton = new FlxButton(320, 240, "START", onStart);
		add(startButton);
		
		
		super.create();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}
	
	override public function update():Void
	{
		super.update();
	}	
	
	private function onStart():Void
	{
		FlxG.cameras.fade(FlxColor.BLACK, 1, false, onFade);
	}
	
	private function onFade():Void
	{
		FlxG.switchState(new PlayState());
	}
}