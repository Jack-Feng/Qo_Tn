//
//  UpdateUrlTableViewController.m
//  FEBasePublicClass
//
//  Created by fetechios1 on 2017/9/18.
//  Copyright © 2017年 Qifeng. All rights reserved.
//

#import "UpdateUrlTableViewController.h"


@interface UpdateUrlTableViewController ()

@end

@implementation UpdateUrlTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSDictionary *dictionary = _array[section];
    
    return dictionary.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * __nonnull cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
//    NSDictionary *dic = _array[indexPath.section];
//    for (int i = 0; i < dic.allKeys.count; i++) {
//        if (i == indexPath.row) {
//            NSString *str = dic.allKeys[indexPath.row];
//            cell.textLabel.text = str;
//            cell.detailTextLabel.text = dic[str];
//        }
//    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_backBlock) {
        _backBlock(indexPath);
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
