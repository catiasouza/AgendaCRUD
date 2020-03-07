//
//  ViewController.m
//  AgendaObjectivC
//
//  Created by Cátia Souza on 06/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"

@interface ViewController ()

@end

@implementation ViewController

-(ViewController *)initWithCoder:(NSCoder *) aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        
        self.dao = [ContatoDAO contatoDaoInstance];
        
    }
    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    
    UIBarButtonItem *botao = nil;
    
    if(self.contato){
        botao = [[UIBarButtonItem alloc]initWithTitle:@"Alterar" style:UIBarButtonItemStylePlain target:self action:@selector(altera)];
        self.navigationItem.title = @"Editar Contato";
    }else{
        botao = [[UIBarButtonItem alloc]initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target:self action:@selector(adiciona)];
        self.navigationItem.title = @"Novo Contato";
    }
    
    self.navigationItem.rightBarButtonItem = botao;
    
    if (self.contato){
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.email.text = self.contato.email;
        self.site.text = self.contato.site;
        self.endereco.text = self.contato.endereco;
    }
    
}
-(void) adiciona{
    
    self.contato = [Contato new]; //manda criar um contato
    [self pegaDadosFormulario];
    [self.dao adicionaContato: self.contato];
    NSLog(@"%@", self.dao.contatos);
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate contatoAdicionado: self.contato];
}
-(void)altera{
    NSLog(@"alterando contato %@",self.contato);
    [self pegaDadosFormulario];
    
    [self.delegate contatoAtualizado: self.contato];
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)pegaDadosFormulario{
    self.contato.nome = self.nome.text;
    self.contato.email = self.email.text;
    self.contato.endereco = self.endereco.text;
    self.contato.site = self.site.text;
    self.contato.telefone = self.telefone.text;
}
@end
