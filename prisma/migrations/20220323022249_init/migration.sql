/*
  Warnings:

  - Added the required column `title` to the `Comic` table without a default value. This is not possible if the table is not empty.

*/
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
    "createdAt" DATETIME NOT NULL,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Comic" ("author", "cover", "createdAt", "description", "id", "isSerialized", "tags", "updatedAt") SELECT "author", "cover", "createdAt", "description", "id", "isSerialized", "tags", "updatedAt" FROM "Comic";
DROP TABLE "Comic";
ALTER TABLE "new_Comic" RENAME TO "Comic";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
