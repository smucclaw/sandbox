/*******************************************************************************
* Copyright (c) 2020 IBM Corporation and others.
*
* This program and the accompanying materials are made available under the
* terms of the Eclipse Public License v. 2.0 which is available at
* http://www.eclipse.org/legal/epl-2.0.
*
* SPDX-License-Identifier: EPL-2.0
*
* Contributors:
*     IBM Corporation - initial API and implementation
*******************************************************************************/

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
