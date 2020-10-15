
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	50                   	push   %eax
  if(fork() > 0)
   f:	e8 c1 01 00 00       	call   1d5 <fork>
  14:	85 c0                	test   %eax,%eax
  16:	7e 0d                	jle    25 <main+0x25>
    sleep(5);  // Let child exit before parent.
  18:	83 ec 0c             	sub    $0xc,%esp
  1b:	6a 05                	push   $0x5
  1d:	e8 4b 02 00 00       	call   26d <sleep>
  22:	83 c4 10             	add    $0x10,%esp
  exit();
  25:	e8 b3 01 00 00       	call   1dd <exit>
  2a:	66 90                	xchg   %ax,%ax

0000002c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  2c:	55                   	push   %ebp
  2d:	89 e5                	mov    %esp,%ebp
  2f:	53                   	push   %ebx
  30:	8b 4d 08             	mov    0x8(%ebp),%ecx
  33:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  36:	31 c0                	xor    %eax,%eax
  38:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  3b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  3e:	40                   	inc    %eax
  3f:	84 d2                	test   %dl,%dl
  41:	75 f5                	jne    38 <strcpy+0xc>
    ;
  return os;
}
  43:	89 c8                	mov    %ecx,%eax
  45:	5b                   	pop    %ebx
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	53                   	push   %ebx
  4c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  4f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  52:	0f b6 03             	movzbl (%ebx),%eax
  55:	0f b6 0a             	movzbl (%edx),%ecx
  58:	84 c0                	test   %al,%al
  5a:	75 10                	jne    6c <strcmp+0x24>
  5c:	eb 1a                	jmp    78 <strcmp+0x30>
  5e:	66 90                	xchg   %ax,%ax
    p++, q++;
  60:	43                   	inc    %ebx
  61:	42                   	inc    %edx
  while(*p && *p == *q)
  62:	0f b6 03             	movzbl (%ebx),%eax
  65:	0f b6 0a             	movzbl (%edx),%ecx
  68:	84 c0                	test   %al,%al
  6a:	74 0c                	je     78 <strcmp+0x30>
  6c:	38 c8                	cmp    %cl,%al
  6e:	74 f0                	je     60 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  70:	29 c8                	sub    %ecx,%eax
}
  72:	5b                   	pop    %ebx
  73:	5d                   	pop    %ebp
  74:	c3                   	ret    
  75:	8d 76 00             	lea    0x0(%esi),%esi
  78:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  7a:	29 c8                	sub    %ecx,%eax
}
  7c:	5b                   	pop    %ebx
  7d:	5d                   	pop    %ebp
  7e:	c3                   	ret    
  7f:	90                   	nop

00000080 <strlen>:

uint
strlen(const char *s)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  86:	80 3a 00             	cmpb   $0x0,(%edx)
  89:	74 15                	je     a0 <strlen+0x20>
  8b:	31 c0                	xor    %eax,%eax
  8d:	8d 76 00             	lea    0x0(%esi),%esi
  90:	40                   	inc    %eax
  91:	89 c1                	mov    %eax,%ecx
  93:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  97:	75 f7                	jne    90 <strlen+0x10>
    ;
  return n;
}
  99:	89 c8                	mov    %ecx,%eax
  9b:	5d                   	pop    %ebp
  9c:	c3                   	ret    
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
  a0:	31 c9                	xor    %ecx,%ecx
}
  a2:	89 c8                	mov    %ecx,%eax
  a4:	5d                   	pop    %ebp
  a5:	c3                   	ret    
  a6:	66 90                	xchg   %ax,%ax

000000a8 <memset>:

void*
memset(void *dst, int c, uint n)
{
  a8:	55                   	push   %ebp
  a9:	89 e5                	mov    %esp,%ebp
  ab:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  ac:	8b 7d 08             	mov    0x8(%ebp),%edi
  af:	8b 4d 10             	mov    0x10(%ebp),%ecx
  b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  b5:	fc                   	cld    
  b6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  b8:	8b 45 08             	mov    0x8(%ebp),%eax
  bb:	5f                   	pop    %edi
  bc:	5d                   	pop    %ebp
  bd:	c3                   	ret    
  be:	66 90                	xchg   %ax,%ax

000000c0 <strchr>:

char*
strchr(const char *s, char c)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 45 08             	mov    0x8(%ebp),%eax
  c6:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
  c9:	8a 10                	mov    (%eax),%dl
  cb:	84 d2                	test   %dl,%dl
  cd:	75 0c                	jne    db <strchr+0x1b>
  cf:	eb 13                	jmp    e4 <strchr+0x24>
  d1:	8d 76 00             	lea    0x0(%esi),%esi
  d4:	40                   	inc    %eax
  d5:	8a 10                	mov    (%eax),%dl
  d7:	84 d2                	test   %dl,%dl
  d9:	74 09                	je     e4 <strchr+0x24>
    if(*s == c)
  db:	38 d1                	cmp    %dl,%cl
  dd:	75 f5                	jne    d4 <strchr+0x14>
      return (char*)s;
  return 0;
}
  df:	5d                   	pop    %ebp
  e0:	c3                   	ret    
  e1:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
  e4:	31 c0                	xor    %eax,%eax
}
  e6:	5d                   	pop    %ebp
  e7:	c3                   	ret    

000000e8 <gets>:

char*
gets(char *buf, int max)
{
  e8:	55                   	push   %ebp
  e9:	89 e5                	mov    %esp,%ebp
  eb:	57                   	push   %edi
  ec:	56                   	push   %esi
  ed:	53                   	push   %ebx
  ee:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  f1:	8b 75 08             	mov    0x8(%ebp),%esi
  f4:	bb 01 00 00 00       	mov    $0x1,%ebx
  f9:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
  fb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
  fe:	eb 20                	jmp    120 <gets+0x38>
    cc = read(0, &c, 1);
 100:	50                   	push   %eax
 101:	6a 01                	push   $0x1
 103:	57                   	push   %edi
 104:	6a 00                	push   $0x0
 106:	e8 ea 00 00 00       	call   1f5 <read>
    if(cc < 1)
 10b:	83 c4 10             	add    $0x10,%esp
 10e:	85 c0                	test   %eax,%eax
 110:	7e 16                	jle    128 <gets+0x40>
      break;
    buf[i++] = c;
 112:	8a 45 e7             	mov    -0x19(%ebp),%al
 115:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
 117:	46                   	inc    %esi
 118:	3c 0a                	cmp    $0xa,%al
 11a:	74 0c                	je     128 <gets+0x40>
 11c:	3c 0d                	cmp    $0xd,%al
 11e:	74 08                	je     128 <gets+0x40>
  for(i=0; i+1 < max; ){
 120:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 123:	39 45 0c             	cmp    %eax,0xc(%ebp)
 126:	7f d8                	jg     100 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 128:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
 12b:	8b 45 08             	mov    0x8(%ebp),%eax
 12e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 131:	5b                   	pop    %ebx
 132:	5e                   	pop    %esi
 133:	5f                   	pop    %edi
 134:	5d                   	pop    %ebp
 135:	c3                   	ret    
 136:	66 90                	xchg   %ax,%ax

00000138 <stat>:

int
stat(const char *n, struct stat *st)
{
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	56                   	push   %esi
 13c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 13d:	83 ec 08             	sub    $0x8,%esp
 140:	6a 00                	push   $0x0
 142:	ff 75 08             	pushl  0x8(%ebp)
 145:	e8 d3 00 00 00       	call   21d <open>
  if(fd < 0)
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	85 c0                	test   %eax,%eax
 14f:	78 27                	js     178 <stat+0x40>
 151:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 153:	83 ec 08             	sub    $0x8,%esp
 156:	ff 75 0c             	pushl  0xc(%ebp)
 159:	50                   	push   %eax
 15a:	e8 d6 00 00 00       	call   235 <fstat>
 15f:	89 c6                	mov    %eax,%esi
  close(fd);
 161:	89 1c 24             	mov    %ebx,(%esp)
 164:	e8 9c 00 00 00       	call   205 <close>
  return r;
 169:	83 c4 10             	add    $0x10,%esp
}
 16c:	89 f0                	mov    %esi,%eax
 16e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 171:	5b                   	pop    %ebx
 172:	5e                   	pop    %esi
 173:	5d                   	pop    %ebp
 174:	c3                   	ret    
 175:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 178:	be ff ff ff ff       	mov    $0xffffffff,%esi
 17d:	eb ed                	jmp    16c <stat+0x34>
 17f:	90                   	nop

00000180 <atoi>:

int
atoi(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 187:	0f be 01             	movsbl (%ecx),%eax
 18a:	8d 50 d0             	lea    -0x30(%eax),%edx
 18d:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
 190:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 195:	77 16                	ja     1ad <atoi+0x2d>
 197:	90                   	nop
    n = n*10 + *s++ - '0';
 198:	41                   	inc    %ecx
 199:	8d 14 92             	lea    (%edx,%edx,4),%edx
 19c:	01 d2                	add    %edx,%edx
 19e:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
 1a2:	0f be 01             	movsbl (%ecx),%eax
 1a5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1a8:	80 fb 09             	cmp    $0x9,%bl
 1ab:	76 eb                	jbe    198 <atoi+0x18>
  return n;
}
 1ad:	89 d0                	mov    %edx,%eax
 1af:	5b                   	pop    %ebx
 1b0:	5d                   	pop    %ebp
 1b1:	c3                   	ret    
 1b2:	66 90                	xchg   %ax,%ax

000001b4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	57                   	push   %edi
 1b8:	56                   	push   %esi
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	8b 75 0c             	mov    0xc(%ebp),%esi
 1bf:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1c2:	85 d2                	test   %edx,%edx
 1c4:	7e 0b                	jle    1d1 <memmove+0x1d>
 1c6:	01 c2                	add    %eax,%edx
  dst = vdst;
 1c8:	89 c7                	mov    %eax,%edi
 1ca:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 1cc:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 1cd:	39 fa                	cmp    %edi,%edx
 1cf:	75 fb                	jne    1cc <memmove+0x18>
  return vdst;
}
 1d1:	5e                   	pop    %esi
 1d2:	5f                   	pop    %edi
 1d3:	5d                   	pop    %ebp
 1d4:	c3                   	ret    

000001d5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 1d5:	b8 01 00 00 00       	mov    $0x1,%eax
 1da:	cd 40                	int    $0x40
 1dc:	c3                   	ret    

000001dd <exit>:
SYSCALL(exit)
 1dd:	b8 02 00 00 00       	mov    $0x2,%eax
 1e2:	cd 40                	int    $0x40
 1e4:	c3                   	ret    

000001e5 <wait>:
SYSCALL(wait)
 1e5:	b8 03 00 00 00       	mov    $0x3,%eax
 1ea:	cd 40                	int    $0x40
 1ec:	c3                   	ret    

000001ed <pipe>:
SYSCALL(pipe)
 1ed:	b8 04 00 00 00       	mov    $0x4,%eax
 1f2:	cd 40                	int    $0x40
 1f4:	c3                   	ret    

000001f5 <read>:
SYSCALL(read)
 1f5:	b8 05 00 00 00       	mov    $0x5,%eax
 1fa:	cd 40                	int    $0x40
 1fc:	c3                   	ret    

000001fd <write>:
SYSCALL(write)
 1fd:	b8 10 00 00 00       	mov    $0x10,%eax
 202:	cd 40                	int    $0x40
 204:	c3                   	ret    

00000205 <close>:
SYSCALL(close)
 205:	b8 15 00 00 00       	mov    $0x15,%eax
 20a:	cd 40                	int    $0x40
 20c:	c3                   	ret    

0000020d <kill>:
SYSCALL(kill)
 20d:	b8 06 00 00 00       	mov    $0x6,%eax
 212:	cd 40                	int    $0x40
 214:	c3                   	ret    

00000215 <exec>:
SYSCALL(exec)
 215:	b8 07 00 00 00       	mov    $0x7,%eax
 21a:	cd 40                	int    $0x40
 21c:	c3                   	ret    

0000021d <open>:
SYSCALL(open)
 21d:	b8 0f 00 00 00       	mov    $0xf,%eax
 222:	cd 40                	int    $0x40
 224:	c3                   	ret    

00000225 <mknod>:
SYSCALL(mknod)
 225:	b8 11 00 00 00       	mov    $0x11,%eax
 22a:	cd 40                	int    $0x40
 22c:	c3                   	ret    

0000022d <unlink>:
SYSCALL(unlink)
 22d:	b8 12 00 00 00       	mov    $0x12,%eax
 232:	cd 40                	int    $0x40
 234:	c3                   	ret    

00000235 <fstat>:
SYSCALL(fstat)
 235:	b8 08 00 00 00       	mov    $0x8,%eax
 23a:	cd 40                	int    $0x40
 23c:	c3                   	ret    

0000023d <link>:
SYSCALL(link)
 23d:	b8 13 00 00 00       	mov    $0x13,%eax
 242:	cd 40                	int    $0x40
 244:	c3                   	ret    

00000245 <mkdir>:
SYSCALL(mkdir)
 245:	b8 14 00 00 00       	mov    $0x14,%eax
 24a:	cd 40                	int    $0x40
 24c:	c3                   	ret    

0000024d <chdir>:
SYSCALL(chdir)
 24d:	b8 09 00 00 00       	mov    $0x9,%eax
 252:	cd 40                	int    $0x40
 254:	c3                   	ret    

00000255 <dup>:
SYSCALL(dup)
 255:	b8 0a 00 00 00       	mov    $0xa,%eax
 25a:	cd 40                	int    $0x40
 25c:	c3                   	ret    

0000025d <getpid>:
SYSCALL(getpid)
 25d:	b8 0b 00 00 00       	mov    $0xb,%eax
 262:	cd 40                	int    $0x40
 264:	c3                   	ret    

00000265 <sbrk>:
SYSCALL(sbrk)
 265:	b8 0c 00 00 00       	mov    $0xc,%eax
 26a:	cd 40                	int    $0x40
 26c:	c3                   	ret    

0000026d <sleep>:
SYSCALL(sleep)
 26d:	b8 0d 00 00 00       	mov    $0xd,%eax
 272:	cd 40                	int    $0x40
 274:	c3                   	ret    

00000275 <uptime>:
SYSCALL(uptime)
 275:	b8 0e 00 00 00       	mov    $0xe,%eax
 27a:	cd 40                	int    $0x40
 27c:	c3                   	ret    

0000027d <getreadcount>:
 27d:	b8 16 00 00 00       	mov    $0x16,%eax
 282:	cd 40                	int    $0x40
 284:	c3                   	ret    
 285:	66 90                	xchg   %ax,%ax
 287:	90                   	nop

00000288 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 288:	55                   	push   %ebp
 289:	89 e5                	mov    %esp,%ebp
 28b:	57                   	push   %edi
 28c:	56                   	push   %esi
 28d:	53                   	push   %ebx
 28e:	83 ec 3c             	sub    $0x3c,%esp
 291:	89 45 bc             	mov    %eax,-0x44(%ebp)
 294:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 297:	89 d1                	mov    %edx,%ecx
  if(sgn && xx < 0){
 299:	8b 5d 08             	mov    0x8(%ebp),%ebx
 29c:	85 db                	test   %ebx,%ebx
 29e:	74 04                	je     2a4 <printint+0x1c>
 2a0:	85 d2                	test   %edx,%edx
 2a2:	78 68                	js     30c <printint+0x84>
  neg = 0;
 2a4:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 2ab:	31 ff                	xor    %edi,%edi
 2ad:	8d 75 d7             	lea    -0x29(%ebp),%esi
  do{
    buf[i++] = digits[x % base];
 2b0:	89 c8                	mov    %ecx,%eax
 2b2:	31 d2                	xor    %edx,%edx
 2b4:	f7 75 c4             	divl   -0x3c(%ebp)
 2b7:	89 fb                	mov    %edi,%ebx
 2b9:	8d 7f 01             	lea    0x1(%edi),%edi
 2bc:	8a 92 24 06 00 00    	mov    0x624(%edx),%dl
 2c2:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
  }while((x /= base) != 0);
 2c6:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 2c9:	89 c1                	mov    %eax,%ecx
 2cb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 2ce:	3b 45 c0             	cmp    -0x40(%ebp),%eax
 2d1:	76 dd                	jbe    2b0 <printint+0x28>
  if(neg)
 2d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d6:	85 c9                	test   %ecx,%ecx
 2d8:	74 09                	je     2e3 <printint+0x5b>
    buf[i++] = '-';
 2da:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
 2df:	89 fb                	mov    %edi,%ebx
    buf[i++] = '-';
 2e1:	b2 2d                	mov    $0x2d,%dl

  while(--i >= 0)
 2e3:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 2e7:	8b 7d bc             	mov    -0x44(%ebp),%edi
 2ea:	eb 03                	jmp    2ef <printint+0x67>
 2ec:	8a 13                	mov    (%ebx),%dl
 2ee:	4b                   	dec    %ebx
    putc(fd, buf[i]);
 2ef:	88 55 d7             	mov    %dl,-0x29(%ebp)
  write(fd, &c, 1);
 2f2:	50                   	push   %eax
 2f3:	6a 01                	push   $0x1
 2f5:	56                   	push   %esi
 2f6:	57                   	push   %edi
 2f7:	e8 01 ff ff ff       	call   1fd <write>
  while(--i >= 0)
 2fc:	83 c4 10             	add    $0x10,%esp
 2ff:	39 de                	cmp    %ebx,%esi
 301:	75 e9                	jne    2ec <printint+0x64>
}
 303:	8d 65 f4             	lea    -0xc(%ebp),%esp
 306:	5b                   	pop    %ebx
 307:	5e                   	pop    %esi
 308:	5f                   	pop    %edi
 309:	5d                   	pop    %ebp
 30a:	c3                   	ret    
 30b:	90                   	nop
    x = -xx;
 30c:	f7 d9                	neg    %ecx
 30e:	eb 9b                	jmp    2ab <printint+0x23>

00000310 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
 315:	53                   	push   %ebx
 316:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 319:	8b 75 0c             	mov    0xc(%ebp),%esi
 31c:	8a 1e                	mov    (%esi),%bl
 31e:	84 db                	test   %bl,%bl
 320:	0f 84 a3 00 00 00    	je     3c9 <printf+0xb9>
 326:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 327:	8d 45 10             	lea    0x10(%ebp),%eax
 32a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  state = 0;
 32d:	31 d2                	xor    %edx,%edx
  write(fd, &c, 1);
 32f:	8d 7d e7             	lea    -0x19(%ebp),%edi
 332:	eb 29                	jmp    35d <printf+0x4d>
 334:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 337:	83 f8 25             	cmp    $0x25,%eax
 33a:	0f 84 94 00 00 00    	je     3d4 <printf+0xc4>
        state = '%';
      } else {
        putc(fd, c);
 340:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 343:	50                   	push   %eax
 344:	6a 01                	push   $0x1
 346:	57                   	push   %edi
 347:	ff 75 08             	pushl  0x8(%ebp)
 34a:	e8 ae fe ff ff       	call   1fd <write>
        putc(fd, c);
 34f:	83 c4 10             	add    $0x10,%esp
 352:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  for(i = 0; fmt[i]; i++){
 355:	46                   	inc    %esi
 356:	8a 5e ff             	mov    -0x1(%esi),%bl
 359:	84 db                	test   %bl,%bl
 35b:	74 6c                	je     3c9 <printf+0xb9>
    c = fmt[i] & 0xff;
 35d:	0f be cb             	movsbl %bl,%ecx
 360:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 363:	85 d2                	test   %edx,%edx
 365:	74 cd                	je     334 <printf+0x24>
      }
    } else if(state == '%'){
 367:	83 fa 25             	cmp    $0x25,%edx
 36a:	75 e9                	jne    355 <printf+0x45>
      if(c == 'd'){
 36c:	83 f8 64             	cmp    $0x64,%eax
 36f:	0f 84 97 00 00 00    	je     40c <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 375:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 37b:	83 f9 70             	cmp    $0x70,%ecx
 37e:	74 60                	je     3e0 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 380:	83 f8 73             	cmp    $0x73,%eax
 383:	0f 84 8f 00 00 00    	je     418 <printf+0x108>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 389:	83 f8 63             	cmp    $0x63,%eax
 38c:	0f 84 d6 00 00 00    	je     468 <printf+0x158>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 392:	83 f8 25             	cmp    $0x25,%eax
 395:	0f 84 c1 00 00 00    	je     45c <printf+0x14c>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 39b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 39f:	50                   	push   %eax
 3a0:	6a 01                	push   $0x1
 3a2:	57                   	push   %edi
 3a3:	ff 75 08             	pushl  0x8(%ebp)
 3a6:	e8 52 fe ff ff       	call   1fd <write>
        putc(fd, c);
 3ab:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 3ae:	83 c4 0c             	add    $0xc,%esp
 3b1:	6a 01                	push   $0x1
 3b3:	57                   	push   %edi
 3b4:	ff 75 08             	pushl  0x8(%ebp)
 3b7:	e8 41 fe ff ff       	call   1fd <write>
        putc(fd, c);
 3bc:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 3bf:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 3c1:	46                   	inc    %esi
 3c2:	8a 5e ff             	mov    -0x1(%esi),%bl
 3c5:	84 db                	test   %bl,%bl
 3c7:	75 94                	jne    35d <printf+0x4d>
    }
  }
}
 3c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3cc:	5b                   	pop    %ebx
 3cd:	5e                   	pop    %esi
 3ce:	5f                   	pop    %edi
 3cf:	5d                   	pop    %ebp
 3d0:	c3                   	ret    
 3d1:	8d 76 00             	lea    0x0(%esi),%esi
        state = '%';
 3d4:	ba 25 00 00 00       	mov    $0x25,%edx
 3d9:	e9 77 ff ff ff       	jmp    355 <printf+0x45>
 3de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 3e0:	83 ec 0c             	sub    $0xc,%esp
 3e3:	6a 00                	push   $0x0
 3e5:	b9 10 00 00 00       	mov    $0x10,%ecx
 3ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 3ed:	8b 13                	mov    (%ebx),%edx
 3ef:	8b 45 08             	mov    0x8(%ebp),%eax
 3f2:	e8 91 fe ff ff       	call   288 <printint>
        ap++;
 3f7:	89 d8                	mov    %ebx,%eax
 3f9:	83 c0 04             	add    $0x4,%eax
 3fc:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3ff:	83 c4 10             	add    $0x10,%esp
      state = 0;
 402:	31 d2                	xor    %edx,%edx
        ap++;
 404:	e9 4c ff ff ff       	jmp    355 <printf+0x45>
 409:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 40c:	83 ec 0c             	sub    $0xc,%esp
 40f:	6a 01                	push   $0x1
 411:	b9 0a 00 00 00       	mov    $0xa,%ecx
 416:	eb d2                	jmp    3ea <printf+0xda>
        s = (char*)*ap;
 418:	8b 45 d0             	mov    -0x30(%ebp),%eax
 41b:	8b 18                	mov    (%eax),%ebx
        ap++;
 41d:	83 c0 04             	add    $0x4,%eax
 420:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 423:	85 db                	test   %ebx,%ebx
 425:	74 65                	je     48c <printf+0x17c>
        while(*s != 0){
 427:	8a 03                	mov    (%ebx),%al
 429:	84 c0                	test   %al,%al
 42b:	74 70                	je     49d <printf+0x18d>
 42d:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 430:	89 de                	mov    %ebx,%esi
 432:	8b 5d 08             	mov    0x8(%ebp),%ebx
 435:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 438:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 43b:	50                   	push   %eax
 43c:	6a 01                	push   $0x1
 43e:	57                   	push   %edi
 43f:	53                   	push   %ebx
 440:	e8 b8 fd ff ff       	call   1fd <write>
          s++;
 445:	46                   	inc    %esi
        while(*s != 0){
 446:	8a 06                	mov    (%esi),%al
 448:	83 c4 10             	add    $0x10,%esp
 44b:	84 c0                	test   %al,%al
 44d:	75 e9                	jne    438 <printf+0x128>
 44f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 452:	31 d2                	xor    %edx,%edx
 454:	e9 fc fe ff ff       	jmp    355 <printf+0x45>
 459:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 45c:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 45f:	52                   	push   %edx
 460:	e9 4c ff ff ff       	jmp    3b1 <printf+0xa1>
 465:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, *ap);
 468:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 46b:	8b 03                	mov    (%ebx),%eax
 46d:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 470:	51                   	push   %ecx
 471:	6a 01                	push   $0x1
 473:	57                   	push   %edi
 474:	ff 75 08             	pushl  0x8(%ebp)
 477:	e8 81 fd ff ff       	call   1fd <write>
        ap++;
 47c:	83 c3 04             	add    $0x4,%ebx
 47f:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 482:	83 c4 10             	add    $0x10,%esp
      state = 0;
 485:	31 d2                	xor    %edx,%edx
 487:	e9 c9 fe ff ff       	jmp    355 <printf+0x45>
          s = "(null)";
 48c:	bb 1c 06 00 00       	mov    $0x61c,%ebx
        while(*s != 0){
 491:	b0 28                	mov    $0x28,%al
 493:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 496:	89 de                	mov    %ebx,%esi
 498:	8b 5d 08             	mov    0x8(%ebp),%ebx
 49b:	eb 9b                	jmp    438 <printf+0x128>
      state = 0;
 49d:	31 d2                	xor    %edx,%edx
 49f:	e9 b1 fe ff ff       	jmp    355 <printf+0x45>

000004a4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 4a4:	55                   	push   %ebp
 4a5:	89 e5                	mov    %esp,%ebp
 4a7:	57                   	push   %edi
 4a8:	56                   	push   %esi
 4a9:	53                   	push   %ebx
 4aa:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 4ad:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4b0:	a1 bc 08 00 00       	mov    0x8bc,%eax
 4b5:	8b 10                	mov    (%eax),%edx
 4b7:	39 c8                	cmp    %ecx,%eax
 4b9:	73 11                	jae    4cc <free+0x28>
 4bb:	90                   	nop
 4bc:	39 d1                	cmp    %edx,%ecx
 4be:	72 14                	jb     4d4 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 4c0:	39 d0                	cmp    %edx,%eax
 4c2:	73 10                	jae    4d4 <free+0x30>
{
 4c4:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4c6:	8b 10                	mov    (%eax),%edx
 4c8:	39 c8                	cmp    %ecx,%eax
 4ca:	72 f0                	jb     4bc <free+0x18>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 4cc:	39 d0                	cmp    %edx,%eax
 4ce:	72 f4                	jb     4c4 <free+0x20>
 4d0:	39 d1                	cmp    %edx,%ecx
 4d2:	73 f0                	jae    4c4 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 4d4:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4d7:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4da:	39 fa                	cmp    %edi,%edx
 4dc:	74 1a                	je     4f8 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 4de:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 4e1:	8b 50 04             	mov    0x4(%eax),%edx
 4e4:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 4e7:	39 f1                	cmp    %esi,%ecx
 4e9:	74 24                	je     50f <free+0x6b>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 4eb:	89 08                	mov    %ecx,(%eax)
  freep = p;
 4ed:	a3 bc 08 00 00       	mov    %eax,0x8bc
}
 4f2:	5b                   	pop    %ebx
 4f3:	5e                   	pop    %esi
 4f4:	5f                   	pop    %edi
 4f5:	5d                   	pop    %ebp
 4f6:	c3                   	ret    
 4f7:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 4f8:	03 72 04             	add    0x4(%edx),%esi
 4fb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 4fe:	8b 10                	mov    (%eax),%edx
 500:	8b 12                	mov    (%edx),%edx
 502:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 505:	8b 50 04             	mov    0x4(%eax),%edx
 508:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 50b:	39 f1                	cmp    %esi,%ecx
 50d:	75 dc                	jne    4eb <free+0x47>
    p->s.size += bp->s.size;
 50f:	03 53 fc             	add    -0x4(%ebx),%edx
 512:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 515:	8b 53 f8             	mov    -0x8(%ebx),%edx
 518:	89 10                	mov    %edx,(%eax)
  freep = p;
 51a:	a3 bc 08 00 00       	mov    %eax,0x8bc
}
 51f:	5b                   	pop    %ebx
 520:	5e                   	pop    %esi
 521:	5f                   	pop    %edi
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    

00000524 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 524:	55                   	push   %ebp
 525:	89 e5                	mov    %esp,%ebp
 527:	57                   	push   %edi
 528:	56                   	push   %esi
 529:	53                   	push   %ebx
 52a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 52d:	8b 45 08             	mov    0x8(%ebp),%eax
 530:	8d 70 07             	lea    0x7(%eax),%esi
 533:	c1 ee 03             	shr    $0x3,%esi
 536:	46                   	inc    %esi
  if((prevp = freep) == 0){
 537:	8b 3d bc 08 00 00    	mov    0x8bc,%edi
 53d:	85 ff                	test   %edi,%edi
 53f:	0f 84 a3 00 00 00    	je     5e8 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 545:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 547:	8b 48 04             	mov    0x4(%eax),%ecx
 54a:	39 f1                	cmp    %esi,%ecx
 54c:	73 67                	jae    5b5 <malloc+0x91>
 54e:	89 f3                	mov    %esi,%ebx
 550:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 556:	0f 82 80 00 00 00    	jb     5dc <malloc+0xb8>
  p = sbrk(nu * sizeof(Header));
 55c:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 563:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 566:	eb 11                	jmp    579 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 568:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 56a:	8b 4a 04             	mov    0x4(%edx),%ecx
 56d:	39 f1                	cmp    %esi,%ecx
 56f:	73 4b                	jae    5bc <malloc+0x98>
 571:	8b 3d bc 08 00 00    	mov    0x8bc,%edi
 577:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 579:	39 c7                	cmp    %eax,%edi
 57b:	75 eb                	jne    568 <malloc+0x44>
  p = sbrk(nu * sizeof(Header));
 57d:	83 ec 0c             	sub    $0xc,%esp
 580:	ff 75 e4             	pushl  -0x1c(%ebp)
 583:	e8 dd fc ff ff       	call   265 <sbrk>
  if(p == (char*)-1)
 588:	83 c4 10             	add    $0x10,%esp
 58b:	83 f8 ff             	cmp    $0xffffffff,%eax
 58e:	74 1b                	je     5ab <malloc+0x87>
  hp->s.size = nu;
 590:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 593:	83 ec 0c             	sub    $0xc,%esp
 596:	83 c0 08             	add    $0x8,%eax
 599:	50                   	push   %eax
 59a:	e8 05 ff ff ff       	call   4a4 <free>
  return freep;
 59f:	a1 bc 08 00 00       	mov    0x8bc,%eax
      if((p = morecore(nunits)) == 0)
 5a4:	83 c4 10             	add    $0x10,%esp
 5a7:	85 c0                	test   %eax,%eax
 5a9:	75 bd                	jne    568 <malloc+0x44>
        return 0;
 5ab:	31 c0                	xor    %eax,%eax
  }
}
 5ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b0:	5b                   	pop    %ebx
 5b1:	5e                   	pop    %esi
 5b2:	5f                   	pop    %edi
 5b3:	5d                   	pop    %ebp
 5b4:	c3                   	ret    
    if(p->s.size >= nunits){
 5b5:	89 c2                	mov    %eax,%edx
 5b7:	89 f8                	mov    %edi,%eax
 5b9:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 5bc:	39 ce                	cmp    %ecx,%esi
 5be:	74 54                	je     614 <malloc+0xf0>
        p->s.size -= nunits;
 5c0:	29 f1                	sub    %esi,%ecx
 5c2:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 5c5:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 5c8:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 5cb:	a3 bc 08 00 00       	mov    %eax,0x8bc
      return (void*)(p + 1);
 5d0:	8d 42 08             	lea    0x8(%edx),%eax
}
 5d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d6:	5b                   	pop    %ebx
 5d7:	5e                   	pop    %esi
 5d8:	5f                   	pop    %edi
 5d9:	5d                   	pop    %ebp
 5da:	c3                   	ret    
 5db:	90                   	nop
 5dc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 5e1:	e9 76 ff ff ff       	jmp    55c <malloc+0x38>
 5e6:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 5e8:	c7 05 bc 08 00 00 c0 	movl   $0x8c0,0x8bc
 5ef:	08 00 00 
 5f2:	c7 05 c0 08 00 00 c0 	movl   $0x8c0,0x8c0
 5f9:	08 00 00 
    base.s.size = 0;
 5fc:	c7 05 c4 08 00 00 00 	movl   $0x0,0x8c4
 603:	00 00 00 
 606:	bf c0 08 00 00       	mov    $0x8c0,%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 60b:	89 f8                	mov    %edi,%eax
 60d:	e9 3c ff ff ff       	jmp    54e <malloc+0x2a>
 612:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 614:	8b 0a                	mov    (%edx),%ecx
 616:	89 08                	mov    %ecx,(%eax)
 618:	eb b1                	jmp    5cb <malloc+0xa7>
