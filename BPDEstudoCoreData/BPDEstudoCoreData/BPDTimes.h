//
//  BPDTimes.h
//  BPDEstudoCoreData
//
//  Created by Rodrigo DAngelo Silva Machado on 5/14/15.
//  Copyright (c) 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface BPDTimes : NSManagedObject


// criando variáveis do banco de dados
@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *sigla;
@property (nonatomic, retain) NSString *conferencia;



@end
