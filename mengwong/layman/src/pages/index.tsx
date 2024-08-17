import React, { useState } from 'react';
import { Vine, Any, All, Leaf, Fill, HideShow,
        narnia, mustSing } from '@/woon';
import { DocView, Document } from '@/pages/docview';
import { EssayContent1 } from '@/pages/essay';

const App: React.FC = () => {
  const [documents, setDocuments] = useState<Document[]>([
    { id: "narnia",
      title: 'In Narnia, a crime is committed if',
      content: narnia },
    { id: "mustSing",
      title: 'Every person must sing...',
      content: mustSing
     }
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
      </div>
      <div className="document-pane">
        {selectedDocument ? (
          <><p>rendering docview with {selectedDocument.id} {selectedDocument.title}</p>
            <DocView
              doc={selectedDocument}
            />

          </>
        ) : (
          <EssayContent1 />
        )}
      </div>
    </div>
  );
};

export default App;