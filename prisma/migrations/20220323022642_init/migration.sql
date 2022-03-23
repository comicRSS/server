/*
  Warnings:

  - Made the column `updatedAt` on table `Image` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Image" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "imageSrc" TEXT NOT NULL,
    "chapterId" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Image_chapterId_fkey" FOREIGN KEY ("chapterId") REFERENCES "Chapter" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Image" ("chapterId", "createdAt", "id", "imageSrc", "updatedAt") SELECT "chapterId", coalesce("createdAt", CURRENT_TIMESTAMP) AS "createdAt", "id", "imageSrc", "updatedAt" FROM "Image";
DROP TABLE "Image";
ALTER TABLE "new_Image" RENAME TO "Image";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
