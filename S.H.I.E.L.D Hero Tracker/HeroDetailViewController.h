//
//  HeroDetailViewController.h
//  S.H.I.E.L.D Hero Tracker
//
//  Created by MBPinTheAir on 24/04/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *heroNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *heroOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *herosPowersLabel;

@end
