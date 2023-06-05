-- LOOP Básico

SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
  vNumero  NUMBER(5) := 1;
  vLimite  NUMBER(5) := &pLimite;
BEGIN

LOOP 
  DBMS_OUTPUT.PUT_LINE('Numero = ' || to_char(vNumero));
  EXIT WHEN vNumero = vLimite;
  vNumero := vNumero + 1;
END LOOP;
END;