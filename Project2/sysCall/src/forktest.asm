
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
   6:	e8 2d 00 00 00       	call   38 <forktest>
  exit();
   b:	e8 c1 02 00 00       	call   2d1 <exit>

00000010 <printf>:
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	53                   	push   %ebx
  14:	83 ec 10             	sub    $0x10,%esp
  17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  1a:	53                   	push   %ebx
  1b:	e8 54 01 00 00       	call   174 <strlen>
  20:	83 c4 0c             	add    $0xc,%esp
  23:	50                   	push   %eax
  24:	53                   	push   %ebx
  25:	ff 75 08             	pushl  0x8(%ebp)
  28:	e8 c4 02 00 00       	call   2f1 <write>
}
  2d:	83 c4 10             	add    $0x10,%esp
  30:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  33:	c9                   	leave  
  34:	c3                   	ret    
  35:	8d 76 00             	lea    0x0(%esi),%esi

00000038 <forktest>:
{
  38:	55                   	push   %ebp
  39:	89 e5                	mov    %esp,%ebp
  3b:	53                   	push   %ebx
  3c:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  3f:	68 7c 03 00 00       	push   $0x37c
  44:	e8 2b 01 00 00       	call   174 <strlen>
  49:	83 c4 0c             	add    $0xc,%esp
  4c:	50                   	push   %eax
  4d:	68 7c 03 00 00       	push   $0x37c
  52:	6a 01                	push   $0x1
  54:	e8 98 02 00 00       	call   2f1 <write>
  59:	83 c4 10             	add    $0x10,%esp
  for(n=0; n<N; n++){
  5c:	31 db                	xor    %ebx,%ebx
  5e:	eb 0f                	jmp    6f <forktest+0x37>
    if(pid == 0)
  60:	74 50                	je     b2 <forktest+0x7a>
  for(n=0; n<N; n++){
  62:	43                   	inc    %ebx
  63:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  69:	0f 84 8c 00 00 00    	je     fb <forktest+0xc3>
    pid = fork();
  6f:	e8 55 02 00 00       	call   2c9 <fork>
    if(pid < 0)
  74:	85 c0                	test   %eax,%eax
  76:	79 e8                	jns    60 <forktest+0x28>
  for(; n > 0; n--){
  78:	85 db                	test   %ebx,%ebx
  7a:	74 0c                	je     88 <forktest+0x50>
    if(wait() < 0){
  7c:	e8 58 02 00 00       	call   2d9 <wait>
  81:	85 c0                	test   %eax,%eax
  83:	78 32                	js     b7 <forktest+0x7f>
  for(; n > 0; n--){
  85:	4b                   	dec    %ebx
  86:	75 f4                	jne    7c <forktest+0x44>
  if(wait() != -1){
  88:	e8 4c 02 00 00       	call   2d9 <wait>
  8d:	40                   	inc    %eax
  8e:	75 49                	jne    d9 <forktest+0xa1>
  write(fd, s, strlen(s));
  90:	83 ec 0c             	sub    $0xc,%esp
  93:	68 ae 03 00 00       	push   $0x3ae
  98:	e8 d7 00 00 00       	call   174 <strlen>
  9d:	83 c4 0c             	add    $0xc,%esp
  a0:	50                   	push   %eax
  a1:	68 ae 03 00 00       	push   $0x3ae
  a6:	6a 01                	push   $0x1
  a8:	e8 44 02 00 00       	call   2f1 <write>
}
  ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b0:	c9                   	leave  
  b1:	c3                   	ret    
      exit();
  b2:	e8 1a 02 00 00       	call   2d1 <exit>
  write(fd, s, strlen(s));
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	68 87 03 00 00       	push   $0x387
  bf:	e8 b0 00 00 00       	call   174 <strlen>
  c4:	83 c4 0c             	add    $0xc,%esp
  c7:	50                   	push   %eax
  c8:	68 87 03 00 00       	push   $0x387
  cd:	6a 01                	push   $0x1
  cf:	e8 1d 02 00 00       	call   2f1 <write>
      exit();
  d4:	e8 f8 01 00 00       	call   2d1 <exit>
  write(fd, s, strlen(s));
  d9:	83 ec 0c             	sub    $0xc,%esp
  dc:	68 9b 03 00 00       	push   $0x39b
  e1:	e8 8e 00 00 00       	call   174 <strlen>
  e6:	83 c4 0c             	add    $0xc,%esp
  e9:	50                   	push   %eax
  ea:	68 9b 03 00 00       	push   $0x39b
  ef:	6a 01                	push   $0x1
  f1:	e8 fb 01 00 00       	call   2f1 <write>
    exit();
  f6:	e8 d6 01 00 00       	call   2d1 <exit>
  write(fd, s, strlen(s));
  fb:	83 ec 0c             	sub    $0xc,%esp
  fe:	68 bc 03 00 00       	push   $0x3bc
 103:	e8 6c 00 00 00       	call   174 <strlen>
 108:	83 c4 0c             	add    $0xc,%esp
 10b:	50                   	push   %eax
 10c:	68 bc 03 00 00       	push   $0x3bc
 111:	6a 01                	push   $0x1
 113:	e8 d9 01 00 00       	call   2f1 <write>
    exit();
 118:	e8 b4 01 00 00       	call   2d1 <exit>
 11d:	66 90                	xchg   %ax,%ax
 11f:	90                   	nop

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 4d 08             	mov    0x8(%ebp),%ecx
 127:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 12a:	31 c0                	xor    %eax,%eax
 12c:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 12f:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 132:	40                   	inc    %eax
 133:	84 d2                	test   %dl,%dl
 135:	75 f5                	jne    12c <strcpy+0xc>
    ;
  return os;
}
 137:	89 c8                	mov    %ecx,%eax
 139:	5b                   	pop    %ebx
 13a:	5d                   	pop    %ebp
 13b:	c3                   	ret    

0000013c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 13c:	55                   	push   %ebp
 13d:	89 e5                	mov    %esp,%ebp
 13f:	53                   	push   %ebx
 140:	8b 5d 08             	mov    0x8(%ebp),%ebx
 143:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 146:	0f b6 03             	movzbl (%ebx),%eax
 149:	0f b6 0a             	movzbl (%edx),%ecx
 14c:	84 c0                	test   %al,%al
 14e:	75 10                	jne    160 <strcmp+0x24>
 150:	eb 1a                	jmp    16c <strcmp+0x30>
 152:	66 90                	xchg   %ax,%ax
    p++, q++;
 154:	43                   	inc    %ebx
 155:	42                   	inc    %edx
  while(*p && *p == *q)
 156:	0f b6 03             	movzbl (%ebx),%eax
 159:	0f b6 0a             	movzbl (%edx),%ecx
 15c:	84 c0                	test   %al,%al
 15e:	74 0c                	je     16c <strcmp+0x30>
 160:	38 c8                	cmp    %cl,%al
 162:	74 f0                	je     154 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 164:	29 c8                	sub    %ecx,%eax
}
 166:	5b                   	pop    %ebx
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    
 169:	8d 76 00             	lea    0x0(%esi),%esi
 16c:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 16e:	29 c8                	sub    %ecx,%eax
}
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	90                   	nop

00000174 <strlen>:

uint
strlen(const char *s)
{
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 17a:	80 3a 00             	cmpb   $0x0,(%edx)
 17d:	74 15                	je     194 <strlen+0x20>
 17f:	31 c0                	xor    %eax,%eax
 181:	8d 76 00             	lea    0x0(%esi),%esi
 184:	40                   	inc    %eax
 185:	89 c1                	mov    %eax,%ecx
 187:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 18b:	75 f7                	jne    184 <strlen+0x10>
    ;
  return n;
}
 18d:	89 c8                	mov    %ecx,%eax
 18f:	5d                   	pop    %ebp
 190:	c3                   	ret    
 191:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 194:	31 c9                	xor    %ecx,%ecx
}
 196:	89 c8                	mov    %ecx,%eax
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    
 19a:	66 90                	xchg   %ax,%ax

0000019c <memset>:

void*
memset(void *dst, int c, uint n)
{
 19c:	55                   	push   %ebp
 19d:	89 e5                	mov    %esp,%ebp
 19f:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a0:	8b 7d 08             	mov    0x8(%ebp),%edi
 1a3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a9:	fc                   	cld    
 1aa:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1ac:	8b 45 08             	mov    0x8(%ebp),%eax
 1af:	5f                   	pop    %edi
 1b0:	5d                   	pop    %ebp
 1b1:	c3                   	ret    
 1b2:	66 90                	xchg   %ax,%ax

000001b4 <strchr>:

char*
strchr(const char *s, char c)
{
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 1bd:	8a 10                	mov    (%eax),%dl
 1bf:	84 d2                	test   %dl,%dl
 1c1:	75 0c                	jne    1cf <strchr+0x1b>
 1c3:	eb 13                	jmp    1d8 <strchr+0x24>
 1c5:	8d 76 00             	lea    0x0(%esi),%esi
 1c8:	40                   	inc    %eax
 1c9:	8a 10                	mov    (%eax),%dl
 1cb:	84 d2                	test   %dl,%dl
 1cd:	74 09                	je     1d8 <strchr+0x24>
    if(*s == c)
 1cf:	38 d1                	cmp    %dl,%cl
 1d1:	75 f5                	jne    1c8 <strchr+0x14>
      return (char*)s;
  return 0;
}
 1d3:	5d                   	pop    %ebp
 1d4:	c3                   	ret    
 1d5:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
 1d8:	31 c0                	xor    %eax,%eax
}
 1da:	5d                   	pop    %ebp
 1db:	c3                   	ret    

000001dc <gets>:

char*
gets(char *buf, int max)
{
 1dc:	55                   	push   %ebp
 1dd:	89 e5                	mov    %esp,%ebp
 1df:	57                   	push   %edi
 1e0:	56                   	push   %esi
 1e1:	53                   	push   %ebx
 1e2:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e5:	8b 75 08             	mov    0x8(%ebp),%esi
 1e8:	bb 01 00 00 00       	mov    $0x1,%ebx
 1ed:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
 1ef:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 1f2:	eb 20                	jmp    214 <gets+0x38>
    cc = read(0, &c, 1);
 1f4:	50                   	push   %eax
 1f5:	6a 01                	push   $0x1
 1f7:	57                   	push   %edi
 1f8:	6a 00                	push   $0x0
 1fa:	e8 ea 00 00 00       	call   2e9 <read>
    if(cc < 1)
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	85 c0                	test   %eax,%eax
 204:	7e 16                	jle    21c <gets+0x40>
      break;
    buf[i++] = c;
 206:	8a 45 e7             	mov    -0x19(%ebp),%al
 209:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
 20b:	46                   	inc    %esi
 20c:	3c 0a                	cmp    $0xa,%al
 20e:	74 0c                	je     21c <gets+0x40>
 210:	3c 0d                	cmp    $0xd,%al
 212:	74 08                	je     21c <gets+0x40>
  for(i=0; i+1 < max; ){
 214:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 217:	39 45 0c             	cmp    %eax,0xc(%ebp)
 21a:	7f d8                	jg     1f4 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 21c:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	8d 65 f4             	lea    -0xc(%ebp),%esp
 225:	5b                   	pop    %ebx
 226:	5e                   	pop    %esi
 227:	5f                   	pop    %edi
 228:	5d                   	pop    %ebp
 229:	c3                   	ret    
 22a:	66 90                	xchg   %ax,%ax

0000022c <stat>:

int
stat(const char *n, struct stat *st)
{
 22c:	55                   	push   %ebp
 22d:	89 e5                	mov    %esp,%ebp
 22f:	56                   	push   %esi
 230:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 231:	83 ec 08             	sub    $0x8,%esp
 234:	6a 00                	push   $0x0
 236:	ff 75 08             	pushl  0x8(%ebp)
 239:	e8 d3 00 00 00       	call   311 <open>
  if(fd < 0)
 23e:	83 c4 10             	add    $0x10,%esp
 241:	85 c0                	test   %eax,%eax
 243:	78 27                	js     26c <stat+0x40>
 245:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 247:	83 ec 08             	sub    $0x8,%esp
 24a:	ff 75 0c             	pushl  0xc(%ebp)
 24d:	50                   	push   %eax
 24e:	e8 d6 00 00 00       	call   329 <fstat>
 253:	89 c6                	mov    %eax,%esi
  close(fd);
 255:	89 1c 24             	mov    %ebx,(%esp)
 258:	e8 9c 00 00 00       	call   2f9 <close>
  return r;
 25d:	83 c4 10             	add    $0x10,%esp
}
 260:	89 f0                	mov    %esi,%eax
 262:	8d 65 f8             	lea    -0x8(%ebp),%esp
 265:	5b                   	pop    %ebx
 266:	5e                   	pop    %esi
 267:	5d                   	pop    %ebp
 268:	c3                   	ret    
 269:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 26c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 271:	eb ed                	jmp    260 <stat+0x34>
 273:	90                   	nop

00000274 <atoi>:

int
atoi(const char *s)
{
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	53                   	push   %ebx
 278:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 27b:	0f be 01             	movsbl (%ecx),%eax
 27e:	8d 50 d0             	lea    -0x30(%eax),%edx
 281:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
 284:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 289:	77 16                	ja     2a1 <atoi+0x2d>
 28b:	90                   	nop
    n = n*10 + *s++ - '0';
 28c:	41                   	inc    %ecx
 28d:	8d 14 92             	lea    (%edx,%edx,4),%edx
 290:	01 d2                	add    %edx,%edx
 292:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
 296:	0f be 01             	movsbl (%ecx),%eax
 299:	8d 58 d0             	lea    -0x30(%eax),%ebx
 29c:	80 fb 09             	cmp    $0x9,%bl
 29f:	76 eb                	jbe    28c <atoi+0x18>
  return n;
}
 2a1:	89 d0                	mov    %edx,%eax
 2a3:	5b                   	pop    %ebx
 2a4:	5d                   	pop    %ebp
 2a5:	c3                   	ret    
 2a6:	66 90                	xchg   %ax,%ax

000002a8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a8:	55                   	push   %ebp
 2a9:	89 e5                	mov    %esp,%ebp
 2ab:	57                   	push   %edi
 2ac:	56                   	push   %esi
 2ad:	8b 45 08             	mov    0x8(%ebp),%eax
 2b0:	8b 75 0c             	mov    0xc(%ebp),%esi
 2b3:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b6:	85 d2                	test   %edx,%edx
 2b8:	7e 0b                	jle    2c5 <memmove+0x1d>
 2ba:	01 c2                	add    %eax,%edx
  dst = vdst;
 2bc:	89 c7                	mov    %eax,%edi
 2be:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 2c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2c1:	39 fa                	cmp    %edi,%edx
 2c3:	75 fb                	jne    2c0 <memmove+0x18>
  return vdst;
}
 2c5:	5e                   	pop    %esi
 2c6:	5f                   	pop    %edi
 2c7:	5d                   	pop    %ebp
 2c8:	c3                   	ret    

000002c9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2c9:	b8 01 00 00 00       	mov    $0x1,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <exit>:
SYSCALL(exit)
 2d1:	b8 02 00 00 00       	mov    $0x2,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <wait>:
SYSCALL(wait)
 2d9:	b8 03 00 00 00       	mov    $0x3,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <pipe>:
SYSCALL(pipe)
 2e1:	b8 04 00 00 00       	mov    $0x4,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <read>:
SYSCALL(read)
 2e9:	b8 05 00 00 00       	mov    $0x5,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <write>:
SYSCALL(write)
 2f1:	b8 10 00 00 00       	mov    $0x10,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <close>:
SYSCALL(close)
 2f9:	b8 15 00 00 00       	mov    $0x15,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <kill>:
SYSCALL(kill)
 301:	b8 06 00 00 00       	mov    $0x6,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <exec>:
SYSCALL(exec)
 309:	b8 07 00 00 00       	mov    $0x7,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <open>:
SYSCALL(open)
 311:	b8 0f 00 00 00       	mov    $0xf,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <mknod>:
SYSCALL(mknod)
 319:	b8 11 00 00 00       	mov    $0x11,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <unlink>:
SYSCALL(unlink)
 321:	b8 12 00 00 00       	mov    $0x12,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <fstat>:
SYSCALL(fstat)
 329:	b8 08 00 00 00       	mov    $0x8,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <link>:
SYSCALL(link)
 331:	b8 13 00 00 00       	mov    $0x13,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <mkdir>:
SYSCALL(mkdir)
 339:	b8 14 00 00 00       	mov    $0x14,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <chdir>:
SYSCALL(chdir)
 341:	b8 09 00 00 00       	mov    $0x9,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <dup>:
SYSCALL(dup)
 349:	b8 0a 00 00 00       	mov    $0xa,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <getpid>:
SYSCALL(getpid)
 351:	b8 0b 00 00 00       	mov    $0xb,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <sbrk>:
SYSCALL(sbrk)
 359:	b8 0c 00 00 00       	mov    $0xc,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <sleep>:
SYSCALL(sleep)
 361:	b8 0d 00 00 00       	mov    $0xd,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <uptime>:
SYSCALL(uptime)
 369:	b8 0e 00 00 00       	mov    $0xe,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <getreadcount>:
 371:	b8 16 00 00 00       	mov    $0x16,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    
