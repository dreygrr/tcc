<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar venda</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">

    <link rel="stylesheet" href="style/main.css">
    <link rel="stylesheet" href="style/form.css">

</head>

<body>
    <h1>RegCycle</h1>

    <form action="VendaController" method="POST" class="formulario">
    
    	<c:if test="${status != null }">
    		<c:if test="${status = true }">

	            	<p class="sucesso"><i class="fas fa-check"></i> Venda registrada com sucesso!</p>

           		 </c:if>
           	<c:if test="${status = false }">
           		<p class="falha"><i class="fas fa-times"></i> Não foi possível cadastrar a venda</p>
           	</c:if>
        </c:if>


        <h3>Nova venda</h3>

        <p>Preencha as informações da venda abaixo.</p>
        <p class="sobre-obrigatorio">Campos com <span class="obrigatorio">*</span> são obrigatórios.</p>

        <div class="linha field">
            <label for="descId">Descrição da venda<span class="obrigatorio">*</span>: </label>
            <input type="text" name="descCampo" id="descId" placeholder="Reciclável ou conjunto de recicláveis..." required>
        </div>
        
        <div class="linhaflex">
            <div class="linha field">
                <label for="qtdId">Quantidade: </label>
                <input type="number" name="qtdCampo" id="qtdId">
            </div>

            <div class="sep"></div>

            <div class="linha field">
                <label for="valorId">Valor (R$)<span class="obrigatorio">*</span>: </label> 
                <input type="number" name="valorCampo" id="valorId" required>
            </div>
        </div>

        <div class="linha field">
            <label for="dataId">Data da venda<span class="obrigatorio">*</span>: </label>
            <input type="date" name="dataCampo" id="dataId" required>
        </div>

        <div class="linha field">
            <label for="localId">Local da venda: </label>
            <input type="text" name="localCampo" id="localId" placeholder="Rua, avenida, pontos de referência..." required>
        </div> 

        <div class="linha entrar">
            <input type="submit" value="Registrar" class="botaotofill-azul botao" name="operacao">
        </div>

        <div class="links">
            <a href="PainelController"><i class="fas fa-arrow-left"></i> Voltar para o painel</a>
        </div>
    </form>
</body>
</html>