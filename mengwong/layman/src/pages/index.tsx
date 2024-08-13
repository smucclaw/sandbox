import React, { useState } from 'react';
import { Vine, Document, HideShow, AnyAll } from '@/woon';
import { DocView } from '@/pages/docview';

const App: React.FC = () => {
  const [documents, setDocuments] = useState<Document[]>([]);
  const [selectedDocument, setSelectedDocument] = useState<Document | null>(null);

  const createDocument = () => {
    const newDocument: Document = {
      id: Math.random().toString(),
      title: 'Untitled Document',
      content: { type: 'linear', children: [
        { type: 'leaf', text: 'In Narnia, a crime requires' },
        { type: 'parent', anyAll: AnyAll.All, hideShow: HideShow.Collapsed, children: [
          { type: 'parent', anyAll: AnyAll.Any, hideShow: HideShow.Collapsed, children: [
            { type: 'leaf', text: 'a grumpy head' },
            { type: 'linear', text: 'or' },
            { type: 'leaf', text: 'an unkind heart' }
          ] },
          { type: 'linear', text: 'and' },
          { type: 'parent', anyAll: AnyAll.Any, hideShow: HideShow.Collapsed, children: [
            { type: 'leaf', text: 'a bloody fist' },
            { type: 'linear', text: 'or' },
            { type: 'leaf', text: 'a venomous tooth' }
          ] },
        ] },
      ] },
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
        <a href="/help">Help</a>
      </div>
      <div className="document-pane">
        {selectedDocument ? (
          <><p>rendering docview with {selectedDocument.id} {selectedDocument.title}</p>
            <DocView
              doc={selectedDocument}
            />

          </>
        ) : (
          <p>No document selected</p>
        )}
      </div>
    </div>
  );
};

export default App;