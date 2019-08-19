package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import beans.FornecedorBeans;
import conexão.Conexao;

public class FornecedorDao {

	// Metodo de cadastro
	public boolean casdastrarFornecedor(FornecedorBeans fb) {

		// Variável
		boolean validaFornecedor = false;

		// Realizar cadastro
		try {
			Connection conexao = Conexao.obterConexao();

			String sql = "INSERT INTO fornecedor (nomeFor, nascimentoFor, cnpjFor, telefoneFor, enderecoFor, cidadeFor, estadoFor, emailFor) VALUES (?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conexao.prepareStatement(sql);
			pst.setString(1, fb.getNome());
			pst.setString(2, fb.getNascimento());
			pst.setString(3, fb.getCnpj());
			pst.setString(4, fb.getTelefone());
			pst.setString(5, fb.getEndereco());
			pst.setString(6, fb.getCidade());
			pst.setString(7, fb.getEstado());
			pst.setString(8, fb.getEmail());

			pst.execute();
			// fecha conexão
			conexao.close();

			validaFornecedor = true;

		} catch (SQLException e) {}

		// Retorna
		return validaFornecedor;
	}

	// Método de seleção
	public String selecionarFornecedor() {

		String tabelaFornecedor = "<table class='table table-dark table table-striped'>";
		tabelaFornecedor += "<tr>";
		tabelaFornecedor += "<td>Nome</td>";
		tabelaFornecedor += "<td>Nascimento</td>";
		tabelaFornecedor += "<td>Cnpj</td>";
		tabelaFornecedor += "<td>Telefone</td>";
		tabelaFornecedor += "<td>Endereço</td>";
		tabelaFornecedor += "<td>Cidade</td>";
		tabelaFornecedor += "<td>Estado</td>";
		tabelaFornecedor += "<td>E-mail</td>";
		tabelaFornecedor += "</tr>";
		try {
			Connection c = Conexao.obterConexao();
			String sql = "select * from fornecedor order by nomeFor";
			Statement stmt = c.createStatement();

			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				tabelaFornecedor += "<tr>";
				tabelaFornecedor += "<td>" + rs.getString(2) + "</td>";
				tabelaFornecedor += "<td>" + rs.getString(3) + "</td>";
				tabelaFornecedor += "<td>" + rs.getString(4) + "</td>";
				tabelaFornecedor += "<td>" + rs.getString(5) + "</td>";
				tabelaFornecedor += "<td>" + rs.getString(6) + "</td>";
				tabelaFornecedor += "<td>" + rs.getString(7) + "</td>";
				tabelaFornecedor += "<td>" + rs.getString(8) + "</td>";
				tabelaFornecedor += "<td>" + rs.getString(9) + "</td>";
				tabelaFornecedor += "<td> <a href='alterarFor.jsp?codigo=" + rs.getInt(1)
						+ "' class='btn btn-warning'>Alterar</a> </td>";
				tabelaFornecedor += "<td> <a href='removerFor.jsp?codigo=" + rs.getInt(1)
						+ "' class='btn btn-danger'>Remover</a> </td>";

				tabelaFornecedor += "</tr>";
			}

			c.close();
		} catch (Exception e) {

		}
		tabelaFornecedor += "</table>";

		return tabelaFornecedor;

	}

	public FornecedorBeans buscaFornecedor(int codigo) {

		// Instânciar um objeto da classe fornecedor
		FornecedorBeans fb = new FornecedorBeans();

		// Obter dados do funcionário
	
		try {
			String sql = "SELECT * FROM fornecedor where idFor=?";
			PreparedStatement pst = Conexao.obterConexao().prepareStatement(sql);
			pst.setInt(1, codigo);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				
			fb.setCodigo(rs.getInt(1));
			fb.setNome(rs.getString(2));
			fb.setNascimento(rs.getString(3));
			fb.setCnpj(rs.getString(4));
			fb.setTelefone(rs.getString(5));
			fb.setEndereco(rs.getString(6));
			fb.setCidade(rs.getString(7));
			fb.setEstado(rs.getString(8));
			fb.setEmail(rs.getString(9));
			}
		} catch (SQLException e) {
		}
		// Retorna
		return fb;
	}

	//Atualizar
	public void atualizarFornecedor(FornecedorBeans fb) {

		try {
			String sql = "UPDATE fornecedor SET nomeFor=? ,nascimentoFor=? ,cnpjFor=? ,telefoneFor=? ,enderecoFor=? ,cidadeFor=? ,estadoFor=? ,emailFor=? WHERE idFor=?";
			PreparedStatement pst = Conexao.obterConexao().prepareStatement(sql);
			pst.setString(1, fb.getNome());
			pst.setString(2, fb.getNascimento());
			pst.setString(3, fb.getCnpj());
			pst.setString(4, fb.getTelefone());
			pst.setString(5, fb.getEndereco());
			pst.setString(6, fb.getCidade());
			pst.setString(7, fb.getEstado());
			pst.setString(8, fb.getEmail());
			pst.setInt(9, fb.getCodigo());

			pst.execute();

		} catch (SQLException e) {
		}
	}
	
	//Metodo para remover
	public boolean removerFornecedor(int codgio) {
		
		//Validação da exclusão
		boolean validaExclusao = false;
		
		//Tentativa de exclusão
		
		try {
			String sql = "DELETE FROM fornecedor where idFor=?";
			PreparedStatement pst = Conexao.obterConexao().prepareStatement(sql);
			pst.setInt(1, codgio);
			pst.execute();
			validaExclusao = true;
		} catch (SQLException e) {}
		
		return validaExclusao;	
	}
	

}