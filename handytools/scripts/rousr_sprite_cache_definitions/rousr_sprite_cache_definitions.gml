///@function rousr_sprite_cache_definitions()
///@desc enums / macros / defs
///@extensionizer { "export": false, "docs": false }
enum ERousrSpriteCache {
	SpriteMap = 0,
	SpriteList,
	SpriteStack,
	AtlasList,
	
	Width,
	Height,
	
	Num,
};

enum ERousrCachedSprite {
	ParentAtlas = 0,
	AtlasIndex,
		
	
	SpriteIndex,
	ImageIndex,
	UVs,
	
	Num
}; 