
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

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

  for(i = 1; i < argc; i++)
  18:	83 f8 01             	cmp    $0x1,%eax
  1b:	7e 47                	jle    64 <main+0x64>
  1d:	8d 5a 04             	lea    0x4(%edx),%ebx
  20:	8d 34 82             	lea    (%edx,%eax,4),%esi
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  23:	83 c3 04             	add    $0x4,%ebx
  26:	8b 43 fc             	mov    -0x4(%ebx),%eax
  29:	39 f3                	cmp    %esi,%ebx
  2b:	74 22                	je     4f <main+0x4f>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
  30:	68 5c 06 00 00       	push   $0x65c
  35:	50                   	push   %eax
  36:	68 5e 06 00 00       	push   $0x65e
  3b:	6a 01                	push   $0x1
  3d:	e8 0e 03 00 00       	call   350 <printf>
  42:	83 c4 10             	add    $0x10,%esp
  45:	83 c3 04             	add    $0x4,%ebx
  48:	8b 43 fc             	mov    -0x4(%ebx),%eax
  4b:	39 f3                	cmp    %esi,%ebx
  4d:	75 e1                	jne    30 <main+0x30>
  4f:	68 63 06 00 00       	push   $0x663
  54:	50                   	push   %eax
  55:	68 5e 06 00 00       	push   $0x65e
  5a:	6a 01                	push   $0x1
  5c:	e8 ef 02 00 00       	call   350 <printf>
  61:	83 c4 10             	add    $0x10,%esp
  exit();
  64:	e8 b4 01 00 00       	call   21d <exit>
  69:	66 90                	xchg   %ax,%ax
  6b:	90                   	nop

0000006c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	53                   	push   %ebx
  70:	8b 4d 08             	mov    0x8(%ebp),%ecx
  73:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  76:	31 c0                	xor    %eax,%eax
  78:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  7b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  7e:	40                   	inc    %eax
  7f:	84 d2                	test   %dl,%dl
  81:	75 f5                	jne    78 <strcpy+0xc>
    ;
  return os;
}
  83:	89 c8                	mov    %ecx,%eax
  85:	5b                   	pop    %ebx
  86:	5d                   	pop    %ebp
  87:	c3                   	ret    

00000088 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  88:	55                   	push   %ebp
  89:	89 e5                	mov    %esp,%ebp
  8b:	53                   	push   %ebx
  8c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  92:	0f b6 03             	movzbl (%ebx),%eax
  95:	0f b6 0a             	movzbl (%edx),%ecx
  98:	84 c0                	test   %al,%al
  9a:	75 10                	jne    ac <strcmp+0x24>
  9c:	eb 1a                	jmp    b8 <strcmp+0x30>
  9e:	66 90                	xchg   %ax,%ax
    p++, q++;
  a0:	43                   	inc    %ebx
  a1:	42                   	inc    %edx
  while(*p && *p == *q)
  a2:	0f b6 03             	movzbl (%ebx),%eax
  a5:	0f b6 0a             	movzbl (%edx),%ecx
  a8:	84 c0                	test   %al,%al
  aa:	74 0c                	je     b8 <strcmp+0x30>
  ac:	38 c8                	cmp    %cl,%al
  ae:	74 f0                	je     a0 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  b0:	29 c8                	sub    %ecx,%eax
}
  b2:	5b                   	pop    %ebx
  b3:	5d                   	pop    %ebp
  b4:	c3                   	ret    
  b5:	8d 76 00             	lea    0x0(%esi),%esi
  b8:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  ba:	29 c8                	sub    %ecx,%eax
}
  bc:	5b                   	pop    %ebx
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    
  bf:	90                   	nop

000000c0 <strlen>:

uint
strlen(const char *s)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  c6:	80 3a 00             	cmpb   $0x0,(%edx)
  c9:	74 15                	je     e0 <strlen+0x20>
  cb:	31 c0                	xor    %eax,%eax
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  d0:	40                   	inc    %eax
  d1:	89 c1                	mov    %eax,%ecx
  d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d7:	75 f7                	jne    d0 <strlen+0x10>
    ;
  return n;
}
  d9:	89 c8                	mov    %ecx,%eax
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
  e0:	31 c9                	xor    %ecx,%ecx
}
  e2:	89 c8                	mov    %ecx,%eax
  e4:	5d                   	pop    %ebp
  e5:	c3                   	ret    
  e6:	66 90                	xchg   %ax,%ax

000000e8 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e8:	55                   	push   %ebp
  e9:	89 e5                	mov    %esp,%ebp
  eb:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  ef:	8b 4d 10             	mov    0x10(%ebp),%ecx
  f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  f5:	fc                   	cld    
  f6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  f8:	8b 45 08             	mov    0x8(%ebp),%eax
  fb:	5f                   	pop    %edi
  fc:	5d                   	pop    %ebp
  fd:	c3                   	ret    
  fe:	66 90                	xchg   %ax,%ax

00000100 <strchr>:

char*
strchr(const char *s, char c)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 109:	8a 10                	mov    (%eax),%dl
 10b:	84 d2                	test   %dl,%dl
 10d:	75 0c                	jne    11b <strchr+0x1b>
 10f:	eb 13                	jmp    124 <strchr+0x24>
 111:	8d 76 00             	lea    0x0(%esi),%esi
 114:	40                   	inc    %eax
 115:	8a 10                	mov    (%eax),%dl
 117:	84 d2                	test   %dl,%dl
 119:	74 09                	je     124 <strchr+0x24>
    if(*s == c)
 11b:	38 d1                	cmp    %dl,%cl
 11d:	75 f5                	jne    114 <strchr+0x14>
      return (char*)s;
  return 0;
}
 11f:	5d                   	pop    %ebp
 120:	c3                   	ret    
 121:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
 124:	31 c0                	xor    %eax,%eax
}
 126:	5d                   	pop    %ebp
 127:	c3                   	ret    

00000128 <gets>:

char*
gets(char *buf, int max)
{
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
 12b:	57                   	push   %edi
 12c:	56                   	push   %esi
 12d:	53                   	push   %ebx
 12e:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 131:	8b 75 08             	mov    0x8(%ebp),%esi
 134:	bb 01 00 00 00       	mov    $0x1,%ebx
 139:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
 13b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 13e:	eb 20                	jmp    160 <gets+0x38>
    cc = read(0, &c, 1);
 140:	50                   	push   %eax
 141:	6a 01                	push   $0x1
 143:	57                   	push   %edi
 144:	6a 00                	push   $0x0
 146:	e8 ea 00 00 00       	call   235 <read>
    if(cc < 1)
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	85 c0                	test   %eax,%eax
 150:	7e 16                	jle    168 <gets+0x40>
      break;
    buf[i++] = c;
 152:	8a 45 e7             	mov    -0x19(%ebp),%al
 155:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
 157:	46                   	inc    %esi
 158:	3c 0a                	cmp    $0xa,%al
 15a:	74 0c                	je     168 <gets+0x40>
 15c:	3c 0d                	cmp    $0xd,%al
 15e:	74 08                	je     168 <gets+0x40>
  for(i=0; i+1 < max; ){
 160:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 163:	39 45 0c             	cmp    %eax,0xc(%ebp)
 166:	7f d8                	jg     140 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 168:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
 16b:	8b 45 08             	mov    0x8(%ebp),%eax
 16e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 171:	5b                   	pop    %ebx
 172:	5e                   	pop    %esi
 173:	5f                   	pop    %edi
 174:	5d                   	pop    %ebp
 175:	c3                   	ret    
 176:	66 90                	xchg   %ax,%ax

00000178 <stat>:

int
stat(const char *n, struct stat *st)
{
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	56                   	push   %esi
 17c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 17d:	83 ec 08             	sub    $0x8,%esp
 180:	6a 00                	push   $0x0
 182:	ff 75 08             	pushl  0x8(%ebp)
 185:	e8 d3 00 00 00       	call   25d <open>
  if(fd < 0)
 18a:	83 c4 10             	add    $0x10,%esp
 18d:	85 c0                	test   %eax,%eax
 18f:	78 27                	js     1b8 <stat+0x40>
 191:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 193:	83 ec 08             	sub    $0x8,%esp
 196:	ff 75 0c             	pushl  0xc(%ebp)
 199:	50                   	push   %eax
 19a:	e8 d6 00 00 00       	call   275 <fstat>
 19f:	89 c6                	mov    %eax,%esi
  close(fd);
 1a1:	89 1c 24             	mov    %ebx,(%esp)
 1a4:	e8 9c 00 00 00       	call   245 <close>
  return r;
 1a9:	83 c4 10             	add    $0x10,%esp
}
 1ac:	89 f0                	mov    %esi,%eax
 1ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b1:	5b                   	pop    %ebx
 1b2:	5e                   	pop    %esi
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    
 1b5:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1b8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1bd:	eb ed                	jmp    1ac <stat+0x34>
 1bf:	90                   	nop

000001c0 <atoi>:

int
atoi(const char *s)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
 1c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1c7:	0f be 01             	movsbl (%ecx),%eax
 1ca:	8d 50 d0             	lea    -0x30(%eax),%edx
 1cd:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
 1d0:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1d5:	77 16                	ja     1ed <atoi+0x2d>
 1d7:	90                   	nop
    n = n*10 + *s++ - '0';
 1d8:	41                   	inc    %ecx
 1d9:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1dc:	01 d2                	add    %edx,%edx
 1de:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
 1e2:	0f be 01             	movsbl (%ecx),%eax
 1e5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1e8:	80 fb 09             	cmp    $0x9,%bl
 1eb:	76 eb                	jbe    1d8 <atoi+0x18>
  return n;
}
 1ed:	89 d0                	mov    %edx,%eax
 1ef:	5b                   	pop    %ebx
 1f0:	5d                   	pop    %ebp
 1f1:	c3                   	ret    
 1f2:	66 90                	xchg   %ax,%ax

000001f4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	57                   	push   %edi
 1f8:	56                   	push   %esi
 1f9:	8b 45 08             	mov    0x8(%ebp),%eax
 1fc:	8b 75 0c             	mov    0xc(%ebp),%esi
 1ff:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 202:	85 d2                	test   %edx,%edx
 204:	7e 0b                	jle    211 <memmove+0x1d>
 206:	01 c2                	add    %eax,%edx
  dst = vdst;
 208:	89 c7                	mov    %eax,%edi
 20a:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 20c:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 20d:	39 fa                	cmp    %edi,%edx
 20f:	75 fb                	jne    20c <memmove+0x18>
  return vdst;
}
 211:	5e                   	pop    %esi
 212:	5f                   	pop    %edi
 213:	5d                   	pop    %ebp
 214:	c3                   	ret    

00000215 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 215:	b8 01 00 00 00       	mov    $0x1,%eax
 21a:	cd 40                	int    $0x40
 21c:	c3                   	ret    

0000021d <exit>:
SYSCALL(exit)
 21d:	b8 02 00 00 00       	mov    $0x2,%eax
 222:	cd 40                	int    $0x40
 224:	c3                   	ret    

00000225 <wait>:
SYSCALL(wait)
 225:	b8 03 00 00 00       	mov    $0x3,%eax
 22a:	cd 40                	int    $0x40
 22c:	c3                   	ret    

0000022d <pipe>:
SYSCALL(pipe)
 22d:	b8 04 00 00 00       	mov    $0x4,%eax
 232:	cd 40                	int    $0x40
 234:	c3                   	ret    

00000235 <read>:
SYSCALL(read)
 235:	b8 05 00 00 00       	mov    $0x5,%eax
 23a:	cd 40                	int    $0x40
 23c:	c3                   	ret    

0000023d <write>:
SYSCALL(write)
 23d:	b8 10 00 00 00       	mov    $0x10,%eax
 242:	cd 40                	int    $0x40
 244:	c3                   	ret    

00000245 <close>:
SYSCALL(close)
 245:	b8 15 00 00 00       	mov    $0x15,%eax
 24a:	cd 40                	int    $0x40
 24c:	c3                   	ret    

0000024d <kill>:
SYSCALL(kill)
 24d:	b8 06 00 00 00       	mov    $0x6,%eax
 252:	cd 40                	int    $0x40
 254:	c3                   	ret    

00000255 <exec>:
SYSCALL(exec)
 255:	b8 07 00 00 00       	mov    $0x7,%eax
 25a:	cd 40                	int    $0x40
 25c:	c3                   	ret    

0000025d <open>:
SYSCALL(open)
 25d:	b8 0f 00 00 00       	mov    $0xf,%eax
 262:	cd 40                	int    $0x40
 264:	c3                   	ret    

00000265 <mknod>:
SYSCALL(mknod)
 265:	b8 11 00 00 00       	mov    $0x11,%eax
 26a:	cd 40                	int    $0x40
 26c:	c3                   	ret    

0000026d <unlink>:
SYSCALL(unlink)
 26d:	b8 12 00 00 00       	mov    $0x12,%eax
 272:	cd 40                	int    $0x40
 274:	c3                   	ret    

00000275 <fstat>:
SYSCALL(fstat)
 275:	b8 08 00 00 00       	mov    $0x8,%eax
 27a:	cd 40                	int    $0x40
 27c:	c3                   	ret    

0000027d <link>:
SYSCALL(link)
 27d:	b8 13 00 00 00       	mov    $0x13,%eax
 282:	cd 40                	int    $0x40
 284:	c3                   	ret    

00000285 <mkdir>:
SYSCALL(mkdir)
 285:	b8 14 00 00 00       	mov    $0x14,%eax
 28a:	cd 40                	int    $0x40
 28c:	c3                   	ret    

0000028d <chdir>:
SYSCALL(chdir)
 28d:	b8 09 00 00 00       	mov    $0x9,%eax
 292:	cd 40                	int    $0x40
 294:	c3                   	ret    

00000295 <dup>:
SYSCALL(dup)
 295:	b8 0a 00 00 00       	mov    $0xa,%eax
 29a:	cd 40                	int    $0x40
 29c:	c3                   	ret    

0000029d <getpid>:
SYSCALL(getpid)
 29d:	b8 0b 00 00 00       	mov    $0xb,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <sbrk>:
SYSCALL(sbrk)
 2a5:	b8 0c 00 00 00       	mov    $0xc,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <sleep>:
SYSCALL(sleep)
 2ad:	b8 0d 00 00 00       	mov    $0xd,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <uptime>:
SYSCALL(uptime)
 2b5:	b8 0e 00 00 00       	mov    $0xe,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <getreadcount>:
 2bd:	b8 16 00 00 00       	mov    $0x16,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    
 2c5:	66 90                	xchg   %ax,%ax
 2c7:	90                   	nop

000002c8 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 2c8:	55                   	push   %ebp
 2c9:	89 e5                	mov    %esp,%ebp
 2cb:	57                   	push   %edi
 2cc:	56                   	push   %esi
 2cd:	53                   	push   %ebx
 2ce:	83 ec 3c             	sub    $0x3c,%esp
 2d1:	89 45 bc             	mov    %eax,-0x44(%ebp)
 2d4:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 2d7:	89 d1                	mov    %edx,%ecx
  if(sgn && xx < 0){
 2d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 2dc:	85 db                	test   %ebx,%ebx
 2de:	74 04                	je     2e4 <printint+0x1c>
 2e0:	85 d2                	test   %edx,%edx
 2e2:	78 68                	js     34c <printint+0x84>
  neg = 0;
 2e4:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 2eb:	31 ff                	xor    %edi,%edi
 2ed:	8d 75 d7             	lea    -0x29(%ebp),%esi
  do{
    buf[i++] = digits[x % base];
 2f0:	89 c8                	mov    %ecx,%eax
 2f2:	31 d2                	xor    %edx,%edx
 2f4:	f7 75 c4             	divl   -0x3c(%ebp)
 2f7:	89 fb                	mov    %edi,%ebx
 2f9:	8d 7f 01             	lea    0x1(%edi),%edi
 2fc:	8a 92 6c 06 00 00    	mov    0x66c(%edx),%dl
 302:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
  }while((x /= base) != 0);
 306:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 309:	89 c1                	mov    %eax,%ecx
 30b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 30e:	3b 45 c0             	cmp    -0x40(%ebp),%eax
 311:	76 dd                	jbe    2f0 <printint+0x28>
  if(neg)
 313:	8b 4d 08             	mov    0x8(%ebp),%ecx
 316:	85 c9                	test   %ecx,%ecx
 318:	74 09                	je     323 <printint+0x5b>
    buf[i++] = '-';
 31a:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
 31f:	89 fb                	mov    %edi,%ebx
    buf[i++] = '-';
 321:	b2 2d                	mov    $0x2d,%dl

  while(--i >= 0)
 323:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 327:	8b 7d bc             	mov    -0x44(%ebp),%edi
 32a:	eb 03                	jmp    32f <printint+0x67>
 32c:	8a 13                	mov    (%ebx),%dl
 32e:	4b                   	dec    %ebx
    putc(fd, buf[i]);
 32f:	88 55 d7             	mov    %dl,-0x29(%ebp)
  write(fd, &c, 1);
 332:	50                   	push   %eax
 333:	6a 01                	push   $0x1
 335:	56                   	push   %esi
 336:	57                   	push   %edi
 337:	e8 01 ff ff ff       	call   23d <write>
  while(--i >= 0)
 33c:	83 c4 10             	add    $0x10,%esp
 33f:	39 de                	cmp    %ebx,%esi
 341:	75 e9                	jne    32c <printint+0x64>
}
 343:	8d 65 f4             	lea    -0xc(%ebp),%esp
 346:	5b                   	pop    %ebx
 347:	5e                   	pop    %esi
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    
 34b:	90                   	nop
    x = -xx;
 34c:	f7 d9                	neg    %ecx
 34e:	eb 9b                	jmp    2eb <printint+0x23>

00000350 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 359:	8b 75 0c             	mov    0xc(%ebp),%esi
 35c:	8a 1e                	mov    (%esi),%bl
 35e:	84 db                	test   %bl,%bl
 360:	0f 84 a3 00 00 00    	je     409 <printf+0xb9>
 366:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 367:	8d 45 10             	lea    0x10(%ebp),%eax
 36a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  state = 0;
 36d:	31 d2                	xor    %edx,%edx
  write(fd, &c, 1);
 36f:	8d 7d e7             	lea    -0x19(%ebp),%edi
 372:	eb 29                	jmp    39d <printf+0x4d>
 374:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 377:	83 f8 25             	cmp    $0x25,%eax
 37a:	0f 84 94 00 00 00    	je     414 <printf+0xc4>
        state = '%';
      } else {
        putc(fd, c);
 380:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 383:	50                   	push   %eax
 384:	6a 01                	push   $0x1
 386:	57                   	push   %edi
 387:	ff 75 08             	pushl  0x8(%ebp)
 38a:	e8 ae fe ff ff       	call   23d <write>
        putc(fd, c);
 38f:	83 c4 10             	add    $0x10,%esp
 392:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  for(i = 0; fmt[i]; i++){
 395:	46                   	inc    %esi
 396:	8a 5e ff             	mov    -0x1(%esi),%bl
 399:	84 db                	test   %bl,%bl
 39b:	74 6c                	je     409 <printf+0xb9>
    c = fmt[i] & 0xff;
 39d:	0f be cb             	movsbl %bl,%ecx
 3a0:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 3a3:	85 d2                	test   %edx,%edx
 3a5:	74 cd                	je     374 <printf+0x24>
      }
    } else if(state == '%'){
 3a7:	83 fa 25             	cmp    $0x25,%edx
 3aa:	75 e9                	jne    395 <printf+0x45>
      if(c == 'd'){
 3ac:	83 f8 64             	cmp    $0x64,%eax
 3af:	0f 84 97 00 00 00    	je     44c <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 3b5:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 3bb:	83 f9 70             	cmp    $0x70,%ecx
 3be:	74 60                	je     420 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 3c0:	83 f8 73             	cmp    $0x73,%eax
 3c3:	0f 84 8f 00 00 00    	je     458 <printf+0x108>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 3c9:	83 f8 63             	cmp    $0x63,%eax
 3cc:	0f 84 d6 00 00 00    	je     4a8 <printf+0x158>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 3d2:	83 f8 25             	cmp    $0x25,%eax
 3d5:	0f 84 c1 00 00 00    	je     49c <printf+0x14c>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 3db:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 3df:	50                   	push   %eax
 3e0:	6a 01                	push   $0x1
 3e2:	57                   	push   %edi
 3e3:	ff 75 08             	pushl  0x8(%ebp)
 3e6:	e8 52 fe ff ff       	call   23d <write>
        putc(fd, c);
 3eb:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 3ee:	83 c4 0c             	add    $0xc,%esp
 3f1:	6a 01                	push   $0x1
 3f3:	57                   	push   %edi
 3f4:	ff 75 08             	pushl  0x8(%ebp)
 3f7:	e8 41 fe ff ff       	call   23d <write>
        putc(fd, c);
 3fc:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 3ff:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 401:	46                   	inc    %esi
 402:	8a 5e ff             	mov    -0x1(%esi),%bl
 405:	84 db                	test   %bl,%bl
 407:	75 94                	jne    39d <printf+0x4d>
    }
  }
}
 409:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40c:	5b                   	pop    %ebx
 40d:	5e                   	pop    %esi
 40e:	5f                   	pop    %edi
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret    
 411:	8d 76 00             	lea    0x0(%esi),%esi
        state = '%';
 414:	ba 25 00 00 00       	mov    $0x25,%edx
 419:	e9 77 ff ff ff       	jmp    395 <printf+0x45>
 41e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 420:	83 ec 0c             	sub    $0xc,%esp
 423:	6a 00                	push   $0x0
 425:	b9 10 00 00 00       	mov    $0x10,%ecx
 42a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 42d:	8b 13                	mov    (%ebx),%edx
 42f:	8b 45 08             	mov    0x8(%ebp),%eax
 432:	e8 91 fe ff ff       	call   2c8 <printint>
        ap++;
 437:	89 d8                	mov    %ebx,%eax
 439:	83 c0 04             	add    $0x4,%eax
 43c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 43f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 442:	31 d2                	xor    %edx,%edx
        ap++;
 444:	e9 4c ff ff ff       	jmp    395 <printf+0x45>
 449:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 44c:	83 ec 0c             	sub    $0xc,%esp
 44f:	6a 01                	push   $0x1
 451:	b9 0a 00 00 00       	mov    $0xa,%ecx
 456:	eb d2                	jmp    42a <printf+0xda>
        s = (char*)*ap;
 458:	8b 45 d0             	mov    -0x30(%ebp),%eax
 45b:	8b 18                	mov    (%eax),%ebx
        ap++;
 45d:	83 c0 04             	add    $0x4,%eax
 460:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 463:	85 db                	test   %ebx,%ebx
 465:	74 65                	je     4cc <printf+0x17c>
        while(*s != 0){
 467:	8a 03                	mov    (%ebx),%al
 469:	84 c0                	test   %al,%al
 46b:	74 70                	je     4dd <printf+0x18d>
 46d:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 470:	89 de                	mov    %ebx,%esi
 472:	8b 5d 08             	mov    0x8(%ebp),%ebx
 475:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 478:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 47b:	50                   	push   %eax
 47c:	6a 01                	push   $0x1
 47e:	57                   	push   %edi
 47f:	53                   	push   %ebx
 480:	e8 b8 fd ff ff       	call   23d <write>
          s++;
 485:	46                   	inc    %esi
        while(*s != 0){
 486:	8a 06                	mov    (%esi),%al
 488:	83 c4 10             	add    $0x10,%esp
 48b:	84 c0                	test   %al,%al
 48d:	75 e9                	jne    478 <printf+0x128>
 48f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 492:	31 d2                	xor    %edx,%edx
 494:	e9 fc fe ff ff       	jmp    395 <printf+0x45>
 499:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 49c:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 49f:	52                   	push   %edx
 4a0:	e9 4c ff ff ff       	jmp    3f1 <printf+0xa1>
 4a5:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, *ap);
 4a8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4ab:	8b 03                	mov    (%ebx),%eax
 4ad:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 4b0:	51                   	push   %ecx
 4b1:	6a 01                	push   $0x1
 4b3:	57                   	push   %edi
 4b4:	ff 75 08             	pushl  0x8(%ebp)
 4b7:	e8 81 fd ff ff       	call   23d <write>
        ap++;
 4bc:	83 c3 04             	add    $0x4,%ebx
 4bf:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4c2:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4c5:	31 d2                	xor    %edx,%edx
 4c7:	e9 c9 fe ff ff       	jmp    395 <printf+0x45>
          s = "(null)";
 4cc:	bb 65 06 00 00       	mov    $0x665,%ebx
        while(*s != 0){
 4d1:	b0 28                	mov    $0x28,%al
 4d3:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 4d6:	89 de                	mov    %ebx,%esi
 4d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4db:	eb 9b                	jmp    478 <printf+0x128>
      state = 0;
 4dd:	31 d2                	xor    %edx,%edx
 4df:	e9 b1 fe ff ff       	jmp    395 <printf+0x45>

000004e4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	57                   	push   %edi
 4e8:	56                   	push   %esi
 4e9:	53                   	push   %ebx
 4ea:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 4ed:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4f0:	a1 0c 09 00 00       	mov    0x90c,%eax
 4f5:	8b 10                	mov    (%eax),%edx
 4f7:	39 c8                	cmp    %ecx,%eax
 4f9:	73 11                	jae    50c <free+0x28>
 4fb:	90                   	nop
 4fc:	39 d1                	cmp    %edx,%ecx
 4fe:	72 14                	jb     514 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 500:	39 d0                	cmp    %edx,%eax
 502:	73 10                	jae    514 <free+0x30>
{
 504:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 506:	8b 10                	mov    (%eax),%edx
 508:	39 c8                	cmp    %ecx,%eax
 50a:	72 f0                	jb     4fc <free+0x18>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 50c:	39 d0                	cmp    %edx,%eax
 50e:	72 f4                	jb     504 <free+0x20>
 510:	39 d1                	cmp    %edx,%ecx
 512:	73 f0                	jae    504 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 514:	8b 73 fc             	mov    -0x4(%ebx),%esi
 517:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 51a:	39 fa                	cmp    %edi,%edx
 51c:	74 1a                	je     538 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 51e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 521:	8b 50 04             	mov    0x4(%eax),%edx
 524:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 527:	39 f1                	cmp    %esi,%ecx
 529:	74 24                	je     54f <free+0x6b>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 52b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 52d:	a3 0c 09 00 00       	mov    %eax,0x90c
}
 532:	5b                   	pop    %ebx
 533:	5e                   	pop    %esi
 534:	5f                   	pop    %edi
 535:	5d                   	pop    %ebp
 536:	c3                   	ret    
 537:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 538:	03 72 04             	add    0x4(%edx),%esi
 53b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 53e:	8b 10                	mov    (%eax),%edx
 540:	8b 12                	mov    (%edx),%edx
 542:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 545:	8b 50 04             	mov    0x4(%eax),%edx
 548:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 54b:	39 f1                	cmp    %esi,%ecx
 54d:	75 dc                	jne    52b <free+0x47>
    p->s.size += bp->s.size;
 54f:	03 53 fc             	add    -0x4(%ebx),%edx
 552:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 555:	8b 53 f8             	mov    -0x8(%ebx),%edx
 558:	89 10                	mov    %edx,(%eax)
  freep = p;
 55a:	a3 0c 09 00 00       	mov    %eax,0x90c
}
 55f:	5b                   	pop    %ebx
 560:	5e                   	pop    %esi
 561:	5f                   	pop    %edi
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    

00000564 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 564:	55                   	push   %ebp
 565:	89 e5                	mov    %esp,%ebp
 567:	57                   	push   %edi
 568:	56                   	push   %esi
 569:	53                   	push   %ebx
 56a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
 570:	8d 70 07             	lea    0x7(%eax),%esi
 573:	c1 ee 03             	shr    $0x3,%esi
 576:	46                   	inc    %esi
  if((prevp = freep) == 0){
 577:	8b 3d 0c 09 00 00    	mov    0x90c,%edi
 57d:	85 ff                	test   %edi,%edi
 57f:	0f 84 a3 00 00 00    	je     628 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 585:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 587:	8b 48 04             	mov    0x4(%eax),%ecx
 58a:	39 f1                	cmp    %esi,%ecx
 58c:	73 67                	jae    5f5 <malloc+0x91>
 58e:	89 f3                	mov    %esi,%ebx
 590:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 596:	0f 82 80 00 00 00    	jb     61c <malloc+0xb8>
  p = sbrk(nu * sizeof(Header));
 59c:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 5a3:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 5a6:	eb 11                	jmp    5b9 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5a8:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 5aa:	8b 4a 04             	mov    0x4(%edx),%ecx
 5ad:	39 f1                	cmp    %esi,%ecx
 5af:	73 4b                	jae    5fc <malloc+0x98>
 5b1:	8b 3d 0c 09 00 00    	mov    0x90c,%edi
 5b7:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 5b9:	39 c7                	cmp    %eax,%edi
 5bb:	75 eb                	jne    5a8 <malloc+0x44>
  p = sbrk(nu * sizeof(Header));
 5bd:	83 ec 0c             	sub    $0xc,%esp
 5c0:	ff 75 e4             	pushl  -0x1c(%ebp)
 5c3:	e8 dd fc ff ff       	call   2a5 <sbrk>
  if(p == (char*)-1)
 5c8:	83 c4 10             	add    $0x10,%esp
 5cb:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ce:	74 1b                	je     5eb <malloc+0x87>
  hp->s.size = nu;
 5d0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5d3:	83 ec 0c             	sub    $0xc,%esp
 5d6:	83 c0 08             	add    $0x8,%eax
 5d9:	50                   	push   %eax
 5da:	e8 05 ff ff ff       	call   4e4 <free>
  return freep;
 5df:	a1 0c 09 00 00       	mov    0x90c,%eax
      if((p = morecore(nunits)) == 0)
 5e4:	83 c4 10             	add    $0x10,%esp
 5e7:	85 c0                	test   %eax,%eax
 5e9:	75 bd                	jne    5a8 <malloc+0x44>
        return 0;
 5eb:	31 c0                	xor    %eax,%eax
  }
}
 5ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5f0:	5b                   	pop    %ebx
 5f1:	5e                   	pop    %esi
 5f2:	5f                   	pop    %edi
 5f3:	5d                   	pop    %ebp
 5f4:	c3                   	ret    
    if(p->s.size >= nunits){
 5f5:	89 c2                	mov    %eax,%edx
 5f7:	89 f8                	mov    %edi,%eax
 5f9:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 5fc:	39 ce                	cmp    %ecx,%esi
 5fe:	74 54                	je     654 <malloc+0xf0>
        p->s.size -= nunits;
 600:	29 f1                	sub    %esi,%ecx
 602:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 605:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 608:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 60b:	a3 0c 09 00 00       	mov    %eax,0x90c
      return (void*)(p + 1);
 610:	8d 42 08             	lea    0x8(%edx),%eax
}
 613:	8d 65 f4             	lea    -0xc(%ebp),%esp
 616:	5b                   	pop    %ebx
 617:	5e                   	pop    %esi
 618:	5f                   	pop    %edi
 619:	5d                   	pop    %ebp
 61a:	c3                   	ret    
 61b:	90                   	nop
 61c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 621:	e9 76 ff ff ff       	jmp    59c <malloc+0x38>
 626:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 628:	c7 05 0c 09 00 00 10 	movl   $0x910,0x90c
 62f:	09 00 00 
 632:	c7 05 10 09 00 00 10 	movl   $0x910,0x910
 639:	09 00 00 
    base.s.size = 0;
 63c:	c7 05 14 09 00 00 00 	movl   $0x0,0x914
 643:	00 00 00 
 646:	bf 10 09 00 00       	mov    $0x910,%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 64b:	89 f8                	mov    %edi,%eax
 64d:	e9 3c ff ff ff       	jmp    58e <malloc+0x2a>
 652:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 654:	8b 0a                	mov    (%edx),%ecx
 656:	89 08                	mov    %ecx,(%eax)
 658:	eb b1                	jmp    60b <malloc+0xa7>
