<%@page import="dao.FuncionarioDao"%>
<%@page import="beans.FuncionarioBeans"%>
<%@page import="conex�o.Conexao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	

<%
	//Obter dadas do funcion�rio
	String telefone = request.getParameter("telefone");
	String cpf = request.getParameter("cpf");
	int n�mero = Integer.parseInt(request.getParameter("n�mero"));
	String nascimento = request.getParameter("nascimento");
	String endere�o = request.getParameter("endere�o");
	String cidade = request.getParameter("cidade");
	String estado = request.getParameter("estado");
	String nome = request.getParameter("nome");
	String fun��o = request.getParameter("fun��o");

	//Criar um objeto da classe funcion�rio
	FuncionarioBeans f = new FuncionarioBeans();
	f.setCidade(cidade);
	f.setCpf(cpf);
	f.setEndereco(endere�o);
	f.setEstado(estado);
	f.setFuncao(fun��o);
	f.setNascimento(nascimento);
	f.setNome(nome);
	f.setNumero(n�mero);
	f.setTelefone(telefone);
	
	//Criar um objeto da classe Funcion�rioDao
	FuncionarioDao fd = new FuncionarioDao();
	boolean cadastro = fd.casdastrarFuncionario(f);
	
	//Redirecionamento
		if (cadastro == true) {
			response.sendRedirect("index.jsp?msg=cadastroOK");
		} else {
			response.sendRedirect("index.jsp?msg=cadastroFalha");
		}
%>