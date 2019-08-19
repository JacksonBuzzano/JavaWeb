<%
try {
	String msg = request.getParameter("menssagem");

	if (msg.equals("cadastroOK")) {
		out.print("<div class='alert alert-success'>Cadastro realizado com sucesso!</div>");
	} else if(msg.equals("cadastroFalha")){
		out.print("<div class='alert alert-danger'>Falha ao cadastrar!</div>");
	}else if(msg.equals("removerOK")){
		out.print("<div class='alert alert-success'>Funcionário removido com sucesso!</div>");
	}else if(msg.equals("removerFalha")){
		out.print("<div class='alert alert-danger'>Falha ao remover!</div>");
	}
	
} catch (Exception falhaMsg) {
}
%>