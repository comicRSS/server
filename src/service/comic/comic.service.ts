import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import {
  Comic,
  Prisma
} from '@prisma/client';

@Injectable()
export class ComicService {
  constructor(private prisma: PrismaService) { }

  async comic(where: Prisma.ComicWhereUniqueInput): Promise<Comic | null>{
    return this.prisma.comic.findUnique({ where })
  }

  async comics(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.ComicWhereUniqueInput;
    where?: Prisma.ComicWhereInput;
    orderBy?: Prisma.ComicOrderByWithRelationInput;
  }): Promise<Comic[]> {
    const { skip, take, cursor, where, orderBy } = params;
    return this.prisma.comic.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async createComic(data: Prisma.ComicCreateInput): Promise<Comic> {
    return this.prisma.comic.create({
      data,
    });
  }

  async updateComic(params: {
    where: Prisma.ComicWhereUniqueInput;
    data: Prisma.ComicUpdateInput;
  }): Promise<Comic> {
    const { where, data } = params;
    return this.prisma.comic.update({
      data,
      where,
    });
  }

  async deleteComic(where: Prisma.ComicWhereUniqueInput): Promise<Comic> {
    return this.prisma.comic.delete({
      where,
    });
  }
}
