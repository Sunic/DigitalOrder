//
//  CollectionController.h
//  数字化点餐1.Q
//
//  Created by HD A6 on 12-8-25.
//  Copyright (c) 2012年 CCUT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *table;
    
    NSMutableDictionary *orderDict;
    NSMutableArray *list;
    NSArray *objectList;
    NSUInteger countTotal;
    int lastTagInt;
}
@property(retain,nonatomic) IBOutlet UITableView *table;

@property(retain,nonatomic) NSMutableArray *list;
@property(retain,nonatomic) NSMutableDictionary *orderDict;
@property(retain,nonatomic) NSArray *objectList;


//-(IBAction)minusOne:(id)sender;
//-(IBAction)plusOne:(id)sender;
-(void)updateTable;
-(void)callBack;

@end
