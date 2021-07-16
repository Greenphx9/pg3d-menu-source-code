#import "Menu.h"
#import <string.h>
#import "Vector2.hpp"
#import "Unity.h"
#import "Vector3Header.hpp"

float speedValue = [menu getFloat:@"Speed Modifier"];
float jumpValue = [menu getFloat:@"Jump Modifier"];
//上丙下丅丝专与不下 - PhotonPlayer
void *(*Fly)(void *instance, bool isOn);
void *(*XRay)(void *instance, bool isOn);
void *(*Noclip)(void *instance, float radius);
void *(*ChatSpam)(void *instance, void *msg, bool clanLogo, void *msg2);
void *(*AddWeapon)(void *instance, int weaponRecord, int score, bool equipIfNeeded, bool fromProviding, int _ammoInClip, int _ammoInBackpack);
//void *(*Component_GetTransform)(void *component);
//Vector3 (*Transform_get_localScale)(void *transform);
//void *(*Transform_set_localScale)(void *transform, Vector3 pos);
//void *(*AddTryGun)(void *instance, int index);
//Vector3 (*Transform_get_position)(void *transform);
//void *(*Transform_set_position)(void *transform, Vector3 pos);
//void *(*Component_get_gameObject)(void* component);
void* il2cpp_string_new(const char* str)
{

    static void* (*il2cpp_string_new_pointer)(const char* str) =
            (void* (*)(const char* str))[UIKeyPatch getRealOffset:@"0x104CC4BB4"]; //CreateString
    return il2cpp_string_new_pointer(str);
}

template <typename T> std::string tostr(const T& t) {
    std::ostringstream os;
    os<<t;
    return os.str();
}

void (*_PlayerMoveCUpdate) (void *playermovec);
void PlayerMoveCUpdate (void *playermovec){
	if(playermovec != NULL) {
		
bool isMine = *(bool*)[UIKeyPatch address:@"0x541" ptr:playermovec];
if(isMine)
{
if([menu getSwitchOnForSwitch:@"Fly Hack"]) {
			Fly(playermovec, true);
		}
		//why does weaponsounds lateupdate gotta stop working for me >:(
void* weaponsounds = *(void **)[UIKeyPatch address:@"0x5B8" ptr:playermovec]; //一丏丘东丂丟丒万七
if([menu getSwitchOnForSwitch:@"Silent Aim"]){
			*(bool*)[UIKeyPatch address:@"0x149" ptr:weaponsounds] = true;  //isRoundMelee
			*(float*)[UIKeyPatch address:@"0x13C" ptr:weaponsounds] = 10000.0; //radiusRoundMelee
		}
		if([menu getSwitchOnForSwitch:@"Ignore Shields"]){
			*(bool*)[UIKeyPatch address:@"0xE8" ptr:weaponsounds] = true;  //ignoreBarrier
			*(bool*)[UIKeyPatch address:@"0xEA" ptr:weaponsounds] = true;  //ignoreReflector
			*(bool*)[UIKeyPatch address:@"0xE9" ptr:weaponsounds] = true;  //ignoreSlyWolf
		}
		if([menu getSwitchOnForSwitch:@"Drop Coins"]){
			*(bool*)[UIKeyPatch address:@"0x2B0" ptr:weaponsounds] = true;  //isCoinDrop
			*(float*)[UIKeyPatch address:@"0x2B4" ptr:weaponsounds] = 1000000000000.0; //coinDropChance
		}

		if([menu getSwitchOnForSwitch:@"Double Jump"]){
			*(bool*)[UIKeyPatch address:@"0x353" ptr:weaponsounds] = true;  //isDoubleJump
		}
		if([menu getSwitchOnForSwitch:@"No Cat Spam Cooldown"]){
			*(bool*)[UIKeyPatch address:@"0x548" ptr:weaponsounds] = false;  //is3CatSpam
		}
		if([menu getSwitchOnForSwitch:@"Critical Hits"]){
			*(int*)[UIKeyPatch address:@"0x358" ptr:weaponsounds] = 10000; //criticalHitChance
		}
		if([menu getSwitchOnForSwitch:@"1 Hit Kill"]){
			*(bool*)[UIKeyPatch address:@"0x1A8" ptr:weaponsounds] = true; //isPoisoning
			*(float*)[UIKeyPatch address:@"0x1B0" ptr:weaponsounds] = 1000.0; //poisonDamageMultiplier
		}
		if([menu getSwitchOnForSwitch:@"Fully Charged"]){
			*(float*)[UIKeyPatch address:@"0x194" ptr:weaponsounds] = 0.0f; //chargeTime
		}
		if([menu getSwitchOnForSwitch:@"Killed Target Explodes"]){
			*(bool*)[UIKeyPatch address:@"0x298" ptr:weaponsounds] = true; //isKilledTargetExplode
		}
//@"Default", @"Rockets", @"Lasers", @"Shotgun", @"Harpoon", @"Dash", @"Exploding Bullets"
		if([menu getIndexForString:@"Shoot..."] == 1/*Rockets*/){
			*(bool*)[UIKeyPatch address:@"0xEB" ptr:weaponsounds] = true;  //bazooka
			*(float*)[UIKeyPatch address:@"0x108" ptr:weaponsounds] = 10000.0; //bazookaExplosionRadius	
		}	
		if([menu getIndexForString:@"Shoot..."] == 2/*Lasers*/){
			*(bool*)[UIKeyPatch address:@"0x16C" ptr:weaponsounds] = true;  //railgun	
		}
		if([menu getIndexForString:@"Shoot..."] == 3/*Shotgun*/){
			*(bool*)[UIKeyPatch address:@"0x15A" ptr:weaponsounds] = true;  //isShotgun	
		}
		if([menu getIndexForString:@"Shoot..."] == 4/*Harpoon*/){
			*(bool*)[UIKeyPatch address:@"0x23C" ptr:weaponsounds] = true;  //harpoon
		}	
		if([menu getIndexForString:@"Shoot..."] == 5/*Dash*/){
			*(bool*)[UIKeyPatch address:@"0x22C" ptr:weaponsounds] = true;  //isDash
		}
		if([menu getIndexForString:@"Shoot..."] == 6/*Exploding Bullets*/){
			*(bool*)[UIKeyPatch address:@"0x159" ptr:weaponsounds] = true;  //bulletExplode
		}
		if([menu getIndexForString:@"Shoot Effect..."] == 1/*Charm*/){
			*(bool*)[UIKeyPatch address:@"0x208" ptr:weaponsounds] = true;  //isCharm
		}	
		if([menu getIndexForString:@"Shoot Effect..."] == 2/*Poison*/){
			*(bool*)[UIKeyPatch address:@"0x1A8" ptr:weaponsounds] = true;  //isPoison	
		}
		if([menu getIndexForString:@"Shoot Effect..."] == 3/*Blindness*/){
			*(bool*)[UIKeyPatch address:@"0x1FC" ptr:weaponsounds] = true;  //isBlindEffect
		}
		if([menu getIndexForString:@"Shoot Effect..."] == 4/*Weakness*/){
			*(bool*)[UIKeyPatch address:@"0x210" ptr:weaponsounds] = true;  //isWeakness
		}	
		if([menu getIndexForString:@"Shoot Effect..."] == 5/*JumpDisabler*/){
			*(bool*)[UIKeyPatch address:@"0x1BD" ptr:weaponsounds] = true;  //jumpDisabler
		}
		if([menu getSwitchOnForSwitch:@"Enemies are sheep"]){
			*(bool*)[UIKeyPatch address:@"0x26C" ptr:weaponsounds] = true; //polymorpher
		}
}	
				
	if([menu getSwitchOnForSwitch:@"Chat Spam"]) {
			
		}
	if([menu getSwitchOnForSwitch:@"X-Ray Hack"]) {
			XRay(playermovec, true);
		}
	_PlayerMoveCUpdate(playermovec);
		}
}


void (*_FPCSUpdate) (void *firstperson);
void FPCSUpdate (void *firstperson){
	if(firstperson != NULL) {
		void* skinName = *(void **)[UIKeyPatch address:@"0x140" ptr:firstperson]; //三万不丗万专丁丞丅
		void* characterController = *(void **)[UIKeyPatch address:@"0x58" ptr:skinName]; //character
			if([menu getSwitchOnForSwitch:@"Noclip"]) {
				Noclip(characterController, INFINITY);
				}else{
				Noclip(characterController, 0.35f);	
				}

	}
	_FPCSUpdate(firstperson);
}

void (*_PlayerMoveCUpdateSkin) (void *playermovec);
void PlayerMoveCUpdateSkin (void *playermovec){
	if(playermovec != NULL) {
	_PlayerMoveCUpdateSkin(playermovec);
		}
}

std::string object;

void setUp() {

    	Fly = (void *(*)(void *, bool))[UIKeyPatch getRealOffset:@"0x101D44B2C"]; //丘不丌丅丌丄丝三丆
    	XRay = (void *(*)(void *, bool))[UIKeyPatch getRealOffset:@"0x101D5B34C"]; //且丂丙丌上丕丛丞丙
    	Noclip = (void *(*)(void *, float))[UIKeyPatch getRealOffset:@"0x104B3D32C"]; //radius
    	ChatSpam = (void *(*)(void *, void*, bool, void*))[UIKeyPatch getRealOffset:@"0x101D41B4C"]; //SendChat
    	AddCoins = (void *(*)(void *, int, bool, int))[UIKeyPatch getRealOffset:@"0x102DD1168"]; //丒与丒业不丆丆丐业
    	//AddWeapon = (void *(*)(void *, int, int, bool, bool, int, int))[UIKeyPatch getRealOffset:@"0x102616398"]; //丏丒不丐世丐不与下
    	//Component_GetTransform = (void *(*)(void *))[UIKeyPatch getRealOffset:@"0x104ADA2C8"]; //Component$$get_transform
    	//Transform_get_localScale = (Vector3 (*)(void *))[UIKeyPatch getRealOffset:@"0x104B0A064"]; //Transform$$get_localScale
    	//Transform_set_localScale = (void *(*)(void *, Vector3))[UIKeyPatch getRealOffset:@"0x104B0A110"]; //Transform$$set_localScale
	//AddTryGun = (void *(*)(void *, int))[UIKeyPatch getRealOffset:@"0x10261DCF4"]; //丒与丒业不丆丆丐业
    	//Transform_get_position = (Vector3 (*)(void *))[UIKeyPatch getRealOffset:@"0x104B093A8"]; //Transform$$get_position
    	//Transform_set_position = (void *(*)(void *, Vector3))[UIKeyPatch getRealOffset:@"0x104B09454"]; //Transform$$set_position
		[r16Hook hook:@"0x101D607D4"
				with:(void *)PlayerMoveCUpdate 
				original:(void **)&_PlayerMoveCUpdate];	

		[r16Hook hook:@"0x102B81A10"
				with:(void *)FPCSUpdate 
				original:(void **)&_FPCSUpdate];	

		[r16Hook hook:@"0x102DCDEBC"
				with:(void *)BankControllerUpdate 
				original:(void **)&_BankControllerUpdate];	

		/*[r16Hook hook:@"0x10296CDD0"
				with:(void *)SpeedModif 
				original:(void **)&_SpeedModif];

		[r16Hook hook:@"0x102968C1C"
				with:(void *)JumpModif 
				original:(void **)&_JumpModif];	*/

		[r16Hook hook:@"0x101D5A38C"
				with:(void *)PlayerMoveCUpdateSkin 
				original:(void **)&_PlayerMoveCUpdateSkin]; //东且丕丕丕丕丈七世	

	

		/*[menu addPatch:@"Level Spoofer"
      description:@"" 
  	offsets:@[@"0x102B66B24"] //丝丞与东丏丂下丏丄
        hexPatches:@[@"0x200880D2C0035FD6"]];*/

		[menu addPatch:@"EXP Spoofer"
      description:@"" 
  	offsets:@[@"0x102B68378"] //丁三东丁业上丕丙丌
        hexPatches:@[@"0x001D90D2C0035FD6"]];

		[menu addPatch:@"Armor Regen"
      description:@"" 
  	offsets:@[@"0x1029896EC"] //丞丄丂上三丁不丗丏
        hexPatches:@[@"0x200080D2C0035FD6"]];

		[menu addPatch:@"Health Regen"
      description:@"" 
  	offsets:@[@"0x102989754"] //专丅万专不丙丒丟与
        hexPatches:@[@"0x200080D2C0035FD6"]];

		[menu addPatch:@"High Speed"
      description:@"" 
  	offsets:@[@"0x10298A66C"] 
        hexPatches:@[@"0x00F0271EC0035FD6"]];

		[menu addPatch:@"High Jump"
      description:@"" 
  	offsets:@[@"0x1029864B8"] 
        hexPatches:@[@"0x00F0271EC0035FD6"]];

		[menu addPatch:@"Rapid Fire"
      description:@"" 
  	offsets:@[@"0x102C7B9BC"] 
        hexPatches:@[@"0x00F0271EC0035FD6"]];

		[menu addPatch:@"Accelerated Reload Speed"
      		description:@"Decreases reload speed" 
  	offsets:@[@"0x10298C44C"] //业丌七丈下三丟七业
        hexPatches:@[@"0x00F0271EC0035FD6"]];

		[menu addPatch:@"Extra Backpack Ammo"
      		description:@"Increases ammo in your backpack (to reload)." 
  	offsets:@[@"0x1029897BC"] //丛丂丙不丟丁丕东万
        hexPatches:@[@"0x00F0271EC0035FD6"]];

		[menu addPatch:@"Godmode"
      		description:@"Found by Green16#5211." 
  	offsets:@[@"0x101D8CE14"] //丌丙世七丘丝与丏且
        hexPatches:@[@"0x000080D2C0035FD6"]];

		[menu addPatch:@"Always Go"
      		description:@"Always move when there is a timer." 
  	offsets:@[@"0x101D2FF1C"] //丞丗上丈三丏丑专丈
        hexPatches:@[@"0x200080D2C0035FD6"]];

		[menu addPatch:@"No Recoil"
          description:@"Removes weapon recoil, making the crosshair not go up." 
             offsets:@[@"0x10298E2C4"] //三丐专下丏丟下一不
             hexPatches:@[@"0x200080D2C0035FD6"]];

		[menu addPatch:@"No Spread"
          description:@"Removes bullet spread, making bullets go directly where you shoot." 
             offsets:@[@"0x101D9E214"] //丙丁丝丕下与丆七不
             hexPatches:@[@"0x000080D2C0035FD6"]];

		[menu addPatch:@"Free Super Chests"
          description:@"Super chests cost 0 points, meaning they are free." 
             offsets:@[@"0x1022433DC"] //丂不丘一丙丈丏丗与
             hexPatches:@[@"0x000080D2C0035FD6"]];

		[menu addPatch:@"Critical Hits"
          description:@"All hits are Critical." 
             offsets:@[@"0x102655480"] //NextHitCritical
             hexPatches:@[@"0x200080D2C0035FD6"]];

		[menu addPatch:@"Freedom"
          description:@"Makes weapons and stuff free. Doesn't work with most categories (like weapons!)." 
             offsets:@[@"0x102789034"] //丈丅专七下一丈与业
             hexPatches:@[@"0x000080D2C0035FD6"]];

		[menu addPatch:@"BattlePass Freedom"
          description:@"Freedom for battlepass." 
             offsets:@[@"0x1031D2D00", @"0x1031D2D68", @"0x1031D2DD0"] //get_PremiumPrice, get_LevelPrice, get_PremiumPriceWithLevels
             hexPatches:@[@"0x000080D2C0035FD6", @"0x000080D2C0035FD6", @"0x000080D2C0035FD6"]];

		/*[menu addPatch:@"Freedom for Weapons"
          description:@"." 
             offsets:@[@"0x102602C00", @"0x102602E58"] 
             hexPatches:@[@"0x200080D2C0035FD6", @"0x800C80D2C0035FD6"]];*/

		[menu addPatch:@"Friendly Fire"
          description:@"Makes its so you can kill your teammates." 
             offsets:@[@"0x102C348CC"] //丘专丐丗丁专与丂丌
             hexPatches:@[@"0x000080D2C0035FD6"]];

		[menu addPatch:@"Gem Drops"
          description:@"" 
             offsets:@[@"0x101CBD048", @"0x101CB8810"] //一且且与丅丑丕丁丄, 东丒万上且丅丕且丞
             hexPatches:@[@"0x200080D2C0035FD6", @"0x200180D2C0035FD6"]];

		[menu addPatch:@"Anti Self-Kill"
          description:@"Found by Chewy" 
             offsets:@[@"0x101D8C58C", @"0x101D8C3B8", @"0x101D81864", @"0x101D8C518"] //丄七丌丑丂丟丌业业, 丝丁丂万丕丏丘丏不, 丗东世丐丟专东丙丕, 丛丘东丂丗与一丗专
             hexPatches:@[@"0xC0035FD6", @"0xC0035FD6", @"0xC0035FD6", @"0xC0035FD6"]];

		[menu addIndexSwitch:@"Shoot..." 
	description:@"" 
	items:@[@"Default", @"Rockets", @"Lasers", @"Shotgun", @"Harpoon", @"Dash", @"Exploding Bullets"]];

		[menu addIndexSwitch:@"Shoot Effect..." 
	description:@"" 
	items:@[@"Default", @"Charm", @"Poison", @"Blindness", @"Weakness", @"Disable Jumps"]];

		[menu addSwitch:@"1 Hit Kill"
			description:@"Kicks you but you can 1 shot everybody (poison damage)"];

		[menu addSwitch:@"Fly Hack"
			description:@"Permantly enables jetpack." ];

		[menu addSwitch:@"Fully Charged"
			description:@"All charge weapons are fully charged." ];

		[menu addSwitch:@"X-Ray Hack"
			description:@"Lets you see through walls." ];

		[menu addSwitch:@"Silent Aim"
			description:@"SUPER OP." ];

		[menu addSwitch:@"Ignore Shields"
			description:@"Your weapons will ignore Sly wolf, Reflector and Barriers."];

		[menu addSwitch:@"Drop Coins"
			description:@"Enemy kills will drop coins."];

		[menu addSwitch:@"Double Jump"
			description:@""];
		
		[menu addSwitch:@"Noclip"
			description:@""];

		[menu addSwitch:@"Killed Target Explodes"
			description:@""];

		[menu addSwitch:@"Chat Spam"
			description:@""];

		[menu addPatch:@"Rent Weapon"
      description:@"All weapons can be equipped (They say rented)" 
  	offsets:@[@"0x10261389C"] //丒丕丄业丙专丛丘世
        hexPatches:@[@"0x200080D2C0035FD6"]];
}

void startAuthentication() {

	#import "r16Logo.h"

     menu.socialShareMessage = @"Im using Pixel Gun 3D Cheats by Greenphx & Green16";
     menu.sharingIconBorderColor = rgba(0xffffff, 1.0);

	//only color that needs to be set
     r16Theme.baseColor = rgba(0x16549C, 0.9);
     //r16Theme.headerBackground = rgba(0x5f04cf, 1.0);
     //r16Theme.footerBackground = rgba(0x5f04cf, 1.0);
     //r16Theme.menuBackground = rgba(0x7300ff, 0.9);
     //r16Theme.keyOnColor = rgba(0x8423fa,1.0);
     //r16Theme.keyOffColor = rgba(0x7b00ff,0.9);
     //r16Theme.menuShadowColor = rgba(0x7200fc, 0.9);

    [menu closeTaps:1 width:270 
          maxVisableToggles:5
          title:@"Pixel Gun 3D 21.4.4" 
          credits:@"Made by Greenphx & Green16"];
    setUp();
}


static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
    timer(0.1){
        startAuthentication();
    });
}

void launchEvent() {
    CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDrop);
}

__attribute__((constructor)) static void initialize() {
    launchEvent();
}
