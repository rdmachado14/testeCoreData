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

@property (nonatomic, readonly) NSArray *times;

+ (instancetype) sharedStore;
- (void) addNewTimeByNome: (NSString *) nome andSigla: (NSString *) sigla andConferencia: (NSString *) conferencia;
- (NSArray *) getAllTimes;
- (void) setManagedObjectContext: (NSManagedObjectContext *) managedObjectContext;

@end
