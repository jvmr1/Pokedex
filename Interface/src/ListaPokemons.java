
import java.awt.GridLayout;
import javafx.stage.Stage;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

public class ListaPokemons extends JFrame {

    public ListaPokemons() {
        super("Pokemons");
        PokemonDAO dao = new PokemonDAO();
        PokemonTableModel tm = new PokemonTableModel(dao);
        
        JTable t = new JTable(tm);
        JScrollPane scroll = new JScrollPane();
        scroll.setViewportView(t);
        this.setTitle("Pokedex");

        t.addMouseListener(new java.awt.event.MouseAdapter() {
            @Override
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                
                Pokemon pokemon;
                pokemon = dao.recupera_por_numero(Integer.parseInt(t.getValueAt(t.getSelectedRow(), 0).toString())).get(0);
                PokeCardJFrame p = new PokeCardJFrame(pokemon);
                
            }
        });

       
        add(scroll);
        setSize(250, 250);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
}
