package sg.edu.smu.cclaw;

import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNode;

import java.util.HashMap;
import java.util.Map;

public class PositionExtractor extends BabyL4BaseListener {
    private final Map<Integer, Map<Integer, ParseTree>> positionMap = new HashMap();

    @Override
    public void visitTerminal(TerminalNode node) {
        packTocken(node.getSymbol(), node);
    }

    private void packTocken(Token t, ParseTree pt) {
        Map<Integer, ParseTree> lineMap = positionMap.computeIfAbsent(t.getLine(), k -> new HashMap<>());
        final int tokenLength = t.getStopIndex() - t.getStartIndex();
        for (int i = t.getCharPositionInLine(); i < t.getCharPositionInLine() + tokenLength + 1; i++) {
            lineMap.put(i, pt);
        }
    }


    public ParseTree locateParseTree(int i, int i1) {
        return positionMap.get(i).get(i1);
    }
}
