<%@page import="dao.FuncionarioDao"%>
<%@page import="beans.FuncionarioBeans"%>

<%

	//Obter dados
	int codigo = Integer.parseInt(request.getParameter("codigo"));
	String nome = request.getParameter("nome");
	String cpf = request.getParameter("cpf");
	String nascimento = request.getParameter("nascimento");
	String endereco = request.getParameter("endereço");
	int numero = Integer.parseInt(request.getParameter("número"));
	String cidade = request.getParameter("cidade");
	String estado = request.getParameter("estado");
	String telefone = request.getParameter("telefone");
	String funcao = request.getParameter("função");

	//Instânciar um objeto
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

	//Instânciar um objeto para realizar o funcionário
	FuncionarioDao fd = new FuncionarioDao();
	fd.atualizar(fb);

	//Redirecionamento
	response.sendRedirect("index.jsp");
%>