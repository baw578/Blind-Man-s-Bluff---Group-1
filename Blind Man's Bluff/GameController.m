//
//  GameController.m
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"
#import "Player.h"

@interface GameController ()

@end

@implementation GameController
@synthesize dealCardsOutlet;
@synthesize player1BetOutlet;
@synthesize player1FoldOutlet;
@synthesize player2BetOutlet;
@synthesize player2FoldOutlet;
@synthesize player3BetOutlet;
@synthesize player3FoldOutlet;
@synthesize player4BetOutlet;
@synthesize player4FoldOutlet;
@synthesize roundLabel;
@synthesize player1EnteredName;
@synthesize player1NameLabel;
@synthesize player2NameLabel;
@synthesize player3NameLabel;
@synthesize player4NameLabel;
@synthesize chipsPlayer1Label;
@synthesize chipsPlayer2Label;
@synthesize chipsPlayer3Label;
@synthesize chipsPlayer4Label;
@synthesize potTotalLabel;
@synthesize temp, playingCardSprite, mainCardArea, playingCardSprite2, mainCardArea2, playingCardSprite3, mainCardArea3,playingCardSprite4, mainCardArea4;
@synthesize player1, player2, player3, player4;
@synthesize playerArray;
@synthesize bet, pot;


@synthesize round;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    round = 1;
    roundLabel.text = [NSString stringWithFormat: @"%d",round];
    [self initPlayers];
    [self disableBetting];
    //[self dealCards];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setPlayer1NameLabel:nil];
    [self setPlayer2NameLabel:nil];
    [self setPlayer3NameLabel:nil];
    [self setPlayer4NameLabel:nil];
    [self setChipsPlayer1Label:nil];
    [self setChipsPlayer2Label:nil];
    [self setChipsPlayer3Label:nil];
    [self setChipsPlayer4Label:nil];
    [self setPotTotalLabel:nil];
    [self setPlayer1BetOutlet:nil];
    [self setPlayer1FoldOutlet:nil];
    [self setPlayer2BetOutlet:nil];
    [self setPlayer2FoldOutlet:nil];
    [self setPlayer3BetOutlet:nil];
    [self setPlayer3FoldOutlet:nil];
    [self setPlayer4BetOutlet:nil];
    [self setPlayer4FoldOutlet:nil];
    [self setDealCardsOutlet:nil];
    [self setRoundLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIDeviceOrientationLandscapeLeft || 
    interfaceOrientation == UIDeviceOrientationLandscapeRight;
	return YES;
}

#pragma mark Init
-(void)setInitialChipCount{
    int chipStartingAmount = 2500;
    player1.chipCount = chipStartingAmount;
    player2.chipCount = chipStartingAmount;
    player3.chipCount = chipStartingAmount;
    player4.chipCount = chipStartingAmount;
    [self updateChipLabels];
    dealCardsOutlet.hidden = NO;
}

-(void)updateChipLabels{
    chipsPlayer1Label.text = [NSString stringWithFormat:@"%d", player1.chipCount];
    chipsPlayer2Label.text = [NSString stringWithFormat:@"%d", player2.chipCount];
    chipsPlayer3Label.text = [NSString stringWithFormat:@"%d", player3.chipCount];
    chipsPlayer4Label.text = [NSString stringWithFormat:@"%d", player4.chipCount];
    potTotalLabel.text = [NSString stringWithFormat:@"%d", pot];
}

-(void)updatePlayerNameLables{
    player1NameLabel.text = player1.playerName;
    player2NameLabel.text = player2.playerName;
    player3NameLabel.text = player3.playerName;
    player4NameLabel.text = player4.playerName;
}

- (void) initPlayers{
    if (!playerArray) {
        playerArray = [[NSMutableArray alloc] initWithCapacity:4];
    }
    if ([player1EnteredName isEqualToString:@""]) {
        player1EnteredName = @"Player 1";
    }
    Player * tempPlayer1 = [[Player alloc] initPlayer:player1EnteredName andWithValue:2500 andWithBool:YES andWithCardValue:0];
    Player * tempPlayer2 = [[Player alloc] initPlayer:@"Player 2" andWithValue:2500 andWithBool:NO andWithCardValue:0];
    Player * tempPlayer3 = [[Player alloc] initPlayer:@"Player 3" andWithValue:2500 andWithBool:NO andWithCardValue:0];
    Player * tempPlayer4 = [[Player alloc] initPlayer:@"Player 4" andWithValue:2500 andWithBool:NO andWithCardValue:0];
    [playerArray addObject:tempPlayer1];
    [playerArray addObject:tempPlayer2];
    [playerArray addObject:tempPlayer3];
    [playerArray addObject:tempPlayer4];
    player1 = tempPlayer1;
    player2 = tempPlayer2;
    player3 = tempPlayer3;
    player4 = tempPlayer4;
    NSLog(@"\nPlayer1: %@\nChip Value: %d\nIs Human: %d",player1.playerName ,player1.chipCount,player1.playerTypeHuman);
    NSLog(@"\nPlayer2: %@\nChip Value: %d\nIs Human: %d",player2.playerName,player2.chipCount,player2.playerTypeHuman);
    NSLog(@"\nPlayer3: %@\nChip Value: %d\nIs Human: %d",player3.playerName,player3.chipCount,player3.playerTypeHuman);
    NSLog(@"\nPlayer4: %@\nChip Value: %d\nIs Human: %d",player4.playerName,player4.chipCount,player4.playerTypeHuman);
    [self updateChipLabels];
    [self updatePlayerNameLables];
}

#pragma mark Deal
- (IBAction)dealCardsButton:(id)sender {
    [self dealCards];
}

-(void) dealCards{
    dealCardsOutlet.hidden = YES;
    temp = [[Deck alloc]initWithFullDeck];
    
    [temp shuffle];
    Card * tempCard1 = [temp dealACard];
    
    //pick card value
    //tempCard1.value = 7;
    
    [tempCard1 logThisCard];
    player1.playerValueOfCard = tempCard1.value;
    
    //display first delt card
    if (!playingCardSprite) {
        playingCardSprite = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cards.png"]];}
    if (!mainCardArea) {
        mainCardArea = [[UIView alloc] initWithFrame:CGRectMake(125, 125, 70, 96)]; }
    
    CGPoint currentPosition = playingCardSprite.center;
    currentPosition.x = tempCard1.cardCenter.x;
    currentPosition.y = tempCard1.cardCenter.y-1;
    playingCardSprite.center = currentPosition;
    
    mainCardArea.clipsToBounds = YES;
    
    [mainCardArea addSubview:playingCardSprite];
    [self.view addSubview:mainCardArea];
    mainCardArea.hidden = YES;
    
    
    Card * tempCard2 = [temp dealACard];
    
    //pick card value
    //tempCard2.value = 7;
    
    [tempCard2 logThisCard];
    
    player2.playerValueOfCard = tempCard2.value;
    
    //display second delt card
    if (!playingCardSprite2) {
        playingCardSprite2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cards.png"]];}
    if (!mainCardArea2) {
        mainCardArea2 = [[UIView alloc] initWithFrame:CGRectMake(824, 125, 70, 96)]; }
    
    CGPoint currentPosition2 = playingCardSprite2.center;
    currentPosition2.x = tempCard2.cardCenter.x;
    currentPosition2.y = tempCard2.cardCenter.y-1;
    playingCardSprite2.center = currentPosition2;
    
    mainCardArea2.clipsToBounds = YES;
    
    [mainCardArea2 addSubview:playingCardSprite2];
    [self.view addSubview:mainCardArea2];
    
    Card * tempCard3 = [temp dealACard];
    
    //pick card value
    //tempCard3.value = 7;
    
    [tempCard3 logThisCard]; 
    player3.playerValueOfCard = tempCard3.value;
    
    //display third delt card
    if (!playingCardSprite3) {
        playingCardSprite3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cards.png"]];}
    if (!mainCardArea3) {
        mainCardArea3 = [[UIView alloc] initWithFrame:CGRectMake(824, 523, 70, 96)]; }
    
    CGPoint currentPosition3 = playingCardSprite3.center;
    currentPosition3.x = tempCard3.cardCenter.x;
    currentPosition3.y = (tempCard3.cardCenter.y-1);
    playingCardSprite3.center = currentPosition3;
    
    mainCardArea3.clipsToBounds = YES;
    
    [mainCardArea3 addSubview:playingCardSprite3];
    [self.view addSubview:mainCardArea3];
    
    Card * tempCard4 = [temp dealACard];
    
    //pick card value
    //tempCard4.value = 5;
    
    [tempCard4 logThisCard]; 
    player4.playerValueOfCard = tempCard4.value;
    
    //display third delt card
    if (!playingCardSprite4) {
        playingCardSprite4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cards.png"]];}
    if (!mainCardArea4) {
        mainCardArea4 = [[UIView alloc] initWithFrame:CGRectMake(125, 523, 70, 96)]; }
    
    CGPoint currentPosition4 = playingCardSprite4.center;
    currentPosition4.x = tempCard4.cardCenter.x;
    currentPosition4.y = (tempCard4.cardCenter.y-1);
    playingCardSprite4.center = currentPosition4;
    
    mainCardArea4.clipsToBounds = YES;
    
    [mainCardArea4 addSubview:playingCardSprite4];
    [self.view addSubview:mainCardArea4];
    mainCardArea.alpha = 1.0;
    mainCardArea2.alpha = 1.0;
    mainCardArea3.alpha = 1.0;
    mainCardArea4.alpha = 1.0;
    [self allowBetting];
}


#pragma mark Betting
- (void) disableBetting {
    player1BetOutlet.hidden = YES;
    player1FoldOutlet.hidden = YES;
    player2BetOutlet.hidden = YES;
    player2FoldOutlet.hidden = YES;
    player3BetOutlet.hidden = YES;
    player3FoldOutlet.hidden = YES;
    player4BetOutlet.hidden = YES;
    player4FoldOutlet.hidden = YES;
}

- (void) showBetting {
    player1BetOutlet.hidden = NO;
    player1FoldOutlet.hidden = NO;
}

- (void) allowBetting {
    bet = 100;
    /*if (player2.playerValueOfCard + player4.playerValueOfCard + player3.playerValueOfCard >= 27) {
        player1.folds = YES;
        player1.playerValueOfCard = 0;
    }else {
        player1.folds = NO;
        player1.chipCount -= bet;
        pot += bet;
    }*/
    if (player1.playerValueOfCard + player4.playerValueOfCard + player3.playerValueOfCard >= 27) {
        player2.folds = YES;
        player2.playerValueOfCard = 0;
        player2FoldOutlet.hidden = NO;
        mainCardArea2.alpha = 0.7;
    }else {
        player2.folds = NO;
        player2.chipCount -= bet;
        pot += bet;
        player2BetOutlet.hidden = NO;
    }
    NSLog(@"Did Player 2 fold? %d", player2.folds);
    if (player1.playerValueOfCard + player2.playerValueOfCard + player4.playerValueOfCard >= 27) {
        player3.folds = YES;
        player3.playerValueOfCard = 0;
        player3FoldOutlet.hidden = NO;
        mainCardArea3.alpha = 0.7;
    }else {
        player3.folds = NO;
        player3.chipCount -= bet;
        pot += bet;
        player3BetOutlet.hidden = NO;
    }
    NSLog(@"Did Player 3 fold? %d", player3.folds);
    if (player1.playerValueOfCard + player2.playerValueOfCard + player3.playerValueOfCard >= 27) {
        player4.folds = YES;
        player4.playerValueOfCard = 0;
        player4FoldOutlet.hidden = NO;
        mainCardArea4.alpha = 0.7;
    }else {
        player4.folds = NO;
        player4.chipCount -= bet;
        pot += bet;
        player4BetOutlet.hidden = NO;
    }
    NSLog(@"Did Player 4 fold? %d", player4.folds);
    NSLog(@"Pot at end of allowBetting = %d", pot);
    [self updateChipLabels];
    [self showBetting];
}

- (IBAction)player1BetAction:(id)sender {
    player1.folds = NO;
    player1.chipCount -= bet;
    pot += bet; 
    mainCardArea.hidden = NO;
    NSLog(@"Did Player 1 fold? %d", player1.folds);
    [self updateChipLabels];
    [self determineWinner];
}

- (IBAction)player1FoldAction:(id)sender {
    player1.folds = YES;
    player1.playerValueOfCard = 0;
    mainCardArea.hidden = NO;
    NSLog(@"Did Player 1 fold? %d", player1.folds);
    mainCardArea.alpha = 0.7;
    [self determineWinner];
}

#pragma mark Determine Winners
- (void) determineWinner{
    int winners = 0;
    if (player1.playerValueOfCard >= player2.playerValueOfCard && player1.playerValueOfCard >= player3.playerValueOfCard && player1.playerValueOfCard >= player4.playerValueOfCard) {
        player1.playerIsWinner = YES;
        winners++;
    }else {
        player1.playerIsWinner = NO;
    }
    if (player2.playerValueOfCard >= player1.playerValueOfCard && player2.playerValueOfCard >= player3.playerValueOfCard && player2.playerValueOfCard >= player4.playerValueOfCard) {
        player2.playerIsWinner = YES;
        winners++;
    }else {
        player2.playerIsWinner = NO;
    }
    if (player3.playerValueOfCard >= player2.playerValueOfCard && player3.playerValueOfCard >= player1.playerValueOfCard && player3.playerValueOfCard >= player4.playerValueOfCard) {
        player3.playerIsWinner = YES;
        winners++;
    }else {
        player3.playerIsWinner = NO;
    }
    if (player4.playerValueOfCard >= player2.playerValueOfCard && player4.playerValueOfCard >= player3.playerValueOfCard && player4.playerValueOfCard >= player1.playerValueOfCard) {
        player4.playerIsWinner = YES;
        winners++;
    }else {
        player4.playerIsWinner = NO;
    }
    NSLog(@"Did Player1 win? %d", player1.playerIsWinner);
    NSLog(@"Did Player2 win? %d", player2.playerIsWinner);
    NSLog(@"Did Player3 win? %d", player3.playerIsWinner);
    NSLog(@"Did Player4 win? %d", player4.playerIsWinner);
    if (winners>=2) {
        NSLog(@"There are %d winners.", winners);
    }else {
        NSLog(@"There is %d winner.", winners);
    }
    NSLog(@"Pot before potAward = %d", pot);
    int potAward;
    potAward = pot / winners;
    NSString * winnerNames = @"";
    NSLog(@"Pot after potAward is determined = %d", pot);
    if (player1.playerIsWinner == YES) {
        player1.chipCount += potAward;
        pot -= potAward;
        winnerNames = [winnerNames stringByAppendingFormat:@"Player 1"];
        NSLog(@"Pot at end of Player 1 winning = %d", pot);
    }
    if (player2.playerIsWinner == YES) {
        player2.chipCount += potAward;
        pot -= potAward;
        winnerNames = [winnerNames stringByAppendingFormat:@"Player 2"];
        NSLog(@"Pot at end of Player 2 winning = %d", pot);
    }
    if (player3.playerIsWinner == YES) {
        player3.chipCount += potAward;
        pot -= potAward;
        winnerNames = [winnerNames stringByAppendingFormat:@"Player 3"];
        NSLog(@"Pot at end of Player 3 winning = %d", pot);
    }
    if (player4.playerIsWinner == YES) {
        player4.chipCount += potAward;
        pot -= potAward;
        winnerNames = [winnerNames stringByAppendingFormat:@"Player 4"];
        NSLog(@"Pot at end of Player 4 winning = %d", pot);
    }
    NSLog(@"Pot at end of Awards = %d", pot);
    [self disableBetting];
    [self updateChipLabels];
    if (winners>=2) {
        NSString * original = winnerNames;
        NSLog(@"Name before the for: %@",winnerNames);
        winnerNames = @"";
        for (int i=0; i <=(winners * 8)-1; i += 8) {
            NSString * new = [original substringFromIndex:i];
            new = [new substringToIndex:8];
            winnerNames = [winnerNames stringByAppendingFormat:@" & %@", new];
            NSLog(@"%@",winnerNames);
        }
        winnerNames = [winnerNames substringFromIndex:3];
    }
    NSString * winningMessage = [NSString stringWithFormat:@"%@ won the pot worth %d", winnerNames, (potAward * winners)];
    potTotalLabel.text = winningMessage;
    round ++;
    [self determineIfTheGameIsOver];
}

- (void)determineIfTheGameIsOver
{
    if (round>=10) {
            [self alertWinnerOfRound];
    }else {
        roundLabel.text = [NSString stringWithFormat: @"%d",round];
        dealCardsOutlet.hidden = NO;
    }
}

- (void)alertWinnerOfRound{
    
    
    
    NSString * winnerName;
    NSString * alertMessage = [NSString stringWithFormat:@"%@ won",winnerName];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Round Winner" 
                                                   message:alertMessage 
                                                  delegate:self 
                                         cancelButtonTitle:@"Quit" 
                                         otherButtonTitles:@"Play Again?", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex ==0){
        [self dismissModalViewControllerAnimated:YES];
    }else {
        [self setInitialChipCount];
    }
}

@end
