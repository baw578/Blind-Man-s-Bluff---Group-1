//
//  GameController.h
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "Player.h"

@interface GameController : UIViewController




@property (nonatomic, strong) Deck * temp;
@property (nonatomic, strong) NSMutableArray * playerArray;
@property (nonatomic, strong) Player * player1;
@property (nonatomic, strong) Player * player2;
@property (nonatomic, strong) Player * player3;
@property (nonatomic, strong) Player * player4;

@property (nonatomic, strong)UIView * mainCardArea;
@property (nonatomic, strong)UIImageView * playingCardSprite;

@property (nonatomic, strong)UIView * mainCardArea2;
@property (nonatomic, strong)UIImageView * playingCardSprite2;
@property (strong, nonatomic) IBOutlet UIButton *dealCardsOutlet;

- (IBAction)dealCardsButton:(id)sender;
@property (nonatomic, strong)UIView * mainCardArea3;
@property (nonatomic, strong)UIImageView * playingCardSprite3;
@property (nonatomic, strong)UIView * mainCardArea4;
@property (nonatomic, strong)UIImageView * playingCardSprite4;


@property (strong, nonatomic) NSString * player1EnteredName;
@property (strong, nonatomic) IBOutlet UILabel *player1NameLabel;
@property (strong, nonatomic) IBOutlet UILabel *player2NameLabel;
@property (strong, nonatomic) IBOutlet UILabel *player3NameLabel;
@property (strong, nonatomic) IBOutlet UILabel *player4NameLabel;

@property int bet;
@property (strong, nonatomic) IBOutlet UILabel *chipsPlayer1Label;
@property (strong, nonatomic) IBOutlet UILabel *chipsPlayer2Label;
@property (strong, nonatomic) IBOutlet UILabel *chipsPlayer3Label;
@property (strong, nonatomic) IBOutlet UILabel *chipsPlayer4Label;
@property (strong, nonatomic) IBOutlet UILabel *potTotalLabel;
@property int pot;

- (IBAction)player1BetAction:(id)sender;
- (IBAction)player1FoldAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *player1BetOutlet;
@property (strong, nonatomic) IBOutlet UIButton *player1FoldOutlet;
@property (strong, nonatomic) IBOutlet UIButton *player2BetOutlet;
@property (strong, nonatomic) IBOutlet UIButton *player2FoldOutlet;
@property (strong, nonatomic) IBOutlet UIButton *player3BetOutlet;
@property (strong, nonatomic) IBOutlet UIButton *player3FoldOutlet;
@property (strong, nonatomic) IBOutlet UIButton *player4BetOutlet;
@property (strong, nonatomic) IBOutlet UIButton *player4FoldOutlet;





























@end
