<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar meta</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">

    <link rel="stylesheet" href="style/main.css">
    <link rel="stylesheet" href="style/form.css">

</head>

<body>
    <h1>RegCycle</h1>

    <form action="MetaController" method="POST" class="formulario">
    	<c:if test="${status != null }">
    		<c:if test="${status = true }">
	            <p class="sucesso"><i class="fas fa-check"></i> Meta registrada com sucesso!</p>
           	</c:if>
           	<c:if test="${status = false }">
           		<p class="falha"><i class="fas fa-times"></i> Não foi possível cadastrar a meta</p>
           	</c:if>
        </c:if>

        
        <h3>Nova meta</h3>
        
        <p>Preencha as informações da meta abaixo.</p>
        <p class="sobre-obrigatorio">Campos com <span class="obrigatorio">*</span> são obrigatórios.</p>

        <div class="linha field">
            <label for="descId">Descrição da meta<span class="obrigatorio">*</span>: </label>
            <textarea name="descCampo" id="descId" placeholder="Vender x garrafas pet; conseguir R$50,00..." required></textarea>
        </div>

        <div class="linha field">
            <label for="valorId">Valor meta (R$): </label>
            <input type="number" name="valorCampo" id="valorId">
        </div>

        <div class="linhaflex">
            <div class="linha field">
                <label for="dataInicialId">Data inicial<span class="obrigatorio">*</span>: </label>
                <input type="date" name="dataInicialCampo" id="dataInicialId" required>
            </div>

            <div class="sep"></div>

            <div class="linha field">
                <label for="dataFinalId">Data final<span class="obrigatorio">*</span>: </label> 
                <input type="date" name="dataFinalCampo" id="dataFinalId" required>
            </div>
        </div>

        <div class="linha entrar">
            <input type="submit" value="Registrar" class="botaotofill-azul botao">
        </div>

        <div class="links">
            <a href="PainelController"><i class="fas fa-arrow-left"></i> Voltar para o painel</a>
        </div>
    </form>
</body>
</html>