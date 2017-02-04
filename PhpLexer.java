package com.lyhux;



class TokenType {
    private String name;
    private String typeName;
    private int val;


    public TokenType(String name, String typeName, int val) {
        this.name = name;
        this.typeName = typeName;
        this.val = val;
    }

    public boolean isType(String name) {
        if (name.equals(this.name)) {
            // name.equal(this.typeName)) {
            return true;
        } else {
            return false;
        }
    }

    public int val(String name) {
        if (name.equals(this.name) ||
            name.equals(this.typeName)) {
            return this.val;
        }

        return -1;
    }

}

public class PhpLexer {
    final static String delimirator = ";(){}[],~@`=+/-*.$|^&<>%!?:\"'\\";

    List<TokenType> keywords = new ArrayList<>(){{
            add(new TokenType("__halt_compiler", "T_HALT_COMPILER", 302);
                add( new TokenType("abstract", "T_ABSTRACT", 303);
        }};



    public boolean isDelemeter(char a) {
        if (delimirator.indexOf(a) > -1) {
            return true;
        } else {
            return false;
        }
    }
    
    public PhpLexer() {
        

        
    }
}
