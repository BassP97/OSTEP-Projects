
_test_2:     file format elf32-i386


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
  17:	e8 a5 02 00 00       	call   2c1 <getreadcount>
  1c:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)

    int rc = fork();
  22:	e8 f2 01 00 00       	call   219 <fork>
  27:	89 c7                	mov    %eax,%edi
  29:	bb a0 86 01 00       	mov    $0x186a0,%ebx
  2e:	8d 75 84             	lea    -0x7c(%ebp),%esi
  31:	8d 76 00             	lea    0x0(%esi),%esi

    int total = 0;
    int i;
    for (i = 0; i < 100000; i++) {
	char buf[100];
	(void) read(4, buf, 1);
  34:	51                   	push   %ecx
  35:	6a 01                	push   $0x1
  37:	56                   	push   %esi
  38:	6a 04                	push   $0x4
  3a:	e8 fa 01 00 00       	call   239 <read>
    for (i = 0; i < 100000; i++) {
  3f:	83 c4 10             	add    $0x10,%esp
  42:	4b                   	dec    %ebx
  43:	75 ef                	jne    34 <main+0x34>
    }
    // https://wiki.osdev.org/Shutdown
    // (void) shutdown();

    if (rc > 0) {
  45:	85 ff                	test   %edi,%edi
  47:	7e 21                	jle    6a <main+0x6a>
	(void) wait();
  49:	e8 db 01 00 00       	call   229 <wait>
	int x2 = getreadcount();
  4e:	e8 6e 02 00 00       	call   2c1 <getreadcount>
	total += (x2 - x1);
	printf(1, "XV6_TEST_OUTPUT %d\n", total);
  53:	52                   	push   %edx
	total += (x2 - x1);
  54:	2b 85 74 ff ff ff    	sub    -0x8c(%ebp),%eax
	printf(1, "XV6_TEST_OUTPUT %d\n", total);
  5a:	50                   	push   %eax
  5b:	68 60 06 00 00       	push   $0x660
  60:	6a 01                	push   $0x1
  62:	e8 ed 02 00 00       	call   354 <printf>
  67:	83 c4 10             	add    $0x10,%esp
    }
    exit();
  6a:	e8 b2 01 00 00       	call   221 <exit>
  6f:	90                   	nop

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	53                   	push   %ebx
  74:	8b 4d 08             	mov    0x8(%ebp),%ecx
  77:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7a:	31 c0                	xor    %eax,%eax
  7c:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  7f:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  82:	40                   	inc    %eax
  83:	84 d2                	test   %dl,%dl
  85:	75 f5                	jne    7c <strcpy+0xc>
    ;
  return os;
}
  87:	89 c8                	mov    %ecx,%eax
  89:	5b                   	pop    %ebx
  8a:	5d                   	pop    %ebp
  8b:	c3                   	ret    

0000008c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	53                   	push   %ebx
  90:	8b 5d 08             	mov    0x8(%ebp),%ebx
  93:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  96:	0f b6 03             	movzbl (%ebx),%eax
  99:	0f b6 0a             	movzbl (%edx),%ecx
  9c:	84 c0                	test   %al,%al
  9e:	75 10                	jne    b0 <strcmp+0x24>
  a0:	eb 1a                	jmp    bc <strcmp+0x30>
  a2:	66 90                	xchg   %ax,%ax
    p++, q++;
  a4:	43                   	inc    %ebx
  a5:	42                   	inc    %edx
  while(*p && *p == *q)
  a6:	0f b6 03             	movzbl (%ebx),%eax
  a9:	0f b6 0a             	movzbl (%edx),%ecx
  ac:	84 c0                	test   %al,%al
  ae:	74 0c                	je     bc <strcmp+0x30>
  b0:	38 c8                	cmp    %cl,%al
  b2:	74 f0                	je     a4 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  b4:	29 c8                	sub    %ecx,%eax
}
  b6:	5b                   	pop    %ebx
  b7:	5d                   	pop    %ebp
  b8:	c3                   	ret    
  b9:	8d 76 00             	lea    0x0(%esi),%esi
  bc:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  be:	29 c8                	sub    %ecx,%eax
}
  c0:	5b                   	pop    %ebx
  c1:	5d                   	pop    %ebp
  c2:	c3                   	ret    
  c3:	90                   	nop

000000c4 <strlen>:

uint
strlen(const char *s)
{
  c4:	55                   	push   %ebp
  c5:	89 e5                	mov    %esp,%ebp
  c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  ca:	80 3a 00             	cmpb   $0x0,(%edx)
  cd:	74 15                	je     e4 <strlen+0x20>
  cf:	31 c0                	xor    %eax,%eax
  d1:	8d 76 00             	lea    0x0(%esi),%esi
  d4:	40                   	inc    %eax
  d5:	89 c1                	mov    %eax,%ecx
  d7:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  db:	75 f7                	jne    d4 <strlen+0x10>
    ;
  return n;
}
  dd:	89 c8                	mov    %ecx,%eax
  df:	5d                   	pop    %ebp
  e0:	c3                   	ret    
  e1:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
  e4:	31 c9                	xor    %ecx,%ecx
}
  e6:	89 c8                	mov    %ecx,%eax
  e8:	5d                   	pop    %ebp
  e9:	c3                   	ret    
  ea:	66 90                	xchg   %ax,%ax

000000ec <memset>:

void*
memset(void *dst, int c, uint n)
{
  ec:	55                   	push   %ebp
  ed:	89 e5                	mov    %esp,%ebp
  ef:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  f0:	8b 7d 08             	mov    0x8(%ebp),%edi
  f3:	8b 4d 10             	mov    0x10(%ebp),%ecx
  f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  f9:	fc                   	cld    
  fa:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  fc:	8b 45 08             	mov    0x8(%ebp),%eax
  ff:	5f                   	pop    %edi
 100:	5d                   	pop    %ebp
 101:	c3                   	ret    
 102:	66 90                	xchg   %ax,%ax

00000104 <strchr>:

char*
strchr(const char *s, char c)
{
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	8b 45 08             	mov    0x8(%ebp),%eax
 10a:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 10d:	8a 10                	mov    (%eax),%dl
 10f:	84 d2                	test   %dl,%dl
 111:	75 0c                	jne    11f <strchr+0x1b>
 113:	eb 13                	jmp    128 <strchr+0x24>
 115:	8d 76 00             	lea    0x0(%esi),%esi
 118:	40                   	inc    %eax
 119:	8a 10                	mov    (%eax),%dl
 11b:	84 d2                	test   %dl,%dl
 11d:	74 09                	je     128 <strchr+0x24>
    if(*s == c)
 11f:	38 d1                	cmp    %dl,%cl
 121:	75 f5                	jne    118 <strchr+0x14>
      return (char*)s;
  return 0;
}
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    
 125:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
 128:	31 c0                	xor    %eax,%eax
}
 12a:	5d                   	pop    %ebp
 12b:	c3                   	ret    

0000012c <gets>:

char*
gets(char *buf, int max)
{
 12c:	55                   	push   %ebp
 12d:	89 e5                	mov    %esp,%ebp
 12f:	57                   	push   %edi
 130:	56                   	push   %esi
 131:	53                   	push   %ebx
 132:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 135:	8b 75 08             	mov    0x8(%ebp),%esi
 138:	bb 01 00 00 00       	mov    $0x1,%ebx
 13d:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
 13f:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 142:	eb 20                	jmp    164 <gets+0x38>
    cc = read(0, &c, 1);
 144:	50                   	push   %eax
 145:	6a 01                	push   $0x1
 147:	57                   	push   %edi
 148:	6a 00                	push   $0x0
 14a:	e8 ea 00 00 00       	call   239 <read>
    if(cc < 1)
 14f:	83 c4 10             	add    $0x10,%esp
 152:	85 c0                	test   %eax,%eax
 154:	7e 16                	jle    16c <gets+0x40>
      break;
    buf[i++] = c;
 156:	8a 45 e7             	mov    -0x19(%ebp),%al
 159:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
 15b:	46                   	inc    %esi
 15c:	3c 0a                	cmp    $0xa,%al
 15e:	74 0c                	je     16c <gets+0x40>
 160:	3c 0d                	cmp    $0xd,%al
 162:	74 08                	je     16c <gets+0x40>
  for(i=0; i+1 < max; ){
 164:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 167:	39 45 0c             	cmp    %eax,0xc(%ebp)
 16a:	7f d8                	jg     144 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 16c:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
 16f:	8b 45 08             	mov    0x8(%ebp),%eax
 172:	8d 65 f4             	lea    -0xc(%ebp),%esp
 175:	5b                   	pop    %ebx
 176:	5e                   	pop    %esi
 177:	5f                   	pop    %edi
 178:	5d                   	pop    %ebp
 179:	c3                   	ret    
 17a:	66 90                	xchg   %ax,%ax

0000017c <stat>:

int
stat(const char *n, struct stat *st)
{
 17c:	55                   	push   %ebp
 17d:	89 e5                	mov    %esp,%ebp
 17f:	56                   	push   %esi
 180:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 181:	83 ec 08             	sub    $0x8,%esp
 184:	6a 00                	push   $0x0
 186:	ff 75 08             	pushl  0x8(%ebp)
 189:	e8 d3 00 00 00       	call   261 <open>
  if(fd < 0)
 18e:	83 c4 10             	add    $0x10,%esp
 191:	85 c0                	test   %eax,%eax
 193:	78 27                	js     1bc <stat+0x40>
 195:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 197:	83 ec 08             	sub    $0x8,%esp
 19a:	ff 75 0c             	pushl  0xc(%ebp)
 19d:	50                   	push   %eax
 19e:	e8 d6 00 00 00       	call   279 <fstat>
 1a3:	89 c6                	mov    %eax,%esi
  close(fd);
 1a5:	89 1c 24             	mov    %ebx,(%esp)
 1a8:	e8 9c 00 00 00       	call   249 <close>
  return r;
 1ad:	83 c4 10             	add    $0x10,%esp
}
 1b0:	89 f0                	mov    %esi,%eax
 1b2:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b5:	5b                   	pop    %ebx
 1b6:	5e                   	pop    %esi
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
 1b9:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1bc:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1c1:	eb ed                	jmp    1b0 <stat+0x34>
 1c3:	90                   	nop

000001c4 <atoi>:

int
atoi(const char *s)
{
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	53                   	push   %ebx
 1c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1cb:	0f be 01             	movsbl (%ecx),%eax
 1ce:	8d 50 d0             	lea    -0x30(%eax),%edx
 1d1:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
 1d4:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1d9:	77 16                	ja     1f1 <atoi+0x2d>
 1db:	90                   	nop
    n = n*10 + *s++ - '0';
 1dc:	41                   	inc    %ecx
 1dd:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1e0:	01 d2                	add    %edx,%edx
 1e2:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
 1e6:	0f be 01             	movsbl (%ecx),%eax
 1e9:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1ec:	80 fb 09             	cmp    $0x9,%bl
 1ef:	76 eb                	jbe    1dc <atoi+0x18>
  return n;
}
 1f1:	89 d0                	mov    %edx,%eax
 1f3:	5b                   	pop    %ebx
 1f4:	5d                   	pop    %ebp
 1f5:	c3                   	ret    
 1f6:	66 90                	xchg   %ax,%ax

000001f8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1f8:	55                   	push   %ebp
 1f9:	89 e5                	mov    %esp,%ebp
 1fb:	57                   	push   %edi
 1fc:	56                   	push   %esi
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	8b 75 0c             	mov    0xc(%ebp),%esi
 203:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 206:	85 d2                	test   %edx,%edx
 208:	7e 0b                	jle    215 <memmove+0x1d>
 20a:	01 c2                	add    %eax,%edx
  dst = vdst;
 20c:	89 c7                	mov    %eax,%edi
 20e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 210:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 211:	39 fa                	cmp    %edi,%edx
 213:	75 fb                	jne    210 <memmove+0x18>
  return vdst;
}
 215:	5e                   	pop    %esi
 216:	5f                   	pop    %edi
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    

00000219 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 219:	b8 01 00 00 00       	mov    $0x1,%eax
 21e:	cd 40                	int    $0x40
 220:	c3                   	ret    

00000221 <exit>:
SYSCALL(exit)
 221:	b8 02 00 00 00       	mov    $0x2,%eax
 226:	cd 40                	int    $0x40
 228:	c3                   	ret    

00000229 <wait>:
SYSCALL(wait)
 229:	b8 03 00 00 00       	mov    $0x3,%eax
 22e:	cd 40                	int    $0x40
 230:	c3                   	ret    

00000231 <pipe>:
SYSCALL(pipe)
 231:	b8 04 00 00 00       	mov    $0x4,%eax
 236:	cd 40                	int    $0x40
 238:	c3                   	ret    

00000239 <read>:
SYSCALL(read)
 239:	b8 05 00 00 00       	mov    $0x5,%eax
 23e:	cd 40                	int    $0x40
 240:	c3                   	ret    

00000241 <write>:
SYSCALL(write)
 241:	b8 10 00 00 00       	mov    $0x10,%eax
 246:	cd 40                	int    $0x40
 248:	c3                   	ret    

00000249 <close>:
SYSCALL(close)
 249:	b8 15 00 00 00       	mov    $0x15,%eax
 24e:	cd 40                	int    $0x40
 250:	c3                   	ret    

00000251 <kill>:
SYSCALL(kill)
 251:	b8 06 00 00 00       	mov    $0x6,%eax
 256:	cd 40                	int    $0x40
 258:	c3                   	ret    

00000259 <exec>:
SYSCALL(exec)
 259:	b8 07 00 00 00       	mov    $0x7,%eax
 25e:	cd 40                	int    $0x40
 260:	c3                   	ret    

00000261 <open>:
SYSCALL(open)
 261:	b8 0f 00 00 00       	mov    $0xf,%eax
 266:	cd 40                	int    $0x40
 268:	c3                   	ret    

00000269 <mknod>:
SYSCALL(mknod)
 269:	b8 11 00 00 00       	mov    $0x11,%eax
 26e:	cd 40                	int    $0x40
 270:	c3                   	ret    

00000271 <unlink>:
SYSCALL(unlink)
 271:	b8 12 00 00 00       	mov    $0x12,%eax
 276:	cd 40                	int    $0x40
 278:	c3                   	ret    

00000279 <fstat>:
SYSCALL(fstat)
 279:	b8 08 00 00 00       	mov    $0x8,%eax
 27e:	cd 40                	int    $0x40
 280:	c3                   	ret    

00000281 <link>:
SYSCALL(link)
 281:	b8 13 00 00 00       	mov    $0x13,%eax
 286:	cd 40                	int    $0x40
 288:	c3                   	ret    

00000289 <mkdir>:
SYSCALL(mkdir)
 289:	b8 14 00 00 00       	mov    $0x14,%eax
 28e:	cd 40                	int    $0x40
 290:	c3                   	ret    

00000291 <chdir>:
SYSCALL(chdir)
 291:	b8 09 00 00 00       	mov    $0x9,%eax
 296:	cd 40                	int    $0x40
 298:	c3                   	ret    

00000299 <dup>:
SYSCALL(dup)
 299:	b8 0a 00 00 00       	mov    $0xa,%eax
 29e:	cd 40                	int    $0x40
 2a0:	c3                   	ret    

000002a1 <getpid>:
SYSCALL(getpid)
 2a1:	b8 0b 00 00 00       	mov    $0xb,%eax
 2a6:	cd 40                	int    $0x40
 2a8:	c3                   	ret    

000002a9 <sbrk>:
SYSCALL(sbrk)
 2a9:	b8 0c 00 00 00       	mov    $0xc,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <sleep>:
SYSCALL(sleep)
 2b1:	b8 0d 00 00 00       	mov    $0xd,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <uptime>:
SYSCALL(uptime)
 2b9:	b8 0e 00 00 00       	mov    $0xe,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <getreadcount>:
 2c1:	b8 16 00 00 00       	mov    $0x16,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    
 2c9:	66 90                	xchg   %ax,%ax
 2cb:	90                   	nop

000002cc <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 2cc:	55                   	push   %ebp
 2cd:	89 e5                	mov    %esp,%ebp
 2cf:	57                   	push   %edi
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	83 ec 3c             	sub    $0x3c,%esp
 2d5:	89 45 bc             	mov    %eax,-0x44(%ebp)
 2d8:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 2db:	89 d1                	mov    %edx,%ecx
  if(sgn && xx < 0){
 2dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
 2e0:	85 db                	test   %ebx,%ebx
 2e2:	74 04                	je     2e8 <printint+0x1c>
 2e4:	85 d2                	test   %edx,%edx
 2e6:	78 68                	js     350 <printint+0x84>
  neg = 0;
 2e8:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 2ef:	31 ff                	xor    %edi,%edi
 2f1:	8d 75 d7             	lea    -0x29(%ebp),%esi
  do{
    buf[i++] = digits[x % base];
 2f4:	89 c8                	mov    %ecx,%eax
 2f6:	31 d2                	xor    %edx,%edx
 2f8:	f7 75 c4             	divl   -0x3c(%ebp)
 2fb:	89 fb                	mov    %edi,%ebx
 2fd:	8d 7f 01             	lea    0x1(%edi),%edi
 300:	8a 92 7c 06 00 00    	mov    0x67c(%edx),%dl
 306:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
  }while((x /= base) != 0);
 30a:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 30d:	89 c1                	mov    %eax,%ecx
 30f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 312:	3b 45 c0             	cmp    -0x40(%ebp),%eax
 315:	76 dd                	jbe    2f4 <printint+0x28>
  if(neg)
 317:	8b 4d 08             	mov    0x8(%ebp),%ecx
 31a:	85 c9                	test   %ecx,%ecx
 31c:	74 09                	je     327 <printint+0x5b>
    buf[i++] = '-';
 31e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
 323:	89 fb                	mov    %edi,%ebx
    buf[i++] = '-';
 325:	b2 2d                	mov    $0x2d,%dl

  while(--i >= 0)
 327:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 32b:	8b 7d bc             	mov    -0x44(%ebp),%edi
 32e:	eb 03                	jmp    333 <printint+0x67>
 330:	8a 13                	mov    (%ebx),%dl
 332:	4b                   	dec    %ebx
    putc(fd, buf[i]);
 333:	88 55 d7             	mov    %dl,-0x29(%ebp)
  write(fd, &c, 1);
 336:	50                   	push   %eax
 337:	6a 01                	push   $0x1
 339:	56                   	push   %esi
 33a:	57                   	push   %edi
 33b:	e8 01 ff ff ff       	call   241 <write>
  while(--i >= 0)
 340:	83 c4 10             	add    $0x10,%esp
 343:	39 de                	cmp    %ebx,%esi
 345:	75 e9                	jne    330 <printint+0x64>
}
 347:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34a:	5b                   	pop    %ebx
 34b:	5e                   	pop    %esi
 34c:	5f                   	pop    %edi
 34d:	5d                   	pop    %ebp
 34e:	c3                   	ret    
 34f:	90                   	nop
    x = -xx;
 350:	f7 d9                	neg    %ecx
 352:	eb 9b                	jmp    2ef <printint+0x23>

00000354 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	57                   	push   %edi
 358:	56                   	push   %esi
 359:	53                   	push   %ebx
 35a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 35d:	8b 75 0c             	mov    0xc(%ebp),%esi
 360:	8a 1e                	mov    (%esi),%bl
 362:	84 db                	test   %bl,%bl
 364:	0f 84 a3 00 00 00    	je     40d <printf+0xb9>
 36a:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 36b:	8d 45 10             	lea    0x10(%ebp),%eax
 36e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  state = 0;
 371:	31 d2                	xor    %edx,%edx
  write(fd, &c, 1);
 373:	8d 7d e7             	lea    -0x19(%ebp),%edi
 376:	eb 29                	jmp    3a1 <printf+0x4d>
 378:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 37b:	83 f8 25             	cmp    $0x25,%eax
 37e:	0f 84 94 00 00 00    	je     418 <printf+0xc4>
        state = '%';
      } else {
        putc(fd, c);
 384:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 387:	50                   	push   %eax
 388:	6a 01                	push   $0x1
 38a:	57                   	push   %edi
 38b:	ff 75 08             	pushl  0x8(%ebp)
 38e:	e8 ae fe ff ff       	call   241 <write>
        putc(fd, c);
 393:	83 c4 10             	add    $0x10,%esp
 396:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  for(i = 0; fmt[i]; i++){
 399:	46                   	inc    %esi
 39a:	8a 5e ff             	mov    -0x1(%esi),%bl
 39d:	84 db                	test   %bl,%bl
 39f:	74 6c                	je     40d <printf+0xb9>
    c = fmt[i] & 0xff;
 3a1:	0f be cb             	movsbl %bl,%ecx
 3a4:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 3a7:	85 d2                	test   %edx,%edx
 3a9:	74 cd                	je     378 <printf+0x24>
      }
    } else if(state == '%'){
 3ab:	83 fa 25             	cmp    $0x25,%edx
 3ae:	75 e9                	jne    399 <printf+0x45>
      if(c == 'd'){
 3b0:	83 f8 64             	cmp    $0x64,%eax
 3b3:	0f 84 97 00 00 00    	je     450 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 3b9:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 3bf:	83 f9 70             	cmp    $0x70,%ecx
 3c2:	74 60                	je     424 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 3c4:	83 f8 73             	cmp    $0x73,%eax
 3c7:	0f 84 8f 00 00 00    	je     45c <printf+0x108>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 3cd:	83 f8 63             	cmp    $0x63,%eax
 3d0:	0f 84 d6 00 00 00    	je     4ac <printf+0x158>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 3d6:	83 f8 25             	cmp    $0x25,%eax
 3d9:	0f 84 c1 00 00 00    	je     4a0 <printf+0x14c>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 3df:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 3e3:	50                   	push   %eax
 3e4:	6a 01                	push   $0x1
 3e6:	57                   	push   %edi
 3e7:	ff 75 08             	pushl  0x8(%ebp)
 3ea:	e8 52 fe ff ff       	call   241 <write>
        putc(fd, c);
 3ef:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 3f2:	83 c4 0c             	add    $0xc,%esp
 3f5:	6a 01                	push   $0x1
 3f7:	57                   	push   %edi
 3f8:	ff 75 08             	pushl  0x8(%ebp)
 3fb:	e8 41 fe ff ff       	call   241 <write>
        putc(fd, c);
 400:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 403:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 405:	46                   	inc    %esi
 406:	8a 5e ff             	mov    -0x1(%esi),%bl
 409:	84 db                	test   %bl,%bl
 40b:	75 94                	jne    3a1 <printf+0x4d>
    }
  }
}
 40d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 410:	5b                   	pop    %ebx
 411:	5e                   	pop    %esi
 412:	5f                   	pop    %edi
 413:	5d                   	pop    %ebp
 414:	c3                   	ret    
 415:	8d 76 00             	lea    0x0(%esi),%esi
        state = '%';
 418:	ba 25 00 00 00       	mov    $0x25,%edx
 41d:	e9 77 ff ff ff       	jmp    399 <printf+0x45>
 422:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 424:	83 ec 0c             	sub    $0xc,%esp
 427:	6a 00                	push   $0x0
 429:	b9 10 00 00 00       	mov    $0x10,%ecx
 42e:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 431:	8b 13                	mov    (%ebx),%edx
 433:	8b 45 08             	mov    0x8(%ebp),%eax
 436:	e8 91 fe ff ff       	call   2cc <printint>
        ap++;
 43b:	89 d8                	mov    %ebx,%eax
 43d:	83 c0 04             	add    $0x4,%eax
 440:	89 45 d0             	mov    %eax,-0x30(%ebp)
 443:	83 c4 10             	add    $0x10,%esp
      state = 0;
 446:	31 d2                	xor    %edx,%edx
        ap++;
 448:	e9 4c ff ff ff       	jmp    399 <printf+0x45>
 44d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 450:	83 ec 0c             	sub    $0xc,%esp
 453:	6a 01                	push   $0x1
 455:	b9 0a 00 00 00       	mov    $0xa,%ecx
 45a:	eb d2                	jmp    42e <printf+0xda>
        s = (char*)*ap;
 45c:	8b 45 d0             	mov    -0x30(%ebp),%eax
 45f:	8b 18                	mov    (%eax),%ebx
        ap++;
 461:	83 c0 04             	add    $0x4,%eax
 464:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 467:	85 db                	test   %ebx,%ebx
 469:	74 65                	je     4d0 <printf+0x17c>
        while(*s != 0){
 46b:	8a 03                	mov    (%ebx),%al
 46d:	84 c0                	test   %al,%al
 46f:	74 70                	je     4e1 <printf+0x18d>
 471:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 474:	89 de                	mov    %ebx,%esi
 476:	8b 5d 08             	mov    0x8(%ebp),%ebx
 479:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 47c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 47f:	50                   	push   %eax
 480:	6a 01                	push   $0x1
 482:	57                   	push   %edi
 483:	53                   	push   %ebx
 484:	e8 b8 fd ff ff       	call   241 <write>
          s++;
 489:	46                   	inc    %esi
        while(*s != 0){
 48a:	8a 06                	mov    (%esi),%al
 48c:	83 c4 10             	add    $0x10,%esp
 48f:	84 c0                	test   %al,%al
 491:	75 e9                	jne    47c <printf+0x128>
 493:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 496:	31 d2                	xor    %edx,%edx
 498:	e9 fc fe ff ff       	jmp    399 <printf+0x45>
 49d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 4a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 4a3:	52                   	push   %edx
 4a4:	e9 4c ff ff ff       	jmp    3f5 <printf+0xa1>
 4a9:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, *ap);
 4ac:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4af:	8b 03                	mov    (%ebx),%eax
 4b1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 4b4:	51                   	push   %ecx
 4b5:	6a 01                	push   $0x1
 4b7:	57                   	push   %edi
 4b8:	ff 75 08             	pushl  0x8(%ebp)
 4bb:	e8 81 fd ff ff       	call   241 <write>
        ap++;
 4c0:	83 c3 04             	add    $0x4,%ebx
 4c3:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4c9:	31 d2                	xor    %edx,%edx
 4cb:	e9 c9 fe ff ff       	jmp    399 <printf+0x45>
          s = "(null)";
 4d0:	bb 74 06 00 00       	mov    $0x674,%ebx
        while(*s != 0){
 4d5:	b0 28                	mov    $0x28,%al
 4d7:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 4da:	89 de                	mov    %ebx,%esi
 4dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4df:	eb 9b                	jmp    47c <printf+0x128>
      state = 0;
 4e1:	31 d2                	xor    %edx,%edx
 4e3:	e9 b1 fe ff ff       	jmp    399 <printf+0x45>

000004e8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 4e8:	55                   	push   %ebp
 4e9:	89 e5                	mov    %esp,%ebp
 4eb:	57                   	push   %edi
 4ec:	56                   	push   %esi
 4ed:	53                   	push   %ebx
 4ee:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 4f1:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4f4:	a1 20 09 00 00       	mov    0x920,%eax
 4f9:	8b 10                	mov    (%eax),%edx
 4fb:	39 c8                	cmp    %ecx,%eax
 4fd:	73 11                	jae    510 <free+0x28>
 4ff:	90                   	nop
 500:	39 d1                	cmp    %edx,%ecx
 502:	72 14                	jb     518 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 504:	39 d0                	cmp    %edx,%eax
 506:	73 10                	jae    518 <free+0x30>
{
 508:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 50a:	8b 10                	mov    (%eax),%edx
 50c:	39 c8                	cmp    %ecx,%eax
 50e:	72 f0                	jb     500 <free+0x18>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 510:	39 d0                	cmp    %edx,%eax
 512:	72 f4                	jb     508 <free+0x20>
 514:	39 d1                	cmp    %edx,%ecx
 516:	73 f0                	jae    508 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 518:	8b 73 fc             	mov    -0x4(%ebx),%esi
 51b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 51e:	39 fa                	cmp    %edi,%edx
 520:	74 1a                	je     53c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 522:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 525:	8b 50 04             	mov    0x4(%eax),%edx
 528:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 52b:	39 f1                	cmp    %esi,%ecx
 52d:	74 24                	je     553 <free+0x6b>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 52f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 531:	a3 20 09 00 00       	mov    %eax,0x920
}
 536:	5b                   	pop    %ebx
 537:	5e                   	pop    %esi
 538:	5f                   	pop    %edi
 539:	5d                   	pop    %ebp
 53a:	c3                   	ret    
 53b:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 53c:	03 72 04             	add    0x4(%edx),%esi
 53f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 542:	8b 10                	mov    (%eax),%edx
 544:	8b 12                	mov    (%edx),%edx
 546:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 549:	8b 50 04             	mov    0x4(%eax),%edx
 54c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 54f:	39 f1                	cmp    %esi,%ecx
 551:	75 dc                	jne    52f <free+0x47>
    p->s.size += bp->s.size;
 553:	03 53 fc             	add    -0x4(%ebx),%edx
 556:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 559:	8b 53 f8             	mov    -0x8(%ebx),%edx
 55c:	89 10                	mov    %edx,(%eax)
  freep = p;
 55e:	a3 20 09 00 00       	mov    %eax,0x920
}
 563:	5b                   	pop    %ebx
 564:	5e                   	pop    %esi
 565:	5f                   	pop    %edi
 566:	5d                   	pop    %ebp
 567:	c3                   	ret    

00000568 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 568:	55                   	push   %ebp
 569:	89 e5                	mov    %esp,%ebp
 56b:	57                   	push   %edi
 56c:	56                   	push   %esi
 56d:	53                   	push   %ebx
 56e:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 571:	8b 45 08             	mov    0x8(%ebp),%eax
 574:	8d 70 07             	lea    0x7(%eax),%esi
 577:	c1 ee 03             	shr    $0x3,%esi
 57a:	46                   	inc    %esi
  if((prevp = freep) == 0){
 57b:	8b 3d 20 09 00 00    	mov    0x920,%edi
 581:	85 ff                	test   %edi,%edi
 583:	0f 84 a3 00 00 00    	je     62c <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 589:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 58b:	8b 48 04             	mov    0x4(%eax),%ecx
 58e:	39 f1                	cmp    %esi,%ecx
 590:	73 67                	jae    5f9 <malloc+0x91>
 592:	89 f3                	mov    %esi,%ebx
 594:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 59a:	0f 82 80 00 00 00    	jb     620 <malloc+0xb8>
  p = sbrk(nu * sizeof(Header));
 5a0:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 5a7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 5aa:	eb 11                	jmp    5bd <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5ac:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 5ae:	8b 4a 04             	mov    0x4(%edx),%ecx
 5b1:	39 f1                	cmp    %esi,%ecx
 5b3:	73 4b                	jae    600 <malloc+0x98>
 5b5:	8b 3d 20 09 00 00    	mov    0x920,%edi
 5bb:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 5bd:	39 c7                	cmp    %eax,%edi
 5bf:	75 eb                	jne    5ac <malloc+0x44>
  p = sbrk(nu * sizeof(Header));
 5c1:	83 ec 0c             	sub    $0xc,%esp
 5c4:	ff 75 e4             	pushl  -0x1c(%ebp)
 5c7:	e8 dd fc ff ff       	call   2a9 <sbrk>
  if(p == (char*)-1)
 5cc:	83 c4 10             	add    $0x10,%esp
 5cf:	83 f8 ff             	cmp    $0xffffffff,%eax
 5d2:	74 1b                	je     5ef <malloc+0x87>
  hp->s.size = nu;
 5d4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5d7:	83 ec 0c             	sub    $0xc,%esp
 5da:	83 c0 08             	add    $0x8,%eax
 5dd:	50                   	push   %eax
 5de:	e8 05 ff ff ff       	call   4e8 <free>
  return freep;
 5e3:	a1 20 09 00 00       	mov    0x920,%eax
      if((p = morecore(nunits)) == 0)
 5e8:	83 c4 10             	add    $0x10,%esp
 5eb:	85 c0                	test   %eax,%eax
 5ed:	75 bd                	jne    5ac <malloc+0x44>
        return 0;
 5ef:	31 c0                	xor    %eax,%eax
  }
}
 5f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5f4:	5b                   	pop    %ebx
 5f5:	5e                   	pop    %esi
 5f6:	5f                   	pop    %edi
 5f7:	5d                   	pop    %ebp
 5f8:	c3                   	ret    
    if(p->s.size >= nunits){
 5f9:	89 c2                	mov    %eax,%edx
 5fb:	89 f8                	mov    %edi,%eax
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 600:	39 ce                	cmp    %ecx,%esi
 602:	74 54                	je     658 <malloc+0xf0>
        p->s.size -= nunits;
 604:	29 f1                	sub    %esi,%ecx
 606:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 609:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 60c:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 60f:	a3 20 09 00 00       	mov    %eax,0x920
      return (void*)(p + 1);
 614:	8d 42 08             	lea    0x8(%edx),%eax
}
 617:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61a:	5b                   	pop    %ebx
 61b:	5e                   	pop    %esi
 61c:	5f                   	pop    %edi
 61d:	5d                   	pop    %ebp
 61e:	c3                   	ret    
 61f:	90                   	nop
 620:	bb 00 10 00 00       	mov    $0x1000,%ebx
 625:	e9 76 ff ff ff       	jmp    5a0 <malloc+0x38>
 62a:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 62c:	c7 05 20 09 00 00 24 	movl   $0x924,0x920
 633:	09 00 00 
 636:	c7 05 24 09 00 00 24 	movl   $0x924,0x924
 63d:	09 00 00 
    base.s.size = 0;
 640:	c7 05 28 09 00 00 00 	movl   $0x0,0x928
 647:	00 00 00 
 64a:	bf 24 09 00 00       	mov    $0x924,%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 64f:	89 f8                	mov    %edi,%eax
 651:	e9 3c ff ff ff       	jmp    592 <malloc+0x2a>
 656:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 658:	8b 0a                	mov    (%edx),%ecx
 65a:	89 08                	mov    %ecx,(%eax)
 65c:	eb b1                	jmp    60f <malloc+0xa7>
