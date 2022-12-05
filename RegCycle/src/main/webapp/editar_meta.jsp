<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar meta</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">

    <link rel="stylesheet" href="style/main.css">
    <link rel="stylesheet" href="style/form.css">
</head>

<body>
    <h1>RegCycle</h1>

    <form action="EditarMetaController" method="POST" class="formulario">
        <!--
            <p class="sucesso"><i class="fas fa-check"></i> Meta registrada com sucesso!</p>
            <p class="falha"><i class="fas fa-times"></i> Não foi possível cadastrar a meta</p>
        -->
        
        <h3>Editar meta</h3>
        
        <p>Reescreva as informações da meta de preferência abaixo.</p>

		<div class="linha field">
			<label for="idId"></label>
			<input type="hidden" id="idId" name="meta_id" value="${meta.id}">
		</div>

        <div class="linha field">
            <label for="descId">Descrição da meta: </label>
            <textarea name="descCampo" id="descId" placeholder="Vender x garrafas pet; conseguir R$50,00..." required >${meta.descricao}</textarea>
        </div>

        <div class="linha field">
            <label for="valorId">Valor meta (R$): </label>
            <input type="number" name="valorCampo" id="valorId" value="${meta.valor_meta}">
        </div>

        <div class="linhaflex">
            <div class="linha field">
                <label for="dataInicialId">Data inicial: </label>
                <input type="date" name="dataInicialCampo" id="dataInicialId" value="${meta.data_inicial}" required>
            </div>

            <div class="sep"></div>

            <div class="linha field">
                <label for="dataFinalId">Data final: </label> 
                <input type="date" name="dataFinalCampo" id="dataFinalId" value="${meta.data_final}" required>
            </div>
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