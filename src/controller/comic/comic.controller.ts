import { Body, Controller, Param, Post } from '@nestjs/common';
import { Comic as ComicModel } from '@prisma/client';
import { ComicService } from 'src/service/comic/comic.service';

type CreateComicType = {
  title: string
  author: string
  description: string
  tags: string
  cover: string
  isSerialized: boolean
}
@Controller('/api/comics')
export class ComicController {
  constructor(private readonly comicService: ComicService) {}

  @Post('')
  async createComic( @Body() postData: CreateComicType ): Promise<ComicModel> {
    return this.comicService.createComic({
      ...postData
    });
  }
}

