//
//  BPDTimesStore.m
//  BPDEstudoCoreData
//
//  Created by Rodrigo DAngelo Silva Machado on 5/14/15.
//  Copyright (c) 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

#import "BPDTimesStore.h"

@interface BPDTimesStore ()

@property (nonatomic) NSMutableArray *privateItems;

//usados em decorrencia do core data
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation BPDTimesStore

+ (instancetype) sharedStore
{
    static BPDTimesStore *sharedStore = nil;
    
    if (! sharedStore)
    {
        sharedStore = [[self alloc] initPrivado];
    }
    
    return sharedStore;
}

- (instancetype) initPrivado
{
    self = [super init];
    return self;
}

// exceção caso o objeto seja criado na tora!!!
- (instancetype) init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"USE +[BPDTimesStore sharedStore]" userInfo:nil];
    
    return nil;
}

- (void) setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    
    if (!self.managedObjectContext)
    {
        _managedObjectContext = managedObjectContext;
        [self loadAllTimes];
        
    }
}

- (void) addNewTimeByNome:(NSString *)nome andSigla:(NSString *)sigla andConferencia:(NSString *)conferencia
{
    BPDTimes *times = [NSEntityDescription insertNewObjectForEntityForName:@"BPDTimes" inManagedObjectContext: self.managedObjectContext];
    
    times.code = [[[NSUUID alloc] init] UUIDString];
    times.sigla = sigla;
    times.nome = nome;
    times.conferencia = conferencia;
    
    // caso haja erro
    NSError *error;
    
    if (! [self.managedObjectContext save:&error])
    {
        NSLog(@"Nao pode ser salvo %@, %@", error, error.userInfo);
    }
    
}

// recupera todos os times salvos no banco de dados
- (void) loadAllTimes
{
    if (!self.privateItems){
        
        // objeto para buscar dados no BD
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"BPDTimes"];
        
        NSError *error;
        
        // executa consulta no BD
        NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if (!result) {
            [NSException raise:@"Fetch failed" format:@"Reason: %@", [error localizedDescription]];
        }
        
        self.privateItems = [NSMutableArray arrayWithArray:result];
    }

}

// retorna os times salvos
- (NSArray *) getAllTimes
{
    return [self.privateItems copy];
}

@end
