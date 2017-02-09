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

	List<TokenType> operator = new ArrayList<>(){{
    	add( new TokenType("!==" "T_IS_NOT_IDENTICAL" 281));
	    add( new TokenType("===" "T_IS_IDENTICAL" 282));
	    add( new TokenType("<<<" "T_START_HEREDOC" 378));
	    add( new TokenType("**=" "T_POW_EQUAL" 268));
	    add( new TokenType(">>=" "T_SR_EQUAL" 268));
	    add( new TokenType("<<=" "T_SL_EQUAL" 269));
	    add( new TokenType("**" "T_POW" 300));
	    add( new TokenType(".." "T_ELLIPSIS" 389));
	    add( new TokenType ("^=" "T_XOR_EQUAL" 270));
	    add( new TokenType("|=" "T_OR_EQUAL" 271));
	    add( new TokenType("&=" "T_AND_EQUAL" 272));
	    add( new TokenType("%=" "T_MOD_EQUAL" 273));
	    add( new TokenType(".=" "T_CONCAT_EQUAL" 274));
	    add( new TokenType("/=" "T_DIV_EQUAL" 275));
	    add( new TokenType("*=" "T_MUL_EQUAL" 276));
	    add( new TokenType("-=" "T_MINUS_EQUAL" 277));
	    add( new TokenType ("+=" "T_PLUS_EQUAL" 278));
	    add( new TokenType("||" "T_BOOLEAN_OR" 279));
	    add( new TokenType("&&" "T_BOOLEAN_AND" 280));
	    add( new TokenType("!=" "T_IS_NOT_EQUAL" 283));
	    add( new TokenType("==" "T_IS_EQUAL" 284));
	    add( new TokenType(">=" "T_IS_GREATER_OR_EQUAL" 285));
	    add( new TokenType("<=" "T_IS_SMALLER_OR_EQUAL" 286));
	    add( new TokenType(">>" "T_SR" 287));
	    add( new TokenType("<<" "T_SL" 288));
	    add( new TokenType("%>" "T_CLOSE_TAG" 376));
	    add( new TokenType("--" "T_DEC" 297));
	    add( new TokenType("++" "T_INC" 298));
	    add( new TokenType("::" "T_DOUBLE_COLON" 382));
	    add( new TokenType("::" "T_PAAMAYIM_NEKUDOTAYIM" 382));
	    
	    add( new TokenType("->" "T_OBJECT_OPERATOR" 361));
	    add( new TokenType("=>" "T_DOUBLE_ARROW" 362));
	    
	    add( new TokenType("${" "T_DOLLAR_OPEN_CURLY_BRACES" 380));
	    add( new TokenType("{$" "T_CURLY_OPEN" 381));
	    
	    add( new TokenType("\\" "T_NS_SEPARATOR" 386));
    }};

    
    List<TokenType> keyword = new ArrayList<>(){{
	    add( new TokenType("require_once" "T_REQUIRE_ONCE" 258));
	    add( new TokenType("require" "T_REQUIRE" 259));
	    add( new TokenType("eval" "T_EVAL" 260));
	    add( new TokenType("include_once" "T_INCLUDE_ONCE" 261));
	    add( new TokenType("include" "T_INCLUDE" 262));
	    add( new TokenType("or" "T_LOGICAL_OR" 263));
	    add( new TokenType("xor" "T_LOGICAL_XOR" 264));
	    add( new TokenType("and" "T_LOGICAL_AND" 265));
	    add( new TokenType("print" "T_PRINT" 266));
	    add( new TokenType("instanceof" "T_INSTANCEOF" 289));
	    add( new TokenType("unset" "T_UNSET_CAST" 290));
	    
	    add( new TokenType("(bool)" "T_BOOL_CAST" 291));
	    add( new TokenType("(boolean)" "T_BOOL_CAST" 291));
	    add( new TokenType("(object));" "T_OBJECT_CAST" 292));
	    add( new TokenType("(array));" "T_ARRAY_CAST" 293));
	    add( new TokenType("(string));" "T_STRING_CAST" 294));
	    add( new TokenType("(double)" "T_DOUBLE_CAST" 295));
	    add( new TokenType("(real)" "T_DOUBLE_CAST" 295));
	    add( new TokenType("(float);" "T_DOUBLE_CAST" 295));
	    add( new TokenType("(int)" "T_INT_CAST" 296));
	    add( new TokenType("clone" "T_CLONE" 299));
	    add( new TokenType("new" "T_NEW" 300));
	    add( new TokenType("exit" "T_EXIT" 301));
	    add( new TokenType("if" "T_IF" 302));
	    add( new TokenType("elseif" "T_ELSEIF" 303));
	    add( new TokenType("else" "T_ELSE" 304));
	    add( new TokenType("endif" "T_ENDIF" 305));
	
	    add( new TokenType("echo" "T_ECHO" 317));
	    add( new TokenType("do" "T_DO" 318));
	    add( new TokenType("while" "T_WHILE" 319));
	    add( new TokenType("endwhile" "T_ENDWHILE" 320));
	    add( new TokenType("for" "T_FOR" 321));
	    add( new TokenType("endfor" "T_ENDFOR" 322));
	    add( new TokenType("foreach" "T_FOREACH" 323));
	    add( new TokenType("endforeach" "T_ENDFOREACH" 324));
	    add( new TokenType("declare" "T_DECLARE" 325));
	    add( new TokenType("enddeclare" "T_ENDDECLARE" 326));
	    add( new TokenType("as" "T_AS" 327));
	    add( new TokenType("switch" "T_SWITCH" 328));
	    add( new TokenType("endswitch" "T_ENDSWITCH" 329));
	    add( new TokenType("case" "T_CASE" 330));
	    add( new TokenType("default" "T_DEFAULT" 331));
	    add( new TokenType("break" "T_BREAK" 332));
	    add( new TokenType("continue" "T_CONTINUE" 333));
	    add( new TokenType("got" "T_GOTO" 334));
	    add( new TokenType("function" "T_FUNCTION" 335));
	    add( new TokenType("const" "T_CONST" 336));
	    add( new TokenType("return" "T_RETURN" 337));
	    add( new TokenType("field" "T_YIELD" 267));
	    add( new TokenType("try" "T_TRY" 338));
	    add( new TokenType("catch" "T_CATCH" 339));
	    add( new TokenType("finally" "T_FINALLY" 340));
	    add( new TokenType("throw" "T_THROW" 341));
	    add( new TokenType("use" "T_USE" 342));
	    add( new TokenType("insteadof" "T_INSTEADOF" 343));
	    add( new TokenType("global" "T_GLOBAL" 344));
	    add( new TokenType("public" "T_PUBLIC" 345));
	    add( new TokenType("protected" "T_PROTECTED" 346));
	    add( new TokenType("private""T_PRIVATE" 347));
	    add( new TokenType("final" "T_FINAL" 348));
	    add( new TokenType("abstract" "T_ABSTRACT" 349));
	    add( new TokenType("static" "T_STATIC" 350));
	    add( new TokenType("var" "T_VAR" 351));
	    add( new TokenType("unset" "T_UNSET" 352));
	    add( new TokenType("isset" "T_ISSET" 353));
	    add( new TokenType("empty" "T_EMPTY" 354));
	    add( new TokenType("__halt_compiler" "T_HALT_COMPILER" 355));
	    add( new TokenType("class" "T_CLASS" 356));
	    add( new TokenType("trail" "T_TRAIT" 357));
	    add( new TokenType("interface" "T_INTERFACE" 358));
	    add( new TokenType("extends" "T_EXTENDS" 359));
	    add( new TokenType("implements" "T_IMPLEMENTS" 360));
	   
	    add( new TokenType("list" "T_LIST" 363));
	    add( new TokenType("array" "T_ARRAY" 364));
	    add( new TokenType("callable" "T_CALLABLE" 365));
	    add( new TokenType("__CLASS__" "T_CLASS_C" 366));
	    add( new TokenType("__TRAIT__" "T_TRAIT_C" 367));
	    add( new TokenType("__METHOD__" "T_METHOD_C" 368));
	    add( new TokenType("__FUNC__" "T_FUNC_C" 369));
	    add( new TokenType("__LINE__" "T_LINE" 370));
	    add( new TokenType("__FILE__" "T_FILE" 371));
	   
	    add( new TokenType("namespace" "T_NAMESPACE" 383));
	    add( new TokenType("__namespace__" "T_NS_C" 384));
	    add( new TokenType("__DIR__" "T_DIR" 385));
    
    
    }}
    
    private String[] whitespace = {" ", "\t", "\r", "\n"};
    
    
    public boolean isWhitespace(String c) {
    	for(String cc : whitespace) {
    		if (cc.equals(c)) {
    			return true;
    		}
    	}
    	
    	return false;
    }
    
    
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
