<%@page import="dao.FuncionarioDao"%>
<%@page import="beans.FuncionarioBeans"%>

<%

	//Obter dados
	int codigo = Integer.parseInt(request.getParameter("codigo"));
	String nome = request.getParameter("nome");
	String cpf = request.getParameter("cpf");
	String nascimento = request.getParameter("nascimento");
	String endereco = request.getParameter("endere�o");
	int numero = Integer.parseInt(request.getParameter("n�mero"));
	String cidade = request.getParameter("cidade");
	String estado = request.getParameter("estado");
	String telefone = request.getParameter("telefone");
	String funcao = request.getParameter("fun��o");

	//Inst�nciar um objeto
	FuncionarioBeans fb = new FuncionarioBeans();
	
	fb.setCodigo(codigo);
	fb.setCidade(cidade);
	fb.setCpf(cpf);
	fb.setEndereco(endereco);
	fb.setEstado(estado);
	fb.setFuncao(funcao);
	fb.setNascimento(nascimento);
	fb.setNome(nome);
	fb.setNumero(numero);
	fb.setTelefone(telefone);

	//Inst�nciar um objeto para realizar o funcion�rio
	FuncionarioDao fd = new FuncionarioDao();
	fd.atualizar(fb);

	//Redirecionamento
	response.sendRedirect("index.jsp");
%>