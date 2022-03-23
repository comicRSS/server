/*
  Warnings:

  - You are about to drop the column `updatedAt` on the `Image` table. All the data in the column will be lost.
  - Added the required column `updated_at` to the `Image` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Image" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "imageSrc" TEXT NOT NULL,
    "chapterId" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "Image_chapterId_fkey" FOREIGN KEY ("chapterId") REFERENCES "Chapter" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Image" ("chapterId", "createdAt", "id", "imageSrc") SELECT "chapterId", "createdAt", "id", "imageSrc" FROM "Image";
DROP TABLE "Image";
ALTER TABLE "new_Image" RENAME TO "Image";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
