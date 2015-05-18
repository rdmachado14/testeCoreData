//
//  TimesViewController.m
//  BPDEstudoCoreData
//
//  Created by Rodrigo DAngelo Silva Machado on 5/18/15.
//  Copyright (c) 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

#import "TimesViewController.h"
#import "BPDTimes.h"
#import "BPDTimesStore.h"
#import "AppDelegate.h"
#import "AddNewTimeViewController.h"

@interface TimesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *timesTableView;



@end

@implementation TimesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    [self.timesTableView reloadData];
    [self.timesTableView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.timesTableView indexPathForSelectedRow];
    
    if (indexPath.row > 0)
    {
        AddNewTimeViewController *detailTime = segue.destinationViewController;
        
        NSArray *times = [[BPDTimesStore sharedStore] getAllTimes];
        BPDTimes *selectedTime = times[indexPath.row];
        
        detailTime.time = selectedTime;
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BPDTimesStore sharedStore] getAllTimes] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TimesCellTableView";
    UITableViewCell *cell = (UITableViewCell *) [self.timesTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewRowActionStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    BPDTimes *t = [[[BPDTimesStore sharedStore] getAllTimes] objectAtIndex: indexPath.row];
    
    cell.textLabel.text = t.nome;
    cell.textLabel.text = t.sigla;
    
    return cell;
}



@end
