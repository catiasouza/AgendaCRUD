//
//  Contato.m
//  AgendaObjectivC
//
//  Created by Cátia Souza on 06/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

#import "Contato.h"

@implementation Contato

-(NSString *) description{
    NSString *dados = [NSString stringWithFormat:@"Nome: %@, Endereco: %@,Telefone: %@,Email: %@,Site %@",self.nome,self.endereco, self.telefone,self.email,self.site];
    return dados;
}
@end
