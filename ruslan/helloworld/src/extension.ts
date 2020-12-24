// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from 'vscode';
import * as path from 'path';

// this method is called when your extension is activated
// your extension is activated the very first time the command is executed
export function activate(context: vscode.ExtensionContext) {

	// Use the console to output diagnostic information (console.log) and errors (console.error)
	// This line of code will only be executed once when your extension is activated
	console.log('Congratulations, your extension "helloworld" is now active!');

	// The command has been defined in the package.json file
	// Now provide the implementation of the command with registerCommand
	// The commandId parameter must match the command field in package.json
	const helloCommand = createHelloCommand();
	const catCommand = createCatCommand(context);

	context.subscriptions.push(helloCommand);
	context.subscriptions.push(catCommand);
}



function createHelloCommand() {
	return vscode.commands.registerCommand('helloworld.helloWorld', () => {
		// The code you place here will be executed every time your command is executed
		// Display a message box to the user
		//vscode.window.showInformationMessage('Hello IDE Code');
		vscode.commands.executeCommand('editorScroll', {
			to: 'down',
			by: 'halfPage',
			revealCursor: true,
		});
	});
}

function createCatCommand(context: vscode.ExtensionContext) {
	let currentPanel: vscode.WebviewPanel | undefined = undefined;

	return vscode.commands.registerCommand('catCoding.start', () => {
		const panel = vscode.window.createWebviewPanel(
			'catCoding',
			'Cat Coding',
			vscode.ViewColumn.One,
			{}
		);

		// Get path to resource on disk
		const catGifPath = vscode.Uri.file(
			path.join(context.extensionPath, 'media', 'cat.gif')
		);
		console.log(path.join(context.extensionPath, 'media', 'cat.gif'));

		const catMoviePath = vscode.Uri.file(
			path.join(context.extensionPath, 'media', 'cat.mp4')
		);

		// And get the special URI to use with the webview
		const catGifSrc = panel.webview.asWebviewUri(catGifPath);

		console.log(getWebviewContent(catGifSrc, panel.webview.asWebviewUri(catMoviePath)));
		
		panel.webview.html = getWebviewContent(catGifSrc, panel.webview.asWebviewUri(catMoviePath));

	});
}

const cats = {
	'Coding Cat': 'https://media.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif',
	'Compiling Cat': 'https://media.giphy.com/media/mlvseq9yvZhba/giphy.gif'
};

function getWebviewContent(cat: vscode.Uri, movie: vscode.Uri) {
	return `<!DOCTYPE html>
  <html lang="en">
  <head>
	  <meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <title>Cat Coding</title>
  </head>
  <body>
	  <img src="${cat}" width="300" />
	  <video width="320" height="240" controls>
  		<source src="${movie}" type="video/mp4">
</video>
  </body>
  </html>`;
}

// this method is called when your extension is deactivated
export function deactivate() { }
