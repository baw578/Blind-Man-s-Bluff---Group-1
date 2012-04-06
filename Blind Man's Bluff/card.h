//
//  card.h
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString * suit;
@property int value;
@property (nonatomic, strong) NSString * cardValueName;
@property CGPoint cardCenter;

-(void)logThisCard;
-(id)initWithSuit: (NSString *)newSuit andWithValue:(int)cardValue andWithCenter:(CGPoint)theCenter;

@end
