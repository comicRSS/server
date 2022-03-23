-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Comic" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "tags" TEXT NOT NULL,
    "cover" TEXT NOT NULL,
    "isSerialized" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Comic" ("author", "cover", "createdAt", "description", "id", "isSerialized", "tags", "title", "updatedAt") SELECT "author", "cover", "createdAt", "description", "id", "isSerialized", "tags", "title", "updatedAt" FROM "Comic";
DROP TABLE "Comic";
ALTER TABLE "new_Comic" RENAME TO "Comic";
CREATE TABLE "new_Chapter" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "comicId" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Chapter_comicId_fkey" FOREIGN KEY ("comicId") REFERENCES "Comic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Chapter" ("comicId", "createdAt", "id", "title", "updatedAt") SELECT "comicId", "createdAt", "id", "title", "updatedAt" FROM "Chapter";
DROP TABLE "Chapter";
ALTER TABLE "new_Chapter" RENAME TO "Chapter";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
