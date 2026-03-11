CREATE OR REPLACE PROCEDURE CMDKRLS_CHAT_INATIVAR_TERMO_USO(
    p_nr_sequencia IN NUMBER
) AS
BEGIN

    UPDATE CMDKRLS_CHAT_TERMO_USO
       SET DT_INATIVACAO          = SYSDATE,
           IE_SITUACAO            = 'I',
          NM_USUARIO_INATIVACAO = wheb_usuario_pck.get_nm_usuario
     WHERE NR_SEQUENCIA = p_nr_sequencia;


END CMDKRLS_CHAT_INATIVAR_TERMO_USO;
/