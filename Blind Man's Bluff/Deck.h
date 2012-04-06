//
//  Deck.h
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 1/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "card.h"

@interface Deck : NSObject

@property (nonatomic, strong) NSMutableArray * cardDeck;
-(id)initWithFullDeck;
-(void)logThisDeck;
-(void)shuffle;
-(id)dealACard;

@end
