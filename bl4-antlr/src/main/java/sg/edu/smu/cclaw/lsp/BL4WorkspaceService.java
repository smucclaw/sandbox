package sg.edu.smu.cclaw.lsp;

import org.eclipse.lsp4j.DidChangeConfigurationParams;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.services.WorkspaceService;

public class BL4WorkspaceService implements WorkspaceService {

    private final BL4LanguageServer languageServer;

    public BL4WorkspaceService(BL4LanguageServer jls) {
        this.languageServer = jls;
    }

    @Override
    public void didChangeConfiguration(DidChangeConfigurationParams params) {
        languageServer.updateSettings(params.getSettings());
    }

    @Override
    public void didChangeWatchedFiles(DidChangeWatchedFilesParams params) {
    }

}
