package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import beans.FuncionarioBeans;
import conex�o.Conexao;

public class FuncionarioDao {

	// Metodo de cadastro
	public boolean casdastrarFuncionario(FuncionarioBeans fb) {

		// Vari�vel
		boolean validaFuncionario = false;

		// Realizar cadastro
		try {
			Connection conexao = Conexao.obterConexao();

			String sql = "INSERT INTO funcion�rio(nomeFun,cpfFun,nascimentoFun,enderecoFun,numeroFun,cidadeFun,estadoFun,telefoneFun,funcaoFun) VALUES(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conexao.prepareStatement(sql);
			pst.setString(1, fb.getNome());
			pst.setString(2, fb.getCpf());
			pst.setString(3, fb.getNascimento());
			pst.setString(4, fb.getEndereco());
			pst.setInt(5, fb.getNumero());
			pst.setString(6, fb.getCidade());
			pst.setString(7, fb.getEstado());
			pst.setString(8, fb.getTelefone());
			pst.setString(9, fb.getFuncao());

			pst.execute();
			// fecha conex�o
			conexao.close();

			validaFuncionario = true;

		} catch (SQLException e) {}

		// Retorna
		return validaFuncionario;
	}

	// M�todo de sele��o
	public String selecionarFuncionario() {

		String tabelaFuncionario = "<table class='table table-dark table table-striped'>";
		tabelaFuncionario += "<tr>";
		tabelaFuncionario += "<td>Nome</td>";
		tabelaFuncionario += "<td>Cpf</td>";
		tabelaFuncionario += "<td>Nascimento</td>";
		tabelaFuncionario += "<td>Endere�o</td>";
		tabelaFuncionario += "<td>N�mero</td>";
		tabelaFuncionario += "<td>Cidade</td>";
		tabelaFuncionario += "<td>Estado</td>";
		tabelaFuncionario += "<td>Teledfone</td>";
		tabelaFuncionario += "<td>Fun��o</td>";
		tabelaFuncionario += "</tr>";
		try {
			Connection c = Conexao.obterConexao();
			String sql = "select * from funcion�rio order by nomeFun";
			Statement stmt = c.createStatement();

			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				tabelaFuncionario += "<tr>";
				tabelaFuncionario += "<td>" + rs.getString(2) + "</td>";
				tabelaFuncionario += "<td>" + rs.getString(3) + "</td>";
				tabelaFuncionario += "<td>" + rs.getString(4) + "</td>";
				tabelaFuncionario += "<td>" + rs.getString(5) + "</td>";
				tabelaFuncionario += "<td>" + rs.getInt(6) + "</td>";
				tabelaFuncionario += "<td>" + rs.getString(7) + "</td>";
				tabelaFuncionario += "<td>" + rs.getString(8) + "</td>";
				tabelaFuncionario += "<td>" + rs.getString(9) + "</td>";
				tabelaFuncionario += "<td>" + rs.getString(10) + "</td>";
				tabelaFuncionario += "<td> <a href='alterarFun.jsp?codigo=" + rs.getInt(1)
						+ "' class='btn btn-warning'>Alterar</a> </td>";
				tabelaFuncionario += "<td> <a href='removerFun.jsp?codigo=" + rs.getInt(1)
						+ "' class='btn btn-danger'>Remover</a> </td>";

				tabelaFuncionario += "</tr>";
			}

			c.close();
		} catch (Exception e) {

		}
		tabelaFuncionario += "</table>";

		return tabelaFuncionario;

	}

	public FuncionarioBeans buscaFuncionario(int codigo) {

		// Inst�nciar um objeto da classe funcion�rio
		FuncionarioBeans fb = new FuncionarioBeans();

		// Obter dados do funcion�rio
	
		try {
			String sql = "SELECT * FROM funcion�rio where idFun=?";
			PreparedStatement pst = Conexao.obterConexao().prepareStatement(sql);
			pst.setInt(1, codigo);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				
			fb.setCodigo(rs.getInt(1));
			fb.setNome(rs.getString(2));
			fb.setCpf(rs.getString(3));
			fb.setNascimento(rs.getString(4));
			fb.setEndereco(rs.getString(5));
			fb.setNumero(rs.getInt(6));
			fb.setCidade(rs.getString(7));
			fb.setEstado(rs.getString(8));
			fb.setTelefone(rs.getString(9));
			fb.setFuncao(rs.getString(10));
			}
		} catch (SQLException e) {
		}
		// Retorna
		return fb;
	}

	//Atualizar
	public void atualizar(FuncionarioBeans fb) {

		
		try {
			String sql = "UPDATE funcion�rio SET nomeFun=? ,cpfFun=? ,nascimentoFun=? ,enderecoFun=? ,numeroFun=? ,cidadeFun=? ,estadoFun=? ,telefoneFun=? ,funcaoFun=? WHERE idFun=?";
			PreparedStatement pst = Conexao.obterConexao().prepareStatement(sql);
			pst.setString(1, fb.getNome());
			pst.setString(2, fb.getCpf());
			pst.setString(3, fb.getNascimento());
			pst.setString(4, fb.getEndereco());
			pst.setInt(5, fb.getNumero());
			pst.setString(6, fb.getCidade());
			pst.setString(7, fb.getEstado());
			pst.setString(8, fb.getTelefone());
			pst.setString(9, fb.getFuncao());
			pst.setInt(10, fb.getCodigo());

			pst.execute();

		} catch (SQLException e) {
		}
	}
	
	//Metodo para remover
	public boolean removerFuncionario(int codgio) {
		
		//Valida��o da exclus�o
		boolean validaExclusao = false;
		
		//Tentativa de exclus�o
		
		try {
			String sql = "DELETE FROM funcion�rio where idFun=?";
			PreparedStatement pst = Conexao.obterConexao().prepareStatement(sql);
			pst.setInt(1, codgio);
			pst.execute();
			validaExclusao = true;
		} catch (SQLException e) {}
		
		return validaExclusao;	
	}
	

}
