
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
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
  1b:	7e 28                	jle    45 <main+0x45>
  1d:	8d 5a 04             	lea    0x4(%edx),%ebx
  20:	8d 34 82             	lea    (%edx,%eax,4),%esi
  23:	90                   	nop
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  24:	83 ec 0c             	sub    $0xc,%esp
  27:	ff 33                	pushl  (%ebx)
  29:	e8 7e 01 00 00       	call   1ac <atoi>
  2e:	89 04 24             	mov    %eax,(%esp)
  31:	e8 03 02 00 00       	call   239 <kill>
  for(i=1; i<argc; i++)
  36:	83 c3 04             	add    $0x4,%ebx
  39:	83 c4 10             	add    $0x10,%esp
  3c:	39 f3                	cmp    %esi,%ebx
  3e:	75 e4                	jne    24 <main+0x24>
  exit();
  40:	e8 c4 01 00 00       	call   209 <exit>
    printf(2, "usage: kill pid...\n");
  45:	50                   	push   %eax
  46:	50                   	push   %eax
  47:	68 48 06 00 00       	push   $0x648
  4c:	6a 02                	push   $0x2
  4e:	e8 e9 02 00 00       	call   33c <printf>
    exit();
  53:	e8 b1 01 00 00       	call   209 <exit>

00000058 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  58:	55                   	push   %ebp
  59:	89 e5                	mov    %esp,%ebp
  5b:	53                   	push   %ebx
  5c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  5f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  62:	31 c0                	xor    %eax,%eax
  64:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  67:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  6a:	40                   	inc    %eax
  6b:	84 d2                	test   %dl,%dl
  6d:	75 f5                	jne    64 <strcpy+0xc>
    ;
  return os;
}
  6f:	89 c8                	mov    %ecx,%eax
  71:	5b                   	pop    %ebx
  72:	5d                   	pop    %ebp
  73:	c3                   	ret    

00000074 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  74:	55                   	push   %ebp
  75:	89 e5                	mov    %esp,%ebp
  77:	53                   	push   %ebx
  78:	8b 5d 08             	mov    0x8(%ebp),%ebx
  7b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  7e:	0f b6 03             	movzbl (%ebx),%eax
  81:	0f b6 0a             	movzbl (%edx),%ecx
  84:	84 c0                	test   %al,%al
  86:	75 10                	jne    98 <strcmp+0x24>
  88:	eb 1a                	jmp    a4 <strcmp+0x30>
  8a:	66 90                	xchg   %ax,%ax
    p++, q++;
  8c:	43                   	inc    %ebx
  8d:	42                   	inc    %edx
  while(*p && *p == *q)
  8e:	0f b6 03             	movzbl (%ebx),%eax
  91:	0f b6 0a             	movzbl (%edx),%ecx
  94:	84 c0                	test   %al,%al
  96:	74 0c                	je     a4 <strcmp+0x30>
  98:	38 c8                	cmp    %cl,%al
  9a:	74 f0                	je     8c <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  9c:	29 c8                	sub    %ecx,%eax
}
  9e:	5b                   	pop    %ebx
  9f:	5d                   	pop    %ebp
  a0:	c3                   	ret    
  a1:	8d 76 00             	lea    0x0(%esi),%esi
  a4:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  a6:	29 c8                	sub    %ecx,%eax
}
  a8:	5b                   	pop    %ebx
  a9:	5d                   	pop    %ebp
  aa:	c3                   	ret    
  ab:	90                   	nop

000000ac <strlen>:

uint
strlen(const char *s)
{
  ac:	55                   	push   %ebp
  ad:	89 e5                	mov    %esp,%ebp
  af:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  b2:	80 3a 00             	cmpb   $0x0,(%edx)
  b5:	74 15                	je     cc <strlen+0x20>
  b7:	31 c0                	xor    %eax,%eax
  b9:	8d 76 00             	lea    0x0(%esi),%esi
  bc:	40                   	inc    %eax
  bd:	89 c1                	mov    %eax,%ecx
  bf:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  c3:	75 f7                	jne    bc <strlen+0x10>
    ;
  return n;
}
  c5:	89 c8                	mov    %ecx,%eax
  c7:	5d                   	pop    %ebp
  c8:	c3                   	ret    
  c9:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
  cc:	31 c9                	xor    %ecx,%ecx
}
  ce:	89 c8                	mov    %ecx,%eax
  d0:	5d                   	pop    %ebp
  d1:	c3                   	ret    
  d2:	66 90                	xchg   %ax,%ax

000000d4 <memset>:

void*
memset(void *dst, int c, uint n)
{
  d4:	55                   	push   %ebp
  d5:	89 e5                	mov    %esp,%ebp
  d7:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  d8:	8b 7d 08             	mov    0x8(%ebp),%edi
  db:	8b 4d 10             	mov    0x10(%ebp),%ecx
  de:	8b 45 0c             	mov    0xc(%ebp),%eax
  e1:	fc                   	cld    
  e2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e4:	8b 45 08             	mov    0x8(%ebp),%eax
  e7:	5f                   	pop    %edi
  e8:	5d                   	pop    %ebp
  e9:	c3                   	ret    
  ea:	66 90                	xchg   %ax,%ax

000000ec <strchr>:

char*
strchr(const char *s, char c)
{
  ec:	55                   	push   %ebp
  ed:	89 e5                	mov    %esp,%ebp
  ef:	8b 45 08             	mov    0x8(%ebp),%eax
  f2:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
  f5:	8a 10                	mov    (%eax),%dl
  f7:	84 d2                	test   %dl,%dl
  f9:	75 0c                	jne    107 <strchr+0x1b>
  fb:	eb 13                	jmp    110 <strchr+0x24>
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	40                   	inc    %eax
 101:	8a 10                	mov    (%eax),%dl
 103:	84 d2                	test   %dl,%dl
 105:	74 09                	je     110 <strchr+0x24>
    if(*s == c)
 107:	38 d1                	cmp    %dl,%cl
 109:	75 f5                	jne    100 <strchr+0x14>
      return (char*)s;
  return 0;
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
 10d:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
 110:	31 c0                	xor    %eax,%eax
}
 112:	5d                   	pop    %ebp
 113:	c3                   	ret    

00000114 <gets>:

char*
gets(char *buf, int max)
{
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	57                   	push   %edi
 118:	56                   	push   %esi
 119:	53                   	push   %ebx
 11a:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 11d:	8b 75 08             	mov    0x8(%ebp),%esi
 120:	bb 01 00 00 00       	mov    $0x1,%ebx
 125:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
 127:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 12a:	eb 20                	jmp    14c <gets+0x38>
    cc = read(0, &c, 1);
 12c:	50                   	push   %eax
 12d:	6a 01                	push   $0x1
 12f:	57                   	push   %edi
 130:	6a 00                	push   $0x0
 132:	e8 ea 00 00 00       	call   221 <read>
    if(cc < 1)
 137:	83 c4 10             	add    $0x10,%esp
 13a:	85 c0                	test   %eax,%eax
 13c:	7e 16                	jle    154 <gets+0x40>
      break;
    buf[i++] = c;
 13e:	8a 45 e7             	mov    -0x19(%ebp),%al
 141:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
 143:	46                   	inc    %esi
 144:	3c 0a                	cmp    $0xa,%al
 146:	74 0c                	je     154 <gets+0x40>
 148:	3c 0d                	cmp    $0xd,%al
 14a:	74 08                	je     154 <gets+0x40>
  for(i=0; i+1 < max; ){
 14c:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 14f:	39 45 0c             	cmp    %eax,0xc(%ebp)
 152:	7f d8                	jg     12c <gets+0x18>
      break;
  }
  buf[i] = '\0';
 154:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
 157:	8b 45 08             	mov    0x8(%ebp),%eax
 15a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 15d:	5b                   	pop    %ebx
 15e:	5e                   	pop    %esi
 15f:	5f                   	pop    %edi
 160:	5d                   	pop    %ebp
 161:	c3                   	ret    
 162:	66 90                	xchg   %ax,%ax

00000164 <stat>:

int
stat(const char *n, struct stat *st)
{
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	56                   	push   %esi
 168:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 169:	83 ec 08             	sub    $0x8,%esp
 16c:	6a 00                	push   $0x0
 16e:	ff 75 08             	pushl  0x8(%ebp)
 171:	e8 d3 00 00 00       	call   249 <open>
  if(fd < 0)
 176:	83 c4 10             	add    $0x10,%esp
 179:	85 c0                	test   %eax,%eax
 17b:	78 27                	js     1a4 <stat+0x40>
 17d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 17f:	83 ec 08             	sub    $0x8,%esp
 182:	ff 75 0c             	pushl  0xc(%ebp)
 185:	50                   	push   %eax
 186:	e8 d6 00 00 00       	call   261 <fstat>
 18b:	89 c6                	mov    %eax,%esi
  close(fd);
 18d:	89 1c 24             	mov    %ebx,(%esp)
 190:	e8 9c 00 00 00       	call   231 <close>
  return r;
 195:	83 c4 10             	add    $0x10,%esp
}
 198:	89 f0                	mov    %esi,%eax
 19a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 19d:	5b                   	pop    %ebx
 19e:	5e                   	pop    %esi
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
 1a1:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1a4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1a9:	eb ed                	jmp    198 <stat+0x34>
 1ab:	90                   	nop

000001ac <atoi>:

int
atoi(const char *s)
{
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	53                   	push   %ebx
 1b0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1b3:	0f be 01             	movsbl (%ecx),%eax
 1b6:	8d 50 d0             	lea    -0x30(%eax),%edx
 1b9:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
 1bc:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1c1:	77 16                	ja     1d9 <atoi+0x2d>
 1c3:	90                   	nop
    n = n*10 + *s++ - '0';
 1c4:	41                   	inc    %ecx
 1c5:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1c8:	01 d2                	add    %edx,%edx
 1ca:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
 1ce:	0f be 01             	movsbl (%ecx),%eax
 1d1:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1d4:	80 fb 09             	cmp    $0x9,%bl
 1d7:	76 eb                	jbe    1c4 <atoi+0x18>
  return n;
}
 1d9:	89 d0                	mov    %edx,%eax
 1db:	5b                   	pop    %ebx
 1dc:	5d                   	pop    %ebp
 1dd:	c3                   	ret    
 1de:	66 90                	xchg   %ax,%ax

000001e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	8b 75 0c             	mov    0xc(%ebp),%esi
 1eb:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1ee:	85 d2                	test   %edx,%edx
 1f0:	7e 0b                	jle    1fd <memmove+0x1d>
 1f2:	01 c2                	add    %eax,%edx
  dst = vdst;
 1f4:	89 c7                	mov    %eax,%edi
 1f6:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 1f8:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 1f9:	39 fa                	cmp    %edi,%edx
 1fb:	75 fb                	jne    1f8 <memmove+0x18>
  return vdst;
}
 1fd:	5e                   	pop    %esi
 1fe:	5f                   	pop    %edi
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    

00000201 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 201:	b8 01 00 00 00       	mov    $0x1,%eax
 206:	cd 40                	int    $0x40
 208:	c3                   	ret    

00000209 <exit>:
SYSCALL(exit)
 209:	b8 02 00 00 00       	mov    $0x2,%eax
 20e:	cd 40                	int    $0x40
 210:	c3                   	ret    

00000211 <wait>:
SYSCALL(wait)
 211:	b8 03 00 00 00       	mov    $0x3,%eax
 216:	cd 40                	int    $0x40
 218:	c3                   	ret    

00000219 <pipe>:
SYSCALL(pipe)
 219:	b8 04 00 00 00       	mov    $0x4,%eax
 21e:	cd 40                	int    $0x40
 220:	c3                   	ret    

00000221 <read>:
SYSCALL(read)
 221:	b8 05 00 00 00       	mov    $0x5,%eax
 226:	cd 40                	int    $0x40
 228:	c3                   	ret    

00000229 <write>:
SYSCALL(write)
 229:	b8 10 00 00 00       	mov    $0x10,%eax
 22e:	cd 40                	int    $0x40
 230:	c3                   	ret    

00000231 <close>:
SYSCALL(close)
 231:	b8 15 00 00 00       	mov    $0x15,%eax
 236:	cd 40                	int    $0x40
 238:	c3                   	ret    

00000239 <kill>:
SYSCALL(kill)
 239:	b8 06 00 00 00       	mov    $0x6,%eax
 23e:	cd 40                	int    $0x40
 240:	c3                   	ret    

00000241 <exec>:
SYSCALL(exec)
 241:	b8 07 00 00 00       	mov    $0x7,%eax
 246:	cd 40                	int    $0x40
 248:	c3                   	ret    

00000249 <open>:
SYSCALL(open)
 249:	b8 0f 00 00 00       	mov    $0xf,%eax
 24e:	cd 40                	int    $0x40
 250:	c3                   	ret    

00000251 <mknod>:
SYSCALL(mknod)
 251:	b8 11 00 00 00       	mov    $0x11,%eax
 256:	cd 40                	int    $0x40
 258:	c3                   	ret    

00000259 <unlink>:
SYSCALL(unlink)
 259:	b8 12 00 00 00       	mov    $0x12,%eax
 25e:	cd 40                	int    $0x40
 260:	c3                   	ret    

00000261 <fstat>:
SYSCALL(fstat)
 261:	b8 08 00 00 00       	mov    $0x8,%eax
 266:	cd 40                	int    $0x40
 268:	c3                   	ret    

00000269 <link>:
SYSCALL(link)
 269:	b8 13 00 00 00       	mov    $0x13,%eax
 26e:	cd 40                	int    $0x40
 270:	c3                   	ret    

00000271 <mkdir>:
SYSCALL(mkdir)
 271:	b8 14 00 00 00       	mov    $0x14,%eax
 276:	cd 40                	int    $0x40
 278:	c3                   	ret    

00000279 <chdir>:
SYSCALL(chdir)
 279:	b8 09 00 00 00       	mov    $0x9,%eax
 27e:	cd 40                	int    $0x40
 280:	c3                   	ret    

00000281 <dup>:
SYSCALL(dup)
 281:	b8 0a 00 00 00       	mov    $0xa,%eax
 286:	cd 40                	int    $0x40
 288:	c3                   	ret    

00000289 <getpid>:
SYSCALL(getpid)
 289:	b8 0b 00 00 00       	mov    $0xb,%eax
 28e:	cd 40                	int    $0x40
 290:	c3                   	ret    

00000291 <sbrk>:
SYSCALL(sbrk)
 291:	b8 0c 00 00 00       	mov    $0xc,%eax
 296:	cd 40                	int    $0x40
 298:	c3                   	ret    

00000299 <sleep>:
SYSCALL(sleep)
 299:	b8 0d 00 00 00       	mov    $0xd,%eax
 29e:	cd 40                	int    $0x40
 2a0:	c3                   	ret    

000002a1 <uptime>:
SYSCALL(uptime)
 2a1:	b8 0e 00 00 00       	mov    $0xe,%eax
 2a6:	cd 40                	int    $0x40
 2a8:	c3                   	ret    

000002a9 <getreadcount>:
 2a9:	b8 16 00 00 00       	mov    $0x16,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    
 2b1:	66 90                	xchg   %ax,%ax
 2b3:	90                   	nop

000002b4 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	57                   	push   %edi
 2b8:	56                   	push   %esi
 2b9:	53                   	push   %ebx
 2ba:	83 ec 3c             	sub    $0x3c,%esp
 2bd:	89 45 bc             	mov    %eax,-0x44(%ebp)
 2c0:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 2c3:	89 d1                	mov    %edx,%ecx
  if(sgn && xx < 0){
 2c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 2c8:	85 db                	test   %ebx,%ebx
 2ca:	74 04                	je     2d0 <printint+0x1c>
 2cc:	85 d2                	test   %edx,%edx
 2ce:	78 68                	js     338 <printint+0x84>
  neg = 0;
 2d0:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 2d7:	31 ff                	xor    %edi,%edi
 2d9:	8d 75 d7             	lea    -0x29(%ebp),%esi
  do{
    buf[i++] = digits[x % base];
 2dc:	89 c8                	mov    %ecx,%eax
 2de:	31 d2                	xor    %edx,%edx
 2e0:	f7 75 c4             	divl   -0x3c(%ebp)
 2e3:	89 fb                	mov    %edi,%ebx
 2e5:	8d 7f 01             	lea    0x1(%edi),%edi
 2e8:	8a 92 64 06 00 00    	mov    0x664(%edx),%dl
 2ee:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
  }while((x /= base) != 0);
 2f2:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 2f5:	89 c1                	mov    %eax,%ecx
 2f7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 2fa:	3b 45 c0             	cmp    -0x40(%ebp),%eax
 2fd:	76 dd                	jbe    2dc <printint+0x28>
  if(neg)
 2ff:	8b 4d 08             	mov    0x8(%ebp),%ecx
 302:	85 c9                	test   %ecx,%ecx
 304:	74 09                	je     30f <printint+0x5b>
    buf[i++] = '-';
 306:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
 30b:	89 fb                	mov    %edi,%ebx
    buf[i++] = '-';
 30d:	b2 2d                	mov    $0x2d,%dl

  while(--i >= 0)
 30f:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 313:	8b 7d bc             	mov    -0x44(%ebp),%edi
 316:	eb 03                	jmp    31b <printint+0x67>
 318:	8a 13                	mov    (%ebx),%dl
 31a:	4b                   	dec    %ebx
    putc(fd, buf[i]);
 31b:	88 55 d7             	mov    %dl,-0x29(%ebp)
  write(fd, &c, 1);
 31e:	50                   	push   %eax
 31f:	6a 01                	push   $0x1
 321:	56                   	push   %esi
 322:	57                   	push   %edi
 323:	e8 01 ff ff ff       	call   229 <write>
  while(--i >= 0)
 328:	83 c4 10             	add    $0x10,%esp
 32b:	39 de                	cmp    %ebx,%esi
 32d:	75 e9                	jne    318 <printint+0x64>
}
 32f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 332:	5b                   	pop    %ebx
 333:	5e                   	pop    %esi
 334:	5f                   	pop    %edi
 335:	5d                   	pop    %ebp
 336:	c3                   	ret    
 337:	90                   	nop
    x = -xx;
 338:	f7 d9                	neg    %ecx
 33a:	eb 9b                	jmp    2d7 <printint+0x23>

0000033c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 33c:	55                   	push   %ebp
 33d:	89 e5                	mov    %esp,%ebp
 33f:	57                   	push   %edi
 340:	56                   	push   %esi
 341:	53                   	push   %ebx
 342:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 345:	8b 75 0c             	mov    0xc(%ebp),%esi
 348:	8a 1e                	mov    (%esi),%bl
 34a:	84 db                	test   %bl,%bl
 34c:	0f 84 a3 00 00 00    	je     3f5 <printf+0xb9>
 352:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 353:	8d 45 10             	lea    0x10(%ebp),%eax
 356:	89 45 d0             	mov    %eax,-0x30(%ebp)
  state = 0;
 359:	31 d2                	xor    %edx,%edx
  write(fd, &c, 1);
 35b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 35e:	eb 29                	jmp    389 <printf+0x4d>
 360:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 363:	83 f8 25             	cmp    $0x25,%eax
 366:	0f 84 94 00 00 00    	je     400 <printf+0xc4>
        state = '%';
      } else {
        putc(fd, c);
 36c:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 36f:	50                   	push   %eax
 370:	6a 01                	push   $0x1
 372:	57                   	push   %edi
 373:	ff 75 08             	pushl  0x8(%ebp)
 376:	e8 ae fe ff ff       	call   229 <write>
        putc(fd, c);
 37b:	83 c4 10             	add    $0x10,%esp
 37e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  for(i = 0; fmt[i]; i++){
 381:	46                   	inc    %esi
 382:	8a 5e ff             	mov    -0x1(%esi),%bl
 385:	84 db                	test   %bl,%bl
 387:	74 6c                	je     3f5 <printf+0xb9>
    c = fmt[i] & 0xff;
 389:	0f be cb             	movsbl %bl,%ecx
 38c:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 38f:	85 d2                	test   %edx,%edx
 391:	74 cd                	je     360 <printf+0x24>
      }
    } else if(state == '%'){
 393:	83 fa 25             	cmp    $0x25,%edx
 396:	75 e9                	jne    381 <printf+0x45>
      if(c == 'd'){
 398:	83 f8 64             	cmp    $0x64,%eax
 39b:	0f 84 97 00 00 00    	je     438 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 3a1:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 3a7:	83 f9 70             	cmp    $0x70,%ecx
 3aa:	74 60                	je     40c <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 3ac:	83 f8 73             	cmp    $0x73,%eax
 3af:	0f 84 8f 00 00 00    	je     444 <printf+0x108>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 3b5:	83 f8 63             	cmp    $0x63,%eax
 3b8:	0f 84 d6 00 00 00    	je     494 <printf+0x158>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 3be:	83 f8 25             	cmp    $0x25,%eax
 3c1:	0f 84 c1 00 00 00    	je     488 <printf+0x14c>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 3c7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 3cb:	50                   	push   %eax
 3cc:	6a 01                	push   $0x1
 3ce:	57                   	push   %edi
 3cf:	ff 75 08             	pushl  0x8(%ebp)
 3d2:	e8 52 fe ff ff       	call   229 <write>
        putc(fd, c);
 3d7:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 3da:	83 c4 0c             	add    $0xc,%esp
 3dd:	6a 01                	push   $0x1
 3df:	57                   	push   %edi
 3e0:	ff 75 08             	pushl  0x8(%ebp)
 3e3:	e8 41 fe ff ff       	call   229 <write>
        putc(fd, c);
 3e8:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 3eb:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 3ed:	46                   	inc    %esi
 3ee:	8a 5e ff             	mov    -0x1(%esi),%bl
 3f1:	84 db                	test   %bl,%bl
 3f3:	75 94                	jne    389 <printf+0x4d>
    }
  }
}
 3f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f8:	5b                   	pop    %ebx
 3f9:	5e                   	pop    %esi
 3fa:	5f                   	pop    %edi
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
        state = '%';
 400:	ba 25 00 00 00       	mov    $0x25,%edx
 405:	e9 77 ff ff ff       	jmp    381 <printf+0x45>
 40a:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 40c:	83 ec 0c             	sub    $0xc,%esp
 40f:	6a 00                	push   $0x0
 411:	b9 10 00 00 00       	mov    $0x10,%ecx
 416:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 419:	8b 13                	mov    (%ebx),%edx
 41b:	8b 45 08             	mov    0x8(%ebp),%eax
 41e:	e8 91 fe ff ff       	call   2b4 <printint>
        ap++;
 423:	89 d8                	mov    %ebx,%eax
 425:	83 c0 04             	add    $0x4,%eax
 428:	89 45 d0             	mov    %eax,-0x30(%ebp)
 42b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 42e:	31 d2                	xor    %edx,%edx
        ap++;
 430:	e9 4c ff ff ff       	jmp    381 <printf+0x45>
 435:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 438:	83 ec 0c             	sub    $0xc,%esp
 43b:	6a 01                	push   $0x1
 43d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 442:	eb d2                	jmp    416 <printf+0xda>
        s = (char*)*ap;
 444:	8b 45 d0             	mov    -0x30(%ebp),%eax
 447:	8b 18                	mov    (%eax),%ebx
        ap++;
 449:	83 c0 04             	add    $0x4,%eax
 44c:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 44f:	85 db                	test   %ebx,%ebx
 451:	74 65                	je     4b8 <printf+0x17c>
        while(*s != 0){
 453:	8a 03                	mov    (%ebx),%al
 455:	84 c0                	test   %al,%al
 457:	74 70                	je     4c9 <printf+0x18d>
 459:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 45c:	89 de                	mov    %ebx,%esi
 45e:	8b 5d 08             	mov    0x8(%ebp),%ebx
 461:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 464:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 467:	50                   	push   %eax
 468:	6a 01                	push   $0x1
 46a:	57                   	push   %edi
 46b:	53                   	push   %ebx
 46c:	e8 b8 fd ff ff       	call   229 <write>
          s++;
 471:	46                   	inc    %esi
        while(*s != 0){
 472:	8a 06                	mov    (%esi),%al
 474:	83 c4 10             	add    $0x10,%esp
 477:	84 c0                	test   %al,%al
 479:	75 e9                	jne    464 <printf+0x128>
 47b:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 47e:	31 d2                	xor    %edx,%edx
 480:	e9 fc fe ff ff       	jmp    381 <printf+0x45>
 485:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 488:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 48b:	52                   	push   %edx
 48c:	e9 4c ff ff ff       	jmp    3dd <printf+0xa1>
 491:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, *ap);
 494:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 497:	8b 03                	mov    (%ebx),%eax
 499:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 49c:	51                   	push   %ecx
 49d:	6a 01                	push   $0x1
 49f:	57                   	push   %edi
 4a0:	ff 75 08             	pushl  0x8(%ebp)
 4a3:	e8 81 fd ff ff       	call   229 <write>
        ap++;
 4a8:	83 c3 04             	add    $0x4,%ebx
 4ab:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4ae:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4b1:	31 d2                	xor    %edx,%edx
 4b3:	e9 c9 fe ff ff       	jmp    381 <printf+0x45>
          s = "(null)";
 4b8:	bb 5c 06 00 00       	mov    $0x65c,%ebx
        while(*s != 0){
 4bd:	b0 28                	mov    $0x28,%al
 4bf:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 4c2:	89 de                	mov    %ebx,%esi
 4c4:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4c7:	eb 9b                	jmp    464 <printf+0x128>
      state = 0;
 4c9:	31 d2                	xor    %edx,%edx
 4cb:	e9 b1 fe ff ff       	jmp    381 <printf+0x45>

000004d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 4d9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4dc:	a1 04 09 00 00       	mov    0x904,%eax
 4e1:	8b 10                	mov    (%eax),%edx
 4e3:	39 c8                	cmp    %ecx,%eax
 4e5:	73 11                	jae    4f8 <free+0x28>
 4e7:	90                   	nop
 4e8:	39 d1                	cmp    %edx,%ecx
 4ea:	72 14                	jb     500 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 4ec:	39 d0                	cmp    %edx,%eax
 4ee:	73 10                	jae    500 <free+0x30>
{
 4f0:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4f2:	8b 10                	mov    (%eax),%edx
 4f4:	39 c8                	cmp    %ecx,%eax
 4f6:	72 f0                	jb     4e8 <free+0x18>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 4f8:	39 d0                	cmp    %edx,%eax
 4fa:	72 f4                	jb     4f0 <free+0x20>
 4fc:	39 d1                	cmp    %edx,%ecx
 4fe:	73 f0                	jae    4f0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 500:	8b 73 fc             	mov    -0x4(%ebx),%esi
 503:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 506:	39 fa                	cmp    %edi,%edx
 508:	74 1a                	je     524 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 50a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 50d:	8b 50 04             	mov    0x4(%eax),%edx
 510:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 513:	39 f1                	cmp    %esi,%ecx
 515:	74 24                	je     53b <free+0x6b>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 517:	89 08                	mov    %ecx,(%eax)
  freep = p;
 519:	a3 04 09 00 00       	mov    %eax,0x904
}
 51e:	5b                   	pop    %ebx
 51f:	5e                   	pop    %esi
 520:	5f                   	pop    %edi
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    
 523:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 524:	03 72 04             	add    0x4(%edx),%esi
 527:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 52a:	8b 10                	mov    (%eax),%edx
 52c:	8b 12                	mov    (%edx),%edx
 52e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 531:	8b 50 04             	mov    0x4(%eax),%edx
 534:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 537:	39 f1                	cmp    %esi,%ecx
 539:	75 dc                	jne    517 <free+0x47>
    p->s.size += bp->s.size;
 53b:	03 53 fc             	add    -0x4(%ebx),%edx
 53e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 541:	8b 53 f8             	mov    -0x8(%ebx),%edx
 544:	89 10                	mov    %edx,(%eax)
  freep = p;
 546:	a3 04 09 00 00       	mov    %eax,0x904
}
 54b:	5b                   	pop    %ebx
 54c:	5e                   	pop    %esi
 54d:	5f                   	pop    %edi
 54e:	5d                   	pop    %ebp
 54f:	c3                   	ret    

00000550 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 559:	8b 45 08             	mov    0x8(%ebp),%eax
 55c:	8d 70 07             	lea    0x7(%eax),%esi
 55f:	c1 ee 03             	shr    $0x3,%esi
 562:	46                   	inc    %esi
  if((prevp = freep) == 0){
 563:	8b 3d 04 09 00 00    	mov    0x904,%edi
 569:	85 ff                	test   %edi,%edi
 56b:	0f 84 a3 00 00 00    	je     614 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 571:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 573:	8b 48 04             	mov    0x4(%eax),%ecx
 576:	39 f1                	cmp    %esi,%ecx
 578:	73 67                	jae    5e1 <malloc+0x91>
 57a:	89 f3                	mov    %esi,%ebx
 57c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 582:	0f 82 80 00 00 00    	jb     608 <malloc+0xb8>
  p = sbrk(nu * sizeof(Header));
 588:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 58f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 592:	eb 11                	jmp    5a5 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 594:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 596:	8b 4a 04             	mov    0x4(%edx),%ecx
 599:	39 f1                	cmp    %esi,%ecx
 59b:	73 4b                	jae    5e8 <malloc+0x98>
 59d:	8b 3d 04 09 00 00    	mov    0x904,%edi
 5a3:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 5a5:	39 c7                	cmp    %eax,%edi
 5a7:	75 eb                	jne    594 <malloc+0x44>
  p = sbrk(nu * sizeof(Header));
 5a9:	83 ec 0c             	sub    $0xc,%esp
 5ac:	ff 75 e4             	pushl  -0x1c(%ebp)
 5af:	e8 dd fc ff ff       	call   291 <sbrk>
  if(p == (char*)-1)
 5b4:	83 c4 10             	add    $0x10,%esp
 5b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ba:	74 1b                	je     5d7 <malloc+0x87>
  hp->s.size = nu;
 5bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5bf:	83 ec 0c             	sub    $0xc,%esp
 5c2:	83 c0 08             	add    $0x8,%eax
 5c5:	50                   	push   %eax
 5c6:	e8 05 ff ff ff       	call   4d0 <free>
  return freep;
 5cb:	a1 04 09 00 00       	mov    0x904,%eax
      if((p = morecore(nunits)) == 0)
 5d0:	83 c4 10             	add    $0x10,%esp
 5d3:	85 c0                	test   %eax,%eax
 5d5:	75 bd                	jne    594 <malloc+0x44>
        return 0;
 5d7:	31 c0                	xor    %eax,%eax
  }
}
 5d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5dc:	5b                   	pop    %ebx
 5dd:	5e                   	pop    %esi
 5de:	5f                   	pop    %edi
 5df:	5d                   	pop    %ebp
 5e0:	c3                   	ret    
    if(p->s.size >= nunits){
 5e1:	89 c2                	mov    %eax,%edx
 5e3:	89 f8                	mov    %edi,%eax
 5e5:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 5e8:	39 ce                	cmp    %ecx,%esi
 5ea:	74 54                	je     640 <malloc+0xf0>
        p->s.size -= nunits;
 5ec:	29 f1                	sub    %esi,%ecx
 5ee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 5f1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 5f4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 5f7:	a3 04 09 00 00       	mov    %eax,0x904
      return (void*)(p + 1);
 5fc:	8d 42 08             	lea    0x8(%edx),%eax
}
 5ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 602:	5b                   	pop    %ebx
 603:	5e                   	pop    %esi
 604:	5f                   	pop    %edi
 605:	5d                   	pop    %ebp
 606:	c3                   	ret    
 607:	90                   	nop
 608:	bb 00 10 00 00       	mov    $0x1000,%ebx
 60d:	e9 76 ff ff ff       	jmp    588 <malloc+0x38>
 612:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 614:	c7 05 04 09 00 00 08 	movl   $0x908,0x904
 61b:	09 00 00 
 61e:	c7 05 08 09 00 00 08 	movl   $0x908,0x908
 625:	09 00 00 
    base.s.size = 0;
 628:	c7 05 0c 09 00 00 00 	movl   $0x0,0x90c
 62f:	00 00 00 
 632:	bf 08 09 00 00       	mov    $0x908,%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 637:	89 f8                	mov    %edi,%eax
 639:	e9 3c ff ff ff       	jmp    57a <malloc+0x2a>
 63e:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 640:	8b 0a                	mov    (%edx),%ecx
 642:	89 08                	mov    %ecx,(%eax)
 644:	eb b1                	jmp    5f7 <malloc+0xa7>
