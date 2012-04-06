//
//  ViewController.m
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController
@synthesize temp;

 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    temp = [[Deck alloc]initWithFullDeck];
    
    [temp shuffle];
    Card * tempCard1 = [temp dealACard];
    [tempCard1 logThisCard];
    Card * tempCard2 = [temp dealACard];
    [tempCard2 logThisCard];
    Card * tempCard3 = [temp dealACard];
    [tempCard3 logThisCard];    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

/*
 
 - (IBAction)moveToRight:(id)sender {
 CGPoint currentPosition = playingCardSprite.center;
 currentPosition.x += 73.0;
 playingCardSprite.center = currentPosition;
 }
 
 - (IBAction)moveDown:(id)sender {
 CGPoint currentPosition = playingCardSprite.center;
 currentPosition.y += 98.0;
 playingCardSprite.center = currentPosition;
 }
 
 - (IBAction)moveUp:(id)sender {
 CGPoint currentPosition = playingCardSprite.center;
 currentPosition.y -= 98.0;
 playingCardSprite.center = currentPosition;
 }
 
 - (IBAction)moveToLeft:(id)sender {
 CGPoint currentPosition = playingCardSprite.center;
 currentPosition.x -= 73.0;
 playingCardSprite.center = currentPosition;
 }
 */

@end
