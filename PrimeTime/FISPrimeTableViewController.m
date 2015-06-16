//
//  FISPrimeTableViewController.m
//  PrimeTime
//
//  Created by Lukas Thoms on 6/16/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISPrimeTableViewController.h"

@interface FISPrimeTableViewController ()

@property (strong, nonatomic) NSArray *primes;

@end

@implementation FISPrimeTableViewController

-(NSArray*)primeNumber:(NSInteger)prime {
    NSMutableArray *primes = [@[] mutableCopy];
    for (NSInteger n=2; n<n+1; n++) {
        NSMutableArray *modArray = [@[] mutableCopy];
        for (NSInteger x=1; x<=n; x++) {
            if (n%x == 0) {
                NSNumber *mod = [NSNumber numberWithInteger:n];
                [modArray addObject:mod];
            }
        }
        if (modArray.count <= 2) {
            NSNumber *primeNumber = [NSNumber numberWithInteger:n];
            [primes addObject:primeNumber];
        }
        if (primes.count == prime) {
            break;
        }
    }
    NSArray *finalPrimes = [[NSArray alloc] initWithArray:primes];
    return finalPrimes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.accessibilityIdentifier = @"table";
    self.primes = [self primeNumber:5200];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"primeCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.primes[(indexPath.row + 5000)]];
    
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
