//
//  ViewController.m
//  
//
//  Created by Anand Kumar on 8/27/15.
//
//

#import "ViewController.h"
#import "ImageController.h"
#import "AstronomicalData.h"
#import "DetailViewController.h"
#import "DataViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController


#pragma mark lazy instantions

-(NSMutableArray *)planets
{
    
    if (!_planets){
        
        _planets = [[NSMutableArray alloc] init];
        
    }
    
    return _planets;
    
}


-(NSMutableArray*)addedSpaceObjects
{
    
    if(!_addedSpaceObjects){
        
        _addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    
    return _addedSpaceObjects;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData [PLANET_NAME]];
        
        ImageController *planet = [[ImageController alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        
        [self.planets addObject:planet];
        
        
    }
    
    
//    NSString *planet1 = @"Mercury";
//    NSString *planet2 = @"Earth";
//    NSString *planet3 = @"Saturn";
//    NSString *planet4 = @"Uranus";
//    
//    self.array = [[NSMutableArray alloc] initWithObjects:planet1,planet2,planet3,planet4, nil];
//    
    
    
    
    
    
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
//    [myDictionary setObject:@"red" forKey:@"firetruck color"];
//    [myDictionary setObject:@"blue" forKey:@"Ocean color"];
//    
//    NSString *bluestring = [myDictionary objectForKey:@"Ocean color"];
//    
//    NSLog(@"dictionary:  %@",bluestring);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark protocol editviewcontroller delegate

-(void)didCancel
{
    NSLog(@"Did cancel");
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)addSpaceObject:(ImageController*)spaceObject
{
    
    
    [self.addedSpaceObjects addObject:spaceObject];
    
   
    //NSUserdefault info is stored here.
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

  
    if ([self.addedSpaceObjects count])
        
    {
        
        return 2;
        
    }
    
    else
    
    {

    return 1 ;

    }

}







- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    
    if(section == 1)
    {
        
        return [self.addedSpaceObjects count];
        
    }
    else {
    
    return [self.planets count];

    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
 
    if(indexPath.section == 1)
        //Use new space object to customize our cell
    {
        ImageController *planet = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text= planet.nickname;
        cell.imageView.image = planet.spaceImage;
        
        
        
    }
        else {
            
    
    ImageController *planets = [self.planets objectAtIndex:indexPath.row];
    
    
    cell.textLabel.text = planets.name;
    cell.detailTextLabel.text = planets.nickname;
    cell.imageView.image = planets.spaceImage;
    
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"space" sender:indexPath];
    
}





-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([sender isKindOfClass:[UITableViewCell class]]) //if the object is a class
        
    {
        
        if ([segue.destinationViewController isKindOfClass:[DetailViewController class]])
            
        {
            
            DetailViewController *nextViewController = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
           
            ImageController *selectedObject;
            
            if (path.section == 0)
            {
                
                selectedObject = self.planets[path.row];
                
                
            }
            
            else if (path.section == 1)
            {
                
                selectedObject = self.addedSpaceObjects[path.row];
                
            }
            nextViewController.spaceObject = selectedObject; //self.planets[path.row];
            
        
        }
        }
        
        if ([sender isKindOfClass:[NSIndexPath class]])
        {
            
            if ([segue.destinationViewController isKindOfClass:[DataViewController class]])
                
            {
                
               DataViewController *targetViewController = segue.destinationViewController;
                NSIndexPath *path = sender;
                ImageController *selectedObject;
                
                if (path.section == 0)
                {
                    
                    selectedObject = self.planets[path.row];
                }
                else if (path.section ==1){
                    
                    selectedObject = self.addedSpaceObjects[path.row];
                }
                
                
                targetViewController.spaceObject = selectedObject;// self.planets[path.row];
               
            }
            
            
        }
        
        
        if ([segue.destinationViewController isKindOfClass:
             [EditViewController class]])
        {
            
            EditViewController *addSpaceObjectVC = segue.destinationViewController;
            addSpaceObjectVC.delegate=self;
            
            
            
        }
    
    
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
