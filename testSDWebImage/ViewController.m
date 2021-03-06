//
//  ViewController.m
//  testSDWebImage
//
//  Created by 陈金 on 15/10/30.
//  Copyright © 2015年 Art. All rights reserved.
//

#import "ViewController.h"
#import "testTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (strong, nonatomic) NSString* imageUrl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageUrl = @"http://7xlznu.com2.z0.glb.qiniucdn.com/5632c949fa59312877bf8065.jpg?imageMogr2/thumbnail/!543x434r/gravity/center/crop/";
//
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UIApplicationDidReceiveMemoryWarningNotification object:nil];
}

- (IBAction)buttonPushAction:(id)sender
{
    [self performSegueWithIdentifier:@"PUSHVIEWCONTROLLERA" sender:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 150;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    testTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"testTableViewCell" forIndexPath:indexPath];
    
    
    NSString* stringUrl = [NSString stringWithFormat:@"%@%@",self.imageUrl,[NSString stringWithFormat:@"%dx%d",(indexPath.row+1)*11,(indexPath.row+1)*10]];
    [cell.testImageview sd_setImageWithURL:[NSURL URLWithString:stringUrl]];
    
    return cell;
}

@end
