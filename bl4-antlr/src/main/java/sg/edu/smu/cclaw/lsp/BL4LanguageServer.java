package sg.edu.smu.cclaw.lsp;

import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.*;

import java.util.concurrent.CompletableFuture;
import java.util.logging.Logger;

public class BL4LanguageServer implements LanguageServer, LanguageClientAware {

    private static final Logger LOGGER = Logger.getLogger(BL4LanguageServer.class.getName());

    private final WorkspaceService workspaceService;
    private final TextDocumentService textDocumentService;
    private LanguageClient client;


    public BL4LanguageServer() {
        // Workspace service handles workspace settings changes and calls update
        // settings.
        workspaceService = new BL4WorkspaceService(this);
        textDocumentService = new BL4TextDocumentService();
    }

    @Override
    public CompletableFuture<InitializeResult> initialize(InitializeParams params) {
        LOGGER.info("Initializing BL4 server");
        ServerCapabilities serverCapabilities = new ServerCapabilities();
        serverCapabilities.setTextDocumentSync(TextDocumentSyncKind.Incremental);

        InitializeResult initializeResult = new InitializeResult(serverCapabilities);

        initializeResult.getCapabilities().setHoverProvider(true);

        return CompletableFuture.completedFuture(initializeResult);
    }

    public synchronized void updateSettings(Object initializationOptionsSettings) {
        if (initializationOptionsSettings == null) {
            return;
        }
        // TODO: else update settings
    }

    @Override
    public CompletableFuture<Object> shutdown() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void exit() {
        System.exit(0);
    }

    @Override
    public TextDocumentService getTextDocumentService() {
        LOGGER.info("TextDocumentService Hooked");
        return this.textDocumentService;
    }

    @Override
    public WorkspaceService getWorkspaceService() {
        return this.workspaceService;
    }


    @Override
    public void connect(LanguageClient client) {
        this.client = client;
    }
}
