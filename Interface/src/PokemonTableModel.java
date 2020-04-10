import java.util.Arrays;
import java.util.List;
import javax.swing.ListSelectionModel;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.AbstractTableModel;

public class PokemonTableModel extends AbstractTableModel  implements TableModelListener {
    private List<Pokemon> pokemons;
    private List<String> colunas;
    private PokemonDAO dao;
    
    public PokemonTableModel (PokemonDAO dao){
        this.dao = dao;
        this.pokemons = dao.recupera();
        colunas = Arrays.asList("Numero", "Nome");   
        this.addTableModelListener(this);

    }
    
    public int getRowCount() { return pokemons.size(); }
    public int getColumnCount() {return colunas.size(); }
    public String getColumnName(int i){return colunas.get(i);}
    
    public Object getValueAt(int r, int c) {
        Pokemon pokemon = pokemons.get(r);
        switch (c) {
            case 0 : return pokemon.getNumero();
            case 1 : return pokemon.getNome();
        }
        return null;
    }

    @Override
    public boolean isCellEditable(int rowIndex, int columnIndex) {
        return true;
    }
	
    public void setValueAt(Object aValue, int r, int c) {
        
        Pokemon pokemon = pokemons.get(r);
	    
        switch (c) {
            case 0:
	        pokemon.setNumero((Integer) aValue);
	        break;
	    case 1:
	        pokemon.setNome((String) aValue);
	        break;
	    default:
                throw new IndexOutOfBoundsException("columnIndex out of bounds");
	}
        fireTableCellUpdated(r, c); 
    }
    
    @Override
    public void tableChanged(TableModelEvent e) {
       
        int i = e.getFirstRow();
	Pokemon pokemon = pokemons.get(i);
	System.out.println(i);
	dao.atualiza(pokemon);
    }
   
}
