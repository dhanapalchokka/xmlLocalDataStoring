//
//  TableViewController.m
//  xmlLocalDataStoring
//
//  Created by Student on 27/07/16.
//  Copyright © 2016 learning. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
{
    AppDelegate*app2;
}
@end
bool customerIsCollapsed = NO;
bool siteIsCollapsed = NO;
@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    app2=[[UIApplication sharedApplication]delegate];
//    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,40,100)];
//    title.text = @"Movie Stars";
//    UINavigationController *nav = [UINavigationController new];
//    nav.navigationItem.titleView = title;
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"table view>>>%@", app2.bollyWoodStarsArr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    if (section==0) {
//        return @"bollyWood";
//    }
//    if (section==1) {
//        return @"tollyWood";
//    }
//    if (section==2) {
//        return @"kollyWood";
//    }
//    if (section==3) {
//        return @"sandalwood";
//    }
//    return  @"";
//}
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
    UIView *hView = [[UIView alloc] initWithFrame:CGRectZero] ;
    hView.backgroundColor=[UIColor clearColor];
    
    UILabel *hLabel=[[UILabel alloc] initWithFrame:CGRectMake(19,17,301,21)] ;
    
    hLabel.backgroundColor=[UIColor clearColor];
    hLabel.shadowColor = [UIColor whiteColor];
    hLabel.shadowOffset = CGSizeMake(0.5,1);  // closest as far as I could tell
    hLabel.textColor = [UIColor blackColor];  // or whatever you want
    hLabel.font = [UIFont boldSystemFontOfSize:17];
    if (section==0) {
        hLabel.text = @"BollyWood";
        hLabel.backgroundColor=[UIColor yellowColor];
    }if (section==1) {
        hLabel.text = @"TollyWood";
         hLabel.backgroundColor=[UIColor orangeColor];
    }if (section==2) {
        hLabel.text = @"KollyWood";
         hLabel.backgroundColor=[UIColor grayColor];
    }if (section==3) {
        hLabel.text = @"SandalWood";
         hLabel.backgroundColor=[UIColor greenColor];
    }
      // probably from array
    
    [hView addSubview:hLabel];
    
    return hView;
    
    
    

    }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
    
    NSString*cellIdentifier=@"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        
    } if (indexPath.section==0) {
        cell.textLabel.text=[app2.bollyWoodStarsArr objectAtIndex:indexPath.row];
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    }
    else if (indexPath.section==1) {
        cell.textLabel.text=[app2.tollyWoodStarsArr objectAtIndex:indexPath.row];
    }else if (indexPath.section==2) {
        cell.textLabel.text=[app2.kollyWoodStarsArr objectAtIndex:indexPath.row];
    }else if (indexPath.section==3) {
        cell.textLabel.text=[app2.sandalWoodStarsArr objectAtIndex:indexPath.row];
    }

       // Configure the cell...
    
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
