
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp
  13:	8b 01                	mov    (%ecx),%eax
  15:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
  18:	83 f8 01             	cmp    $0x1,%eax
  1b:	7e 20                	jle    3d <main+0x3d>
  1d:	8d 5a 04             	lea    0x4(%edx),%ebx
  20:	8d 34 82             	lea    (%edx,%eax,4),%esi
  23:	90                   	nop
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  24:	83 ec 0c             	sub    $0xc,%esp
  27:	ff 33                	pushl  (%ebx)
  29:	e8 b2 00 00 00       	call   e0 <ls>
  for(i=1; i<argc; i++)
  2e:	83 c3 04             	add    $0x4,%ebx
  31:	83 c4 10             	add    $0x10,%esp
  34:	39 f3                	cmp    %esi,%ebx
  36:	75 ec                	jne    24 <main+0x24>
  exit();
  38:	e8 68 04 00 00       	call   4a5 <exit>
    ls(".");
  3d:	83 ec 0c             	sub    $0xc,%esp
  40:	68 2c 09 00 00       	push   $0x92c
  45:	e8 96 00 00 00       	call   e0 <ls>
    exit();
  4a:	e8 56 04 00 00       	call   4a5 <exit>
  4f:	90                   	nop

00000050 <fmtname>:
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	56                   	push   %esi
  54:	53                   	push   %ebx
  55:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  58:	83 ec 0c             	sub    $0xc,%esp
  5b:	56                   	push   %esi
  5c:	e8 e7 02 00 00       	call   348 <strlen>
  61:	83 c4 10             	add    $0x10,%esp
  64:	01 f0                	add    %esi,%eax
  66:	89 c3                	mov    %eax,%ebx
  68:	73 0b                	jae    75 <fmtname+0x25>
  6a:	eb 0e                	jmp    7a <fmtname+0x2a>
  6c:	8d 43 ff             	lea    -0x1(%ebx),%eax
  6f:	39 c6                	cmp    %eax,%esi
  71:	77 08                	ja     7b <fmtname+0x2b>
  73:	89 c3                	mov    %eax,%ebx
  75:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  78:	75 f2                	jne    6c <fmtname+0x1c>
  7a:	43                   	inc    %ebx
  if(strlen(p) >= DIRSIZ)
  7b:	83 ec 0c             	sub    $0xc,%esp
  7e:	53                   	push   %ebx
  7f:	e8 c4 02 00 00       	call   348 <strlen>
  84:	83 c4 10             	add    $0x10,%esp
  87:	83 f8 0d             	cmp    $0xd,%eax
  8a:	77 4a                	ja     d6 <fmtname+0x86>
  memmove(buf, p, strlen(p));
  8c:	83 ec 0c             	sub    $0xc,%esp
  8f:	53                   	push   %ebx
  90:	e8 b3 02 00 00       	call   348 <strlen>
  95:	83 c4 0c             	add    $0xc,%esp
  98:	50                   	push   %eax
  99:	53                   	push   %ebx
  9a:	68 50 0c 00 00       	push   $0xc50
  9f:	e8 d8 03 00 00       	call   47c <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  a4:	89 1c 24             	mov    %ebx,(%esp)
  a7:	e8 9c 02 00 00       	call   348 <strlen>
  ac:	89 c6                	mov    %eax,%esi
  ae:	89 1c 24             	mov    %ebx,(%esp)
  b1:	e8 92 02 00 00       	call   348 <strlen>
  b6:	83 c4 0c             	add    $0xc,%esp
  b9:	ba 0e 00 00 00       	mov    $0xe,%edx
  be:	29 f2                	sub    %esi,%edx
  c0:	52                   	push   %edx
  c1:	6a 20                	push   $0x20
  c3:	05 50 0c 00 00       	add    $0xc50,%eax
  c8:	50                   	push   %eax
  c9:	e8 a2 02 00 00       	call   370 <memset>
  return buf;
  ce:	83 c4 10             	add    $0x10,%esp
  d1:	bb 50 0c 00 00       	mov    $0xc50,%ebx
}
  d6:	89 d8                	mov    %ebx,%eax
  d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  db:	5b                   	pop    %ebx
  dc:	5e                   	pop    %esi
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret    
  df:	90                   	nop

000000e0 <ls>:
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	56                   	push   %esi
  e5:	53                   	push   %ebx
  e6:	81 ec 64 02 00 00    	sub    $0x264,%esp
  ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
  ef:	6a 00                	push   $0x0
  f1:	57                   	push   %edi
  f2:	e8 ee 03 00 00       	call   4e5 <open>
  f7:	83 c4 10             	add    $0x10,%esp
  fa:	85 c0                	test   %eax,%eax
  fc:	0f 88 82 01 00 00    	js     284 <ls+0x1a4>
 102:	89 c3                	mov    %eax,%ebx
  if(fstat(fd, &st) < 0){
 104:	83 ec 08             	sub    $0x8,%esp
 107:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 10d:	56                   	push   %esi
 10e:	50                   	push   %eax
 10f:	e8 e9 03 00 00       	call   4fd <fstat>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	0f 88 99 01 00 00    	js     2b8 <ls+0x1d8>
  switch(st.type){
 11f:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
 125:	66 83 f8 01          	cmp    $0x1,%ax
 129:	74 59                	je     184 <ls+0xa4>
 12b:	66 83 f8 02          	cmp    $0x2,%ax
 12f:	74 17                	je     148 <ls+0x68>
  close(fd);
 131:	83 ec 0c             	sub    $0xc,%esp
 134:	53                   	push   %ebx
 135:	e8 93 03 00 00       	call   4cd <close>
 13a:	83 c4 10             	add    $0x10,%esp
}
 13d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 140:	5b                   	pop    %ebx
 141:	5e                   	pop    %esi
 142:	5f                   	pop    %edi
 143:	5d                   	pop    %ebp
 144:	c3                   	ret    
 145:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 148:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 14e:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 154:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 15a:	83 ec 0c             	sub    $0xc,%esp
 15d:	57                   	push   %edi
 15e:	e8 ed fe ff ff       	call   50 <fmtname>
 163:	59                   	pop    %ecx
 164:	5f                   	pop    %edi
 165:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 16b:	52                   	push   %edx
 16c:	56                   	push   %esi
 16d:	6a 02                	push   $0x2
 16f:	50                   	push   %eax
 170:	68 0c 09 00 00       	push   $0x90c
 175:	6a 01                	push   $0x1
 177:	e8 5c 04 00 00       	call   5d8 <printf>
    break;
 17c:	83 c4 20             	add    $0x20,%esp
 17f:	eb b0                	jmp    131 <ls+0x51>
 181:	8d 76 00             	lea    0x0(%esi),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 184:	83 ec 0c             	sub    $0xc,%esp
 187:	57                   	push   %edi
 188:	e8 bb 01 00 00       	call   348 <strlen>
 18d:	83 c0 10             	add    $0x10,%eax
 190:	83 c4 10             	add    $0x10,%esp
 193:	3d 00 02 00 00       	cmp    $0x200,%eax
 198:	0f 87 02 01 00 00    	ja     2a0 <ls+0x1c0>
    strcpy(buf, path);
 19e:	83 ec 08             	sub    $0x8,%esp
 1a1:	57                   	push   %edi
 1a2:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1a8:	57                   	push   %edi
 1a9:	e8 46 01 00 00       	call   2f4 <strcpy>
    p = buf+strlen(buf);
 1ae:	89 3c 24             	mov    %edi,(%esp)
 1b1:	e8 92 01 00 00       	call   348 <strlen>
 1b6:	8d 0c 07             	lea    (%edi,%eax,1),%ecx
 1b9:	89 8d a8 fd ff ff    	mov    %ecx,-0x258(%ebp)
    *p++ = '/';
 1bf:	8d 44 07 01          	lea    0x1(%edi,%eax,1),%eax
 1c3:	89 85 a4 fd ff ff    	mov    %eax,-0x25c(%ebp)
 1c9:	c6 01 2f             	movb   $0x2f,(%ecx)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1cc:	83 c4 10             	add    $0x10,%esp
 1cf:	90                   	nop
 1d0:	50                   	push   %eax
 1d1:	6a 10                	push   $0x10
 1d3:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 1d9:	50                   	push   %eax
 1da:	53                   	push   %ebx
 1db:	e8 dd 02 00 00       	call   4bd <read>
 1e0:	83 c4 10             	add    $0x10,%esp
 1e3:	83 f8 10             	cmp    $0x10,%eax
 1e6:	0f 85 45 ff ff ff    	jne    131 <ls+0x51>
      if(de.inum == 0)
 1ec:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 1f3:	00 
 1f4:	74 da                	je     1d0 <ls+0xf0>
      memmove(p, de.name, DIRSIZ);
 1f6:	50                   	push   %eax
 1f7:	6a 0e                	push   $0xe
 1f9:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 1ff:	50                   	push   %eax
 200:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
 206:	e8 71 02 00 00       	call   47c <memmove>
      p[DIRSIZ] = 0;
 20b:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 211:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 215:	58                   	pop    %eax
 216:	5a                   	pop    %edx
 217:	56                   	push   %esi
 218:	57                   	push   %edi
 219:	e8 e2 01 00 00       	call   400 <stat>
 21e:	83 c4 10             	add    $0x10,%esp
 221:	85 c0                	test   %eax,%eax
 223:	0f 88 b3 00 00 00    	js     2dc <ls+0x1fc>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 229:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 22f:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 235:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 23b:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 241:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 248:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	57                   	push   %edi
 252:	e8 f9 fd ff ff       	call   50 <fmtname>
 257:	5a                   	pop    %edx
 258:	59                   	pop    %ecx
 259:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 25f:	51                   	push   %ecx
 260:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 266:	52                   	push   %edx
 267:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 26d:	50                   	push   %eax
 26e:	68 0c 09 00 00       	push   $0x90c
 273:	6a 01                	push   $0x1
 275:	e8 5e 03 00 00       	call   5d8 <printf>
 27a:	83 c4 20             	add    $0x20,%esp
 27d:	e9 4e ff ff ff       	jmp    1d0 <ls+0xf0>
 282:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot open %s\n", path);
 284:	50                   	push   %eax
 285:	57                   	push   %edi
 286:	68 e4 08 00 00       	push   $0x8e4
 28b:	6a 02                	push   $0x2
 28d:	e8 46 03 00 00       	call   5d8 <printf>
    return;
 292:	83 c4 10             	add    $0x10,%esp
}
 295:	8d 65 f4             	lea    -0xc(%ebp),%esp
 298:	5b                   	pop    %ebx
 299:	5e                   	pop    %esi
 29a:	5f                   	pop    %edi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret    
 29d:	8d 76 00             	lea    0x0(%esi),%esi
      printf(1, "ls: path too long\n");
 2a0:	83 ec 08             	sub    $0x8,%esp
 2a3:	68 19 09 00 00       	push   $0x919
 2a8:	6a 01                	push   $0x1
 2aa:	e8 29 03 00 00       	call   5d8 <printf>
      break;
 2af:	83 c4 10             	add    $0x10,%esp
 2b2:	e9 7a fe ff ff       	jmp    131 <ls+0x51>
 2b7:	90                   	nop
    printf(2, "ls: cannot stat %s\n", path);
 2b8:	50                   	push   %eax
 2b9:	57                   	push   %edi
 2ba:	68 f8 08 00 00       	push   $0x8f8
 2bf:	6a 02                	push   $0x2
 2c1:	e8 12 03 00 00       	call   5d8 <printf>
    close(fd);
 2c6:	89 1c 24             	mov    %ebx,(%esp)
 2c9:	e8 ff 01 00 00       	call   4cd <close>
    return;
 2ce:	83 c4 10             	add    $0x10,%esp
}
 2d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d4:	5b                   	pop    %ebx
 2d5:	5e                   	pop    %esi
 2d6:	5f                   	pop    %edi
 2d7:	5d                   	pop    %ebp
 2d8:	c3                   	ret    
 2d9:	8d 76 00             	lea    0x0(%esi),%esi
        printf(1, "ls: cannot stat %s\n", buf);
 2dc:	50                   	push   %eax
 2dd:	57                   	push   %edi
 2de:	68 f8 08 00 00       	push   $0x8f8
 2e3:	6a 01                	push   $0x1
 2e5:	e8 ee 02 00 00       	call   5d8 <printf>
        continue;
 2ea:	83 c4 10             	add    $0x10,%esp
 2ed:	e9 de fe ff ff       	jmp    1d0 <ls+0xf0>
 2f2:	66 90                	xchg   %ax,%ax

000002f4 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	53                   	push   %ebx
 2f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2fe:	31 c0                	xor    %eax,%eax
 300:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 303:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 306:	40                   	inc    %eax
 307:	84 d2                	test   %dl,%dl
 309:	75 f5                	jne    300 <strcpy+0xc>
    ;
  return os;
}
 30b:	89 c8                	mov    %ecx,%eax
 30d:	5b                   	pop    %ebx
 30e:	5d                   	pop    %ebp
 30f:	c3                   	ret    

00000310 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	53                   	push   %ebx
 314:	8b 5d 08             	mov    0x8(%ebp),%ebx
 317:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 31a:	0f b6 03             	movzbl (%ebx),%eax
 31d:	0f b6 0a             	movzbl (%edx),%ecx
 320:	84 c0                	test   %al,%al
 322:	75 10                	jne    334 <strcmp+0x24>
 324:	eb 1a                	jmp    340 <strcmp+0x30>
 326:	66 90                	xchg   %ax,%ax
    p++, q++;
 328:	43                   	inc    %ebx
 329:	42                   	inc    %edx
  while(*p && *p == *q)
 32a:	0f b6 03             	movzbl (%ebx),%eax
 32d:	0f b6 0a             	movzbl (%edx),%ecx
 330:	84 c0                	test   %al,%al
 332:	74 0c                	je     340 <strcmp+0x30>
 334:	38 c8                	cmp    %cl,%al
 336:	74 f0                	je     328 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 338:	29 c8                	sub    %ecx,%eax
}
 33a:	5b                   	pop    %ebx
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    
 33d:	8d 76 00             	lea    0x0(%esi),%esi
 340:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 342:	29 c8                	sub    %ecx,%eax
}
 344:	5b                   	pop    %ebx
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    
 347:	90                   	nop

00000348 <strlen>:

uint
strlen(const char *s)
{
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 34e:	80 3a 00             	cmpb   $0x0,(%edx)
 351:	74 15                	je     368 <strlen+0x20>
 353:	31 c0                	xor    %eax,%eax
 355:	8d 76 00             	lea    0x0(%esi),%esi
 358:	40                   	inc    %eax
 359:	89 c1                	mov    %eax,%ecx
 35b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 35f:	75 f7                	jne    358 <strlen+0x10>
    ;
  return n;
}
 361:	89 c8                	mov    %ecx,%eax
 363:	5d                   	pop    %ebp
 364:	c3                   	ret    
 365:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 368:	31 c9                	xor    %ecx,%ecx
}
 36a:	89 c8                	mov    %ecx,%eax
 36c:	5d                   	pop    %ebp
 36d:	c3                   	ret    
 36e:	66 90                	xchg   %ax,%ax

00000370 <memset>:

void*
memset(void *dst, int c, uint n)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 374:	8b 7d 08             	mov    0x8(%ebp),%edi
 377:	8b 4d 10             	mov    0x10(%ebp),%ecx
 37a:	8b 45 0c             	mov    0xc(%ebp),%eax
 37d:	fc                   	cld    
 37e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 380:	8b 45 08             	mov    0x8(%ebp),%eax
 383:	5f                   	pop    %edi
 384:	5d                   	pop    %ebp
 385:	c3                   	ret    
 386:	66 90                	xchg   %ax,%ax

00000388 <strchr>:

char*
strchr(const char *s, char c)
{
 388:	55                   	push   %ebp
 389:	89 e5                	mov    %esp,%ebp
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 391:	8a 10                	mov    (%eax),%dl
 393:	84 d2                	test   %dl,%dl
 395:	75 0c                	jne    3a3 <strchr+0x1b>
 397:	eb 13                	jmp    3ac <strchr+0x24>
 399:	8d 76 00             	lea    0x0(%esi),%esi
 39c:	40                   	inc    %eax
 39d:	8a 10                	mov    (%eax),%dl
 39f:	84 d2                	test   %dl,%dl
 3a1:	74 09                	je     3ac <strchr+0x24>
    if(*s == c)
 3a3:	38 d1                	cmp    %dl,%cl
 3a5:	75 f5                	jne    39c <strchr+0x14>
      return (char*)s;
  return 0;
}
 3a7:	5d                   	pop    %ebp
 3a8:	c3                   	ret    
 3a9:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
 3ac:	31 c0                	xor    %eax,%eax
}
 3ae:	5d                   	pop    %ebp
 3af:	c3                   	ret    

000003b0 <gets>:

char*
gets(char *buf, int max)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	56                   	push   %esi
 3b5:	53                   	push   %ebx
 3b6:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3b9:	8b 75 08             	mov    0x8(%ebp),%esi
 3bc:	bb 01 00 00 00       	mov    $0x1,%ebx
 3c1:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
 3c3:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 3c6:	eb 20                	jmp    3e8 <gets+0x38>
    cc = read(0, &c, 1);
 3c8:	50                   	push   %eax
 3c9:	6a 01                	push   $0x1
 3cb:	57                   	push   %edi
 3cc:	6a 00                	push   $0x0
 3ce:	e8 ea 00 00 00       	call   4bd <read>
    if(cc < 1)
 3d3:	83 c4 10             	add    $0x10,%esp
 3d6:	85 c0                	test   %eax,%eax
 3d8:	7e 16                	jle    3f0 <gets+0x40>
      break;
    buf[i++] = c;
 3da:	8a 45 e7             	mov    -0x19(%ebp),%al
 3dd:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
 3df:	46                   	inc    %esi
 3e0:	3c 0a                	cmp    $0xa,%al
 3e2:	74 0c                	je     3f0 <gets+0x40>
 3e4:	3c 0d                	cmp    $0xd,%al
 3e6:	74 08                	je     3f0 <gets+0x40>
  for(i=0; i+1 < max; ){
 3e8:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 3eb:	39 45 0c             	cmp    %eax,0xc(%ebp)
 3ee:	7f d8                	jg     3c8 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 3f0:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
 3f3:	8b 45 08             	mov    0x8(%ebp),%eax
 3f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f9:	5b                   	pop    %ebx
 3fa:	5e                   	pop    %esi
 3fb:	5f                   	pop    %edi
 3fc:	5d                   	pop    %ebp
 3fd:	c3                   	ret    
 3fe:	66 90                	xchg   %ax,%ax

00000400 <stat>:

int
stat(const char *n, struct stat *st)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	56                   	push   %esi
 404:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 405:	83 ec 08             	sub    $0x8,%esp
 408:	6a 00                	push   $0x0
 40a:	ff 75 08             	pushl  0x8(%ebp)
 40d:	e8 d3 00 00 00       	call   4e5 <open>
  if(fd < 0)
 412:	83 c4 10             	add    $0x10,%esp
 415:	85 c0                	test   %eax,%eax
 417:	78 27                	js     440 <stat+0x40>
 419:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 41b:	83 ec 08             	sub    $0x8,%esp
 41e:	ff 75 0c             	pushl  0xc(%ebp)
 421:	50                   	push   %eax
 422:	e8 d6 00 00 00       	call   4fd <fstat>
 427:	89 c6                	mov    %eax,%esi
  close(fd);
 429:	89 1c 24             	mov    %ebx,(%esp)
 42c:	e8 9c 00 00 00       	call   4cd <close>
  return r;
 431:	83 c4 10             	add    $0x10,%esp
}
 434:	89 f0                	mov    %esi,%eax
 436:	8d 65 f8             	lea    -0x8(%ebp),%esp
 439:	5b                   	pop    %ebx
 43a:	5e                   	pop    %esi
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    
 43d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 440:	be ff ff ff ff       	mov    $0xffffffff,%esi
 445:	eb ed                	jmp    434 <stat+0x34>
 447:	90                   	nop

00000448 <atoi>:

int
atoi(const char *s)
{
 448:	55                   	push   %ebp
 449:	89 e5                	mov    %esp,%ebp
 44b:	53                   	push   %ebx
 44c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 44f:	0f be 01             	movsbl (%ecx),%eax
 452:	8d 50 d0             	lea    -0x30(%eax),%edx
 455:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
 458:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 45d:	77 16                	ja     475 <atoi+0x2d>
 45f:	90                   	nop
    n = n*10 + *s++ - '0';
 460:	41                   	inc    %ecx
 461:	8d 14 92             	lea    (%edx,%edx,4),%edx
 464:	01 d2                	add    %edx,%edx
 466:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
 46a:	0f be 01             	movsbl (%ecx),%eax
 46d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 470:	80 fb 09             	cmp    $0x9,%bl
 473:	76 eb                	jbe    460 <atoi+0x18>
  return n;
}
 475:	89 d0                	mov    %edx,%eax
 477:	5b                   	pop    %ebx
 478:	5d                   	pop    %ebp
 479:	c3                   	ret    
 47a:	66 90                	xchg   %ax,%ax

0000047c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 47c:	55                   	push   %ebp
 47d:	89 e5                	mov    %esp,%ebp
 47f:	57                   	push   %edi
 480:	56                   	push   %esi
 481:	8b 45 08             	mov    0x8(%ebp),%eax
 484:	8b 75 0c             	mov    0xc(%ebp),%esi
 487:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 48a:	85 d2                	test   %edx,%edx
 48c:	7e 0b                	jle    499 <memmove+0x1d>
 48e:	01 c2                	add    %eax,%edx
  dst = vdst;
 490:	89 c7                	mov    %eax,%edi
 492:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 494:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 495:	39 fa                	cmp    %edi,%edx
 497:	75 fb                	jne    494 <memmove+0x18>
  return vdst;
}
 499:	5e                   	pop    %esi
 49a:	5f                   	pop    %edi
 49b:	5d                   	pop    %ebp
 49c:	c3                   	ret    

0000049d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 49d:	b8 01 00 00 00       	mov    $0x1,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <exit>:
SYSCALL(exit)
 4a5:	b8 02 00 00 00       	mov    $0x2,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <wait>:
SYSCALL(wait)
 4ad:	b8 03 00 00 00       	mov    $0x3,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <pipe>:
SYSCALL(pipe)
 4b5:	b8 04 00 00 00       	mov    $0x4,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <read>:
SYSCALL(read)
 4bd:	b8 05 00 00 00       	mov    $0x5,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <write>:
SYSCALL(write)
 4c5:	b8 10 00 00 00       	mov    $0x10,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <close>:
SYSCALL(close)
 4cd:	b8 15 00 00 00       	mov    $0x15,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <kill>:
SYSCALL(kill)
 4d5:	b8 06 00 00 00       	mov    $0x6,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <exec>:
SYSCALL(exec)
 4dd:	b8 07 00 00 00       	mov    $0x7,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <open>:
SYSCALL(open)
 4e5:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <mknod>:
SYSCALL(mknod)
 4ed:	b8 11 00 00 00       	mov    $0x11,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <unlink>:
SYSCALL(unlink)
 4f5:	b8 12 00 00 00       	mov    $0x12,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <fstat>:
SYSCALL(fstat)
 4fd:	b8 08 00 00 00       	mov    $0x8,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <link>:
SYSCALL(link)
 505:	b8 13 00 00 00       	mov    $0x13,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <mkdir>:
SYSCALL(mkdir)
 50d:	b8 14 00 00 00       	mov    $0x14,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <chdir>:
SYSCALL(chdir)
 515:	b8 09 00 00 00       	mov    $0x9,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <dup>:
SYSCALL(dup)
 51d:	b8 0a 00 00 00       	mov    $0xa,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <getpid>:
SYSCALL(getpid)
 525:	b8 0b 00 00 00       	mov    $0xb,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <sbrk>:
SYSCALL(sbrk)
 52d:	b8 0c 00 00 00       	mov    $0xc,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <sleep>:
SYSCALL(sleep)
 535:	b8 0d 00 00 00       	mov    $0xd,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <uptime>:
SYSCALL(uptime)
 53d:	b8 0e 00 00 00       	mov    $0xe,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <getreadcount>:
 545:	b8 16 00 00 00       	mov    $0x16,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    
 54d:	66 90                	xchg   %ax,%ax
 54f:	90                   	nop

00000550 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 3c             	sub    $0x3c,%esp
 559:	89 45 bc             	mov    %eax,-0x44(%ebp)
 55c:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 55f:	89 d1                	mov    %edx,%ecx
  if(sgn && xx < 0){
 561:	8b 5d 08             	mov    0x8(%ebp),%ebx
 564:	85 db                	test   %ebx,%ebx
 566:	74 04                	je     56c <printint+0x1c>
 568:	85 d2                	test   %edx,%edx
 56a:	78 68                	js     5d4 <printint+0x84>
  neg = 0;
 56c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 573:	31 ff                	xor    %edi,%edi
 575:	8d 75 d7             	lea    -0x29(%ebp),%esi
  do{
    buf[i++] = digits[x % base];
 578:	89 c8                	mov    %ecx,%eax
 57a:	31 d2                	xor    %edx,%edx
 57c:	f7 75 c4             	divl   -0x3c(%ebp)
 57f:	89 fb                	mov    %edi,%ebx
 581:	8d 7f 01             	lea    0x1(%edi),%edi
 584:	8a 92 38 09 00 00    	mov    0x938(%edx),%dl
 58a:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
  }while((x /= base) != 0);
 58e:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 591:	89 c1                	mov    %eax,%ecx
 593:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 596:	3b 45 c0             	cmp    -0x40(%ebp),%eax
 599:	76 dd                	jbe    578 <printint+0x28>
  if(neg)
 59b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 59e:	85 c9                	test   %ecx,%ecx
 5a0:	74 09                	je     5ab <printint+0x5b>
    buf[i++] = '-';
 5a2:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
 5a7:	89 fb                	mov    %edi,%ebx
    buf[i++] = '-';
 5a9:	b2 2d                	mov    $0x2d,%dl

  while(--i >= 0)
 5ab:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 5af:	8b 7d bc             	mov    -0x44(%ebp),%edi
 5b2:	eb 03                	jmp    5b7 <printint+0x67>
 5b4:	8a 13                	mov    (%ebx),%dl
 5b6:	4b                   	dec    %ebx
    putc(fd, buf[i]);
 5b7:	88 55 d7             	mov    %dl,-0x29(%ebp)
  write(fd, &c, 1);
 5ba:	50                   	push   %eax
 5bb:	6a 01                	push   $0x1
 5bd:	56                   	push   %esi
 5be:	57                   	push   %edi
 5bf:	e8 01 ff ff ff       	call   4c5 <write>
  while(--i >= 0)
 5c4:	83 c4 10             	add    $0x10,%esp
 5c7:	39 de                	cmp    %ebx,%esi
 5c9:	75 e9                	jne    5b4 <printint+0x64>
}
 5cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ce:	5b                   	pop    %ebx
 5cf:	5e                   	pop    %esi
 5d0:	5f                   	pop    %edi
 5d1:	5d                   	pop    %ebp
 5d2:	c3                   	ret    
 5d3:	90                   	nop
    x = -xx;
 5d4:	f7 d9                	neg    %ecx
 5d6:	eb 9b                	jmp    573 <printint+0x23>

000005d8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5d8:	55                   	push   %ebp
 5d9:	89 e5                	mov    %esp,%ebp
 5db:	57                   	push   %edi
 5dc:	56                   	push   %esi
 5dd:	53                   	push   %ebx
 5de:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5e1:	8b 75 0c             	mov    0xc(%ebp),%esi
 5e4:	8a 1e                	mov    (%esi),%bl
 5e6:	84 db                	test   %bl,%bl
 5e8:	0f 84 a3 00 00 00    	je     691 <printf+0xb9>
 5ee:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 5ef:	8d 45 10             	lea    0x10(%ebp),%eax
 5f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  state = 0;
 5f5:	31 d2                	xor    %edx,%edx
  write(fd, &c, 1);
 5f7:	8d 7d e7             	lea    -0x19(%ebp),%edi
 5fa:	eb 29                	jmp    625 <printf+0x4d>
 5fc:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5ff:	83 f8 25             	cmp    $0x25,%eax
 602:	0f 84 94 00 00 00    	je     69c <printf+0xc4>
        state = '%';
      } else {
        putc(fd, c);
 608:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 60b:	50                   	push   %eax
 60c:	6a 01                	push   $0x1
 60e:	57                   	push   %edi
 60f:	ff 75 08             	pushl  0x8(%ebp)
 612:	e8 ae fe ff ff       	call   4c5 <write>
        putc(fd, c);
 617:	83 c4 10             	add    $0x10,%esp
 61a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  for(i = 0; fmt[i]; i++){
 61d:	46                   	inc    %esi
 61e:	8a 5e ff             	mov    -0x1(%esi),%bl
 621:	84 db                	test   %bl,%bl
 623:	74 6c                	je     691 <printf+0xb9>
    c = fmt[i] & 0xff;
 625:	0f be cb             	movsbl %bl,%ecx
 628:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 62b:	85 d2                	test   %edx,%edx
 62d:	74 cd                	je     5fc <printf+0x24>
      }
    } else if(state == '%'){
 62f:	83 fa 25             	cmp    $0x25,%edx
 632:	75 e9                	jne    61d <printf+0x45>
      if(c == 'd'){
 634:	83 f8 64             	cmp    $0x64,%eax
 637:	0f 84 97 00 00 00    	je     6d4 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 63d:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 643:	83 f9 70             	cmp    $0x70,%ecx
 646:	74 60                	je     6a8 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 648:	83 f8 73             	cmp    $0x73,%eax
 64b:	0f 84 8f 00 00 00    	je     6e0 <printf+0x108>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 651:	83 f8 63             	cmp    $0x63,%eax
 654:	0f 84 d6 00 00 00    	je     730 <printf+0x158>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 65a:	83 f8 25             	cmp    $0x25,%eax
 65d:	0f 84 c1 00 00 00    	je     724 <printf+0x14c>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 663:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 667:	50                   	push   %eax
 668:	6a 01                	push   $0x1
 66a:	57                   	push   %edi
 66b:	ff 75 08             	pushl  0x8(%ebp)
 66e:	e8 52 fe ff ff       	call   4c5 <write>
        putc(fd, c);
 673:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 676:	83 c4 0c             	add    $0xc,%esp
 679:	6a 01                	push   $0x1
 67b:	57                   	push   %edi
 67c:	ff 75 08             	pushl  0x8(%ebp)
 67f:	e8 41 fe ff ff       	call   4c5 <write>
        putc(fd, c);
 684:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 687:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 689:	46                   	inc    %esi
 68a:	8a 5e ff             	mov    -0x1(%esi),%bl
 68d:	84 db                	test   %bl,%bl
 68f:	75 94                	jne    625 <printf+0x4d>
    }
  }
}
 691:	8d 65 f4             	lea    -0xc(%ebp),%esp
 694:	5b                   	pop    %ebx
 695:	5e                   	pop    %esi
 696:	5f                   	pop    %edi
 697:	5d                   	pop    %ebp
 698:	c3                   	ret    
 699:	8d 76 00             	lea    0x0(%esi),%esi
        state = '%';
 69c:	ba 25 00 00 00       	mov    $0x25,%edx
 6a1:	e9 77 ff ff ff       	jmp    61d <printf+0x45>
 6a6:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 6a8:	83 ec 0c             	sub    $0xc,%esp
 6ab:	6a 00                	push   $0x0
 6ad:	b9 10 00 00 00       	mov    $0x10,%ecx
 6b2:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6b5:	8b 13                	mov    (%ebx),%edx
 6b7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ba:	e8 91 fe ff ff       	call   550 <printint>
        ap++;
 6bf:	89 d8                	mov    %ebx,%eax
 6c1:	83 c0 04             	add    $0x4,%eax
 6c4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6c7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ca:	31 d2                	xor    %edx,%edx
        ap++;
 6cc:	e9 4c ff ff ff       	jmp    61d <printf+0x45>
 6d1:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6d4:	83 ec 0c             	sub    $0xc,%esp
 6d7:	6a 01                	push   $0x1
 6d9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6de:	eb d2                	jmp    6b2 <printf+0xda>
        s = (char*)*ap;
 6e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6e3:	8b 18                	mov    (%eax),%ebx
        ap++;
 6e5:	83 c0 04             	add    $0x4,%eax
 6e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6eb:	85 db                	test   %ebx,%ebx
 6ed:	74 65                	je     754 <printf+0x17c>
        while(*s != 0){
 6ef:	8a 03                	mov    (%ebx),%al
 6f1:	84 c0                	test   %al,%al
 6f3:	74 70                	je     765 <printf+0x18d>
 6f5:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6f8:	89 de                	mov    %ebx,%esi
 6fa:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 700:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 703:	50                   	push   %eax
 704:	6a 01                	push   $0x1
 706:	57                   	push   %edi
 707:	53                   	push   %ebx
 708:	e8 b8 fd ff ff       	call   4c5 <write>
          s++;
 70d:	46                   	inc    %esi
        while(*s != 0){
 70e:	8a 06                	mov    (%esi),%al
 710:	83 c4 10             	add    $0x10,%esp
 713:	84 c0                	test   %al,%al
 715:	75 e9                	jne    700 <printf+0x128>
 717:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 71a:	31 d2                	xor    %edx,%edx
 71c:	e9 fc fe ff ff       	jmp    61d <printf+0x45>
 721:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 724:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 727:	52                   	push   %edx
 728:	e9 4c ff ff ff       	jmp    679 <printf+0xa1>
 72d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, *ap);
 730:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 733:	8b 03                	mov    (%ebx),%eax
 735:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 738:	51                   	push   %ecx
 739:	6a 01                	push   $0x1
 73b:	57                   	push   %edi
 73c:	ff 75 08             	pushl  0x8(%ebp)
 73f:	e8 81 fd ff ff       	call   4c5 <write>
        ap++;
 744:	83 c3 04             	add    $0x4,%ebx
 747:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 74a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 74d:	31 d2                	xor    %edx,%edx
 74f:	e9 c9 fe ff ff       	jmp    61d <printf+0x45>
          s = "(null)";
 754:	bb 2e 09 00 00       	mov    $0x92e,%ebx
        while(*s != 0){
 759:	b0 28                	mov    $0x28,%al
 75b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 75e:	89 de                	mov    %ebx,%esi
 760:	8b 5d 08             	mov    0x8(%ebp),%ebx
 763:	eb 9b                	jmp    700 <printf+0x128>
      state = 0;
 765:	31 d2                	xor    %edx,%edx
 767:	e9 b1 fe ff ff       	jmp    61d <printf+0x45>

0000076c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 76c:	55                   	push   %ebp
 76d:	89 e5                	mov    %esp,%ebp
 76f:	57                   	push   %edi
 770:	56                   	push   %esi
 771:	53                   	push   %ebx
 772:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 775:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 778:	a1 60 0c 00 00       	mov    0xc60,%eax
 77d:	8b 10                	mov    (%eax),%edx
 77f:	39 c8                	cmp    %ecx,%eax
 781:	73 11                	jae    794 <free+0x28>
 783:	90                   	nop
 784:	39 d1                	cmp    %edx,%ecx
 786:	72 14                	jb     79c <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 788:	39 d0                	cmp    %edx,%eax
 78a:	73 10                	jae    79c <free+0x30>
{
 78c:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78e:	8b 10                	mov    (%eax),%edx
 790:	39 c8                	cmp    %ecx,%eax
 792:	72 f0                	jb     784 <free+0x18>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 794:	39 d0                	cmp    %edx,%eax
 796:	72 f4                	jb     78c <free+0x20>
 798:	39 d1                	cmp    %edx,%ecx
 79a:	73 f0                	jae    78c <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 79c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 79f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7a2:	39 fa                	cmp    %edi,%edx
 7a4:	74 1a                	je     7c0 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7a6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7a9:	8b 50 04             	mov    0x4(%eax),%edx
 7ac:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7af:	39 f1                	cmp    %esi,%ecx
 7b1:	74 24                	je     7d7 <free+0x6b>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7b3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7b5:	a3 60 0c 00 00       	mov    %eax,0xc60
}
 7ba:	5b                   	pop    %ebx
 7bb:	5e                   	pop    %esi
 7bc:	5f                   	pop    %edi
 7bd:	5d                   	pop    %ebp
 7be:	c3                   	ret    
 7bf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 7c0:	03 72 04             	add    0x4(%edx),%esi
 7c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c6:	8b 10                	mov    (%eax),%edx
 7c8:	8b 12                	mov    (%edx),%edx
 7ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cd:	8b 50 04             	mov    0x4(%eax),%edx
 7d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d3:	39 f1                	cmp    %esi,%ecx
 7d5:	75 dc                	jne    7b3 <free+0x47>
    p->s.size += bp->s.size;
 7d7:	03 53 fc             	add    -0x4(%ebx),%edx
 7da:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7dd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7e0:	89 10                	mov    %edx,(%eax)
  freep = p;
 7e2:	a3 60 0c 00 00       	mov    %eax,0xc60
}
 7e7:	5b                   	pop    %ebx
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret    

000007ec <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7ec:	55                   	push   %ebp
 7ed:	89 e5                	mov    %esp,%ebp
 7ef:	57                   	push   %edi
 7f0:	56                   	push   %esi
 7f1:	53                   	push   %ebx
 7f2:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	8d 70 07             	lea    0x7(%eax),%esi
 7fb:	c1 ee 03             	shr    $0x3,%esi
 7fe:	46                   	inc    %esi
  if((prevp = freep) == 0){
 7ff:	8b 3d 60 0c 00 00    	mov    0xc60,%edi
 805:	85 ff                	test   %edi,%edi
 807:	0f 84 a3 00 00 00    	je     8b0 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 80d:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 80f:	8b 48 04             	mov    0x4(%eax),%ecx
 812:	39 f1                	cmp    %esi,%ecx
 814:	73 67                	jae    87d <malloc+0x91>
 816:	89 f3                	mov    %esi,%ebx
 818:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 81e:	0f 82 80 00 00 00    	jb     8a4 <malloc+0xb8>
  p = sbrk(nu * sizeof(Header));
 824:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 82b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 82e:	eb 11                	jmp    841 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 830:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 832:	8b 4a 04             	mov    0x4(%edx),%ecx
 835:	39 f1                	cmp    %esi,%ecx
 837:	73 4b                	jae    884 <malloc+0x98>
 839:	8b 3d 60 0c 00 00    	mov    0xc60,%edi
 83f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 841:	39 c7                	cmp    %eax,%edi
 843:	75 eb                	jne    830 <malloc+0x44>
  p = sbrk(nu * sizeof(Header));
 845:	83 ec 0c             	sub    $0xc,%esp
 848:	ff 75 e4             	pushl  -0x1c(%ebp)
 84b:	e8 dd fc ff ff       	call   52d <sbrk>
  if(p == (char*)-1)
 850:	83 c4 10             	add    $0x10,%esp
 853:	83 f8 ff             	cmp    $0xffffffff,%eax
 856:	74 1b                	je     873 <malloc+0x87>
  hp->s.size = nu;
 858:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 85b:	83 ec 0c             	sub    $0xc,%esp
 85e:	83 c0 08             	add    $0x8,%eax
 861:	50                   	push   %eax
 862:	e8 05 ff ff ff       	call   76c <free>
  return freep;
 867:	a1 60 0c 00 00       	mov    0xc60,%eax
      if((p = morecore(nunits)) == 0)
 86c:	83 c4 10             	add    $0x10,%esp
 86f:	85 c0                	test   %eax,%eax
 871:	75 bd                	jne    830 <malloc+0x44>
        return 0;
 873:	31 c0                	xor    %eax,%eax
  }
}
 875:	8d 65 f4             	lea    -0xc(%ebp),%esp
 878:	5b                   	pop    %ebx
 879:	5e                   	pop    %esi
 87a:	5f                   	pop    %edi
 87b:	5d                   	pop    %ebp
 87c:	c3                   	ret    
    if(p->s.size >= nunits){
 87d:	89 c2                	mov    %eax,%edx
 87f:	89 f8                	mov    %edi,%eax
 881:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 884:	39 ce                	cmp    %ecx,%esi
 886:	74 54                	je     8dc <malloc+0xf0>
        p->s.size -= nunits;
 888:	29 f1                	sub    %esi,%ecx
 88a:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 88d:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 890:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 893:	a3 60 0c 00 00       	mov    %eax,0xc60
      return (void*)(p + 1);
 898:	8d 42 08             	lea    0x8(%edx),%eax
}
 89b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 89e:	5b                   	pop    %ebx
 89f:	5e                   	pop    %esi
 8a0:	5f                   	pop    %edi
 8a1:	5d                   	pop    %ebp
 8a2:	c3                   	ret    
 8a3:	90                   	nop
 8a4:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8a9:	e9 76 ff ff ff       	jmp    824 <malloc+0x38>
 8ae:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 8b0:	c7 05 60 0c 00 00 64 	movl   $0xc64,0xc60
 8b7:	0c 00 00 
 8ba:	c7 05 64 0c 00 00 64 	movl   $0xc64,0xc64
 8c1:	0c 00 00 
    base.s.size = 0;
 8c4:	c7 05 68 0c 00 00 00 	movl   $0x0,0xc68
 8cb:	00 00 00 
 8ce:	bf 64 0c 00 00       	mov    $0xc64,%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d3:	89 f8                	mov    %edi,%eax
 8d5:	e9 3c ff ff ff       	jmp    816 <malloc+0x2a>
 8da:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 8dc:	8b 0a                	mov    (%edx),%ecx
 8de:	89 08                	mov    %ecx,(%eax)
 8e0:	eb b1                	jmp    893 <malloc+0xa7>
