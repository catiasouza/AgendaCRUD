//
//  ContatoDAO.h
//  AgendaObjectivC
//
//  Created by Cátia Souza on 07/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"


@interface ContatoDAO : NSObject

@property NSMutableArray *contatos;

-(void)adicionaContato: (Contato *)contato;
-(NSInteger)total;
-(Contato *)contatoIndice:(NSInteger)indice;
-(NSInteger)indiceContato:(Contato *)contato;
+(ContatoDAO *)contatoDaoInstance;
-(void)removeContato:(Contato *)contato;
@end


