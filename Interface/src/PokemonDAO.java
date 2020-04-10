
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PokemonDAO {

    private Connection conn;
    String url = "jdbc:postgresql://localhost/pokedex?user=postgres&password=bct";

    public PokemonDAO() {
        try {
            conn = DriverManager.getConnection(url);
            System.out.println("conectado");
        } catch (SQLException excecao) {
            throw new RuntimeException(excecao);
        }
    }

    
    public void adiciona(Pokemon p) {
        String sql = "INSERT INTO pokedex.pokemon(numero,nome) VALUES(?,?)";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, p.getNumero());
            stmt.setString(2, p.getNome());
            stmt.execute();
            stmt.close();
        } catch (SQLException u) {
            throw new RuntimeException(u);
        }
    }
    

    public List<Pokemon> recupera() {
        String sql = "select * from pokedex.pokemon order by numero";
        List<Pokemon> pokemons = new ArrayList<Pokemon>();
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Pokemon pokemon = new Pokemon();
                pokemon.setNumero(rs.getInt("numero"));
                pokemon.setNome(rs.getString("nome"));
                pokemon.setAltura(rs.getFloat("altura"));
                pokemon.setAtk(rs.getInt("atk"));
                pokemon.setCategoria(rs.getString("categoria"));
                pokemon.setDef(rs.getInt("def"));
                pokemon.setDescricao(rs.getString("descricao"));
                pokemon.setHp(rs.getInt("hp"));
                pokemon.setPeso(rs.getFloat("peso"));
                pokemon.setSpd(rs.getInt("speed"));
                pokemon.setTipo1(rs.getString("tipo_1"));
                pokemon.setTipo2(rs.getString("tipo_2"));
                pokemon.setUrl_imagem(rs.getString("url"));
                pokemons.add(pokemon);
            }

            stmt.close();
        } catch (SQLException u) {
            throw new RuntimeException(u);
        }
        return pokemons;
    }

    public List<Pokemon> recupera_por_numero(Integer i) {
        String sql = "select * from pokedex.pokemon where numero = ?";
        List<Pokemon> pokemons = new ArrayList<Pokemon>();
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, i);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Pokemon pokemon = new Pokemon();
                pokemon.setNumero(rs.getInt("numero"));
                pokemon.setNome(rs.getString("nome"));
                pokemon.setAltura(rs.getFloat("altura"));
                pokemon.setAtk(rs.getInt("atk"));
                pokemon.setCategoria(rs.getString("categoria"));
                pokemon.setDef(rs.getInt("def"));
                pokemon.setDescricao(rs.getString("descricao"));
                pokemon.setHp(rs.getInt("hp"));
                pokemon.setPeso(rs.getFloat("peso"));
                pokemon.setSpd(rs.getInt("speed"));
                pokemon.setTipo1(rs.getString("tipo_1"));
                pokemon.setTipo2(rs.getString("tipo_2"));
                pokemon.setUrl_imagem(rs.getString("url"));
                pokemons.add(pokemon);
            }

            stmt.close();
        } catch (SQLException u) {
            throw new RuntimeException(u);
        }
        return pokemons;
    }

    
    public void atualiza(Pokemon p) {
        String sql = "update pokedex.pokemon set nome=?  where numero = ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, p.getNumero());
            stmt.setString(2, p.getNome());
            stmt.execute();
            stmt.close();
        } catch (SQLException u) {
            throw new RuntimeException(u);
        }
    }
    
}
