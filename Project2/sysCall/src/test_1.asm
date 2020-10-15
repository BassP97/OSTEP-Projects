
_test_1:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec 88 00 00 00    	sub    $0x88,%esp
  int x1 = getreadcount();
  17:	e8 c1 02 00 00       	call   2dd <getreadcount>
  1c:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
  int x2 = getreadcount();
  22:	e8 b6 02 00 00       	call   2dd <getreadcount>
  27:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
  char buf[100];
  (void) read(4, buf, 1);
  2d:	52                   	push   %edx
  2e:	6a 01                	push   $0x1
  30:	8d 75 84             	lea    -0x7c(%ebp),%esi
  33:	56                   	push   %esi
  34:	6a 04                	push   $0x4
  36:	e8 1a 02 00 00       	call   255 <read>
  int x3 = getreadcount();
  3b:	e8 9d 02 00 00       	call   2dd <getreadcount>
  40:	89 c7                	mov    %eax,%edi
  42:	83 c4 10             	add    $0x10,%esp
  45:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  4a:	66 90                	xchg   %ax,%ax
  int i;
  for (i = 0; i < 1000; i++) {
    (void) read(4, buf, 1);
  4c:	50                   	push   %eax
  4d:	6a 01                	push   $0x1
  4f:	56                   	push   %esi
  50:	6a 04                	push   $0x4
  52:	e8 fe 01 00 00       	call   255 <read>
  for (i = 0; i < 1000; i++) {
  57:	83 c4 10             	add    $0x10,%esp
  5a:	4b                   	dec    %ebx
  5b:	75 ef                	jne    4c <main+0x4c>
  }
  int x4 = getreadcount();
  5d:	e8 7b 02 00 00       	call   2dd <getreadcount>
  printf(1, "XV6_TEST_OUTPUT %d %d %d\n", x2-x1, x3-x2, x4-x3);
  62:	83 ec 0c             	sub    $0xc,%esp
  65:	29 f8                	sub    %edi,%eax
  67:	50                   	push   %eax
  68:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
  6e:	29 c7                	sub    %eax,%edi
  70:	57                   	push   %edi
  71:	2b 85 74 ff ff ff    	sub    -0x8c(%ebp),%eax
  77:	50                   	push   %eax
  78:	68 7c 06 00 00       	push   $0x67c
  7d:	6a 01                	push   $0x1
  7f:	e8 ec 02 00 00       	call   370 <printf>
  exit();
  84:	83 c4 20             	add    $0x20,%esp
  87:	e8 b1 01 00 00       	call   23d <exit>

0000008c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	53                   	push   %ebx
  90:	8b 4d 08             	mov    0x8(%ebp),%ecx
  93:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  96:	31 c0                	xor    %eax,%eax
  98:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  9b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  9e:	40                   	inc    %eax
  9f:	84 d2                	test   %dl,%dl
  a1:	75 f5                	jne    98 <strcpy+0xc>
    ;
  return os;
}
  a3:	89 c8                	mov    %ecx,%eax
  a5:	5b                   	pop    %ebx
  a6:	5d                   	pop    %ebp
  a7:	c3                   	ret    

000000a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a8:	55                   	push   %ebp
  a9:	89 e5                	mov    %esp,%ebp
  ab:	53                   	push   %ebx
  ac:	8b 5d 08             	mov    0x8(%ebp),%ebx
  af:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  b2:	0f b6 03             	movzbl (%ebx),%eax
  b5:	0f b6 0a             	movzbl (%edx),%ecx
  b8:	84 c0                	test   %al,%al
  ba:	75 10                	jne    cc <strcmp+0x24>
  bc:	eb 1a                	jmp    d8 <strcmp+0x30>
  be:	66 90                	xchg   %ax,%ax
    p++, q++;
  c0:	43                   	inc    %ebx
  c1:	42                   	inc    %edx
  while(*p && *p == *q)
  c2:	0f b6 03             	movzbl (%ebx),%eax
  c5:	0f b6 0a             	movzbl (%edx),%ecx
  c8:	84 c0                	test   %al,%al
  ca:	74 0c                	je     d8 <strcmp+0x30>
  cc:	38 c8                	cmp    %cl,%al
  ce:	74 f0                	je     c0 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  d0:	29 c8                	sub    %ecx,%eax
}
  d2:	5b                   	pop    %ebx
  d3:	5d                   	pop    %ebp
  d4:	c3                   	ret    
  d5:	8d 76 00             	lea    0x0(%esi),%esi
  d8:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  da:	29 c8                	sub    %ecx,%eax
}
  dc:	5b                   	pop    %ebx
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret    
  df:	90                   	nop

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  e6:	80 3a 00             	cmpb   $0x0,(%edx)
  e9:	74 15                	je     100 <strlen+0x20>
  eb:	31 c0                	xor    %eax,%eax
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	40                   	inc    %eax
  f1:	89 c1                	mov    %eax,%ecx
  f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  f7:	75 f7                	jne    f0 <strlen+0x10>
    ;
  return n;
}
  f9:	89 c8                	mov    %ecx,%eax
  fb:	5d                   	pop    %ebp
  fc:	c3                   	ret    
  fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 100:	31 c9                	xor    %ecx,%ecx
}
 102:	89 c8                	mov    %ecx,%eax
 104:	5d                   	pop    %ebp
 105:	c3                   	ret    
 106:	66 90                	xchg   %ax,%ax

00000108 <memset>:

void*
memset(void *dst, int c, uint n)
{
 108:	55                   	push   %ebp
 109:	89 e5                	mov    %esp,%ebp
 10b:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
 10f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 112:	8b 45 0c             	mov    0xc(%ebp),%eax
 115:	fc                   	cld    
 116:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 118:	8b 45 08             	mov    0x8(%ebp),%eax
 11b:	5f                   	pop    %edi
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    
 11e:	66 90                	xchg   %ax,%ax

00000120 <strchr>:

char*
strchr(const char *s, char c)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 129:	8a 10                	mov    (%eax),%dl
 12b:	84 d2                	test   %dl,%dl
 12d:	75 0c                	jne    13b <strchr+0x1b>
 12f:	eb 13                	jmp    144 <strchr+0x24>
 131:	8d 76 00             	lea    0x0(%esi),%esi
 134:	40                   	inc    %eax
 135:	8a 10                	mov    (%eax),%dl
 137:	84 d2                	test   %dl,%dl
 139:	74 09                	je     144 <strchr+0x24>
    if(*s == c)
 13b:	38 d1                	cmp    %dl,%cl
 13d:	75 f5                	jne    134 <strchr+0x14>
      return (char*)s;
  return 0;
}
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    
 141:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
 144:	31 c0                	xor    %eax,%eax
}
 146:	5d                   	pop    %ebp
 147:	c3                   	ret    

00000148 <gets>:

char*
gets(char *buf, int max)
{
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	57                   	push   %edi
 14c:	56                   	push   %esi
 14d:	53                   	push   %ebx
 14e:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 151:	8b 75 08             	mov    0x8(%ebp),%esi
 154:	bb 01 00 00 00       	mov    $0x1,%ebx
 159:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
 15b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 15e:	eb 20                	jmp    180 <gets+0x38>
    cc = read(0, &c, 1);
 160:	50                   	push   %eax
 161:	6a 01                	push   $0x1
 163:	57                   	push   %edi
 164:	6a 00                	push   $0x0
 166:	e8 ea 00 00 00       	call   255 <read>
    if(cc < 1)
 16b:	83 c4 10             	add    $0x10,%esp
 16e:	85 c0                	test   %eax,%eax
 170:	7e 16                	jle    188 <gets+0x40>
      break;
    buf[i++] = c;
 172:	8a 45 e7             	mov    -0x19(%ebp),%al
 175:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
 177:	46                   	inc    %esi
 178:	3c 0a                	cmp    $0xa,%al
 17a:	74 0c                	je     188 <gets+0x40>
 17c:	3c 0d                	cmp    $0xd,%al
 17e:	74 08                	je     188 <gets+0x40>
  for(i=0; i+1 < max; ){
 180:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 183:	39 45 0c             	cmp    %eax,0xc(%ebp)
 186:	7f d8                	jg     160 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 188:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 191:	5b                   	pop    %ebx
 192:	5e                   	pop    %esi
 193:	5f                   	pop    %edi
 194:	5d                   	pop    %ebp
 195:	c3                   	ret    
 196:	66 90                	xchg   %ax,%ax

00000198 <stat>:

int
stat(const char *n, struct stat *st)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	56                   	push   %esi
 19c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 19d:	83 ec 08             	sub    $0x8,%esp
 1a0:	6a 00                	push   $0x0
 1a2:	ff 75 08             	pushl  0x8(%ebp)
 1a5:	e8 d3 00 00 00       	call   27d <open>
  if(fd < 0)
 1aa:	83 c4 10             	add    $0x10,%esp
 1ad:	85 c0                	test   %eax,%eax
 1af:	78 27                	js     1d8 <stat+0x40>
 1b1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1b3:	83 ec 08             	sub    $0x8,%esp
 1b6:	ff 75 0c             	pushl  0xc(%ebp)
 1b9:	50                   	push   %eax
 1ba:	e8 d6 00 00 00       	call   295 <fstat>
 1bf:	89 c6                	mov    %eax,%esi
  close(fd);
 1c1:	89 1c 24             	mov    %ebx,(%esp)
 1c4:	e8 9c 00 00 00       	call   265 <close>
  return r;
 1c9:	83 c4 10             	add    $0x10,%esp
}
 1cc:	89 f0                	mov    %esi,%eax
 1ce:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1d1:	5b                   	pop    %ebx
 1d2:	5e                   	pop    %esi
 1d3:	5d                   	pop    %ebp
 1d4:	c3                   	ret    
 1d5:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1d8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1dd:	eb ed                	jmp    1cc <stat+0x34>
 1df:	90                   	nop

000001e0 <atoi>:

int
atoi(const char *s)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1e7:	0f be 01             	movsbl (%ecx),%eax
 1ea:	8d 50 d0             	lea    -0x30(%eax),%edx
 1ed:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
 1f0:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1f5:	77 16                	ja     20d <atoi+0x2d>
 1f7:	90                   	nop
    n = n*10 + *s++ - '0';
 1f8:	41                   	inc    %ecx
 1f9:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1fc:	01 d2                	add    %edx,%edx
 1fe:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
 202:	0f be 01             	movsbl (%ecx),%eax
 205:	8d 58 d0             	lea    -0x30(%eax),%ebx
 208:	80 fb 09             	cmp    $0x9,%bl
 20b:	76 eb                	jbe    1f8 <atoi+0x18>
  return n;
}
 20d:	89 d0                	mov    %edx,%eax
 20f:	5b                   	pop    %ebx
 210:	5d                   	pop    %ebp
 211:	c3                   	ret    
 212:	66 90                	xchg   %ax,%ax

00000214 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	57                   	push   %edi
 218:	56                   	push   %esi
 219:	8b 45 08             	mov    0x8(%ebp),%eax
 21c:	8b 75 0c             	mov    0xc(%ebp),%esi
 21f:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 222:	85 d2                	test   %edx,%edx
 224:	7e 0b                	jle    231 <memmove+0x1d>
 226:	01 c2                	add    %eax,%edx
  dst = vdst;
 228:	89 c7                	mov    %eax,%edi
 22a:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 22c:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 22d:	39 fa                	cmp    %edi,%edx
 22f:	75 fb                	jne    22c <memmove+0x18>
  return vdst;
}
 231:	5e                   	pop    %esi
 232:	5f                   	pop    %edi
 233:	5d                   	pop    %ebp
 234:	c3                   	ret    

00000235 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 235:	b8 01 00 00 00       	mov    $0x1,%eax
 23a:	cd 40                	int    $0x40
 23c:	c3                   	ret    

0000023d <exit>:
SYSCALL(exit)
 23d:	b8 02 00 00 00       	mov    $0x2,%eax
 242:	cd 40                	int    $0x40
 244:	c3                   	ret    

00000245 <wait>:
SYSCALL(wait)
 245:	b8 03 00 00 00       	mov    $0x3,%eax
 24a:	cd 40                	int    $0x40
 24c:	c3                   	ret    

0000024d <pipe>:
SYSCALL(pipe)
 24d:	b8 04 00 00 00       	mov    $0x4,%eax
 252:	cd 40                	int    $0x40
 254:	c3                   	ret    

00000255 <read>:
SYSCALL(read)
 255:	b8 05 00 00 00       	mov    $0x5,%eax
 25a:	cd 40                	int    $0x40
 25c:	c3                   	ret    

0000025d <write>:
SYSCALL(write)
 25d:	b8 10 00 00 00       	mov    $0x10,%eax
 262:	cd 40                	int    $0x40
 264:	c3                   	ret    

00000265 <close>:
SYSCALL(close)
 265:	b8 15 00 00 00       	mov    $0x15,%eax
 26a:	cd 40                	int    $0x40
 26c:	c3                   	ret    

0000026d <kill>:
SYSCALL(kill)
 26d:	b8 06 00 00 00       	mov    $0x6,%eax
 272:	cd 40                	int    $0x40
 274:	c3                   	ret    

00000275 <exec>:
SYSCALL(exec)
 275:	b8 07 00 00 00       	mov    $0x7,%eax
 27a:	cd 40                	int    $0x40
 27c:	c3                   	ret    

0000027d <open>:
SYSCALL(open)
 27d:	b8 0f 00 00 00       	mov    $0xf,%eax
 282:	cd 40                	int    $0x40
 284:	c3                   	ret    

00000285 <mknod>:
SYSCALL(mknod)
 285:	b8 11 00 00 00       	mov    $0x11,%eax
 28a:	cd 40                	int    $0x40
 28c:	c3                   	ret    

0000028d <unlink>:
SYSCALL(unlink)
 28d:	b8 12 00 00 00       	mov    $0x12,%eax
 292:	cd 40                	int    $0x40
 294:	c3                   	ret    

00000295 <fstat>:
SYSCALL(fstat)
 295:	b8 08 00 00 00       	mov    $0x8,%eax
 29a:	cd 40                	int    $0x40
 29c:	c3                   	ret    

0000029d <link>:
SYSCALL(link)
 29d:	b8 13 00 00 00       	mov    $0x13,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <mkdir>:
SYSCALL(mkdir)
 2a5:	b8 14 00 00 00       	mov    $0x14,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <chdir>:
SYSCALL(chdir)
 2ad:	b8 09 00 00 00       	mov    $0x9,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <dup>:
SYSCALL(dup)
 2b5:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <getpid>:
SYSCALL(getpid)
 2bd:	b8 0b 00 00 00       	mov    $0xb,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <sbrk>:
SYSCALL(sbrk)
 2c5:	b8 0c 00 00 00       	mov    $0xc,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <sleep>:
SYSCALL(sleep)
 2cd:	b8 0d 00 00 00       	mov    $0xd,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <uptime>:
SYSCALL(uptime)
 2d5:	b8 0e 00 00 00       	mov    $0xe,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <getreadcount>:
 2dd:	b8 16 00 00 00       	mov    $0x16,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    
 2e5:	66 90                	xchg   %ax,%ax
 2e7:	90                   	nop

000002e8 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 2e8:	55                   	push   %ebp
 2e9:	89 e5                	mov    %esp,%ebp
 2eb:	57                   	push   %edi
 2ec:	56                   	push   %esi
 2ed:	53                   	push   %ebx
 2ee:	83 ec 3c             	sub    $0x3c,%esp
 2f1:	89 45 bc             	mov    %eax,-0x44(%ebp)
 2f4:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 2f7:	89 d1                	mov    %edx,%ecx
  if(sgn && xx < 0){
 2f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 2fc:	85 db                	test   %ebx,%ebx
 2fe:	74 04                	je     304 <printint+0x1c>
 300:	85 d2                	test   %edx,%edx
 302:	78 68                	js     36c <printint+0x84>
  neg = 0;
 304:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 30b:	31 ff                	xor    %edi,%edi
 30d:	8d 75 d7             	lea    -0x29(%ebp),%esi
  do{
    buf[i++] = digits[x % base];
 310:	89 c8                	mov    %ecx,%eax
 312:	31 d2                	xor    %edx,%edx
 314:	f7 75 c4             	divl   -0x3c(%ebp)
 317:	89 fb                	mov    %edi,%ebx
 319:	8d 7f 01             	lea    0x1(%edi),%edi
 31c:	8a 92 a0 06 00 00    	mov    0x6a0(%edx),%dl
 322:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
  }while((x /= base) != 0);
 326:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 329:	89 c1                	mov    %eax,%ecx
 32b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 32e:	3b 45 c0             	cmp    -0x40(%ebp),%eax
 331:	76 dd                	jbe    310 <printint+0x28>
  if(neg)
 333:	8b 4d 08             	mov    0x8(%ebp),%ecx
 336:	85 c9                	test   %ecx,%ecx
 338:	74 09                	je     343 <printint+0x5b>
    buf[i++] = '-';
 33a:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
 33f:	89 fb                	mov    %edi,%ebx
    buf[i++] = '-';
 341:	b2 2d                	mov    $0x2d,%dl

  while(--i >= 0)
 343:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 347:	8b 7d bc             	mov    -0x44(%ebp),%edi
 34a:	eb 03                	jmp    34f <printint+0x67>
 34c:	8a 13                	mov    (%ebx),%dl
 34e:	4b                   	dec    %ebx
    putc(fd, buf[i]);
 34f:	88 55 d7             	mov    %dl,-0x29(%ebp)
  write(fd, &c, 1);
 352:	50                   	push   %eax
 353:	6a 01                	push   $0x1
 355:	56                   	push   %esi
 356:	57                   	push   %edi
 357:	e8 01 ff ff ff       	call   25d <write>
  while(--i >= 0)
 35c:	83 c4 10             	add    $0x10,%esp
 35f:	39 de                	cmp    %ebx,%esi
 361:	75 e9                	jne    34c <printint+0x64>
}
 363:	8d 65 f4             	lea    -0xc(%ebp),%esp
 366:	5b                   	pop    %ebx
 367:	5e                   	pop    %esi
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	90                   	nop
    x = -xx;
 36c:	f7 d9                	neg    %ecx
 36e:	eb 9b                	jmp    30b <printint+0x23>

00000370 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 379:	8b 75 0c             	mov    0xc(%ebp),%esi
 37c:	8a 1e                	mov    (%esi),%bl
 37e:	84 db                	test   %bl,%bl
 380:	0f 84 a3 00 00 00    	je     429 <printf+0xb9>
 386:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 387:	8d 45 10             	lea    0x10(%ebp),%eax
 38a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  state = 0;
 38d:	31 d2                	xor    %edx,%edx
  write(fd, &c, 1);
 38f:	8d 7d e7             	lea    -0x19(%ebp),%edi
 392:	eb 29                	jmp    3bd <printf+0x4d>
 394:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 397:	83 f8 25             	cmp    $0x25,%eax
 39a:	0f 84 94 00 00 00    	je     434 <printf+0xc4>
        state = '%';
      } else {
        putc(fd, c);
 3a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 3a3:	50                   	push   %eax
 3a4:	6a 01                	push   $0x1
 3a6:	57                   	push   %edi
 3a7:	ff 75 08             	pushl  0x8(%ebp)
 3aa:	e8 ae fe ff ff       	call   25d <write>
        putc(fd, c);
 3af:	83 c4 10             	add    $0x10,%esp
 3b2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  for(i = 0; fmt[i]; i++){
 3b5:	46                   	inc    %esi
 3b6:	8a 5e ff             	mov    -0x1(%esi),%bl
 3b9:	84 db                	test   %bl,%bl
 3bb:	74 6c                	je     429 <printf+0xb9>
    c = fmt[i] & 0xff;
 3bd:	0f be cb             	movsbl %bl,%ecx
 3c0:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 3c3:	85 d2                	test   %edx,%edx
 3c5:	74 cd                	je     394 <printf+0x24>
      }
    } else if(state == '%'){
 3c7:	83 fa 25             	cmp    $0x25,%edx
 3ca:	75 e9                	jne    3b5 <printf+0x45>
      if(c == 'd'){
 3cc:	83 f8 64             	cmp    $0x64,%eax
 3cf:	0f 84 97 00 00 00    	je     46c <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 3d5:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 3db:	83 f9 70             	cmp    $0x70,%ecx
 3de:	74 60                	je     440 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 3e0:	83 f8 73             	cmp    $0x73,%eax
 3e3:	0f 84 8f 00 00 00    	je     478 <printf+0x108>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 3e9:	83 f8 63             	cmp    $0x63,%eax
 3ec:	0f 84 d6 00 00 00    	je     4c8 <printf+0x158>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 3f2:	83 f8 25             	cmp    $0x25,%eax
 3f5:	0f 84 c1 00 00 00    	je     4bc <printf+0x14c>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 3fb:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 3ff:	50                   	push   %eax
 400:	6a 01                	push   $0x1
 402:	57                   	push   %edi
 403:	ff 75 08             	pushl  0x8(%ebp)
 406:	e8 52 fe ff ff       	call   25d <write>
        putc(fd, c);
 40b:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 40e:	83 c4 0c             	add    $0xc,%esp
 411:	6a 01                	push   $0x1
 413:	57                   	push   %edi
 414:	ff 75 08             	pushl  0x8(%ebp)
 417:	e8 41 fe ff ff       	call   25d <write>
        putc(fd, c);
 41c:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 41f:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 421:	46                   	inc    %esi
 422:	8a 5e ff             	mov    -0x1(%esi),%bl
 425:	84 db                	test   %bl,%bl
 427:	75 94                	jne    3bd <printf+0x4d>
    }
  }
}
 429:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42c:	5b                   	pop    %ebx
 42d:	5e                   	pop    %esi
 42e:	5f                   	pop    %edi
 42f:	5d                   	pop    %ebp
 430:	c3                   	ret    
 431:	8d 76 00             	lea    0x0(%esi),%esi
        state = '%';
 434:	ba 25 00 00 00       	mov    $0x25,%edx
 439:	e9 77 ff ff ff       	jmp    3b5 <printf+0x45>
 43e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 440:	83 ec 0c             	sub    $0xc,%esp
 443:	6a 00                	push   $0x0
 445:	b9 10 00 00 00       	mov    $0x10,%ecx
 44a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 44d:	8b 13                	mov    (%ebx),%edx
 44f:	8b 45 08             	mov    0x8(%ebp),%eax
 452:	e8 91 fe ff ff       	call   2e8 <printint>
        ap++;
 457:	89 d8                	mov    %ebx,%eax
 459:	83 c0 04             	add    $0x4,%eax
 45c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 45f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 462:	31 d2                	xor    %edx,%edx
        ap++;
 464:	e9 4c ff ff ff       	jmp    3b5 <printf+0x45>
 469:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 46c:	83 ec 0c             	sub    $0xc,%esp
 46f:	6a 01                	push   $0x1
 471:	b9 0a 00 00 00       	mov    $0xa,%ecx
 476:	eb d2                	jmp    44a <printf+0xda>
        s = (char*)*ap;
 478:	8b 45 d0             	mov    -0x30(%ebp),%eax
 47b:	8b 18                	mov    (%eax),%ebx
        ap++;
 47d:	83 c0 04             	add    $0x4,%eax
 480:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 483:	85 db                	test   %ebx,%ebx
 485:	74 65                	je     4ec <printf+0x17c>
        while(*s != 0){
 487:	8a 03                	mov    (%ebx),%al
 489:	84 c0                	test   %al,%al
 48b:	74 70                	je     4fd <printf+0x18d>
 48d:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 490:	89 de                	mov    %ebx,%esi
 492:	8b 5d 08             	mov    0x8(%ebp),%ebx
 495:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 498:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 49b:	50                   	push   %eax
 49c:	6a 01                	push   $0x1
 49e:	57                   	push   %edi
 49f:	53                   	push   %ebx
 4a0:	e8 b8 fd ff ff       	call   25d <write>
          s++;
 4a5:	46                   	inc    %esi
        while(*s != 0){
 4a6:	8a 06                	mov    (%esi),%al
 4a8:	83 c4 10             	add    $0x10,%esp
 4ab:	84 c0                	test   %al,%al
 4ad:	75 e9                	jne    498 <printf+0x128>
 4af:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 4b2:	31 d2                	xor    %edx,%edx
 4b4:	e9 fc fe ff ff       	jmp    3b5 <printf+0x45>
 4b9:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 4bc:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 4bf:	52                   	push   %edx
 4c0:	e9 4c ff ff ff       	jmp    411 <printf+0xa1>
 4c5:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, *ap);
 4c8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4cb:	8b 03                	mov    (%ebx),%eax
 4cd:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 4d0:	51                   	push   %ecx
 4d1:	6a 01                	push   $0x1
 4d3:	57                   	push   %edi
 4d4:	ff 75 08             	pushl  0x8(%ebp)
 4d7:	e8 81 fd ff ff       	call   25d <write>
        ap++;
 4dc:	83 c3 04             	add    $0x4,%ebx
 4df:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4e2:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4e5:	31 d2                	xor    %edx,%edx
 4e7:	e9 c9 fe ff ff       	jmp    3b5 <printf+0x45>
          s = "(null)";
 4ec:	bb 96 06 00 00       	mov    $0x696,%ebx
        while(*s != 0){
 4f1:	b0 28                	mov    $0x28,%al
 4f3:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 4f6:	89 de                	mov    %ebx,%esi
 4f8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4fb:	eb 9b                	jmp    498 <printf+0x128>
      state = 0;
 4fd:	31 d2                	xor    %edx,%edx
 4ff:	e9 b1 fe ff ff       	jmp    3b5 <printf+0x45>

00000504 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	57                   	push   %edi
 508:	56                   	push   %esi
 509:	53                   	push   %ebx
 50a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 50d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 510:	a1 44 09 00 00       	mov    0x944,%eax
 515:	8b 10                	mov    (%eax),%edx
 517:	39 c8                	cmp    %ecx,%eax
 519:	73 11                	jae    52c <free+0x28>
 51b:	90                   	nop
 51c:	39 d1                	cmp    %edx,%ecx
 51e:	72 14                	jb     534 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 520:	39 d0                	cmp    %edx,%eax
 522:	73 10                	jae    534 <free+0x30>
{
 524:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 526:	8b 10                	mov    (%eax),%edx
 528:	39 c8                	cmp    %ecx,%eax
 52a:	72 f0                	jb     51c <free+0x18>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 52c:	39 d0                	cmp    %edx,%eax
 52e:	72 f4                	jb     524 <free+0x20>
 530:	39 d1                	cmp    %edx,%ecx
 532:	73 f0                	jae    524 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 534:	8b 73 fc             	mov    -0x4(%ebx),%esi
 537:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 53a:	39 fa                	cmp    %edi,%edx
 53c:	74 1a                	je     558 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 53e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 541:	8b 50 04             	mov    0x4(%eax),%edx
 544:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 547:	39 f1                	cmp    %esi,%ecx
 549:	74 24                	je     56f <free+0x6b>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 54b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 54d:	a3 44 09 00 00       	mov    %eax,0x944
}
 552:	5b                   	pop    %ebx
 553:	5e                   	pop    %esi
 554:	5f                   	pop    %edi
 555:	5d                   	pop    %ebp
 556:	c3                   	ret    
 557:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 558:	03 72 04             	add    0x4(%edx),%esi
 55b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 55e:	8b 10                	mov    (%eax),%edx
 560:	8b 12                	mov    (%edx),%edx
 562:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 565:	8b 50 04             	mov    0x4(%eax),%edx
 568:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 56b:	39 f1                	cmp    %esi,%ecx
 56d:	75 dc                	jne    54b <free+0x47>
    p->s.size += bp->s.size;
 56f:	03 53 fc             	add    -0x4(%ebx),%edx
 572:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 575:	8b 53 f8             	mov    -0x8(%ebx),%edx
 578:	89 10                	mov    %edx,(%eax)
  freep = p;
 57a:	a3 44 09 00 00       	mov    %eax,0x944
}
 57f:	5b                   	pop    %ebx
 580:	5e                   	pop    %esi
 581:	5f                   	pop    %edi
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    

00000584 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 584:	55                   	push   %ebp
 585:	89 e5                	mov    %esp,%ebp
 587:	57                   	push   %edi
 588:	56                   	push   %esi
 589:	53                   	push   %ebx
 58a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 58d:	8b 45 08             	mov    0x8(%ebp),%eax
 590:	8d 70 07             	lea    0x7(%eax),%esi
 593:	c1 ee 03             	shr    $0x3,%esi
 596:	46                   	inc    %esi
  if((prevp = freep) == 0){
 597:	8b 3d 44 09 00 00    	mov    0x944,%edi
 59d:	85 ff                	test   %edi,%edi
 59f:	0f 84 a3 00 00 00    	je     648 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5a5:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 5a7:	8b 48 04             	mov    0x4(%eax),%ecx
 5aa:	39 f1                	cmp    %esi,%ecx
 5ac:	73 67                	jae    615 <malloc+0x91>
 5ae:	89 f3                	mov    %esi,%ebx
 5b0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 5b6:	0f 82 80 00 00 00    	jb     63c <malloc+0xb8>
  p = sbrk(nu * sizeof(Header));
 5bc:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 5c3:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 5c6:	eb 11                	jmp    5d9 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5c8:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 5ca:	8b 4a 04             	mov    0x4(%edx),%ecx
 5cd:	39 f1                	cmp    %esi,%ecx
 5cf:	73 4b                	jae    61c <malloc+0x98>
 5d1:	8b 3d 44 09 00 00    	mov    0x944,%edi
 5d7:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 5d9:	39 c7                	cmp    %eax,%edi
 5db:	75 eb                	jne    5c8 <malloc+0x44>
  p = sbrk(nu * sizeof(Header));
 5dd:	83 ec 0c             	sub    $0xc,%esp
 5e0:	ff 75 e4             	pushl  -0x1c(%ebp)
 5e3:	e8 dd fc ff ff       	call   2c5 <sbrk>
  if(p == (char*)-1)
 5e8:	83 c4 10             	add    $0x10,%esp
 5eb:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ee:	74 1b                	je     60b <malloc+0x87>
  hp->s.size = nu;
 5f0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5f3:	83 ec 0c             	sub    $0xc,%esp
 5f6:	83 c0 08             	add    $0x8,%eax
 5f9:	50                   	push   %eax
 5fa:	e8 05 ff ff ff       	call   504 <free>
  return freep;
 5ff:	a1 44 09 00 00       	mov    0x944,%eax
      if((p = morecore(nunits)) == 0)
 604:	83 c4 10             	add    $0x10,%esp
 607:	85 c0                	test   %eax,%eax
 609:	75 bd                	jne    5c8 <malloc+0x44>
        return 0;
 60b:	31 c0                	xor    %eax,%eax
  }
}
 60d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 610:	5b                   	pop    %ebx
 611:	5e                   	pop    %esi
 612:	5f                   	pop    %edi
 613:	5d                   	pop    %ebp
 614:	c3                   	ret    
    if(p->s.size >= nunits){
 615:	89 c2                	mov    %eax,%edx
 617:	89 f8                	mov    %edi,%eax
 619:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 61c:	39 ce                	cmp    %ecx,%esi
 61e:	74 54                	je     674 <malloc+0xf0>
        p->s.size -= nunits;
 620:	29 f1                	sub    %esi,%ecx
 622:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 625:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 628:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 62b:	a3 44 09 00 00       	mov    %eax,0x944
      return (void*)(p + 1);
 630:	8d 42 08             	lea    0x8(%edx),%eax
}
 633:	8d 65 f4             	lea    -0xc(%ebp),%esp
 636:	5b                   	pop    %ebx
 637:	5e                   	pop    %esi
 638:	5f                   	pop    %edi
 639:	5d                   	pop    %ebp
 63a:	c3                   	ret    
 63b:	90                   	nop
 63c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 641:	e9 76 ff ff ff       	jmp    5bc <malloc+0x38>
 646:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 648:	c7 05 44 09 00 00 48 	movl   $0x948,0x944
 64f:	09 00 00 
 652:	c7 05 48 09 00 00 48 	movl   $0x948,0x948
 659:	09 00 00 
    base.s.size = 0;
 65c:	c7 05 4c 09 00 00 00 	movl   $0x0,0x94c
 663:	00 00 00 
 666:	bf 48 09 00 00       	mov    $0x948,%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 66b:	89 f8                	mov    %edi,%eax
 66d:	e9 3c ff ff ff       	jmp    5ae <malloc+0x2a>
 672:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 674:	8b 0a                	mov    (%edx),%ecx
 676:	89 08                	mov    %ecx,(%eax)
 678:	eb b1                	jmp    62b <malloc+0xa7>
