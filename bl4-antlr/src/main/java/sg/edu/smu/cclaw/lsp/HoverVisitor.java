package sg.edu.smu.cclaw.lsp;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import sg.edu.smu.cclaw.BabyL4BaseVisitor;
import sg.edu.smu.cclaw.BabyL4Parser;

public class HoverVisitor extends BabyL4BaseVisitor<String> {
    @Override
    public String visitLexiconBlock(BabyL4Parser.LexiconBlockContext ctx) {
        return "This is a lexicon";
    }

    @Override
    public String visitLexiconMapping(BabyL4Parser.LexiconMappingContext ctx) {
        return "This block maps variable %s to WordNet definion %s".formatted( ctx.getChild(0),  ctx.getChild(2));
    }

    @Override
    public String visitClassDeclaration(BabyL4Parser.ClassDeclarationContext ctx) {
        return "Declaration of new class : %s".formatted( ctx.getChild(1));
    }

    @Override
    public String visitClassField(BabyL4Parser.ClassFieldContext ctx) {
        ParserRuleContext classDecl = ctx.getParent().getParent();
        return "Declaration of field %s within class %s".formatted(ctx.getChild(0), classDecl.getChild(1));
    }

    @Override
    public String visitType(BabyL4Parser.TypeContext ctx) {
        ParserRuleContext typeContainer = ctx;
        do {
            typeContainer = typeContainer.getParent();
        } while (typeContainer instanceof BabyL4Parser.TypeContext);

        //Assume ClassField
        if (typeContainer instanceof BabyL4Parser.ClassFieldContext ) {
            ParserRuleContext classDecl = typeContainer.getParent().getParent();
            return "Declaration of type for field %s within class %s".formatted(typeContainer.getChild(0), classDecl.getChild(1));
        } else if (typeContainer instanceof BabyL4Parser.GlobalVarDeclsContext ) {
            return "Declaration of type for global variable %s".formatted(typeContainer.getChild(1));
        }
        return "Some type";
    }

    @Override
    public String visitGlobalVarDecls(BabyL4Parser.GlobalVarDeclsContext ctx) {
        return "Declaration of global variable %s".formatted(ctx.getChild(1));
    }

    @Override
    public String visitRules(BabyL4Parser.RulesContext ctx) {
        return "Declaration of rule %s".formatted(ctx.getChild(2));
    }


    @Override
    public String visitTerminal(TerminalNode node) {
        return "Don't know";
    }
}
