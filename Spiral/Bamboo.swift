//
//  Bamboo.swift
//  Spiral
//
//  Created by 杨萧玉 on 15/5/1.
//  Copyright (c) 2015年 杨萧玉. All rights reserved.
//

import SpriteKit

class Bamboo: SKSpriteNode {
    let maxLength:CGFloat
    let fixWidth:CGFloat = 5
    init(length:CGFloat){
        
        let texture = SKTexture(imageNamed: "bamboo2")
        maxLength = texture.size().height / (texture.size().width / fixWidth)
        let size = CGSize(width: fixWidth, height: min(length,maxLength))
        super.init(texture: SKTexture(rect: CGRect(origin: CGPointZero, size: CGSize(width: 1, height: min(length / maxLength, 1))), inTexture: texture),color:SKColor.clearColor(), size: size)
        normalTexture = texture.textureByGeneratingNormalMapWithSmoothness(0.5, contrast: 0.4)
        lightingBitMask = playerLightCategory|killerLightCategory|scoreLightCategory|shieldLightCategory|reaperLightCategory
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
