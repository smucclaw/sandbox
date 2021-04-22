package sg.edu.smu.cclaw.lsp;

import org.eclipse.lsp4j.jsonrpc.Launcher;
import org.eclipse.lsp4j.launch.LSPLauncher;
import org.eclipse.lsp4j.services.LanguageClient;


public class BL4LanguageServerLauncher {
    public static void main(String[] args) {
        BL4LanguageServer server = new BL4LanguageServer();

        Launcher<LanguageClient> launcher = LSPLauncher.createServerLauncher(server,
                System.in,
                System.out);

        server.connect(launcher.getRemoteProxy());

        launcher.startListening();
    }

}
