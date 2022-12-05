<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar venda</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">

    <link rel="stylesheet" href="style/main.css">
    <link rel="stylesheet" href="style/form.css">

</head>

<body>
    <h1>RegCycle</h1>

    <form action="EditarVendaController" method="POST" class="formulario">
        <!--
            <p class="sucesso"><i class="fas fa-check"></i> Venda registrada com sucesso!</p>
            <p class="falha"><i class="fas fa-times"></i> Não foi possível cadastrar a venda</p>
        -->


        <h3>Editar venda</h3>

        <p>Reescreva as informações da venda de preferência abaixo.</p>
        
        <div class="linha field">
        	<label for="idId"></label>
        	<input type="hidden" name="venda_id" value="${venda.id}">
        </div>

        <div class="linha field">
            <label for="descId">Descrição da venda: </label>
            <input type="text" name="descCampo" id="descId" placeholder="Reciclável ou conjunto de recicláveis..." value="${venda.descricao}" required>
        </div>
        
        <div class="linhaflex">
            <div class="linha field">
                <label for="qtdId">Quantidade: </label>
                <input type="number" name="qtdCampo" id="qtdId" value="${venda.quantidade}">
            </div>

            <div class="sep"></div>

            <div class="linha field">
                <label for="valorId">Valor (R$): </label> 
                <input type="number" name="valorCampo" id="valorId" value="${venda.valor_venda}" required>
            </div>
        </div>

        <div class="linha field">
            <label for="dataId">Data da venda: </label>
            <input type="date" name="dataCampo" id="dataId" value="${venda.data}" required>
        </div>

        <div class="linha field">
            <label for="localId">Local da venda: </label>
            <input type="text" name="localCampo" id="localId" placeholder="Rua, avenida, pontos de referência..." value="${venda.local}" required>
        </div> 

        <div class="linha entrar">
            <input type="submit" value="Editar" class="botaotofill-azul botao">
        </div>

        <div class="links">
            <a href="painel.jsp"><i class="fas fa-arrow-left"></i> Voltar para o painel</a>
        </div>
    </form>
</body>
</html>