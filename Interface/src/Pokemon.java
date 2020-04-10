public class Pokemon {

    private Integer numero;
    private String nome;
    private String url_imagem;
    private String descricao;
    private Float altura;
    private Float peso;
    private Integer hp;
    private Integer atk;
    private Integer def;
    private Integer spd;
    private String categoria;
    private String tipo1;
    private String tipo2;

    public Pokemon() {
        super();
    }

    public Pokemon(Integer numero, String nome, String url_imagem, String descricao, Float altura, Float peso, Integer hp, Integer atk, Integer def, Integer spd, String categoria, String tipo1, String tipo2) {
        super();
        this.numero = numero;
        this.nome = nome;
        this.url_imagem = url_imagem;
        this.descricao = descricao;
        this.altura = altura;
        this.peso = peso;
        this.hp = hp;
        this.atk = atk;
        this.def = def;
        this.spd = spd;
        this.categoria = categoria;
        this.tipo1 = tipo1;
        this.tipo2 = tipo2;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUrl_imagem() {
        return url_imagem;
    }

    public void setUrl_imagem(String url_imagem) {
        this.url_imagem = url_imagem;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Float getAltura() {
        return altura;
    }

    public void setAltura(Float altura) {
        this.altura = altura;
    }

    public Float getPeso() {
        return peso;
    }

    public void setPeso(Float peso) {
        this.peso = peso;
    }

    public Integer getHp() {
        return hp;
    }

    public void setHp(Integer hp) {
        this.hp = hp;
    }

    public Integer getAtk() {
        return atk;
    }

    public void setAtk(Integer atk) {
        this.atk = atk;
    }

    public Integer getDef() {
        return def;
    }

    public void setDef(Integer def) {
        this.def = def;
    }

    public Integer getSpd() {
        return spd;
    }

    public void setSpd(Integer spd) {
        this.spd = spd;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getTipo1() {
        return tipo1;
    }

    public void setTipo1(String tipo1) {
        this.tipo1 = tipo1;
    }

    public String getTipo2() {
        return tipo2;
    }

    public void setTipo2(String tipo2) {
        this.tipo2 = tipo2;
    }

}
