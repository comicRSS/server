-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Image" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "imageSrc" TEXT NOT NULL,
    "chapterId" INTEGER NOT NULL,
    "createdAt" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME,
    CONSTRAINT "Image_chapterId_fkey" FOREIGN KEY ("chapterId") REFERENCES "Chapter" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Image" ("chapterId", "createdAt", "id", "imageSrc", "updatedAt") SELECT "chapterId", "createdAt", "id", "imageSrc", "updatedAt" FROM "Image";
DROP TABLE "Image";
ALTER TABLE "new_Image" RENAME TO "Image";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
