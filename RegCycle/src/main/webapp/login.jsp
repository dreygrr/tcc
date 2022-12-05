<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored = "false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RegCycle</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">

    <link rel="stylesheet" href="style/main.css">
    <link rel="stylesheet" href="style/login.css">
    <link rel="stylesheet" href="style/form.css">
</head>

<body>
    <h1>RegCycle</h1>

    <form action="LoginController" method="POST" class="formulario">
    	<c:if test="${operacao == 'cadastrada'}">
    		<p class="sucesso"><i class="fas fa-check"></i> Cadastrado(a)! Você pode entrar agora.</p>
    	</c:if>
	    
	    <c:if test="${status != null}"> 
			
			<p class="falha"> <i class="fas fa-times"></i> Login ou senha incorretos!</p>
			
		</c:if>
		
		<c:if test="${sessaoexpirou != null}"> 
			
			<p class="falha"> <i class="fas fa-times"></i> A sessão expirou. Entre novamente.</p>
			
		</c:if>
    
        <h3>Entrar</h3>
        
        <div class="linha field">
            <label for="usernameId">Nome de usuário: </label>
            <input type="text" name="usernameCampo" id="usernameId" required>
        </div>

        <div class="linha field">
            <label for="senhaId">Senha: </label>
            <input type="password" name="senhaCampo" id="senhaId" required>
        </div>

        <div class="linha entrar">
            <input type="submit" value="Entrar" class="botaotofill-azul botao">
        </div>

        <div class="links">
        	<p>Não tem uma conta? <a href="cadastro.jsp">Cadastre-se agora!</a></p>
        	
            <a href="index.html"><i class="fas fa-arrow-left"></i> Voltar para a home</a>
            
        </div>
    </form>
</body>
</html>