SELECT DISTINCT e.seqpessoa, e.fantasia fornecedor, b.seqproduto, b.desccompleta produto, c.estqtroca estoque_troca, (c.cmultvlrnf * c.estqtroca) vlr_estoque
  FROM consinco.map_familia a
        JOIN consinco.map_produto b
             ON a.seqfamilia = b.seqfamilia
        JOIN consinco.mrl_produtoempresa c
             ON b.seqproduto = c.seqproduto
        JOIN consinco.mlf_nfitem d
             ON b.seqproduto = d.seqproduto           
        JOIN consinco.ge_pessoa e
             ON d.seqpessoa = e.seqpessoa
        WHERE d.seqpessoa = 1587 and
              b.seqproduto IN (SELECT f.seqproduto
                                 FROM consinco.mlf_nfitem f where f.seqpessoa = 1587) and
              c.estqtroca <> 0
              ;




SELECT * FROM consinco.mrl_produtoempresa;







