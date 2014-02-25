package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.plugin.MouseEventManager;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	private var currentEnemy:FlxSprite;
	
	private var currentWorld:Int = 0;//0 = Fields
	private var comboDecayTime:Int = 1000;
	private var currentCombo:Int = 1;
	private var currentWeaponDamage:Int = 1;
	private var totalDamage:Int = 0;
	
	override public function create():Void
	{
		
		FlxG.cameras.bgColor = 0xff131c1b;
		
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();
		#end
		
		FlxG.plugins.add(new MouseEventManager());
		
		currentEnemy = new FlxSprite(320, 240);//, 100, 100);//, "BUTTON", doDamage);
		currentEnemy.loadGraphic("assets/images/Button.png", true, true, 100, 100);
		currentEnemy.health = 10;
		add(currentEnemy);
		
		//trace("poop");
		
		super.create();
		
		MouseEventManager.addSprite(currentEnemy, onDown, onUp, onOver, onOut);
	}
	
	private function onDown(Sprite:FlxSprite):Void
	{
		currentEnemy.hurt(currentWeaponDamage);
	}
	
	private function onUp(Sprite:FlxSprite):Void
	{
		Sprite.velocity.y += 5;
	}
	
	private function onOver(Sprite:FlxSprite):Void
	{
		Sprite.velocity.y -= 5;
	}
	
	private function onOut(Sprite:FlxSprite):Void
	{
		Sprite.velocity.x = 0;
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	
	override public function update():Void
	{
		
		
		totalDamage = 0;
		
		if (FlxG.mouse.justPressed) 
		{
			//if (FlxG.mouse.
		}
		
		
		totalDamage = (currentCombo * 2) * currentWeaponDamage;
		
		//doDamage(currentEnemy, totalDamage);
		
		super.update();
		
	}	
}