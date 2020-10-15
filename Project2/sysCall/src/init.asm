
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 d4 06 00 00       	push   $0x6d4
  19:	e8 b7 02 00 00       	call   2d5 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 93 00 00 00    	js     bc <main+0xbc>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 da 02 00 00       	call   30d <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 ce 02 00 00       	call   30d <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	66 90                	xchg   %ax,%ax

  for(;;){
    printf(1, "init: starting sh\n");
  44:	83 ec 08             	sub    $0x8,%esp
  47:	68 dc 06 00 00       	push   $0x6dc
  4c:	6a 01                	push   $0x1
  4e:	e8 75 03 00 00       	call   3c8 <printf>
    pid = fork();
  53:	e8 35 02 00 00       	call   28d <fork>
  58:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	85 c0                	test   %eax,%eax
  5f:	78 24                	js     85 <main+0x85>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  61:	74 35                	je     98 <main+0x98>
  63:	90                   	nop
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  64:	e8 34 02 00 00       	call   29d <wait>
  69:	85 c0                	test   %eax,%eax
  6b:	78 d7                	js     44 <main+0x44>
  6d:	39 c3                	cmp    %eax,%ebx
  6f:	74 d3                	je     44 <main+0x44>
      printf(1, "zombie!\n");
  71:	83 ec 08             	sub    $0x8,%esp
  74:	68 1b 07 00 00       	push   $0x71b
  79:	6a 01                	push   $0x1
  7b:	e8 48 03 00 00       	call   3c8 <printf>
  80:	83 c4 10             	add    $0x10,%esp
  83:	eb df                	jmp    64 <main+0x64>
      printf(1, "init: fork failed\n");
  85:	53                   	push   %ebx
  86:	53                   	push   %ebx
  87:	68 ef 06 00 00       	push   $0x6ef
  8c:	6a 01                	push   $0x1
  8e:	e8 35 03 00 00       	call   3c8 <printf>
      exit();
  93:	e8 fd 01 00 00       	call   295 <exit>
      exec("sh", argv);
  98:	50                   	push   %eax
  99:	50                   	push   %eax
  9a:	68 c8 09 00 00       	push   $0x9c8
  9f:	68 02 07 00 00       	push   $0x702
  a4:	e8 24 02 00 00       	call   2cd <exec>
      printf(1, "init: exec sh failed\n");
  a9:	5a                   	pop    %edx
  aa:	59                   	pop    %ecx
  ab:	68 05 07 00 00       	push   $0x705
  b0:	6a 01                	push   $0x1
  b2:	e8 11 03 00 00       	call   3c8 <printf>
      exit();
  b7:	e8 d9 01 00 00       	call   295 <exit>
    mknod("console", 1, 1);
  bc:	50                   	push   %eax
  bd:	6a 01                	push   $0x1
  bf:	6a 01                	push   $0x1
  c1:	68 d4 06 00 00       	push   $0x6d4
  c6:	e8 12 02 00 00       	call   2dd <mknod>
    open("console", O_RDWR);
  cb:	58                   	pop    %eax
  cc:	5a                   	pop    %edx
  cd:	6a 02                	push   $0x2
  cf:	68 d4 06 00 00       	push   $0x6d4
  d4:	e8 fc 01 00 00       	call   2d5 <open>
  d9:	83 c4 10             	add    $0x10,%esp
  dc:	e9 48 ff ff ff       	jmp    29 <main+0x29>
  e1:	66 90                	xchg   %ax,%ax
  e3:	90                   	nop

000000e4 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	53                   	push   %ebx
  e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  eb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ee:	31 c0                	xor    %eax,%eax
  f0:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  f3:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  f6:	40                   	inc    %eax
  f7:	84 d2                	test   %dl,%dl
  f9:	75 f5                	jne    f0 <strcpy+0xc>
    ;
  return os;
}
  fb:	89 c8                	mov    %ecx,%eax
  fd:	5b                   	pop    %ebx
  fe:	5d                   	pop    %ebp
  ff:	c3                   	ret    

00000100 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	53                   	push   %ebx
 104:	8b 5d 08             	mov    0x8(%ebp),%ebx
 107:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 10a:	0f b6 03             	movzbl (%ebx),%eax
 10d:	0f b6 0a             	movzbl (%edx),%ecx
 110:	84 c0                	test   %al,%al
 112:	75 10                	jne    124 <strcmp+0x24>
 114:	eb 1a                	jmp    130 <strcmp+0x30>
 116:	66 90                	xchg   %ax,%ax
    p++, q++;
 118:	43                   	inc    %ebx
 119:	42                   	inc    %edx
  while(*p && *p == *q)
 11a:	0f b6 03             	movzbl (%ebx),%eax
 11d:	0f b6 0a             	movzbl (%edx),%ecx
 120:	84 c0                	test   %al,%al
 122:	74 0c                	je     130 <strcmp+0x30>
 124:	38 c8                	cmp    %cl,%al
 126:	74 f0                	je     118 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 128:	29 c8                	sub    %ecx,%eax
}
 12a:	5b                   	pop    %ebx
 12b:	5d                   	pop    %ebp
 12c:	c3                   	ret    
 12d:	8d 76 00             	lea    0x0(%esi),%esi
 130:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 132:	29 c8                	sub    %ecx,%eax
}
 134:	5b                   	pop    %ebx
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	90                   	nop

00000138 <strlen>:

uint
strlen(const char *s)
{
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 13e:	80 3a 00             	cmpb   $0x0,(%edx)
 141:	74 15                	je     158 <strlen+0x20>
 143:	31 c0                	xor    %eax,%eax
 145:	8d 76 00             	lea    0x0(%esi),%esi
 148:	40                   	inc    %eax
 149:	89 c1                	mov    %eax,%ecx
 14b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 14f:	75 f7                	jne    148 <strlen+0x10>
    ;
  return n;
}
 151:	89 c8                	mov    %ecx,%eax
 153:	5d                   	pop    %ebp
 154:	c3                   	ret    
 155:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 158:	31 c9                	xor    %ecx,%ecx
}
 15a:	89 c8                	mov    %ecx,%eax
 15c:	5d                   	pop    %ebp
 15d:	c3                   	ret    
 15e:	66 90                	xchg   %ax,%ax

00000160 <memset>:

void*
memset(void *dst, int c, uint n)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 164:	8b 7d 08             	mov    0x8(%ebp),%edi
 167:	8b 4d 10             	mov    0x10(%ebp),%ecx
 16a:	8b 45 0c             	mov    0xc(%ebp),%eax
 16d:	fc                   	cld    
 16e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 170:	8b 45 08             	mov    0x8(%ebp),%eax
 173:	5f                   	pop    %edi
 174:	5d                   	pop    %ebp
 175:	c3                   	ret    
 176:	66 90                	xchg   %ax,%ax

00000178 <strchr>:

char*
strchr(const char *s, char c)
{
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	8b 45 08             	mov    0x8(%ebp),%eax
 17e:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 181:	8a 10                	mov    (%eax),%dl
 183:	84 d2                	test   %dl,%dl
 185:	75 0c                	jne    193 <strchr+0x1b>
 187:	eb 13                	jmp    19c <strchr+0x24>
 189:	8d 76 00             	lea    0x0(%esi),%esi
 18c:	40                   	inc    %eax
 18d:	8a 10                	mov    (%eax),%dl
 18f:	84 d2                	test   %dl,%dl
 191:	74 09                	je     19c <strchr+0x24>
    if(*s == c)
 193:	38 d1                	cmp    %dl,%cl
 195:	75 f5                	jne    18c <strchr+0x14>
      return (char*)s;
  return 0;
}
 197:	5d                   	pop    %ebp
 198:	c3                   	ret    
 199:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
 19c:	31 c0                	xor    %eax,%eax
}
 19e:	5d                   	pop    %ebp
 19f:	c3                   	ret    

000001a0 <gets>:

char*
gets(char *buf, int max)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
 1a5:	53                   	push   %ebx
 1a6:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a9:	8b 75 08             	mov    0x8(%ebp),%esi
 1ac:	bb 01 00 00 00       	mov    $0x1,%ebx
 1b1:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
 1b3:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 1b6:	eb 20                	jmp    1d8 <gets+0x38>
    cc = read(0, &c, 1);
 1b8:	50                   	push   %eax
 1b9:	6a 01                	push   $0x1
 1bb:	57                   	push   %edi
 1bc:	6a 00                	push   $0x0
 1be:	e8 ea 00 00 00       	call   2ad <read>
    if(cc < 1)
 1c3:	83 c4 10             	add    $0x10,%esp
 1c6:	85 c0                	test   %eax,%eax
 1c8:	7e 16                	jle    1e0 <gets+0x40>
      break;
    buf[i++] = c;
 1ca:	8a 45 e7             	mov    -0x19(%ebp),%al
 1cd:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
 1cf:	46                   	inc    %esi
 1d0:	3c 0a                	cmp    $0xa,%al
 1d2:	74 0c                	je     1e0 <gets+0x40>
 1d4:	3c 0d                	cmp    $0xd,%al
 1d6:	74 08                	je     1e0 <gets+0x40>
  for(i=0; i+1 < max; ){
 1d8:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 1db:	39 45 0c             	cmp    %eax,0xc(%ebp)
 1de:	7f d8                	jg     1b8 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 1e0:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e9:	5b                   	pop    %ebx
 1ea:	5e                   	pop    %esi
 1eb:	5f                   	pop    %edi
 1ec:	5d                   	pop    %ebp
 1ed:	c3                   	ret    
 1ee:	66 90                	xchg   %ax,%ax

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	pushl  0x8(%ebp)
 1fd:	e8 d3 00 00 00       	call   2d5 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
 209:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 20b:	83 ec 08             	sub    $0x8,%esp
 20e:	ff 75 0c             	pushl  0xc(%ebp)
 211:	50                   	push   %eax
 212:	e8 d6 00 00 00       	call   2ed <fstat>
 217:	89 c6                	mov    %eax,%esi
  close(fd);
 219:	89 1c 24             	mov    %ebx,(%esp)
 21c:	e8 9c 00 00 00       	call   2bd <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	89 f0                	mov    %esi,%eax
 226:	8d 65 f8             	lea    -0x8(%ebp),%esp
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	90                   	nop

00000238 <atoi>:

int
atoi(const char *s)
{
 238:	55                   	push   %ebp
 239:	89 e5                	mov    %esp,%ebp
 23b:	53                   	push   %ebx
 23c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 23f:	0f be 01             	movsbl (%ecx),%eax
 242:	8d 50 d0             	lea    -0x30(%eax),%edx
 245:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
 248:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 24d:	77 16                	ja     265 <atoi+0x2d>
 24f:	90                   	nop
    n = n*10 + *s++ - '0';
 250:	41                   	inc    %ecx
 251:	8d 14 92             	lea    (%edx,%edx,4),%edx
 254:	01 d2                	add    %edx,%edx
 256:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
 25a:	0f be 01             	movsbl (%ecx),%eax
 25d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 260:	80 fb 09             	cmp    $0x9,%bl
 263:	76 eb                	jbe    250 <atoi+0x18>
  return n;
}
 265:	89 d0                	mov    %edx,%eax
 267:	5b                   	pop    %ebx
 268:	5d                   	pop    %ebp
 269:	c3                   	ret    
 26a:	66 90                	xchg   %ax,%ax

0000026c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 26c:	55                   	push   %ebp
 26d:	89 e5                	mov    %esp,%ebp
 26f:	57                   	push   %edi
 270:	56                   	push   %esi
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	8b 75 0c             	mov    0xc(%ebp),%esi
 277:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27a:	85 d2                	test   %edx,%edx
 27c:	7e 0b                	jle    289 <memmove+0x1d>
 27e:	01 c2                	add    %eax,%edx
  dst = vdst;
 280:	89 c7                	mov    %eax,%edi
 282:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 284:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 285:	39 fa                	cmp    %edi,%edx
 287:	75 fb                	jne    284 <memmove+0x18>
  return vdst;
}
 289:	5e                   	pop    %esi
 28a:	5f                   	pop    %edi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    

0000028d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 28d:	b8 01 00 00 00       	mov    $0x1,%eax
 292:	cd 40                	int    $0x40
 294:	c3                   	ret    

00000295 <exit>:
SYSCALL(exit)
 295:	b8 02 00 00 00       	mov    $0x2,%eax
 29a:	cd 40                	int    $0x40
 29c:	c3                   	ret    

0000029d <wait>:
SYSCALL(wait)
 29d:	b8 03 00 00 00       	mov    $0x3,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <pipe>:
SYSCALL(pipe)
 2a5:	b8 04 00 00 00       	mov    $0x4,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <read>:
SYSCALL(read)
 2ad:	b8 05 00 00 00       	mov    $0x5,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <write>:
SYSCALL(write)
 2b5:	b8 10 00 00 00       	mov    $0x10,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <close>:
SYSCALL(close)
 2bd:	b8 15 00 00 00       	mov    $0x15,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <kill>:
SYSCALL(kill)
 2c5:	b8 06 00 00 00       	mov    $0x6,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <exec>:
SYSCALL(exec)
 2cd:	b8 07 00 00 00       	mov    $0x7,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <open>:
SYSCALL(open)
 2d5:	b8 0f 00 00 00       	mov    $0xf,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <mknod>:
SYSCALL(mknod)
 2dd:	b8 11 00 00 00       	mov    $0x11,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <unlink>:
SYSCALL(unlink)
 2e5:	b8 12 00 00 00       	mov    $0x12,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <fstat>:
SYSCALL(fstat)
 2ed:	b8 08 00 00 00       	mov    $0x8,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <link>:
SYSCALL(link)
 2f5:	b8 13 00 00 00       	mov    $0x13,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <mkdir>:
SYSCALL(mkdir)
 2fd:	b8 14 00 00 00       	mov    $0x14,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <chdir>:
SYSCALL(chdir)
 305:	b8 09 00 00 00       	mov    $0x9,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <dup>:
SYSCALL(dup)
 30d:	b8 0a 00 00 00       	mov    $0xa,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <getpid>:
SYSCALL(getpid)
 315:	b8 0b 00 00 00       	mov    $0xb,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <sbrk>:
SYSCALL(sbrk)
 31d:	b8 0c 00 00 00       	mov    $0xc,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <sleep>:
SYSCALL(sleep)
 325:	b8 0d 00 00 00       	mov    $0xd,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <uptime>:
SYSCALL(uptime)
 32d:	b8 0e 00 00 00       	mov    $0xe,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <getreadcount>:
 335:	b8 16 00 00 00       	mov    $0x16,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    
 33d:	66 90                	xchg   %ax,%ax
 33f:	90                   	nop

00000340 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	53                   	push   %ebx
 346:	83 ec 3c             	sub    $0x3c,%esp
 349:	89 45 bc             	mov    %eax,-0x44(%ebp)
 34c:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 34f:	89 d1                	mov    %edx,%ecx
  if(sgn && xx < 0){
 351:	8b 5d 08             	mov    0x8(%ebp),%ebx
 354:	85 db                	test   %ebx,%ebx
 356:	74 04                	je     35c <printint+0x1c>
 358:	85 d2                	test   %edx,%edx
 35a:	78 68                	js     3c4 <printint+0x84>
  neg = 0;
 35c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 363:	31 ff                	xor    %edi,%edi
 365:	8d 75 d7             	lea    -0x29(%ebp),%esi
  do{
    buf[i++] = digits[x % base];
 368:	89 c8                	mov    %ecx,%eax
 36a:	31 d2                	xor    %edx,%edx
 36c:	f7 75 c4             	divl   -0x3c(%ebp)
 36f:	89 fb                	mov    %edi,%ebx
 371:	8d 7f 01             	lea    0x1(%edi),%edi
 374:	8a 92 2c 07 00 00    	mov    0x72c(%edx),%dl
 37a:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
  }while((x /= base) != 0);
 37e:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 381:	89 c1                	mov    %eax,%ecx
 383:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 386:	3b 45 c0             	cmp    -0x40(%ebp),%eax
 389:	76 dd                	jbe    368 <printint+0x28>
  if(neg)
 38b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 38e:	85 c9                	test   %ecx,%ecx
 390:	74 09                	je     39b <printint+0x5b>
    buf[i++] = '-';
 392:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
 397:	89 fb                	mov    %edi,%ebx
    buf[i++] = '-';
 399:	b2 2d                	mov    $0x2d,%dl

  while(--i >= 0)
 39b:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 39f:	8b 7d bc             	mov    -0x44(%ebp),%edi
 3a2:	eb 03                	jmp    3a7 <printint+0x67>
 3a4:	8a 13                	mov    (%ebx),%dl
 3a6:	4b                   	dec    %ebx
    putc(fd, buf[i]);
 3a7:	88 55 d7             	mov    %dl,-0x29(%ebp)
  write(fd, &c, 1);
 3aa:	50                   	push   %eax
 3ab:	6a 01                	push   $0x1
 3ad:	56                   	push   %esi
 3ae:	57                   	push   %edi
 3af:	e8 01 ff ff ff       	call   2b5 <write>
  while(--i >= 0)
 3b4:	83 c4 10             	add    $0x10,%esp
 3b7:	39 de                	cmp    %ebx,%esi
 3b9:	75 e9                	jne    3a4 <printint+0x64>
}
 3bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3be:	5b                   	pop    %ebx
 3bf:	5e                   	pop    %esi
 3c0:	5f                   	pop    %edi
 3c1:	5d                   	pop    %ebp
 3c2:	c3                   	ret    
 3c3:	90                   	nop
    x = -xx;
 3c4:	f7 d9                	neg    %ecx
 3c6:	eb 9b                	jmp    363 <printint+0x23>

000003c8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3c8:	55                   	push   %ebp
 3c9:	89 e5                	mov    %esp,%ebp
 3cb:	57                   	push   %edi
 3cc:	56                   	push   %esi
 3cd:	53                   	push   %ebx
 3ce:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3d1:	8b 75 0c             	mov    0xc(%ebp),%esi
 3d4:	8a 1e                	mov    (%esi),%bl
 3d6:	84 db                	test   %bl,%bl
 3d8:	0f 84 a3 00 00 00    	je     481 <printf+0xb9>
 3de:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 3df:	8d 45 10             	lea    0x10(%ebp),%eax
 3e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  state = 0;
 3e5:	31 d2                	xor    %edx,%edx
  write(fd, &c, 1);
 3e7:	8d 7d e7             	lea    -0x19(%ebp),%edi
 3ea:	eb 29                	jmp    415 <printf+0x4d>
 3ec:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3ef:	83 f8 25             	cmp    $0x25,%eax
 3f2:	0f 84 94 00 00 00    	je     48c <printf+0xc4>
        state = '%';
      } else {
        putc(fd, c);
 3f8:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 3fb:	50                   	push   %eax
 3fc:	6a 01                	push   $0x1
 3fe:	57                   	push   %edi
 3ff:	ff 75 08             	pushl  0x8(%ebp)
 402:	e8 ae fe ff ff       	call   2b5 <write>
        putc(fd, c);
 407:	83 c4 10             	add    $0x10,%esp
 40a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  for(i = 0; fmt[i]; i++){
 40d:	46                   	inc    %esi
 40e:	8a 5e ff             	mov    -0x1(%esi),%bl
 411:	84 db                	test   %bl,%bl
 413:	74 6c                	je     481 <printf+0xb9>
    c = fmt[i] & 0xff;
 415:	0f be cb             	movsbl %bl,%ecx
 418:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 41b:	85 d2                	test   %edx,%edx
 41d:	74 cd                	je     3ec <printf+0x24>
      }
    } else if(state == '%'){
 41f:	83 fa 25             	cmp    $0x25,%edx
 422:	75 e9                	jne    40d <printf+0x45>
      if(c == 'd'){
 424:	83 f8 64             	cmp    $0x64,%eax
 427:	0f 84 97 00 00 00    	je     4c4 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 42d:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 433:	83 f9 70             	cmp    $0x70,%ecx
 436:	74 60                	je     498 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 438:	83 f8 73             	cmp    $0x73,%eax
 43b:	0f 84 8f 00 00 00    	je     4d0 <printf+0x108>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 441:	83 f8 63             	cmp    $0x63,%eax
 444:	0f 84 d6 00 00 00    	je     520 <printf+0x158>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 44a:	83 f8 25             	cmp    $0x25,%eax
 44d:	0f 84 c1 00 00 00    	je     514 <printf+0x14c>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 453:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 457:	50                   	push   %eax
 458:	6a 01                	push   $0x1
 45a:	57                   	push   %edi
 45b:	ff 75 08             	pushl  0x8(%ebp)
 45e:	e8 52 fe ff ff       	call   2b5 <write>
        putc(fd, c);
 463:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 466:	83 c4 0c             	add    $0xc,%esp
 469:	6a 01                	push   $0x1
 46b:	57                   	push   %edi
 46c:	ff 75 08             	pushl  0x8(%ebp)
 46f:	e8 41 fe ff ff       	call   2b5 <write>
        putc(fd, c);
 474:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 477:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 479:	46                   	inc    %esi
 47a:	8a 5e ff             	mov    -0x1(%esi),%bl
 47d:	84 db                	test   %bl,%bl
 47f:	75 94                	jne    415 <printf+0x4d>
    }
  }
}
 481:	8d 65 f4             	lea    -0xc(%ebp),%esp
 484:	5b                   	pop    %ebx
 485:	5e                   	pop    %esi
 486:	5f                   	pop    %edi
 487:	5d                   	pop    %ebp
 488:	c3                   	ret    
 489:	8d 76 00             	lea    0x0(%esi),%esi
        state = '%';
 48c:	ba 25 00 00 00       	mov    $0x25,%edx
 491:	e9 77 ff ff ff       	jmp    40d <printf+0x45>
 496:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 498:	83 ec 0c             	sub    $0xc,%esp
 49b:	6a 00                	push   $0x0
 49d:	b9 10 00 00 00       	mov    $0x10,%ecx
 4a2:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4a5:	8b 13                	mov    (%ebx),%edx
 4a7:	8b 45 08             	mov    0x8(%ebp),%eax
 4aa:	e8 91 fe ff ff       	call   340 <printint>
        ap++;
 4af:	89 d8                	mov    %ebx,%eax
 4b1:	83 c0 04             	add    $0x4,%eax
 4b4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4b7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ba:	31 d2                	xor    %edx,%edx
        ap++;
 4bc:	e9 4c ff ff ff       	jmp    40d <printf+0x45>
 4c1:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 4c4:	83 ec 0c             	sub    $0xc,%esp
 4c7:	6a 01                	push   $0x1
 4c9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4ce:	eb d2                	jmp    4a2 <printf+0xda>
        s = (char*)*ap;
 4d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4d3:	8b 18                	mov    (%eax),%ebx
        ap++;
 4d5:	83 c0 04             	add    $0x4,%eax
 4d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 4db:	85 db                	test   %ebx,%ebx
 4dd:	74 65                	je     544 <printf+0x17c>
        while(*s != 0){
 4df:	8a 03                	mov    (%ebx),%al
 4e1:	84 c0                	test   %al,%al
 4e3:	74 70                	je     555 <printf+0x18d>
 4e5:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 4e8:	89 de                	mov    %ebx,%esi
 4ea:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 4f0:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 4f3:	50                   	push   %eax
 4f4:	6a 01                	push   $0x1
 4f6:	57                   	push   %edi
 4f7:	53                   	push   %ebx
 4f8:	e8 b8 fd ff ff       	call   2b5 <write>
          s++;
 4fd:	46                   	inc    %esi
        while(*s != 0){
 4fe:	8a 06                	mov    (%esi),%al
 500:	83 c4 10             	add    $0x10,%esp
 503:	84 c0                	test   %al,%al
 505:	75 e9                	jne    4f0 <printf+0x128>
 507:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 50a:	31 d2                	xor    %edx,%edx
 50c:	e9 fc fe ff ff       	jmp    40d <printf+0x45>
 511:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 514:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 517:	52                   	push   %edx
 518:	e9 4c ff ff ff       	jmp    469 <printf+0xa1>
 51d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, *ap);
 520:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 523:	8b 03                	mov    (%ebx),%eax
 525:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 528:	51                   	push   %ecx
 529:	6a 01                	push   $0x1
 52b:	57                   	push   %edi
 52c:	ff 75 08             	pushl  0x8(%ebp)
 52f:	e8 81 fd ff ff       	call   2b5 <write>
        ap++;
 534:	83 c3 04             	add    $0x4,%ebx
 537:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 53a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 53d:	31 d2                	xor    %edx,%edx
 53f:	e9 c9 fe ff ff       	jmp    40d <printf+0x45>
          s = "(null)";
 544:	bb 24 07 00 00       	mov    $0x724,%ebx
        while(*s != 0){
 549:	b0 28                	mov    $0x28,%al
 54b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 54e:	89 de                	mov    %ebx,%esi
 550:	8b 5d 08             	mov    0x8(%ebp),%ebx
 553:	eb 9b                	jmp    4f0 <printf+0x128>
      state = 0;
 555:	31 d2                	xor    %edx,%edx
 557:	e9 b1 fe ff ff       	jmp    40d <printf+0x45>

0000055c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 55c:	55                   	push   %ebp
 55d:	89 e5                	mov    %esp,%ebp
 55f:	57                   	push   %edi
 560:	56                   	push   %esi
 561:	53                   	push   %ebx
 562:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 565:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 568:	a1 d0 09 00 00       	mov    0x9d0,%eax
 56d:	8b 10                	mov    (%eax),%edx
 56f:	39 c8                	cmp    %ecx,%eax
 571:	73 11                	jae    584 <free+0x28>
 573:	90                   	nop
 574:	39 d1                	cmp    %edx,%ecx
 576:	72 14                	jb     58c <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 578:	39 d0                	cmp    %edx,%eax
 57a:	73 10                	jae    58c <free+0x30>
{
 57c:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 57e:	8b 10                	mov    (%eax),%edx
 580:	39 c8                	cmp    %ecx,%eax
 582:	72 f0                	jb     574 <free+0x18>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 584:	39 d0                	cmp    %edx,%eax
 586:	72 f4                	jb     57c <free+0x20>
 588:	39 d1                	cmp    %edx,%ecx
 58a:	73 f0                	jae    57c <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 58c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 58f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 592:	39 fa                	cmp    %edi,%edx
 594:	74 1a                	je     5b0 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 596:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 599:	8b 50 04             	mov    0x4(%eax),%edx
 59c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 59f:	39 f1                	cmp    %esi,%ecx
 5a1:	74 24                	je     5c7 <free+0x6b>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5a3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5a5:	a3 d0 09 00 00       	mov    %eax,0x9d0
}
 5aa:	5b                   	pop    %ebx
 5ab:	5e                   	pop    %esi
 5ac:	5f                   	pop    %edi
 5ad:	5d                   	pop    %ebp
 5ae:	c3                   	ret    
 5af:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 5b0:	03 72 04             	add    0x4(%edx),%esi
 5b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5b6:	8b 10                	mov    (%eax),%edx
 5b8:	8b 12                	mov    (%edx),%edx
 5ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5bd:	8b 50 04             	mov    0x4(%eax),%edx
 5c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5c3:	39 f1                	cmp    %esi,%ecx
 5c5:	75 dc                	jne    5a3 <free+0x47>
    p->s.size += bp->s.size;
 5c7:	03 53 fc             	add    -0x4(%ebx),%edx
 5ca:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5cd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5d0:	89 10                	mov    %edx,(%eax)
  freep = p;
 5d2:	a3 d0 09 00 00       	mov    %eax,0x9d0
}
 5d7:	5b                   	pop    %ebx
 5d8:	5e                   	pop    %esi
 5d9:	5f                   	pop    %edi
 5da:	5d                   	pop    %ebp
 5db:	c3                   	ret    

000005dc <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 5dc:	55                   	push   %ebp
 5dd:	89 e5                	mov    %esp,%ebp
 5df:	57                   	push   %edi
 5e0:	56                   	push   %esi
 5e1:	53                   	push   %ebx
 5e2:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5e5:	8b 45 08             	mov    0x8(%ebp),%eax
 5e8:	8d 70 07             	lea    0x7(%eax),%esi
 5eb:	c1 ee 03             	shr    $0x3,%esi
 5ee:	46                   	inc    %esi
  if((prevp = freep) == 0){
 5ef:	8b 3d d0 09 00 00    	mov    0x9d0,%edi
 5f5:	85 ff                	test   %edi,%edi
 5f7:	0f 84 a3 00 00 00    	je     6a0 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5fd:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 5ff:	8b 48 04             	mov    0x4(%eax),%ecx
 602:	39 f1                	cmp    %esi,%ecx
 604:	73 67                	jae    66d <malloc+0x91>
 606:	89 f3                	mov    %esi,%ebx
 608:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 60e:	0f 82 80 00 00 00    	jb     694 <malloc+0xb8>
  p = sbrk(nu * sizeof(Header));
 614:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 61b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 61e:	eb 11                	jmp    631 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 620:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 622:	8b 4a 04             	mov    0x4(%edx),%ecx
 625:	39 f1                	cmp    %esi,%ecx
 627:	73 4b                	jae    674 <malloc+0x98>
 629:	8b 3d d0 09 00 00    	mov    0x9d0,%edi
 62f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 631:	39 c7                	cmp    %eax,%edi
 633:	75 eb                	jne    620 <malloc+0x44>
  p = sbrk(nu * sizeof(Header));
 635:	83 ec 0c             	sub    $0xc,%esp
 638:	ff 75 e4             	pushl  -0x1c(%ebp)
 63b:	e8 dd fc ff ff       	call   31d <sbrk>
  if(p == (char*)-1)
 640:	83 c4 10             	add    $0x10,%esp
 643:	83 f8 ff             	cmp    $0xffffffff,%eax
 646:	74 1b                	je     663 <malloc+0x87>
  hp->s.size = nu;
 648:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 64b:	83 ec 0c             	sub    $0xc,%esp
 64e:	83 c0 08             	add    $0x8,%eax
 651:	50                   	push   %eax
 652:	e8 05 ff ff ff       	call   55c <free>
  return freep;
 657:	a1 d0 09 00 00       	mov    0x9d0,%eax
      if((p = morecore(nunits)) == 0)
 65c:	83 c4 10             	add    $0x10,%esp
 65f:	85 c0                	test   %eax,%eax
 661:	75 bd                	jne    620 <malloc+0x44>
        return 0;
 663:	31 c0                	xor    %eax,%eax
  }
}
 665:	8d 65 f4             	lea    -0xc(%ebp),%esp
 668:	5b                   	pop    %ebx
 669:	5e                   	pop    %esi
 66a:	5f                   	pop    %edi
 66b:	5d                   	pop    %ebp
 66c:	c3                   	ret    
    if(p->s.size >= nunits){
 66d:	89 c2                	mov    %eax,%edx
 66f:	89 f8                	mov    %edi,%eax
 671:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 674:	39 ce                	cmp    %ecx,%esi
 676:	74 54                	je     6cc <malloc+0xf0>
        p->s.size -= nunits;
 678:	29 f1                	sub    %esi,%ecx
 67a:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 67d:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 680:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 683:	a3 d0 09 00 00       	mov    %eax,0x9d0
      return (void*)(p + 1);
 688:	8d 42 08             	lea    0x8(%edx),%eax
}
 68b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 68e:	5b                   	pop    %ebx
 68f:	5e                   	pop    %esi
 690:	5f                   	pop    %edi
 691:	5d                   	pop    %ebp
 692:	c3                   	ret    
 693:	90                   	nop
 694:	bb 00 10 00 00       	mov    $0x1000,%ebx
 699:	e9 76 ff ff ff       	jmp    614 <malloc+0x38>
 69e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 6a0:	c7 05 d0 09 00 00 d4 	movl   $0x9d4,0x9d0
 6a7:	09 00 00 
 6aa:	c7 05 d4 09 00 00 d4 	movl   $0x9d4,0x9d4
 6b1:	09 00 00 
    base.s.size = 0;
 6b4:	c7 05 d8 09 00 00 00 	movl   $0x0,0x9d8
 6bb:	00 00 00 
 6be:	bf d4 09 00 00       	mov    $0x9d4,%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c3:	89 f8                	mov    %edi,%eax
 6c5:	e9 3c ff ff ff       	jmp    606 <malloc+0x2a>
 6ca:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 6cc:	8b 0a                	mov    (%edx),%ecx
 6ce:	89 08                	mov    %ecx,(%eax)
 6d0:	eb b1                	jmp    683 <malloc+0xa7>
