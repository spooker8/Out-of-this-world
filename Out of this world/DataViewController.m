//
//  DataViewController.m
//  Out of this world
//
//  Created by Anand Kumar on 9/3/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    
    
    
}


#pragma  mark - UITableview Datasource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *CellIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
   switch (indexPath.row)
    
    {
            
        case 0:
            cell.textLabel.text = @"Nickname :";
            cell.detailTextLabel.text = self.spaceObject.nickname;
            break;
            
         case 1:
            
            cell.textLabel.text = @"Diameter (km):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.diameter];
            break;
            
        case 2:
            cell.textLabel.text = @"Gravitational Force:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.gravitationalForce];
            break;
        case 3:
            cell.textLabel.text = @"Length of a Year in (days):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.yearLenght];
            break;
            
        case 4:
            cell.textLabel.text = @"Lenght of a day (hours):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.dayLenght];
            break;
            
        case 5:
            cell.textLabel.text = @"Temperature(celcius):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.temperature];
            
        case 6:
            cell.textLabel.text = @"Number of moons";
            cell.detailTextLabel.text = self.spaceObject.interestFact;
            break;
            default:
            break;
            
            
    }
    
    return cell;
    
    
}


-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section

{
    
    
    return 6;
    
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
