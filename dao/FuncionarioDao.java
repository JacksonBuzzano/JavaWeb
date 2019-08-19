package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import beans.FuncionarioBeans;
import conexão.Conexao;

public class FuncionarioDao {

	// Metodo de cadastro
	public boolean casdastrarFuncionario(FuncionarioBeans fb) {

		// Variável
		boolean validaFuncionario = false;

		// Realizar cadastro
		try {
			Connection conexao = Conexao.obterConexao();

			String sql = "INSERT INTO funcionário(nomeFun,cpfFun,nascimentoFun,enderecoFun,numeroFun,cidadeFun,estadoFun,telefoneFun,funcaoFun) VALUES(?,?,?,?,?,?,?,?,?)";
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
			// fecha conexão
			conexao.close();

			validaFuncionario = true;

		} catch (SQLException e) {}

		// Retorna
		return validaFuncionario;
	}

	// Método de seleção
	public String selecionarFuncionario() {

		String tabelaFuncionario = "<table class='table table-dark table table-striped'>";
		tabelaFuncionario += "<tr>";
		tabelaFuncionario += "<td>Nome</td>";
		tabelaFuncionario += "<td>Cpf</td>";
		tabelaFuncionario += "<td>Nascimento</td>";
		tabelaFuncionario += "<td>Endereço</td>";
		tabelaFuncionario += "<td>Número</td>";
		tabelaFuncionario += "<td>Cidade</td>";
		tabelaFuncionario += "<td>Estado</td>";
		tabelaFuncionario += "<td>Teledfone</td>";
		tabelaFuncionario += "<td>Função</td>";
		tabelaFuncionario += "</tr>";
		try {
			Connection c = Conexao.obterConexao();
			String sql = "select * from funcionário order by nomeFun";
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

		// Instânciar um objeto da classe funcionário
		FuncionarioBeans fb = new FuncionarioBeans();

		// Obter dados do funcionário
	
		try {
			String sql = "SELECT * FROM funcionário where idFun=?";
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
			String sql = "UPDATE funcionário SET nomeFun=? ,cpfFun=? ,nascimentoFun=? ,enderecoFun=? ,numeroFun=? ,cidadeFun=? ,estadoFun=? ,telefoneFun=? ,funcaoFun=? WHERE idFun=?";
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
		
		//Validação da exclusão
		boolean validaExclusao = false;
		
		//Tentativa de exclusão
		
		try {
			String sql = "DELETE FROM funcionário where idFun=?";
			PreparedStatement pst = Conexao.obterConexao().prepareStatement(sql);
			pst.setInt(1, codgio);
			pst.execute();
			validaExclusao = true;
		} catch (SQLException e) {}
		
		return validaExclusao;	
	}
	

}
