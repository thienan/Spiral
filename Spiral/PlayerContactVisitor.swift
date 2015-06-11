//
//  PlayerContactVisitor.swift
//  Spiral
//
//  Created by 杨萧玉 on 14-7-14.
//  Copyright (c) 2014年 杨萧玉. All rights reserved.
//

import Foundation
import SpriteKit
class PlayerContactVisitor:ContactVisitor{
    
    func visitPlayer(body:SKPhysicsBody){
        let thisNode = self.body.node
        let otherNode = body.node
//        println(thisNode.name+"->"+otherNode.name)
    }
    
    func visitKiller(body:SKPhysicsBody){
        let thisNode = self.body.node as! Player
        let otherNode = body.node

        if thisNode.shield {
            thisNode.shield = false
            Data.sharedData.score++
            var achievement = GameKitHelper.sharedGameKitHelper().getAchievementForIdentifier(kClean100KillerAchievementID)
            if achievement.percentComplete <= 99.0{
                achievement.percentComplete += 1
            }
            GameKitHelper.sharedGameKitHelper().updateAchievement(achievement, identifier: kClean100KillerAchievementID)
            (thisNode.parent as! GameScene).soundManager.playKiller()
        }
        else {
            thisNode.removeAllActions()
            Data.sharedData.gameOver = true
        }
    }
    
    func visitScore(body:SKPhysicsBody){
        let thisNode = self.body.node as! Player
        let otherNode = body.node

        Data.sharedData.score += 2
        var achievement = GameKitHelper.sharedGameKitHelper().getAchievementForIdentifier(kCatch500ScoreAchievementID)
        if achievement.percentComplete <= 99.8{
            achievement.percentComplete += 0.2
        }
        GameKitHelper.sharedGameKitHelper().updateAchievement(achievement, identifier: kCatch500ScoreAchievementID)
        (thisNode.parent as! GameScene).soundManager.playScore()
    }
    
    func visitShield(body:SKPhysicsBody){
        let thisNode = self.body.node as! Player
        let otherNode = body.node

        thisNode.shield = true
        Data.sharedData.score++
        var achievement = GameKitHelper.sharedGameKitHelper().getAchievementForIdentifier(kCatch500ShieldAchievementID)
        if achievement.percentComplete <= 99.8{
            achievement.percentComplete += 0.2
        }
        GameKitHelper.sharedGameKitHelper().updateAchievement(achievement, identifier: kCatch500ShieldAchievementID)
        (thisNode.parent as! GameScene).soundManager.playShield()
    }
}