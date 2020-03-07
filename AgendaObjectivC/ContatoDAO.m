//
//  ContatoDAO.m
//  AgendaObjectivC
//
//  Created by Cátia Souza on 07/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

#import "ContatoDAO.h"
#import "Contato.h"

@implementation ContatoDAO

static ContatoDAO *defaultDao = nil;

-(id)init{
    self = [super init];
    if(self){
        self.contatos = [NSMutableArray new];
    }
    return self;
}
+(ContatoDAO *)contatoDaoInstance{
    if(!defaultDao){
        defaultDao = [ContatoDAO new];
    }
    return defaultDao;
}

-(void)adicionaContato:(Contato *)contato{
    [self.contatos addObject:contato];
}
-(void)removeContato:(Contato *)contato{
    [self.contatos removeObject:contato];
}
-(NSInteger)total{
    return self.contatos.count;
}
-(Contato *)contatoIndice: (NSInteger) indice{
    return self.contatos[indice];
}
-(NSInteger)indiceContato:(Contato *)contato{
    return [self.contatos indexOfObject:contato];
}
@end
