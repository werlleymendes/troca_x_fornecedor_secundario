CREATE OR REPLACE VIEW vw_estoque_troca_fornecedor AS
SELECT DISTINCT 
    c.nroempresa,
    e.seqpessoa,
    e.fantasia AS fornecedor,
    b.seqproduto,
    b.desccompleta AS produto,
    c.estqtroca AS estoque_troca,
    ROUND((c.cmultvlrnf * c.estqtroca),2) AS vlr_estoque
FROM consinco.map_familia a
JOIN consinco.map_produto b ON a.seqfamilia = b.seqfamilia
JOIN consinco.mrl_produtoempresa c ON b.seqproduto = c.seqproduto
JOIN consinco.mlf_nfitem d ON b.seqproduto = d.seqproduto           
JOIN consinco.ge_pessoa e ON d.seqpessoa = e.seqpessoa
JOIN consinco.ge_empresa g ON c.nroempresa = g.nroempresa
WHERE 
    c.estqtroca <> 0 and
    d.seqpessoa NOT IN (1,2,3,4)
    AND b.seqproduto IN (
        SELECT f.seqproduto
        FROM consinco.mlf_nfitem f 
        WHERE f.tipnotafiscal = 'E' and
             f.seqpessoa = d.seqpessoa
    );
    

