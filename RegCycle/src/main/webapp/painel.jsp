<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<%@ page isELIgnored="false" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@page import="Model.Usuario" %>

<%!
	DateTimeFormatter dtf_data = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	LocalDateTime now = LocalDateTime.now();
	String data = dtf_data.format(now);
	
	DateTimeFormatter dtf_hora = DateTimeFormatter.ofPattern("HH");
	String hora = dtf_hora.format(now);
	String hora_dia = horaDoDia(Integer.parseInt(hora));
	
	public String horaDoDia(int horario) {
		String msg = "";
		if (horario >= 00) {
			msg = "Boa madrugada";
		}
		
		if (horario >= 06) {
			msg = "Bom dia";
		}
		
		if (horario >= 12) {
			msg = "Boa tarde";
		}
		
		if (horario >= 18) {
			msg = "Boa noite";
		}
		
		return msg;
	}
	
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel do usuário</title>

    <link rel="stylesheet" href="style/main.css">
    <link rel="stylesheet" href="style/painel.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
    
    <style>
    	
    </style>
</head>

<body>
	<!--CALCULANDO O TOTAL DAS VENDAS -->
	<c:set var="total"/>
				
	<div style="display: none;">
		<c:forEach var="vendas" items="${usuario.vendas}">
			${total = total + vendas.valor_venda}
		</c:forEach>
	</div>
	<!---->
	
	<c:set var="data" value="<%=data%>"/>
	<c:set var="hora_dia" value="<%=hora_dia%>"/>
	
	<nav class="navbar-mobile">
        <div class="perfil">
            <div class="foto">
                <i class="fas fa-user"></i>
                <!--<img src="" alt="perfil">-->
            </div>
            
            <p class="nome">${sessionScope.usuario.nomeCompleto}</p>

            <a class="botao sair botaotofill-cinza-vermelho" href="SairController"><i class="fas fa-sign-out-alt"></i> sair</a>
        </div>

        <div class="operacoes">
            <a class="botao botaofilled-verde" href="form_venda.jsp"><i class="fas fa-plus"></i> nova venda</a>
            <a class="botao botaofilled-verde" href="form_meta.jsp"><i class="fas fa-plus"></i> nova meta</a>
        </div>
    </nav>

	
	
    <div class="wrapper">
        <nav class="navbar-desktop">
            <div class="dia-desktop">
                <p>${hora_dia}! Hoje é dia <b>${data}</b></p>
            </div>

            <div class="perfil">
                <div class="foto">
                    <i class="fas fa-user"></i>
                    <!--<img src="" alt="perfil">-->
                </div>
                
                <p class="nome"> ${sessionScope.usuario.nomeCompleto} </p>
            </div>
    
            <div class="operacoes">
                <a class="botao botaofilled-verde" href="form_venda.jsp"><i class="fas fa-plus"></i> nova venda</a>
                <a class="botao botaofilled-verde" href="form_meta.jsp"><i class="fas fa-plus"></i> nova meta</a>
            </div>
			
			<a class="botao sair botaotofill-cinza-vermelho" href="SairController"><i class="fas fa-sign-out-alt"></i> sair</a>
        </nav>
    
    
    
        <div class="dia-mobile">
            <p>${hora_dia}! Hoje é dia <b>${data}</b></p>
        </div>

        <div class="funcionalidades">
            <div class="minhasvendas">
                <h3 class="titulo">Minhas vendas</h3>
				
				<c:if test="${usuario.vendas.isEmpty()}">
					<div class="nenhumavenda">
	                    <p>Nenhuma venda foi registrada ainda...</p>
	
	                    <a class="botao-plus" href="form_venda.jsp"><i class="fas fa-plus"></i> Registrar uma venda</a>
	                </div>
				</c:if>
				
				<c:if test="${!usuario.vendas.isEmpty()}">
					<table class="vendas">
	                    <thead>
	                        <tr class="total"><th colspan="5">TOTAL = R$${total}</th></tr>
	                        <th>VENDA</th>
	                        <th>QTD.</th>
	                        <th>VALOR (R$)</th>
	                        <th>DATA</th>
	                        <th>LOCAL</th>
	                    </thead>
	                    
	                    <tbody>
		                    <c:forEach var="vendas" items="${usuario.vendas}">
		                        <tr>
		                            <td class="descricao">${vendas.descricao}</td>
		                            <td>${vendas.quantidade}</td>
		                            <td>${vendas.valor_venda}</td>
		                            <fmt:parseDate value="${vendas.data}" pattern="yyyy-MM-dd" var="parsedDate" type="date"/>
		                            <fmt:formatDate value="${parsedDate}" var="formatedDate" type="date" pattern="dd/MM/yyyy"/>
		                            <!--  <td>${vendas.data}</td>-->
		                            <td class="data">${formatedDate}</td>
		                            <td class="local">${vendas.local}</td>
		                            
			        					<form method="GET" action="EditarVendaController">
				                            <td class="operacao"><button type="submit" class="editar"><i class="operacao fas fa-pen"></i></button> </td>
				                            <input type="hidden" name="venda_id" value="${vendas.id}">
			                      		</form>
			                      		
			                      		<form method="POST" action="ExcluirVendaController">
		                            		<td class="operacao"><button type="submit" class="remover"><i class="operacao fas fa-trash"></i></button></td>
		                            		<input type="hidden" name="venda_id" value="${vendas.id}">
		                            	</form>
		                        </tr>
		                    </c:forEach>
	                    </tbody>
	                </table>
				</c:if>
			
            </div>
        
            <div class="minhasmetas">
                <h3 class="titulo">MINHAS METAS</h3>
                
                <div class="metas-tipo">
                	<div class="sep"></div>
                	
               		<button title="Visualizar em cards" onclick="trocarVisCard()" class="card"><i class="fas fa-stream"></i></button>
               		<button title="Visualizar em tabela" onclick="trocarVisTabela()" class="tabela active"><i class="fas fa-table"></i></button>
                </div>
                
                
                
                <div class="metas-concluidas">
               		<button onclick="metasNaoConcluidas()" class="nao-concluidas active"><i class="fas fa-clock"></i> PENDENTES</button>
               		<div class="sep"></div>
               		<button onclick="metasConcluidas()" class="concluidas"><i class="fas fa-check"></i> CONCLUÍDAS</button>
                </div>
                
                
                
                <div class="metas-legenda">
                	<div class="tag">
                		<div class="box normal"></div>
                		<p>Longe de expirar</p>
                	</div>
                	
                	<div class="tag meio">
                		<div class="box quase-expirada"></div>
                		<p>Quase expirando</p>
                	</div>
                	
                	<div class="tag">
                		<div class="box expirada"></div>
                		<p>Expirada</p>
                	</div>
                </div>
                
                
                
	            <div class="nao-concluidas active">
	            	
	            	<c:if test="${usuario.metas.isEmpty()}">
	            		<div class="nenhumameta">
		                    <p>Nenhuma meta foi definida ainda...</p>
		
		                    <a class="botao-plus" href="form_meta.jsp"><i class="fas fa-plus"></i> Registrar uma meta</a>
						</div>
	            	</c:if>
					
					<c:if test="${!usuario.metas.isEmpty()}">
						<table class="metas-t">
		                    <thead>
		                        <th>META</th>
		                        <th>VALOR META (R$)</th>
		                       	<th>INICIAR EM:</th>
		                        <th>TERMINAR EM:</th>
		                    </thead>
		        
		                    <tbody>
		                    	<c:forEach var="metas" items="${usuario.metas}">
		                    		<c:if test="${metas.status == 0}">
		                    			<c:set var="cor" value="normal"/>
		                    			
		                    			<c:if test="${metas.expirada()}">
		                    				<c:set var="cor" value="expirada"/>
		                    			</c:if>
		                    			
		                    			<c:if test="${metas.quaseExpirada() && !metas.expirada()}">
		                    				<c:set var="cor" value="quase-expirada"/>
		                    			</c:if>
		                    			
		                    			<tr class="metas-c ${cor}">
		                    				<td class="descricao">${metas.descricao}</td>
		                    				<td class="t-remove c-break"></td>
				                            <td class="c-valormeta"><span class="t-remove">R$</span>${metas.valor_meta}</td>
				                            <td class="t-remove c-break"></td>
				                            
				                            <fmt:parseDate value="${metas.data_inicial}" pattern="yyyy-MM-dd" var="parsedDate2" type="date"/>
		                            		<fmt:formatDate value="${parsedDate2}" var="formatedDataInicial1" type="date" pattern="dd/MM/yyyy"/>
											<!-- <td class="data-i">${metas.data_inicial}</td> -->
											<td class="data-i">${formatedDataInicial1}</td>
											
											<td class="t-remove c-data-meio">-</td>
											
											<fmt:parseDate value="${metas.data_final}" pattern="yyyy-MM-dd" var="parsedDate2" type="date"/>
		                            		<fmt:formatDate value="${parsedDate2}" var="formatedDataFinal1" type="date" pattern="dd/MM/yyyy"/>
					                        <!-- <td class="data-f">${metas.data_final}</td> -->
					                        <td class="data-i">${formatedDataFinal1}</td>
					                        
				        					<form method="POST" action="ConcluirMetaController">
				        						<td class="operacao concluir"><button type="submit" name="operacao" value="concluir" class="check"><i class="fas fa-check"></i></button></td>
				        						<input type="hidden" name="meta_id" value="${metas.id}">
				        					</form>
				        					
				        					<form method="GET" action="EditarMetaController">
					                            <td class="operacao editar"><button type="submit" name="operacao" value="editar" class="editar"><i class="operacao fas fa-pen"></i></button> </td>
					                            <input type="hidden" name="meta_id" value="${metas.id}">
				                      		</form>
				                            
				                            <form method="POST" action="ExcluirMetasController">
				                            	<td class="operacao excluir"><button type="submit" name="operacao" value="excluir" class="remover"><i class="operacao fas fa-trash"></i></button></td>
				                            	<input type="hidden" name="meta_id" value="${metas.id}">
				                            </form>
		                    			
			                        	</tr>
			                        </c:if>
		                    	</c:forEach>
		                    </tbody>
		                </table>
					</c:if>
	                
				</div>
                
                
                
                
                <div class="concluidas disable">
	                <table class="metas-t metas-2">
	                    <thead>
	                        <th>META</th>
	                        <th>VALOR META (R$)</th>
	                       	<th>INICIAR EM:</th>
	                        <th>TERMINAR EM:</th>
	                    </thead>
	        
	                    <tbody>
	                    	<c:forEach var="metas" items="${usuario.metas}">
	                    		<c:if test="${metas.status == 1}">
	                    			<tr class="metas-c concluidas">
	                    				<td class="descricao">${metas.descricao}</td>
	                    				<td class="t-remove c-break"></td>
			                            <td class="c-valormeta"><span class="t-remove">R$</span>${metas.valor_meta}</td>
			                            <td class="t-remove c-break"></td>
			                            
			                            <fmt:parseDate value="${metas.data_inicial}" pattern="yyyy-MM-dd" var="parsedDate2" type="date"/>
		                            	<fmt:formatDate value="${parsedDate2}" var="formatedDataInicial2" type="date" pattern="dd/MM/yyyy"/>
										<!-- <td class="data-i">${metas.data_inicial}</td> -->
										<td class="data-i">${formatedDataInicial2}</td>
										
										<td class="t-remove c-data-meio">-</td>
										
										<fmt:parseDate value="${metas.data_final}" pattern="yyyy-MM-dd" var="parsedDate2" type="date"/>
		                            	<fmt:formatDate value="${parsedDate2}" var="formatedDataFinal2" type="date" pattern="dd/MM/yyyy"/>
				                        <!-- <td class="data-f">${metas.data_final}</td>-->
				                        <td class="data-f">${formatedDataFinal2}</td>
				                        
			        					<form method="POST" action="DesconcluirMetaController">
			        						<td class="operacao concluir"><button title="Desconcluir meta" type="submit" name="operacao" value="concluir" class="check"><i class="fas fa-undo"></i> <span class="t-remove">DESCONCLUIR</span></button></td>
			        						<input type="hidden" name="meta_id" value="${metas.id}">
			        					</form>
			                            
			                            <form method="POST" action="ExcluirMetasController">
			                            	<td class="operacao excluir"><button type="submit" name="operacao" value="excluir" class="remover"><i class="operacao fas fa-trash"></i></button></td>
			                            	<input type="hidden" name="meta_id" value="${metas.id}">
			                            </form>
	                    			
		                        	</tr>
		                        </c:if>
	                    	</c:forEach>
	                    </tbody>
	                </table>
            	</div>
            </div>
        </div>
    </div>
    
    <script>
    	function trocarVisCard() {
    		const botaoCard = document.querySelector("button.card");
    		const botaoTabela = document.querySelector("button.tabela");
    		
    		const tabela = document.querySelector("table.metas-t");
    		const tabela2 = document.querySelector("table.metas-2");
    		
    		const boxLegenda = document.querySelector("div.metas-legenda .tag div.normal");
    		
    		tabela.classList.replace("metas-t", "metas-c");
    		tabela2.classList.replace("metas-t", "metas-c");
    		
    		botaoCard.className = "card active";
    		botaoTabela.className = "tabela";
    		
    		boxLegenda.className = "box normal-c";
    	}
    	
    	function trocarVisTabela() {
    		const botaoCard = document.querySelector("button.card");
    		const botaoTabela = document.querySelector("button.tabela");
    		
    		const tabela = document.querySelector("table.metas-c");
    		const tabela2 = document.querySelector("table.metas-2");
    		
    		const boxLegenda = document.querySelector("div.metas-legenda .tag div.normal-c");
    		
    		tabela.className = "metas-t";
    		tabela2.className = "metas-t metas-2";
    		
    		botaoCard.className = "card";
    		botaoTabela.className = "tabela active";
    		
    		boxLegenda.className = "box normal";
    	}
    	
    	function metasNaoConcluidas() {
    		const botaoNC = document.querySelector("button.nao-concluidas");
    		const botaoC = document.querySelector("button.concluidas");
    		
    		const tabelaNaoConcluidas = document.querySelector("div.nao-concluidas");
    		const tabelaConcluidas = document.querySelector("div.concluidas");
    		
    		const legenda = document.querySelector("div.metas-legenda");
    		
    		botaoNC.className = "nao-concluidas active";
    		botaoC.className = "concluidas";
    		
    		tabelaNaoConcluidas.className = "nao-concluidas active";
    		tabelaConcluidas.className = "concluidas disable";
    		
    		legenda.className = "metas-legenda";
    		
    		trocarVisTabela();
    	}
    	
    	function metasConcluidas() {
    		const botaoNC = document.querySelector("button.nao-concluidas");
    		const botaoC = document.querySelector("button.concluidas");
    		
    		const tabelaNaoConcluidas = document.querySelector("div.nao-concluidas");
    		const tabelaConcluidas = document.querySelector("div.concluidas");
    		
    		const legenda = document.querySelector("div.metas-legenda");
    		
    		botaoNC.className = "nao-concluidas";
    		botaoC.className = "concluidas active";
    		
    		tabelaNaoConcluidas.className = "nao-concluidas disable";
    		tabelaConcluidas.className = "concluidas active";
    		
    		legenda.className = "metas-legenda disable";
    		
    		trocarVisTabela();
    	}
    </script>
</body>
</html>