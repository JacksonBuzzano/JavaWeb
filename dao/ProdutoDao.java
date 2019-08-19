package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import beans.ProdutoBeans;
import conexão.Conexao;

public class ProdutoDao {
	
	//Método para cadastrar
	public boolean cadastarProduto(ProdutoBeans pb) {
		
		//Variável
		boolean validaProduto = false;
		
		//Realizar cadastro
		Connection conexao = Conexao.obterConexao();
			
		try {
			String sql = "INSERT INTO produtos(nomePro, qntPro, compraPro, vendaPro, marcaPro) VALUES (?,?,?,?,?)";
			PreparedStatement pst = conexao.prepareStatement(sql);
			pst.setString(1, pb.getProduto());
			pst.setInt(2, pb.getQuantidade());
			pst.setDouble(3, pb.getCompra());
			pst.setDouble(4, pb.getValor());
			pst.setString(5, pb.getMarca());
			pst.execute();
			
			//Fecha conecxão
			conexao.close();
			
			validaProduto = true;
		} catch (SQLException e) {}
		
		
		return validaProduto;
		
	}
	
	// Método de seleção
	public String selecionarProduto() {

		String tabelaProduto = "<table class='table table-dark table table-striped'>";
		tabelaProduto += "<tr>";
		tabelaProduto += "<td>Nome</td>";
		tabelaProduto += "<td>Quantidade</td>";
		tabelaProduto += "<td>Valor de Compra</td>";
		tabelaProduto += "<td>Valor Venda</td>";
		tabelaProduto += "<td>Marca</td>";
		tabelaProduto += "</tr>";
		try {
			Connection c = Conexao.obterConexao();
			String sql = "select * from produtos order by nomePro";
			Statement stmt = c.createStatement();

			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				tabelaProduto += "<tr>";
				tabelaProduto += "<td>" + rs.getString(2) + "</td>";
				tabelaProduto += "<td>" + rs.getInt(3) + "</td>";
				tabelaProduto += "<td>" + rs.getDouble(4) + "</td>";
				tabelaProduto += "<td>" + rs.getDouble(5) + "</td>";
				tabelaProduto += "<td>" + rs.getString(6) + "</td>";
				tabelaProduto += "<td> <a href='alterarPro.jsp?codigo=" + rs.getInt(1)
						+ "' class='btn btn-warning'>Alterar</a> </td>";
				tabelaProduto += "<td> <a href='removerPro.jsp?codigo=" + rs.getInt(1)
						+ "' class='btn btn-danger'>Remover</a> </td>";

				tabelaProduto += "</tr>";
			}

			c.close();
		} catch (Exception e) {

		}
		tabelaProduto += "</table>";

		return tabelaProduto;

	}
	
	public ProdutoBeans buscaProduto(int codigo) {

		// Instânciar um objeto da classe Produto
		ProdutoBeans pb = new ProdutoBeans();

		// Obter dados do Produto
	
		try {
			String sql = "SELECT * FROM produtos where idPro=?";
			PreparedStatement pst = Conexao.obterConexao().prepareStatement(sql);
			pst.setInt(1, codigo);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
			
				pb.setCodigo(rs.getInt(1));
				pb.setProduto(rs.getString(2));
				pb.setQuantidade(rs.getInt(3));
				pb.setCompra(rs.getDouble(4));
				pb.setValor(rs.getDouble(5));
				pb.setMarca(rs.getString(6));
		
			}
		} catch (SQLException e) {
		}
		// Retorna
		return pb;
	}
	
	//Atualizar
	public void atualizarProdutos(ProdutoBeans pb) {

		try {
			String sql = "UPDATE produtos SET nomePro=?, qntPro=?, compraPro=?, vendaPro=?, marcaPro=?  WHERE idPro=?";
			PreparedStatement pst = Conexao.obterConexao().prepareStatement(sql);
			pst.setString(1, pb.getProduto());
			pst.setInt(2, pb.getQuantidade());
			pst.setDouble(3, pb.getCompra());
			pst.setDouble(4, pb.getValor());
			pst.setString(5, pb.getMarca());
			pst.setInt(6, pb.getCodigo());

			pst.execute();

		} catch (SQLException e) {
		}
	}
	
	//Metodo para remover
	public boolean removerProduto(int codgio) {
		
		//Validação da exclusão
		boolean validaExclusao = false;
		
		//Tentativa de exclusão
		
		try {
			String sql = "DELETE FROM produtos where idPro=?";
			PreparedStatement pst = Conexao.obterConexao().prepareStatement(sql);
			pst.setInt(1, codgio);
			pst.execute();
			validaExclusao = true;
		} catch (SQLException e) {}
		
		return validaExclusao;	
	}

}
