//
//  MyScene.m
//  walk
//
//  Created by Austin Louden on 1/20/14.
//  Copyright (c) 2014 Austin Louden. All rights reserved.
//

#import "ALGameScene.h"

@implementation ALGameScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        // info labels
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
        myLabel.text = @"9:30 (26° F)";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        [self addChild:myLabel];
        
        // gamepad
        SKSpriteNode *upNode = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(15.0f, 15.0f)];
        upNode.position = CGPointMake(CGRectGetMaxX(self.frame)-40, 50);
        upNode.name = @"upNode";
        [self addChild:upNode];
        
        SKSpriteNode *downNode = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(15.0f, 15.0f)];
        downNode.position = CGPointMake(CGRectGetMaxX(self.frame)-40, 10);
        downNode.name = @"downNode";
        [self addChild:downNode];
        
        SKSpriteNode *leftNode = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(15.0f, 15.0f)];
        leftNode.position = CGPointMake(CGRectGetMaxX(self.frame)-60, 31);
        leftNode.name = @"leftNode";
        [self addChild:leftNode];
        
        SKSpriteNode *rightNode = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(15.0f, 15.0f)];
        rightNode.position = CGPointMake(CGRectGetMaxX(self.frame)-20, 31);
        rightNode.name = @"rightNode";
        [self addChild:rightNode];
        
        self.player = [SKSpriteNode spriteNodeWithImageNamed:@"back_still"];
        self.player.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-40);
        [self addChild:self.player];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        
        // move up
        if([node.name isEqualToString:@"upNode"]) {
            SKAction *moveAction = [SKAction moveTo:CGPointMake(self.player.position.x, self.player.position.y+30) duration:0.6f];
            [self.player runAction:moveAction];
        }
        // move down
        else if([node.name isEqualToString:@"downNode"]) {
            SKAction *moveAction = [SKAction moveTo:CGPointMake(self.player.position.x, self.player.position.y-30) duration:0.6f];
            [self.player runAction:moveAction];
        }
        // move left
        else if([node.name isEqualToString:@"leftNode"]) {
            SKAction *moveAction = [SKAction moveTo:CGPointMake(self.player.position.x-30, self.player.position.y) duration:0.6f];
            [self.player runAction:moveAction];
        }
        // move right
        else if([node.name isEqualToString:@"rightNode"]) {
            SKAction *moveAction = [SKAction moveTo:CGPointMake(self.player.position.x+30, self.player.position.y) duration:0.6f];
            [self.player runAction:moveAction];
        }

    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
