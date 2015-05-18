//
//  AddNewTimeViewController.m
//  BPDEstudoCoreData
//
//  Created by Rodrigo DAngelo Silva Machado on 5/18/15.
//  Copyright (c) 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

#import "AddNewTimeViewController.h"
#import "BPDTimesStore.h"

@interface AddNewTimeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nomeField;
@property (weak, nonatomic) IBOutlet UITextField *siglaField;
@property (weak, nonatomic) IBOutlet UITextField *conferenciaField;

@end

@implementation AddNewTimeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    self.nomeField.text = self.times.nome;
    self.siglaField.text = self.times.sigla;
    self.conferenciaField.text = self.times.conferencia;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
