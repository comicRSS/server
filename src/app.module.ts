import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './service/prisma/prisma.service';
import { ComicService } from './service/comic/comic.service';
import { ChapterService } from './service/chapter/chapter.service';
import { ImageService } from './service/image/image.service';
import { ComicController } from './controller/comic/comic.controller';

@Module({
  imports: [],
  controllers: [AppController, ComicController],
  providers: [AppService, PrismaService, ComicService, ChapterService, ImageService],
})
export class AppModule {}
