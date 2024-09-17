import React, { useState } from 'react';
import { Vine, Any, All, Leaf, Fill, HideShow,
         narnia, mustSing, cheating, laymanS, abcde, marijuana,
	 bna1981_1_1,
       } from '@/woon';
import { DocView, Document } from '@/pages/docview';
import { EssayContent1 } from '@/pages/essay';

const App: React.FC = () => {
  const [documents, setDocuments] = useState<Document[]>([
    { id: "mustSing",  title: 'Every person must sing...',          content: mustSing },
    { id: "narnia",    title: 'In Narnia, a crime is committed if', content: narnia },
    { id: "cheating",  title: '415 Cheating',                       content: cheating },
    { id: "laymanSS",  title: 'Layman Allen\'s example says S1 if', content: laymanS },
    { id: "abcde",     title: 'ABCDE example',                      content: abcde },
    { id: "marijuana",   title: 'section 420',                      content: marijuana },
    { id: "bna1981_1_1", title: 'British Nationality Act S1',       content: bna1981_1_1 },
    ]);
  const [selectedDocument, setSelectedDocument] = useState<Document | null>(null);

  const createDocument = () => {
    const newDocument: Document = {
      id: Math.random().toString(),
      title: 'In Narnia, a crime is committed if',
      content: narnia
    };
    setDocuments([...documents, newDocument]);
    setSelectedDocument(newDocument);
  };

  const deleteDocument = (document: Document) => {
    setDocuments(documents.filter((doc) => doc.id !== document.id));
    setSelectedDocument(null);
  };

  const renameDocument = (document: Document, newTitle: string) => {
    setDocuments(
      documents.map((doc) =>
        doc.id === document.id ? { ...doc, title: newTitle } : doc
      )
    );
  };

  const selectDocument = (document: Document) => {
    setSelectedDocument(document);
  };

  const updateDocumentContent = (content: Vine) => {
    if (selectedDocument) {
      setDocuments(
        documents.map((doc) =>
          doc.id === selectedDocument.id ? { ...doc, content } : doc
        )
      );
    }
  };

  return (
    <div className="app">
      <div className="navbar">
        <button onClick={createDocument}>Create Document</button>
        <ul>
          {documents.map((document) => (
            <li key={document.id}>
              <button onClick={() => selectDocument(document)}>
                {document.title}
              </button>
              <br />
              <button onClick={() => deleteDocument(document)}>(del)</button>
              <button onClick={() => renameDocument(document, 'New Title')}>
                (Rename)
              </button>
            </li>
          ))}
        </ul>
        <div><a href="/help">Help</a></div>
        <div><a href="/about">About</a></div>
        <div style={{ position: 'fixed', bottom: 1, paddingLeft: 20 }}>
          <p>L4: <a href="https://en.wikipedia.org/wiki/Mieza_(Macedonia)" target="mieza">Μίεζα</a> (<a href="https://github.com/smucclaw/sandbox/tree/default/mengwong/layman">GitHub</a>)</p>
        </div>
      </div>
      <div className="document-pane">
        {selectedDocument ? (
            <DocView
              doc={selectedDocument}
              key={selectedDocument.id}
            />
        ) : (
          <EssayContent1 />
        )}
      </div>
    </div>
  );
};

export default App;
