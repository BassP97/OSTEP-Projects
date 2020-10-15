
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec 20 02 00 00    	sub    $0x220,%esp
  int fd, i;
  char path[] = "stressfs0";
  17:	be 23 07 00 00       	mov    $0x723,%esi
  1c:	b9 0a 00 00 00       	mov    $0xa,%ecx
  21:	8d bd de fd ff ff    	lea    -0x222(%ebp),%edi
  27:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  char data[512];

  printf(1, "stressfs starting\n");
  29:	68 00 07 00 00       	push   $0x700
  2e:	6a 01                	push   $0x1
  30:	e8 bf 03 00 00       	call   3f4 <printf>
  memset(data, 'a', sizeof(data));
  35:	83 c4 0c             	add    $0xc,%esp
  38:	68 00 02 00 00       	push   $0x200
  3d:	6a 61                	push   $0x61
  3f:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
  45:	56                   	push   %esi
  46:	e8 41 01 00 00       	call   18c <memset>
  4b:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 4; i++)
  4e:	31 db                	xor    %ebx,%ebx
    if(fork() > 0)
  50:	e8 64 02 00 00       	call   2b9 <fork>
  55:	85 c0                	test   %eax,%eax
  57:	0f 8f a9 00 00 00    	jg     106 <main+0x106>
  for(i = 0; i < 4; i++)
  5d:	43                   	inc    %ebx
  5e:	83 fb 04             	cmp    $0x4,%ebx
  61:	75 ed                	jne    50 <main+0x50>
  63:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  68:	50                   	push   %eax
  69:	53                   	push   %ebx
  6a:	68 13 07 00 00       	push   $0x713
  6f:	6a 01                	push   $0x1
  71:	e8 7e 03 00 00       	call   3f4 <printf>

  path[8] += i;
  76:	89 f8                	mov    %edi,%eax
  78:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7e:	58                   	pop    %eax
  7f:	5a                   	pop    %edx
  80:	68 02 02 00 00       	push   $0x202
  85:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  8b:	50                   	push   %eax
  8c:	e8 70 02 00 00       	call   301 <open>
  91:	89 c7                	mov    %eax,%edi
  93:	83 c4 10             	add    $0x10,%esp
  96:	bb 14 00 00 00       	mov    $0x14,%ebx
  9b:	90                   	nop
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  9c:	50                   	push   %eax
  9d:	68 00 02 00 00       	push   $0x200
  a2:	56                   	push   %esi
  a3:	57                   	push   %edi
  a4:	e8 38 02 00 00       	call   2e1 <write>
  for(i = 0; i < 20; i++)
  a9:	83 c4 10             	add    $0x10,%esp
  ac:	4b                   	dec    %ebx
  ad:	75 ed                	jne    9c <main+0x9c>
  close(fd);
  af:	83 ec 0c             	sub    $0xc,%esp
  b2:	57                   	push   %edi
  b3:	e8 31 02 00 00       	call   2e9 <close>

  printf(1, "read\n");
  b8:	5a                   	pop    %edx
  b9:	59                   	pop    %ecx
  ba:	68 1d 07 00 00       	push   $0x71d
  bf:	6a 01                	push   $0x1
  c1:	e8 2e 03 00 00       	call   3f4 <printf>

  fd = open(path, O_RDONLY);
  c6:	5b                   	pop    %ebx
  c7:	5f                   	pop    %edi
  c8:	6a 00                	push   $0x0
  ca:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  d0:	50                   	push   %eax
  d1:	e8 2b 02 00 00       	call   301 <open>
  d6:	89 c7                	mov    %eax,%edi
  d8:	83 c4 10             	add    $0x10,%esp
  db:	bb 14 00 00 00       	mov    $0x14,%ebx
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
  e0:	50                   	push   %eax
  e1:	68 00 02 00 00       	push   $0x200
  e6:	56                   	push   %esi
  e7:	57                   	push   %edi
  e8:	e8 ec 01 00 00       	call   2d9 <read>
  for (i = 0; i < 20; i++)
  ed:	83 c4 10             	add    $0x10,%esp
  f0:	4b                   	dec    %ebx
  f1:	75 ed                	jne    e0 <main+0xe0>
  close(fd);
  f3:	83 ec 0c             	sub    $0xc,%esp
  f6:	57                   	push   %edi
  f7:	e8 ed 01 00 00       	call   2e9 <close>

  wait();
  fc:	e8 c8 01 00 00       	call   2c9 <wait>

  exit();
 101:	e8 bb 01 00 00       	call   2c1 <exit>
 106:	89 df                	mov    %ebx,%edi
 108:	e9 5b ff ff ff       	jmp    68 <main+0x68>
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 11a:	31 c0                	xor    %eax,%eax
 11c:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 11f:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 122:	40                   	inc    %eax
 123:	84 d2                	test   %dl,%dl
 125:	75 f5                	jne    11c <strcpy+0xc>
    ;
  return os;
}
 127:	89 c8                	mov    %ecx,%eax
 129:	5b                   	pop    %ebx
 12a:	5d                   	pop    %ebp
 12b:	c3                   	ret    

0000012c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 12c:	55                   	push   %ebp
 12d:	89 e5                	mov    %esp,%ebp
 12f:	53                   	push   %ebx
 130:	8b 5d 08             	mov    0x8(%ebp),%ebx
 133:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 136:	0f b6 03             	movzbl (%ebx),%eax
 139:	0f b6 0a             	movzbl (%edx),%ecx
 13c:	84 c0                	test   %al,%al
 13e:	75 10                	jne    150 <strcmp+0x24>
 140:	eb 1a                	jmp    15c <strcmp+0x30>
 142:	66 90                	xchg   %ax,%ax
    p++, q++;
 144:	43                   	inc    %ebx
 145:	42                   	inc    %edx
  while(*p && *p == *q)
 146:	0f b6 03             	movzbl (%ebx),%eax
 149:	0f b6 0a             	movzbl (%edx),%ecx
 14c:	84 c0                	test   %al,%al
 14e:	74 0c                	je     15c <strcmp+0x30>
 150:	38 c8                	cmp    %cl,%al
 152:	74 f0                	je     144 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 154:	29 c8                	sub    %ecx,%eax
}
 156:	5b                   	pop    %ebx
 157:	5d                   	pop    %ebp
 158:	c3                   	ret    
 159:	8d 76 00             	lea    0x0(%esi),%esi
 15c:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 15e:	29 c8                	sub    %ecx,%eax
}
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	90                   	nop

00000164 <strlen>:

uint
strlen(const char *s)
{
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 16a:	80 3a 00             	cmpb   $0x0,(%edx)
 16d:	74 15                	je     184 <strlen+0x20>
 16f:	31 c0                	xor    %eax,%eax
 171:	8d 76 00             	lea    0x0(%esi),%esi
 174:	40                   	inc    %eax
 175:	89 c1                	mov    %eax,%ecx
 177:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 17b:	75 f7                	jne    174 <strlen+0x10>
    ;
  return n;
}
 17d:	89 c8                	mov    %ecx,%eax
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 184:	31 c9                	xor    %ecx,%ecx
}
 186:	89 c8                	mov    %ecx,%eax
 188:	5d                   	pop    %ebp
 189:	c3                   	ret    
 18a:	66 90                	xchg   %ax,%ax

0000018c <memset>:

void*
memset(void *dst, int c, uint n)
{
 18c:	55                   	push   %ebp
 18d:	89 e5                	mov    %esp,%ebp
 18f:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 190:	8b 7d 08             	mov    0x8(%ebp),%edi
 193:	8b 4d 10             	mov    0x10(%ebp),%ecx
 196:	8b 45 0c             	mov    0xc(%ebp),%eax
 199:	fc                   	cld    
 19a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	5f                   	pop    %edi
 1a0:	5d                   	pop    %ebp
 1a1:	c3                   	ret    
 1a2:	66 90                	xchg   %ax,%ax

000001a4 <strchr>:

char*
strchr(const char *s, char c)
{
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 1ad:	8a 10                	mov    (%eax),%dl
 1af:	84 d2                	test   %dl,%dl
 1b1:	75 0c                	jne    1bf <strchr+0x1b>
 1b3:	eb 13                	jmp    1c8 <strchr+0x24>
 1b5:	8d 76 00             	lea    0x0(%esi),%esi
 1b8:	40                   	inc    %eax
 1b9:	8a 10                	mov    (%eax),%dl
 1bb:	84 d2                	test   %dl,%dl
 1bd:	74 09                	je     1c8 <strchr+0x24>
    if(*s == c)
 1bf:	38 d1                	cmp    %dl,%cl
 1c1:	75 f5                	jne    1b8 <strchr+0x14>
      return (char*)s;
  return 0;
}
 1c3:	5d                   	pop    %ebp
 1c4:	c3                   	ret    
 1c5:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
 1c8:	31 c0                	xor    %eax,%eax
}
 1ca:	5d                   	pop    %ebp
 1cb:	c3                   	ret    

000001cc <gets>:

char*
gets(char *buf, int max)
{
 1cc:	55                   	push   %ebp
 1cd:	89 e5                	mov    %esp,%ebp
 1cf:	57                   	push   %edi
 1d0:	56                   	push   %esi
 1d1:	53                   	push   %ebx
 1d2:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d5:	8b 75 08             	mov    0x8(%ebp),%esi
 1d8:	bb 01 00 00 00       	mov    $0x1,%ebx
 1dd:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
 1df:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 1e2:	eb 20                	jmp    204 <gets+0x38>
    cc = read(0, &c, 1);
 1e4:	50                   	push   %eax
 1e5:	6a 01                	push   $0x1
 1e7:	57                   	push   %edi
 1e8:	6a 00                	push   $0x0
 1ea:	e8 ea 00 00 00       	call   2d9 <read>
    if(cc < 1)
 1ef:	83 c4 10             	add    $0x10,%esp
 1f2:	85 c0                	test   %eax,%eax
 1f4:	7e 16                	jle    20c <gets+0x40>
      break;
    buf[i++] = c;
 1f6:	8a 45 e7             	mov    -0x19(%ebp),%al
 1f9:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
 1fb:	46                   	inc    %esi
 1fc:	3c 0a                	cmp    $0xa,%al
 1fe:	74 0c                	je     20c <gets+0x40>
 200:	3c 0d                	cmp    $0xd,%al
 202:	74 08                	je     20c <gets+0x40>
  for(i=0; i+1 < max; ){
 204:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 207:	39 45 0c             	cmp    %eax,0xc(%ebp)
 20a:	7f d8                	jg     1e4 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 20c:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	8d 65 f4             	lea    -0xc(%ebp),%esp
 215:	5b                   	pop    %ebx
 216:	5e                   	pop    %esi
 217:	5f                   	pop    %edi
 218:	5d                   	pop    %ebp
 219:	c3                   	ret    
 21a:	66 90                	xchg   %ax,%ax

0000021c <stat>:

int
stat(const char *n, struct stat *st)
{
 21c:	55                   	push   %ebp
 21d:	89 e5                	mov    %esp,%ebp
 21f:	56                   	push   %esi
 220:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 221:	83 ec 08             	sub    $0x8,%esp
 224:	6a 00                	push   $0x0
 226:	ff 75 08             	pushl  0x8(%ebp)
 229:	e8 d3 00 00 00       	call   301 <open>
  if(fd < 0)
 22e:	83 c4 10             	add    $0x10,%esp
 231:	85 c0                	test   %eax,%eax
 233:	78 27                	js     25c <stat+0x40>
 235:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 237:	83 ec 08             	sub    $0x8,%esp
 23a:	ff 75 0c             	pushl  0xc(%ebp)
 23d:	50                   	push   %eax
 23e:	e8 d6 00 00 00       	call   319 <fstat>
 243:	89 c6                	mov    %eax,%esi
  close(fd);
 245:	89 1c 24             	mov    %ebx,(%esp)
 248:	e8 9c 00 00 00       	call   2e9 <close>
  return r;
 24d:	83 c4 10             	add    $0x10,%esp
}
 250:	89 f0                	mov    %esi,%eax
 252:	8d 65 f8             	lea    -0x8(%ebp),%esp
 255:	5b                   	pop    %ebx
 256:	5e                   	pop    %esi
 257:	5d                   	pop    %ebp
 258:	c3                   	ret    
 259:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 25c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 261:	eb ed                	jmp    250 <stat+0x34>
 263:	90                   	nop

00000264 <atoi>:

int
atoi(const char *s)
{
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	53                   	push   %ebx
 268:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26b:	0f be 01             	movsbl (%ecx),%eax
 26e:	8d 50 d0             	lea    -0x30(%eax),%edx
 271:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
 274:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 279:	77 16                	ja     291 <atoi+0x2d>
 27b:	90                   	nop
    n = n*10 + *s++ - '0';
 27c:	41                   	inc    %ecx
 27d:	8d 14 92             	lea    (%edx,%edx,4),%edx
 280:	01 d2                	add    %edx,%edx
 282:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
 286:	0f be 01             	movsbl (%ecx),%eax
 289:	8d 58 d0             	lea    -0x30(%eax),%ebx
 28c:	80 fb 09             	cmp    $0x9,%bl
 28f:	76 eb                	jbe    27c <atoi+0x18>
  return n;
}
 291:	89 d0                	mov    %edx,%eax
 293:	5b                   	pop    %ebx
 294:	5d                   	pop    %ebp
 295:	c3                   	ret    
 296:	66 90                	xchg   %ax,%ax

00000298 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 298:	55                   	push   %ebp
 299:	89 e5                	mov    %esp,%ebp
 29b:	57                   	push   %edi
 29c:	56                   	push   %esi
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
 2a0:	8b 75 0c             	mov    0xc(%ebp),%esi
 2a3:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a6:	85 d2                	test   %edx,%edx
 2a8:	7e 0b                	jle    2b5 <memmove+0x1d>
 2aa:	01 c2                	add    %eax,%edx
  dst = vdst;
 2ac:	89 c7                	mov    %eax,%edi
 2ae:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 2b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2b1:	39 fa                	cmp    %edi,%edx
 2b3:	75 fb                	jne    2b0 <memmove+0x18>
  return vdst;
}
 2b5:	5e                   	pop    %esi
 2b6:	5f                   	pop    %edi
 2b7:	5d                   	pop    %ebp
 2b8:	c3                   	ret    

000002b9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2b9:	b8 01 00 00 00       	mov    $0x1,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <exit>:
SYSCALL(exit)
 2c1:	b8 02 00 00 00       	mov    $0x2,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <wait>:
SYSCALL(wait)
 2c9:	b8 03 00 00 00       	mov    $0x3,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <pipe>:
SYSCALL(pipe)
 2d1:	b8 04 00 00 00       	mov    $0x4,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <read>:
SYSCALL(read)
 2d9:	b8 05 00 00 00       	mov    $0x5,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <write>:
SYSCALL(write)
 2e1:	b8 10 00 00 00       	mov    $0x10,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <close>:
SYSCALL(close)
 2e9:	b8 15 00 00 00       	mov    $0x15,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <kill>:
SYSCALL(kill)
 2f1:	b8 06 00 00 00       	mov    $0x6,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <exec>:
SYSCALL(exec)
 2f9:	b8 07 00 00 00       	mov    $0x7,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <open>:
SYSCALL(open)
 301:	b8 0f 00 00 00       	mov    $0xf,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <mknod>:
SYSCALL(mknod)
 309:	b8 11 00 00 00       	mov    $0x11,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <unlink>:
SYSCALL(unlink)
 311:	b8 12 00 00 00       	mov    $0x12,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <fstat>:
SYSCALL(fstat)
 319:	b8 08 00 00 00       	mov    $0x8,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <link>:
SYSCALL(link)
 321:	b8 13 00 00 00       	mov    $0x13,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <mkdir>:
SYSCALL(mkdir)
 329:	b8 14 00 00 00       	mov    $0x14,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <chdir>:
SYSCALL(chdir)
 331:	b8 09 00 00 00       	mov    $0x9,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <dup>:
SYSCALL(dup)
 339:	b8 0a 00 00 00       	mov    $0xa,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <getpid>:
SYSCALL(getpid)
 341:	b8 0b 00 00 00       	mov    $0xb,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <sbrk>:
SYSCALL(sbrk)
 349:	b8 0c 00 00 00       	mov    $0xc,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <sleep>:
SYSCALL(sleep)
 351:	b8 0d 00 00 00       	mov    $0xd,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <uptime>:
SYSCALL(uptime)
 359:	b8 0e 00 00 00       	mov    $0xe,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <getreadcount>:
 361:	b8 16 00 00 00       	mov    $0x16,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    
 369:	66 90                	xchg   %ax,%ax
 36b:	90                   	nop

0000036c <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 36c:	55                   	push   %ebp
 36d:	89 e5                	mov    %esp,%ebp
 36f:	57                   	push   %edi
 370:	56                   	push   %esi
 371:	53                   	push   %ebx
 372:	83 ec 3c             	sub    $0x3c,%esp
 375:	89 45 bc             	mov    %eax,-0x44(%ebp)
 378:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 37b:	89 d1                	mov    %edx,%ecx
  if(sgn && xx < 0){
 37d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 380:	85 db                	test   %ebx,%ebx
 382:	74 04                	je     388 <printint+0x1c>
 384:	85 d2                	test   %edx,%edx
 386:	78 68                	js     3f0 <printint+0x84>
  neg = 0;
 388:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 38f:	31 ff                	xor    %edi,%edi
 391:	8d 75 d7             	lea    -0x29(%ebp),%esi
  do{
    buf[i++] = digits[x % base];
 394:	89 c8                	mov    %ecx,%eax
 396:	31 d2                	xor    %edx,%edx
 398:	f7 75 c4             	divl   -0x3c(%ebp)
 39b:	89 fb                	mov    %edi,%ebx
 39d:	8d 7f 01             	lea    0x1(%edi),%edi
 3a0:	8a 92 34 07 00 00    	mov    0x734(%edx),%dl
 3a6:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
  }while((x /= base) != 0);
 3aa:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 3ad:	89 c1                	mov    %eax,%ecx
 3af:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3b2:	3b 45 c0             	cmp    -0x40(%ebp),%eax
 3b5:	76 dd                	jbe    394 <printint+0x28>
  if(neg)
 3b7:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3ba:	85 c9                	test   %ecx,%ecx
 3bc:	74 09                	je     3c7 <printint+0x5b>
    buf[i++] = '-';
 3be:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
 3c3:	89 fb                	mov    %edi,%ebx
    buf[i++] = '-';
 3c5:	b2 2d                	mov    $0x2d,%dl

  while(--i >= 0)
 3c7:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 3cb:	8b 7d bc             	mov    -0x44(%ebp),%edi
 3ce:	eb 03                	jmp    3d3 <printint+0x67>
 3d0:	8a 13                	mov    (%ebx),%dl
 3d2:	4b                   	dec    %ebx
    putc(fd, buf[i]);
 3d3:	88 55 d7             	mov    %dl,-0x29(%ebp)
  write(fd, &c, 1);
 3d6:	50                   	push   %eax
 3d7:	6a 01                	push   $0x1
 3d9:	56                   	push   %esi
 3da:	57                   	push   %edi
 3db:	e8 01 ff ff ff       	call   2e1 <write>
  while(--i >= 0)
 3e0:	83 c4 10             	add    $0x10,%esp
 3e3:	39 de                	cmp    %ebx,%esi
 3e5:	75 e9                	jne    3d0 <printint+0x64>
}
 3e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ea:	5b                   	pop    %ebx
 3eb:	5e                   	pop    %esi
 3ec:	5f                   	pop    %edi
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret    
 3ef:	90                   	nop
    x = -xx;
 3f0:	f7 d9                	neg    %ecx
 3f2:	eb 9b                	jmp    38f <printint+0x23>

000003f4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	57                   	push   %edi
 3f8:	56                   	push   %esi
 3f9:	53                   	push   %ebx
 3fa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3fd:	8b 75 0c             	mov    0xc(%ebp),%esi
 400:	8a 1e                	mov    (%esi),%bl
 402:	84 db                	test   %bl,%bl
 404:	0f 84 a3 00 00 00    	je     4ad <printf+0xb9>
 40a:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 40b:	8d 45 10             	lea    0x10(%ebp),%eax
 40e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  state = 0;
 411:	31 d2                	xor    %edx,%edx
  write(fd, &c, 1);
 413:	8d 7d e7             	lea    -0x19(%ebp),%edi
 416:	eb 29                	jmp    441 <printf+0x4d>
 418:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 41b:	83 f8 25             	cmp    $0x25,%eax
 41e:	0f 84 94 00 00 00    	je     4b8 <printf+0xc4>
        state = '%';
      } else {
        putc(fd, c);
 424:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 427:	50                   	push   %eax
 428:	6a 01                	push   $0x1
 42a:	57                   	push   %edi
 42b:	ff 75 08             	pushl  0x8(%ebp)
 42e:	e8 ae fe ff ff       	call   2e1 <write>
        putc(fd, c);
 433:	83 c4 10             	add    $0x10,%esp
 436:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  for(i = 0; fmt[i]; i++){
 439:	46                   	inc    %esi
 43a:	8a 5e ff             	mov    -0x1(%esi),%bl
 43d:	84 db                	test   %bl,%bl
 43f:	74 6c                	je     4ad <printf+0xb9>
    c = fmt[i] & 0xff;
 441:	0f be cb             	movsbl %bl,%ecx
 444:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 447:	85 d2                	test   %edx,%edx
 449:	74 cd                	je     418 <printf+0x24>
      }
    } else if(state == '%'){
 44b:	83 fa 25             	cmp    $0x25,%edx
 44e:	75 e9                	jne    439 <printf+0x45>
      if(c == 'd'){
 450:	83 f8 64             	cmp    $0x64,%eax
 453:	0f 84 97 00 00 00    	je     4f0 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 459:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 45f:	83 f9 70             	cmp    $0x70,%ecx
 462:	74 60                	je     4c4 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 464:	83 f8 73             	cmp    $0x73,%eax
 467:	0f 84 8f 00 00 00    	je     4fc <printf+0x108>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 46d:	83 f8 63             	cmp    $0x63,%eax
 470:	0f 84 d6 00 00 00    	je     54c <printf+0x158>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 476:	83 f8 25             	cmp    $0x25,%eax
 479:	0f 84 c1 00 00 00    	je     540 <printf+0x14c>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 47f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 483:	50                   	push   %eax
 484:	6a 01                	push   $0x1
 486:	57                   	push   %edi
 487:	ff 75 08             	pushl  0x8(%ebp)
 48a:	e8 52 fe ff ff       	call   2e1 <write>
        putc(fd, c);
 48f:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 492:	83 c4 0c             	add    $0xc,%esp
 495:	6a 01                	push   $0x1
 497:	57                   	push   %edi
 498:	ff 75 08             	pushl  0x8(%ebp)
 49b:	e8 41 fe ff ff       	call   2e1 <write>
        putc(fd, c);
 4a0:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 4a3:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 4a5:	46                   	inc    %esi
 4a6:	8a 5e ff             	mov    -0x1(%esi),%bl
 4a9:	84 db                	test   %bl,%bl
 4ab:	75 94                	jne    441 <printf+0x4d>
    }
  }
}
 4ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b0:	5b                   	pop    %ebx
 4b1:	5e                   	pop    %esi
 4b2:	5f                   	pop    %edi
 4b3:	5d                   	pop    %ebp
 4b4:	c3                   	ret    
 4b5:	8d 76 00             	lea    0x0(%esi),%esi
        state = '%';
 4b8:	ba 25 00 00 00       	mov    $0x25,%edx
 4bd:	e9 77 ff ff ff       	jmp    439 <printf+0x45>
 4c2:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 4c4:	83 ec 0c             	sub    $0xc,%esp
 4c7:	6a 00                	push   $0x0
 4c9:	b9 10 00 00 00       	mov    $0x10,%ecx
 4ce:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4d1:	8b 13                	mov    (%ebx),%edx
 4d3:	8b 45 08             	mov    0x8(%ebp),%eax
 4d6:	e8 91 fe ff ff       	call   36c <printint>
        ap++;
 4db:	89 d8                	mov    %ebx,%eax
 4dd:	83 c0 04             	add    $0x4,%eax
 4e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4e3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4e6:	31 d2                	xor    %edx,%edx
        ap++;
 4e8:	e9 4c ff ff ff       	jmp    439 <printf+0x45>
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 4f0:	83 ec 0c             	sub    $0xc,%esp
 4f3:	6a 01                	push   $0x1
 4f5:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4fa:	eb d2                	jmp    4ce <printf+0xda>
        s = (char*)*ap;
 4fc:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4ff:	8b 18                	mov    (%eax),%ebx
        ap++;
 501:	83 c0 04             	add    $0x4,%eax
 504:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 507:	85 db                	test   %ebx,%ebx
 509:	74 65                	je     570 <printf+0x17c>
        while(*s != 0){
 50b:	8a 03                	mov    (%ebx),%al
 50d:	84 c0                	test   %al,%al
 50f:	74 70                	je     581 <printf+0x18d>
 511:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 514:	89 de                	mov    %ebx,%esi
 516:	8b 5d 08             	mov    0x8(%ebp),%ebx
 519:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 51c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 51f:	50                   	push   %eax
 520:	6a 01                	push   $0x1
 522:	57                   	push   %edi
 523:	53                   	push   %ebx
 524:	e8 b8 fd ff ff       	call   2e1 <write>
          s++;
 529:	46                   	inc    %esi
        while(*s != 0){
 52a:	8a 06                	mov    (%esi),%al
 52c:	83 c4 10             	add    $0x10,%esp
 52f:	84 c0                	test   %al,%al
 531:	75 e9                	jne    51c <printf+0x128>
 533:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 536:	31 d2                	xor    %edx,%edx
 538:	e9 fc fe ff ff       	jmp    439 <printf+0x45>
 53d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 540:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 543:	52                   	push   %edx
 544:	e9 4c ff ff ff       	jmp    495 <printf+0xa1>
 549:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, *ap);
 54c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 54f:	8b 03                	mov    (%ebx),%eax
 551:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 554:	51                   	push   %ecx
 555:	6a 01                	push   $0x1
 557:	57                   	push   %edi
 558:	ff 75 08             	pushl  0x8(%ebp)
 55b:	e8 81 fd ff ff       	call   2e1 <write>
        ap++;
 560:	83 c3 04             	add    $0x4,%ebx
 563:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 566:	83 c4 10             	add    $0x10,%esp
      state = 0;
 569:	31 d2                	xor    %edx,%edx
 56b:	e9 c9 fe ff ff       	jmp    439 <printf+0x45>
          s = "(null)";
 570:	bb 2d 07 00 00       	mov    $0x72d,%ebx
        while(*s != 0){
 575:	b0 28                	mov    $0x28,%al
 577:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 57a:	89 de                	mov    %ebx,%esi
 57c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 57f:	eb 9b                	jmp    51c <printf+0x128>
      state = 0;
 581:	31 d2                	xor    %edx,%edx
 583:	e9 b1 fe ff ff       	jmp    439 <printf+0x45>

00000588 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	57                   	push   %edi
 58c:	56                   	push   %esi
 58d:	53                   	push   %ebx
 58e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 591:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 594:	a1 d8 09 00 00       	mov    0x9d8,%eax
 599:	8b 10                	mov    (%eax),%edx
 59b:	39 c8                	cmp    %ecx,%eax
 59d:	73 11                	jae    5b0 <free+0x28>
 59f:	90                   	nop
 5a0:	39 d1                	cmp    %edx,%ecx
 5a2:	72 14                	jb     5b8 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5a4:	39 d0                	cmp    %edx,%eax
 5a6:	73 10                	jae    5b8 <free+0x30>
{
 5a8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5aa:	8b 10                	mov    (%eax),%edx
 5ac:	39 c8                	cmp    %ecx,%eax
 5ae:	72 f0                	jb     5a0 <free+0x18>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5b0:	39 d0                	cmp    %edx,%eax
 5b2:	72 f4                	jb     5a8 <free+0x20>
 5b4:	39 d1                	cmp    %edx,%ecx
 5b6:	73 f0                	jae    5a8 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5be:	39 fa                	cmp    %edi,%edx
 5c0:	74 1a                	je     5dc <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5c5:	8b 50 04             	mov    0x4(%eax),%edx
 5c8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5cb:	39 f1                	cmp    %esi,%ecx
 5cd:	74 24                	je     5f3 <free+0x6b>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5cf:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5d1:	a3 d8 09 00 00       	mov    %eax,0x9d8
}
 5d6:	5b                   	pop    %ebx
 5d7:	5e                   	pop    %esi
 5d8:	5f                   	pop    %edi
 5d9:	5d                   	pop    %ebp
 5da:	c3                   	ret    
 5db:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 5dc:	03 72 04             	add    0x4(%edx),%esi
 5df:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5e2:	8b 10                	mov    (%eax),%edx
 5e4:	8b 12                	mov    (%edx),%edx
 5e6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5e9:	8b 50 04             	mov    0x4(%eax),%edx
 5ec:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5ef:	39 f1                	cmp    %esi,%ecx
 5f1:	75 dc                	jne    5cf <free+0x47>
    p->s.size += bp->s.size;
 5f3:	03 53 fc             	add    -0x4(%ebx),%edx
 5f6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5f9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5fc:	89 10                	mov    %edx,(%eax)
  freep = p;
 5fe:	a3 d8 09 00 00       	mov    %eax,0x9d8
}
 603:	5b                   	pop    %ebx
 604:	5e                   	pop    %esi
 605:	5f                   	pop    %edi
 606:	5d                   	pop    %ebp
 607:	c3                   	ret    

00000608 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 608:	55                   	push   %ebp
 609:	89 e5                	mov    %esp,%ebp
 60b:	57                   	push   %edi
 60c:	56                   	push   %esi
 60d:	53                   	push   %ebx
 60e:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 611:	8b 45 08             	mov    0x8(%ebp),%eax
 614:	8d 70 07             	lea    0x7(%eax),%esi
 617:	c1 ee 03             	shr    $0x3,%esi
 61a:	46                   	inc    %esi
  if((prevp = freep) == 0){
 61b:	8b 3d d8 09 00 00    	mov    0x9d8,%edi
 621:	85 ff                	test   %edi,%edi
 623:	0f 84 a3 00 00 00    	je     6cc <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 629:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 62b:	8b 48 04             	mov    0x4(%eax),%ecx
 62e:	39 f1                	cmp    %esi,%ecx
 630:	73 67                	jae    699 <malloc+0x91>
 632:	89 f3                	mov    %esi,%ebx
 634:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 63a:	0f 82 80 00 00 00    	jb     6c0 <malloc+0xb8>
  p = sbrk(nu * sizeof(Header));
 640:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 647:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 64a:	eb 11                	jmp    65d <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 64c:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 64e:	8b 4a 04             	mov    0x4(%edx),%ecx
 651:	39 f1                	cmp    %esi,%ecx
 653:	73 4b                	jae    6a0 <malloc+0x98>
 655:	8b 3d d8 09 00 00    	mov    0x9d8,%edi
 65b:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 65d:	39 c7                	cmp    %eax,%edi
 65f:	75 eb                	jne    64c <malloc+0x44>
  p = sbrk(nu * sizeof(Header));
 661:	83 ec 0c             	sub    $0xc,%esp
 664:	ff 75 e4             	pushl  -0x1c(%ebp)
 667:	e8 dd fc ff ff       	call   349 <sbrk>
  if(p == (char*)-1)
 66c:	83 c4 10             	add    $0x10,%esp
 66f:	83 f8 ff             	cmp    $0xffffffff,%eax
 672:	74 1b                	je     68f <malloc+0x87>
  hp->s.size = nu;
 674:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 677:	83 ec 0c             	sub    $0xc,%esp
 67a:	83 c0 08             	add    $0x8,%eax
 67d:	50                   	push   %eax
 67e:	e8 05 ff ff ff       	call   588 <free>
  return freep;
 683:	a1 d8 09 00 00       	mov    0x9d8,%eax
      if((p = morecore(nunits)) == 0)
 688:	83 c4 10             	add    $0x10,%esp
 68b:	85 c0                	test   %eax,%eax
 68d:	75 bd                	jne    64c <malloc+0x44>
        return 0;
 68f:	31 c0                	xor    %eax,%eax
  }
}
 691:	8d 65 f4             	lea    -0xc(%ebp),%esp
 694:	5b                   	pop    %ebx
 695:	5e                   	pop    %esi
 696:	5f                   	pop    %edi
 697:	5d                   	pop    %ebp
 698:	c3                   	ret    
    if(p->s.size >= nunits){
 699:	89 c2                	mov    %eax,%edx
 69b:	89 f8                	mov    %edi,%eax
 69d:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6a0:	39 ce                	cmp    %ecx,%esi
 6a2:	74 54                	je     6f8 <malloc+0xf0>
        p->s.size -= nunits;
 6a4:	29 f1                	sub    %esi,%ecx
 6a6:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 6a9:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 6ac:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 6af:	a3 d8 09 00 00       	mov    %eax,0x9d8
      return (void*)(p + 1);
 6b4:	8d 42 08             	lea    0x8(%edx),%eax
}
 6b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ba:	5b                   	pop    %ebx
 6bb:	5e                   	pop    %esi
 6bc:	5f                   	pop    %edi
 6bd:	5d                   	pop    %ebp
 6be:	c3                   	ret    
 6bf:	90                   	nop
 6c0:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6c5:	e9 76 ff ff ff       	jmp    640 <malloc+0x38>
 6ca:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 6cc:	c7 05 d8 09 00 00 dc 	movl   $0x9dc,0x9d8
 6d3:	09 00 00 
 6d6:	c7 05 dc 09 00 00 dc 	movl   $0x9dc,0x9dc
 6dd:	09 00 00 
    base.s.size = 0;
 6e0:	c7 05 e0 09 00 00 00 	movl   $0x0,0x9e0
 6e7:	00 00 00 
 6ea:	bf dc 09 00 00       	mov    $0x9dc,%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6ef:	89 f8                	mov    %edi,%eax
 6f1:	e9 3c ff ff ff       	jmp    632 <malloc+0x2a>
 6f6:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 6f8:	8b 0a                	mov    (%edx),%ecx
 6fa:	89 08                	mov    %ecx,(%eax)
 6fc:	eb b1                	jmp    6af <malloc+0xa7>
