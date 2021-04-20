package sg.edu.smu.cclaw.lsp;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;
import sg.edu.smu.cclaw.BabyL4Lexer;
import sg.edu.smu.cclaw.BabyL4Parser;
import sg.edu.smu.cclaw.PositionExtractor;


import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.concurrent.CompletableFuture;
import java.util.logging.Logger;


public class BL4TextDocumentService implements TextDocumentService {

    private static final Logger LOGGER = Logger.getLogger(BL4TextDocumentService.class.getName());

    @Override
    public CompletableFuture<Hover> hover(HoverParams params) {

        String message = "";
        LOGGER.info("received textDocument/hover request:" + params);
        try {
            final Path path = Paths.get(new URI(params.getTextDocument().getUri()));
            CharStream input = CharStreams.fromPath(path);
            message = getHoverMessage(input, params.getPosition());
        } catch (URISyntaxException | IOException e) {
            throw new IllegalArgumentException("Failed to get file from hover param", e);
        }

        Hover h = new Hover(new MarkupContent("markdown", message));
        return CompletableFuture.completedFuture(h);
    }

     public static String getHoverMessage(CharStream input, Position position) throws IOException {
        BabyL4Lexer lex = new BabyL4Lexer(input);

        CommonTokenStream tokens = new CommonTokenStream(lex);

        BabyL4Parser p = new BabyL4Parser(tokens);
        ParseTree tree = p.program();

        ParseTreeWalker walker = new ParseTreeWalker(); // create standard walker
        PositionExtractor extractor = new PositionExtractor();
        walker.walk(extractor, tree); // initiate walk of tree with listener

        ParseTree lexMapNode = extractor.locateParseTree(position.getLine() + 1, position.getCharacter() + 1);

         return getHoverFromTree(lexMapNode);
     }

    public static  String getHoverFromTree(ParseTree lexMapNode) {
        HoverVisitor hoverVisitor = new HoverVisitor();
        if (lexMapNode != null ){
            return hoverVisitor.visit(lexMapNode.getParent());
        }
        return "Dont know";
    }

    @Override
    public void didOpen(DidOpenTextDocumentParams params) {

    }

    @Override
    public void didChange(DidChangeTextDocumentParams params) {

    }

    @Override
    public void didClose(DidCloseTextDocumentParams params) {

    }

    @Override
    public void didSave(DidSaveTextDocumentParams params) {

    }

}
