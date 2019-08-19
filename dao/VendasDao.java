package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import conexão.Conexao;

public class VendasDao {
	
	public String tabelaVenda() {
		
		String tabela = "<table class='table table-dark table table-striped'>";
		tabela += "<tr>";
		tabela += "<td>Produto</td>";
		tabela += "<td>Valor</td>";
		tabela += "</tr>";
		
		Connection c = Conexao.obterConexao();
		String sql ="SELECT *FROM produtos order by nomePro";
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				tabela += "<tr>";
				
				tabela += "<td>" + rs.getString(2) + "</td>";
				tabela += "<td>" + rs.getDouble(5) + "</td>";
				tabela += "<td> <a href='alterarPro.jsp?codigo=" + rs.getInt(1)
						+ "' class='btn btn-warning'>Adicionar</a> </td>";
				

				tabela += "</tr>";
			}
		} catch (SQLException e) {
		}
		tabela += "</table>";
		return tabela;
	}
	
	

}
