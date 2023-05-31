--Bloco Anônimo Estrutura

SET SERVEROUTPUT ON
DECLARE
    vnumb1 NUMBER(11,2) := 400;
    vnumb2 NUMBER(11,2) := 400;
    vmedia NUMBER(11,2);
BEGIN
    vmedia := (vnumb1 + vnumb2) / 2;
    dbms_output.put_line('Media = ' || vmedia);
END;    


-- VARIÁVEIS | CONSTANTES | TIPOS DE DADOS

DECLARE
    vnumber                      NUMBER(11,2) := 11500.50;
    vNumeroInteiro               BINARY_INTEGER := 1200;
    vNumeroFloat                 BINARY_FLOAT := 15000000;
    vNumeroDouble                BINARY_DOUBLE := 15000000;
    vPi                          CONSTANT NUMBER(6,5) := 3.14159;
    vCaracterTamanhoFixo         CHAR(2) := 'MG';
    vCaracterTamanhoVariavel     VARCHAR2(100) := 'Minas Gerais, MG';
    vLong                        LONG := 'Texto Tamanho variável de até 32760 bytes';
    vCaracterTamFixoUniver       NCHAR(100) := 'Texto de Tamanho Fixo Universal de atÃ© 32767 bytes';
    vCaractTamVariavelUnir       NVARCHAR2(100) := 'Texto Tamanho variÃ¡vel Universal de atÃ© 32767 bytes';
    vData                        DATE := '01/05/2023';
    vDataAtual                   DATE := SYSDATE;
    vDataAtualComAte9Digt        TIMESTAMP := SYSTIMESTAMP;
    vDataAtualComLimt            TIMESTAMP(3) := SYSTIMESTAMP;
    vDataAtualComHoraUTCServidor TIMESTAMP WITH TIME ZONE := SYSTIMESTAMP;
    vDataAtualComHoraUTCCliente  TIMESTAMP WITH LOCAL TIME ZONE := SYSTIMESTAMP;
    vBooleano                    BOOLEAN := TRUE;
    vRowid                       ROWID; --Endereço logico de uma coluna de uma tabela
BEGIN
    dbms_output.put_line('Numero = ' || vnumber);
    dbms_output.put_line('Numero = ' || vNumeroInteiro);
    dbms_output.put_line('Numero = ' || vNumeroFloat);
    dbms_output.put_line('Numero = ' || vNumeroDouble);
    dbms_output.put_line('Constante = ' || vPi);
    dbms_output.put_line('String com Tamanho Fixo = ' || vCaracterTamanhoFixo);
    dbms_output.put_line('String com Tamanho Variavel = ' || vCaracterTamanhoVariavel);
    dbms_output.put_line('String com Tamanho Variavel = ' || vLong);
    dbms_output.put_line('String com Tamanho Variavel = ' || vCaracterTamFixoUniver);
    dbms_output.put_line('String com Tamanho Variavel = ' || vCaractTamVariavelUnir);
    dbms_output.put_line('Data = ' || vData);
    dbms_output.put_line('Data Atual Padrão = ' || vDataAtual);
    dbms_output.put_line('Data Atual Com Ate 9 digitos de Presisão = ' || vDataAtualComAte9Digt);
    dbms_output.put_line('Data Atual Com Ate 3 digitos de Presisão = ' || vDataAtualComLimt);
    dbms_output.put_line('Data Atual UTC do Servidor = ' || vDataAtualComHoraUTCServidor);
    dbms_output.put_line('Data Atual UTC do Cliente = ' || vDataAtualComHoraUTCCliente);
    
    IF  vBooleano = TRUE
    THEN 
        DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'FALSE OR NULL');
    END IF;
  
   SELECT rowid
   INTO   vRowid
   FROM   funcionarios
   WHERE  first_name = 'Steven' AND last_name = 'King';
   DBMS_OUTPUT.PUT_LINE('Rowid = ' || vRowid );
    
END;