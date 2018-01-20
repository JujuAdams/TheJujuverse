///@function rousr_sprite_atlas_definitions()
///@desc definitions / enums for sprite atlases
///@extensionizer { "export": false, "docs": false }
enum ERousrSpriteAtlas {
		SpriteList = 0,
		SpriteStack, // sprites added but not flushed
		BinPack,
		Surface,
		
		Num
};

enum ERousrAtlasSprite {
	Sprite = 0,
	Image,
	PackedId,
	PackedRect,
	UVs,
	
	Num
};