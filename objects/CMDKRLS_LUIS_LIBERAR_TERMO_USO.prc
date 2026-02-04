CREATE OR REPLACE PROCEDURE CMDKRLS_LUIS_LIBERAR_TERMO_USO (
    p_nr_sequencia IN NUMBER
) AS
    qt_registro_w NUMBER(10);
BEGIN

    SELECT COUNT(1)
      INTO qt_registro_w
      FROM CMDKRLS_LUIS_TERMO_USO
     WHERE IE_SITUACAO = 'A'
       AND DT_LIBERACAO IS NOT NULL;

    IF (qt_registro_w > 0) THEN
        Wheb_mensagem_pck.exibir_mensagem_abort('Não é possível liberar mais de um termo para a mesma aplicação.');
    END IF;

    UPDATE CMDKRLS_LUIS_TERMO_USO
       SET DT_LIBERACAO = SYSDATE
     WHERE NR_SEQUENCIA = p_nr_sequencia;

END CMDKRLS_LUIS_LIBERAR_TERMO_USO;
/