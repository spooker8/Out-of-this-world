//
//  ViewController.h
//  
//
//  Created by Anand Kumar on 8/27/15.
//
//

#import <UIKit/UIKit.h>
#import "EditViewController.h"

@interface ViewController : UITableViewController <EditViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) IBOutlet UITableView *UITableVIew;
@property (strong, nonatomic) NSMutableArray *addedSpaceObjects;


@end
