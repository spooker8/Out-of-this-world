//
//  DataViewController.h
//  Out of this world
//
//  Created by Anand Kumar on 9/3/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageController.h"
#import "ViewController.h"

@interface DataViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ImageController *spaceObject;



@end
