//
//  BPDTimesStore.h
//  BPDEstudoCoreData
//
//  Created by Rodrigo DAngelo Silva Machado on 5/14/15.
//  Copyright (c) 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BPDTimes.h"
@import CoreData;

@interface BPDTimesStore : NSObject

// variável para a coleção de adds
@property (nonatomic, readonly) NSArray *times;

+ (instancetype) sharedStore;

// adicionando times
- (void) addNewTimeByNome: (NSString *) nome andSigla: (NSString *) sigla andConferencia: (NSString *) conferencia;

// retornando todos os times
- (NSArray *) getAllTimes;

// banco de dados
- (void) setManagedObjectContext: (NSManagedObjectContext *) managedObjectContext;

@end
