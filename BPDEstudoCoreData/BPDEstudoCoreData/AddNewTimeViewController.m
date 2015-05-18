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
    
    self.nomeField.text = self.time.nome;
    self.siglaField.text = self.time.sigla;
    self.conferenciaField.text = self.time.conferencia;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

// ação do botão salvar
- (IBAction)salvarTime:(id)sender
{
    [[BPDTimesStore sharedStore] addNewTimeByNome:self.nomeField.text
                                         andSigla:self.siglaField.text
                                   andConferencia:self.conferenciaField.text];
    
    [self.navigationController popViewControllerAnimated:YES];
}

/* Dispensa o teclado quando a tecla de retorno for tocada
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



@end
