<%@page import="dao.FuncionarioDao"%>
<%@page import="beans.FuncionarioBeans"%>
<%@page import="conexão.Conexao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	

<%
	//Obter dadas do funcionário
	String telefone = request.getParameter("telefone");
	String cpf = request.getParameter("cpf");
	int número = Integer.parseInt(request.getParameter("número"));
	String nascimento = request.getParameter("nascimento");
	String endereço = request.getParameter("endereço");
	String cidade = request.getParameter("cidade");
	String estado = request.getParameter("estado");
	String nome = request.getParameter("nome");
	String função = request.getParameter("função");

	//Criar um objeto da classe funcionário
	FuncionarioBeans f = new FuncionarioBeans();
	f.setCidade(cidade);
	f.setCpf(cpf);
	f.setEndereco(endereço);
	f.setEstado(estado);
	f.setFuncao(função);
	f.setNascimento(nascimento);
	f.setNome(nome);
	f.setNumero(número);
	f.setTelefone(telefone);
	
	//Criar um objeto da classe FuncionárioDao
	FuncionarioDao fd = new FuncionarioDao();
	boolean cadastro = fd.casdastrarFuncionario(f);
	
	//Redirecionamento
		if (cadastro == true) {
			response.sendRedirect("index.jsp?msg=cadastroOK");
		} else {
			response.sendRedirect("index.jsp?msg=cadastroFalha");
		}
%>