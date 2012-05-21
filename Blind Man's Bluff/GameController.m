//
//  GameController.m
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"

@interface GameController ()

@end

@implementation GameController
@synthesize player1EnteredName;
@synthesize player1NameLabel;
@synthesize player2NameLabel;
@synthesize player3NameLabel;
@synthesize player4NameLabel;
@synthesize chipsPlayer1Label;
@synthesize chipsPlayer2Label;
@synthesize chipsPlayer3Label;
@synthesize chipsPlayer4Label;
@synthesize temp, playingCardSprite, mainCardArea, playingCardSprite2, mainCardArea2, playingCardSprite3, mainCardArea3,playingCardSprite4, mainCardArea4;
@synthesize player1, player2, player3, player4;
@synthesize playerArray;


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
    [self initPlayers];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIDeviceOrientationLandscapeLeft || 
    interfaceOrientation == UIDeviceOrientationLandscapeRight;
	return YES;
}

- (void) initPlayers{
    if (!playerArray) {
        playerArray = [[NSMutableArray alloc] initWithCapacity:4];
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

-(void) dealCards{
    temp = [[Deck alloc]initWithFullDeck];
    
    [temp shuffle];
    Card * tempCard1 = [temp dealACard];
    
    //pick card value
    //tempCard1.value = 13;
    
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
    
    
    
    Card * tempCard2 = [temp dealACard];
    
    //pick card value
    //tempCard2.value = 14;
    
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
    //tempCard3.value = 12;
    
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
    //tempCard4.value = 12;
    
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
    
    [self alertWinnerOfRound];
}


- (void)alertWinnerOfRound{
    
    
    
    NSString * winner = [[NSString alloc] initWithFormat: @"temp", @"temp2"];
    NSString * alertMessage = [NSString stringWithFormat:@"%@ won",winner];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Round Winner" message:alertMessage delegate:self cancelButtonTitle:@"OK!" otherButtonTitles:nil];
    [alert show];
}

-(void)setInitialChipCount{
    int chipStartingAmount = 2500;
    player1.chipCount = chipStartingAmount;
    player2.chipCount = chipStartingAmount;
    player3.chipCount = chipStartingAmount;
    player4.chipCount = chipStartingAmount;
    [self updateChipLabels];
}

-(void)updateChipLabels{
    chipsPlayer1Label.text = [NSString stringWithFormat:@"%d", player1.chipCount];
    chipsPlayer2Label.text = [NSString stringWithFormat:@"%d", player2.chipCount];
    chipsPlayer3Label.text = [NSString stringWithFormat:@"%d", player3.chipCount];
    chipsPlayer4Label.text = [NSString stringWithFormat:@"%d", player4.chipCount];
}

-(void)updatePlayerNameLables{
    player1NameLabel.text = player1.playerName;
    player2NameLabel.text = player2.playerName;
    player3NameLabel.text = player3.playerName;
    player4NameLabel.text = player4.playerName;
}

- (IBAction)dealCardsButton:(id)sender {
    [self dealCards];
}
@end
