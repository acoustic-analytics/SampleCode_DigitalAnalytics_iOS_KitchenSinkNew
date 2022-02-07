//
// Copyright (C) 2022 Acoustic, L.P. All rights reserved.
//
// NOTICE: This file contains material that is confidential and proprietary to
// Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
// industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
// Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
// prohibited.
//
#import "ProductController.h"
#import "Product.h"
#import "ShoppingCart.h"
#import "TagProductView.h"
#import "TagPageView.h"
#import "TagShopAction5.h"

@interface ProductController ()

@property (nonatomic) NSUInteger selectedRow;

@end

@implementation ProductController

@synthesize productCategory;
@synthesize selectedRow;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //TAGGING: Send a PageView Tag to indicate successful loading of this page
    NSString *pageName = NSStringFromClass([self class]);
    id<Tag> pageViewTag = [[TagPageView alloc] initTag:pageName sessionStarted:NO];
    [pageViewTag executeTag];
    
    //TAGGING: Send ProductView Tags for Products being displayed
    id<Tag> productViewTag = [[TagProductView alloc] initTag:pageName products:self.productCategory.products];
    [productViewTag executeTag];
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
    return [self.productCategory.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    
    // Get the Product object and data that needs to be displayed
    Product *product = [self.productCategory.products objectAtIndex:indexPath.row];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20,-20,100,80)];
    UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(200,-20,100,80)];
    
    nameLabel.text = product.name;
    priceLabel.text = [NSString stringWithFormat:@"$%@", product.baseUnitPrice];

    [cell.contentView addSubview:nameLabel];
    [cell.contentView addSubview:priceLabel];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRow = indexPath.row;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add to Cart"
                                                                   message:@"Quantity"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
    }];
    
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // do your action on cancel click
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        UITextField *myTextField = alert.textFields.firstObject;
        NSString *inputQuantity = myTextField.text;
        int quantity = [inputQuantity intValue];
        Product *product = [self.productCategory.products objectAtIndex:self.selectedRow];
        Product *cartItem = [[Product alloc] initWithDetails:product.productId categoryId:product.categoryId name:product.name baseUnitPrice:product.baseUnitPrice quantity:quantity attributes:product.attributes];

        ShoppingCart *cart = [ShoppingCart instance];
        [cart addToCart:cartItem];

        //TAGGING: Tag the addition of a product into your ShoppingCart
        NSString *pageName = NSStringFromClass([self class]);
        id<Tag> shopAction5Tag = [[TagShopAction5 alloc] initTag:pageName product:cartItem];
        [shopAction5Tag executeTag];
    }]];
    [self presentViewController:alert animated:YES completion:nil];

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
