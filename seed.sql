DROP TABLE IF EXISTS folder;
DROP TABLE IF EXISTS notes;
CREATE TABLE folders (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    folder_name TEXT NOT NULL
 );

CREATE TABLE notes (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    note_title TEXT NOT NULL,
    note_content TEXT,
    modified TIMESTAMPTZ DEFAULT now() NOT NULL,
    folder_id INTEGER REFERENCES folders(id) ON DELETE CASCADE
);

INSERT INTO folders (folder_name) VALUES (
    'Test Folder 1'
),
(
    'Test Folder 2'
),
(
    'Test Folder 3'
);

INSERT INTO notes (note_title, note_content, folder_id)
VALUES ('Note Title 1', 'Note Content 1', 1),
('Note Title 2', 'Note Content 2', 2),
('Note Title 3', 'Note Content 3', 3);