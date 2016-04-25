//
//  HeroTableViewController.m
//  S.H.I.E.L.D Hero Tracker
//
//  Created by MBPinTheAir on 24/04/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "HeroTableViewController.h"
#import "Hero.h"

@interface HeroTableViewController ()
@property (strong, nonatomic) NSArray *heroList;
@property (strong, nonatomic) NSMutableArray *heroes;

- (void)loadHeroes;

@end

@implementation HeroTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"S.H.I.E.L.D. Hero Tracker";
    [self loadHeroes];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)loadHeroes{
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@"json"];
    NSArray *heroList = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    NSLog(@" herolist array from json %@", heroList);
    
    NSMutableArray *heroes = [NSMutableArray array];

    for (int i = 0 ; i < [heroList count]; i++) {
     
        NSMutableDictionary *heroesDict = [[[[heroList objectAtIndex:i]objectForKey:@"name"]objectForKey:@"homeworld"]objectForKey:@"powers"];

        Hero *myHero = [[Hero alloc]initWith:heroesDict];
    
        [heroes addObject:myHero];
    
    }
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.heroes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftCell" forIndexPath:indexPath];
 
    //cell.textLabel.text =
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
