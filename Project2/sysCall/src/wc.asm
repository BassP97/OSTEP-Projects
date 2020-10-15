
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  19:	8b 59 04             	mov    0x4(%ecx),%ebx
  int fd, i;

  if(argc <= 1){
  1c:	48                   	dec    %eax
  1d:	7e 56                	jle    75 <main+0x75>
  1f:	83 c3 04             	add    $0x4,%ebx
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  22:	be 01 00 00 00       	mov    $0x1,%esi
  27:	90                   	nop
    if((fd = open(argv[i], 0)) < 0){
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	6a 00                	push   $0x0
  2d:	ff 33                	pushl  (%ebx)
  2f:	e8 05 03 00 00       	call   339 <open>
  34:	89 c7                	mov    %eax,%edi
  36:	83 c4 10             	add    $0x10,%esp
  39:	85 c0                	test   %eax,%eax
  3b:	78 24                	js     61 <main+0x61>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  3d:	83 ec 08             	sub    $0x8,%esp
  40:	ff 33                	pushl  (%ebx)
  42:	50                   	push   %eax
  43:	e8 40 00 00 00       	call   88 <wc>
    close(fd);
  48:	89 3c 24             	mov    %edi,(%esp)
  4b:	e8 d1 02 00 00       	call   321 <close>
  for(i = 1; i < argc; i++){
  50:	46                   	inc    %esi
  51:	83 c3 04             	add    $0x4,%ebx
  54:	83 c4 10             	add    $0x10,%esp
  57:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  5a:	75 cc                	jne    28 <main+0x28>
  }
  exit();
  5c:	e8 98 02 00 00       	call   2f9 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  61:	50                   	push   %eax
  62:	ff 33                	pushl  (%ebx)
  64:	68 5b 07 00 00       	push   $0x75b
  69:	6a 01                	push   $0x1
  6b:	e8 bc 03 00 00       	call   42c <printf>
      exit();
  70:	e8 84 02 00 00       	call   2f9 <exit>
    wc(0, "");
  75:	52                   	push   %edx
  76:	52                   	push   %edx
  77:	68 4d 07 00 00       	push   $0x74d
  7c:	6a 00                	push   $0x0
  7e:	e8 05 00 00 00       	call   88 <wc>
    exit();
  83:	e8 71 02 00 00       	call   2f9 <exit>

00000088 <wc>:
{
  88:	55                   	push   %ebp
  89:	89 e5                	mov    %esp,%ebp
  8b:	57                   	push   %edi
  8c:	56                   	push   %esi
  8d:	53                   	push   %ebx
  8e:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  91:	31 f6                	xor    %esi,%esi
  l = w = c = 0;
  93:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  9a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  a1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  a8:	52                   	push   %edx
  a9:	68 00 02 00 00       	push   $0x200
  ae:	68 80 0a 00 00       	push   $0xa80
  b3:	ff 75 08             	pushl  0x8(%ebp)
  b6:	e8 56 02 00 00       	call   311 <read>
  bb:	89 c3                	mov    %eax,%ebx
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	85 c0                	test   %eax,%eax
  c2:	7e 48                	jle    10c <wc+0x84>
    for(i=0; i<n; i++){
  c4:	31 ff                	xor    %edi,%edi
  c6:	eb 07                	jmp    cf <wc+0x47>
        inword = 0;
  c8:	31 f6                	xor    %esi,%esi
    for(i=0; i<n; i++){
  ca:	47                   	inc    %edi
  cb:	39 fb                	cmp    %edi,%ebx
  cd:	74 35                	je     104 <wc+0x7c>
      if(buf[i] == '\n')
  cf:	0f be 87 80 0a 00 00 	movsbl 0xa80(%edi),%eax
  d6:	3c 0a                	cmp    $0xa,%al
  d8:	75 03                	jne    dd <wc+0x55>
        l++;
  da:	ff 45 e4             	incl   -0x1c(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  dd:	83 ec 08             	sub    $0x8,%esp
  e0:	50                   	push   %eax
  e1:	68 38 07 00 00       	push   $0x738
  e6:	e8 f1 00 00 00       	call   1dc <strchr>
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	85 c0                	test   %eax,%eax
  f0:	75 d6                	jne    c8 <wc+0x40>
      else if(!inword){
  f2:	85 f6                	test   %esi,%esi
  f4:	75 d4                	jne    ca <wc+0x42>
        w++;
  f6:	ff 45 e0             	incl   -0x20(%ebp)
        inword = 1;
  f9:	be 01 00 00 00       	mov    $0x1,%esi
    for(i=0; i<n; i++){
  fe:	47                   	inc    %edi
  ff:	39 fb                	cmp    %edi,%ebx
 101:	75 cc                	jne    cf <wc+0x47>
 103:	90                   	nop
 104:	01 5d dc             	add    %ebx,-0x24(%ebp)
 107:	eb 9f                	jmp    a8 <wc+0x20>
 109:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 10c:	75 26                	jne    134 <wc+0xac>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 10e:	83 ec 08             	sub    $0x8,%esp
 111:	ff 75 0c             	pushl  0xc(%ebp)
 114:	ff 75 dc             	pushl  -0x24(%ebp)
 117:	ff 75 e0             	pushl  -0x20(%ebp)
 11a:	ff 75 e4             	pushl  -0x1c(%ebp)
 11d:	68 4e 07 00 00       	push   $0x74e
 122:	6a 01                	push   $0x1
 124:	e8 03 03 00 00       	call   42c <printf>
}
 129:	83 c4 20             	add    $0x20,%esp
 12c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 12f:	5b                   	pop    %ebx
 130:	5e                   	pop    %esi
 131:	5f                   	pop    %edi
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    
    printf(1, "wc: read error\n");
 134:	50                   	push   %eax
 135:	50                   	push   %eax
 136:	68 3e 07 00 00       	push   $0x73e
 13b:	6a 01                	push   $0x1
 13d:	e8 ea 02 00 00       	call   42c <printf>
    exit();
 142:	e8 b2 01 00 00       	call   2f9 <exit>
 147:	90                   	nop

00000148 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	53                   	push   %ebx
 14c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 14f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 152:	31 c0                	xor    %eax,%eax
 154:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 157:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 15a:	40                   	inc    %eax
 15b:	84 d2                	test   %dl,%dl
 15d:	75 f5                	jne    154 <strcpy+0xc>
    ;
  return os;
}
 15f:	89 c8                	mov    %ecx,%eax
 161:	5b                   	pop    %ebx
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    

00000164 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	53                   	push   %ebx
 168:	8b 5d 08             	mov    0x8(%ebp),%ebx
 16b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 16e:	0f b6 03             	movzbl (%ebx),%eax
 171:	0f b6 0a             	movzbl (%edx),%ecx
 174:	84 c0                	test   %al,%al
 176:	75 10                	jne    188 <strcmp+0x24>
 178:	eb 1a                	jmp    194 <strcmp+0x30>
 17a:	66 90                	xchg   %ax,%ax
    p++, q++;
 17c:	43                   	inc    %ebx
 17d:	42                   	inc    %edx
  while(*p && *p == *q)
 17e:	0f b6 03             	movzbl (%ebx),%eax
 181:	0f b6 0a             	movzbl (%edx),%ecx
 184:	84 c0                	test   %al,%al
 186:	74 0c                	je     194 <strcmp+0x30>
 188:	38 c8                	cmp    %cl,%al
 18a:	74 f0                	je     17c <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 18c:	29 c8                	sub    %ecx,%eax
}
 18e:	5b                   	pop    %ebx
 18f:	5d                   	pop    %ebp
 190:	c3                   	ret    
 191:	8d 76 00             	lea    0x0(%esi),%esi
 194:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 196:	29 c8                	sub    %ecx,%eax
}
 198:	5b                   	pop    %ebx
 199:	5d                   	pop    %ebp
 19a:	c3                   	ret    
 19b:	90                   	nop

0000019c <strlen>:

uint
strlen(const char *s)
{
 19c:	55                   	push   %ebp
 19d:	89 e5                	mov    %esp,%ebp
 19f:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1a2:	80 3a 00             	cmpb   $0x0,(%edx)
 1a5:	74 15                	je     1bc <strlen+0x20>
 1a7:	31 c0                	xor    %eax,%eax
 1a9:	8d 76 00             	lea    0x0(%esi),%esi
 1ac:	40                   	inc    %eax
 1ad:	89 c1                	mov    %eax,%ecx
 1af:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1b3:	75 f7                	jne    1ac <strlen+0x10>
    ;
  return n;
}
 1b5:	89 c8                	mov    %ecx,%eax
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
 1b9:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 1bc:	31 c9                	xor    %ecx,%ecx
}
 1be:	89 c8                	mov    %ecx,%eax
 1c0:	5d                   	pop    %ebp
 1c1:	c3                   	ret    
 1c2:	66 90                	xchg   %ax,%ax

000001c4 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c8:	8b 7d 08             	mov    0x8(%ebp),%edi
 1cb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d1:	fc                   	cld    
 1d2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	5f                   	pop    %edi
 1d8:	5d                   	pop    %ebp
 1d9:	c3                   	ret    
 1da:	66 90                	xchg   %ax,%ax

000001dc <strchr>:

char*
strchr(const char *s, char c)
{
 1dc:	55                   	push   %ebp
 1dd:	89 e5                	mov    %esp,%ebp
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 1e5:	8a 10                	mov    (%eax),%dl
 1e7:	84 d2                	test   %dl,%dl
 1e9:	75 0c                	jne    1f7 <strchr+0x1b>
 1eb:	eb 13                	jmp    200 <strchr+0x24>
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
 1f0:	40                   	inc    %eax
 1f1:	8a 10                	mov    (%eax),%dl
 1f3:	84 d2                	test   %dl,%dl
 1f5:	74 09                	je     200 <strchr+0x24>
    if(*s == c)
 1f7:	38 d1                	cmp    %dl,%cl
 1f9:	75 f5                	jne    1f0 <strchr+0x14>
      return (char*)s;
  return 0;
}
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
 200:	31 c0                	xor    %eax,%eax
}
 202:	5d                   	pop    %ebp
 203:	c3                   	ret    

00000204 <gets>:

char*
gets(char *buf, int max)
{
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	56                   	push   %esi
 209:	53                   	push   %ebx
 20a:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 20d:	8b 75 08             	mov    0x8(%ebp),%esi
 210:	bb 01 00 00 00       	mov    $0x1,%ebx
 215:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
 217:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 21a:	eb 20                	jmp    23c <gets+0x38>
    cc = read(0, &c, 1);
 21c:	50                   	push   %eax
 21d:	6a 01                	push   $0x1
 21f:	57                   	push   %edi
 220:	6a 00                	push   $0x0
 222:	e8 ea 00 00 00       	call   311 <read>
    if(cc < 1)
 227:	83 c4 10             	add    $0x10,%esp
 22a:	85 c0                	test   %eax,%eax
 22c:	7e 16                	jle    244 <gets+0x40>
      break;
    buf[i++] = c;
 22e:	8a 45 e7             	mov    -0x19(%ebp),%al
 231:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
 233:	46                   	inc    %esi
 234:	3c 0a                	cmp    $0xa,%al
 236:	74 0c                	je     244 <gets+0x40>
 238:	3c 0d                	cmp    $0xd,%al
 23a:	74 08                	je     244 <gets+0x40>
  for(i=0; i+1 < max; ){
 23c:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 23f:	39 45 0c             	cmp    %eax,0xc(%ebp)
 242:	7f d8                	jg     21c <gets+0x18>
      break;
  }
  buf[i] = '\0';
 244:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
 247:	8b 45 08             	mov    0x8(%ebp),%eax
 24a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24d:	5b                   	pop    %ebx
 24e:	5e                   	pop    %esi
 24f:	5f                   	pop    %edi
 250:	5d                   	pop    %ebp
 251:	c3                   	ret    
 252:	66 90                	xchg   %ax,%ax

00000254 <stat>:

int
stat(const char *n, struct stat *st)
{
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	56                   	push   %esi
 258:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 259:	83 ec 08             	sub    $0x8,%esp
 25c:	6a 00                	push   $0x0
 25e:	ff 75 08             	pushl  0x8(%ebp)
 261:	e8 d3 00 00 00       	call   339 <open>
  if(fd < 0)
 266:	83 c4 10             	add    $0x10,%esp
 269:	85 c0                	test   %eax,%eax
 26b:	78 27                	js     294 <stat+0x40>
 26d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 26f:	83 ec 08             	sub    $0x8,%esp
 272:	ff 75 0c             	pushl  0xc(%ebp)
 275:	50                   	push   %eax
 276:	e8 d6 00 00 00       	call   351 <fstat>
 27b:	89 c6                	mov    %eax,%esi
  close(fd);
 27d:	89 1c 24             	mov    %ebx,(%esp)
 280:	e8 9c 00 00 00       	call   321 <close>
  return r;
 285:	83 c4 10             	add    $0x10,%esp
}
 288:	89 f0                	mov    %esi,%eax
 28a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 28d:	5b                   	pop    %ebx
 28e:	5e                   	pop    %esi
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret    
 291:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 294:	be ff ff ff ff       	mov    $0xffffffff,%esi
 299:	eb ed                	jmp    288 <stat+0x34>
 29b:	90                   	nop

0000029c <atoi>:

int
atoi(const char *s)
{
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
 29f:	53                   	push   %ebx
 2a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2a3:	0f be 01             	movsbl (%ecx),%eax
 2a6:	8d 50 d0             	lea    -0x30(%eax),%edx
 2a9:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
 2ac:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2b1:	77 16                	ja     2c9 <atoi+0x2d>
 2b3:	90                   	nop
    n = n*10 + *s++ - '0';
 2b4:	41                   	inc    %ecx
 2b5:	8d 14 92             	lea    (%edx,%edx,4),%edx
 2b8:	01 d2                	add    %edx,%edx
 2ba:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
 2be:	0f be 01             	movsbl (%ecx),%eax
 2c1:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c4:	80 fb 09             	cmp    $0x9,%bl
 2c7:	76 eb                	jbe    2b4 <atoi+0x18>
  return n;
}
 2c9:	89 d0                	mov    %edx,%eax
 2cb:	5b                   	pop    %ebx
 2cc:	5d                   	pop    %ebp
 2cd:	c3                   	ret    
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	56                   	push   %esi
 2d5:	8b 45 08             	mov    0x8(%ebp),%eax
 2d8:	8b 75 0c             	mov    0xc(%ebp),%esi
 2db:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2de:	85 d2                	test   %edx,%edx
 2e0:	7e 0b                	jle    2ed <memmove+0x1d>
 2e2:	01 c2                	add    %eax,%edx
  dst = vdst;
 2e4:	89 c7                	mov    %eax,%edi
 2e6:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 2e8:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2e9:	39 fa                	cmp    %edi,%edx
 2eb:	75 fb                	jne    2e8 <memmove+0x18>
  return vdst;
}
 2ed:	5e                   	pop    %esi
 2ee:	5f                   	pop    %edi
 2ef:	5d                   	pop    %ebp
 2f0:	c3                   	ret    

000002f1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2f1:	b8 01 00 00 00       	mov    $0x1,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <exit>:
SYSCALL(exit)
 2f9:	b8 02 00 00 00       	mov    $0x2,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <wait>:
SYSCALL(wait)
 301:	b8 03 00 00 00       	mov    $0x3,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <pipe>:
SYSCALL(pipe)
 309:	b8 04 00 00 00       	mov    $0x4,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <read>:
SYSCALL(read)
 311:	b8 05 00 00 00       	mov    $0x5,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <write>:
SYSCALL(write)
 319:	b8 10 00 00 00       	mov    $0x10,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <close>:
SYSCALL(close)
 321:	b8 15 00 00 00       	mov    $0x15,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <kill>:
SYSCALL(kill)
 329:	b8 06 00 00 00       	mov    $0x6,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <exec>:
SYSCALL(exec)
 331:	b8 07 00 00 00       	mov    $0x7,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <open>:
SYSCALL(open)
 339:	b8 0f 00 00 00       	mov    $0xf,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <mknod>:
SYSCALL(mknod)
 341:	b8 11 00 00 00       	mov    $0x11,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <unlink>:
SYSCALL(unlink)
 349:	b8 12 00 00 00       	mov    $0x12,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <fstat>:
SYSCALL(fstat)
 351:	b8 08 00 00 00       	mov    $0x8,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <link>:
SYSCALL(link)
 359:	b8 13 00 00 00       	mov    $0x13,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <mkdir>:
SYSCALL(mkdir)
 361:	b8 14 00 00 00       	mov    $0x14,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <chdir>:
SYSCALL(chdir)
 369:	b8 09 00 00 00       	mov    $0x9,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <dup>:
SYSCALL(dup)
 371:	b8 0a 00 00 00       	mov    $0xa,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <getpid>:
SYSCALL(getpid)
 379:	b8 0b 00 00 00       	mov    $0xb,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <sbrk>:
SYSCALL(sbrk)
 381:	b8 0c 00 00 00       	mov    $0xc,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <sleep>:
SYSCALL(sleep)
 389:	b8 0d 00 00 00       	mov    $0xd,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <uptime>:
SYSCALL(uptime)
 391:	b8 0e 00 00 00       	mov    $0xe,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <getreadcount>:
 399:	b8 16 00 00 00       	mov    $0x16,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    
 3a1:	66 90                	xchg   %ax,%ax
 3a3:	90                   	nop

000003a4 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	57                   	push   %edi
 3a8:	56                   	push   %esi
 3a9:	53                   	push   %ebx
 3aa:	83 ec 3c             	sub    $0x3c,%esp
 3ad:	89 45 bc             	mov    %eax,-0x44(%ebp)
 3b0:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3b3:	89 d1                	mov    %edx,%ecx
  if(sgn && xx < 0){
 3b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3b8:	85 db                	test   %ebx,%ebx
 3ba:	74 04                	je     3c0 <printint+0x1c>
 3bc:	85 d2                	test   %edx,%edx
 3be:	78 68                	js     428 <printint+0x84>
  neg = 0;
 3c0:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3c7:	31 ff                	xor    %edi,%edi
 3c9:	8d 75 d7             	lea    -0x29(%ebp),%esi
  do{
    buf[i++] = digits[x % base];
 3cc:	89 c8                	mov    %ecx,%eax
 3ce:	31 d2                	xor    %edx,%edx
 3d0:	f7 75 c4             	divl   -0x3c(%ebp)
 3d3:	89 fb                	mov    %edi,%ebx
 3d5:	8d 7f 01             	lea    0x1(%edi),%edi
 3d8:	8a 92 78 07 00 00    	mov    0x778(%edx),%dl
 3de:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
  }while((x /= base) != 0);
 3e2:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 3e5:	89 c1                	mov    %eax,%ecx
 3e7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3ea:	3b 45 c0             	cmp    -0x40(%ebp),%eax
 3ed:	76 dd                	jbe    3cc <printint+0x28>
  if(neg)
 3ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3f2:	85 c9                	test   %ecx,%ecx
 3f4:	74 09                	je     3ff <printint+0x5b>
    buf[i++] = '-';
 3f6:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
 3fb:	89 fb                	mov    %edi,%ebx
    buf[i++] = '-';
 3fd:	b2 2d                	mov    $0x2d,%dl

  while(--i >= 0)
 3ff:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 403:	8b 7d bc             	mov    -0x44(%ebp),%edi
 406:	eb 03                	jmp    40b <printint+0x67>
 408:	8a 13                	mov    (%ebx),%dl
 40a:	4b                   	dec    %ebx
    putc(fd, buf[i]);
 40b:	88 55 d7             	mov    %dl,-0x29(%ebp)
  write(fd, &c, 1);
 40e:	50                   	push   %eax
 40f:	6a 01                	push   $0x1
 411:	56                   	push   %esi
 412:	57                   	push   %edi
 413:	e8 01 ff ff ff       	call   319 <write>
  while(--i >= 0)
 418:	83 c4 10             	add    $0x10,%esp
 41b:	39 de                	cmp    %ebx,%esi
 41d:	75 e9                	jne    408 <printint+0x64>
}
 41f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 422:	5b                   	pop    %ebx
 423:	5e                   	pop    %esi
 424:	5f                   	pop    %edi
 425:	5d                   	pop    %ebp
 426:	c3                   	ret    
 427:	90                   	nop
    x = -xx;
 428:	f7 d9                	neg    %ecx
 42a:	eb 9b                	jmp    3c7 <printint+0x23>

0000042c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	57                   	push   %edi
 430:	56                   	push   %esi
 431:	53                   	push   %ebx
 432:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 435:	8b 75 0c             	mov    0xc(%ebp),%esi
 438:	8a 1e                	mov    (%esi),%bl
 43a:	84 db                	test   %bl,%bl
 43c:	0f 84 a3 00 00 00    	je     4e5 <printf+0xb9>
 442:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 443:	8d 45 10             	lea    0x10(%ebp),%eax
 446:	89 45 d0             	mov    %eax,-0x30(%ebp)
  state = 0;
 449:	31 d2                	xor    %edx,%edx
  write(fd, &c, 1);
 44b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 44e:	eb 29                	jmp    479 <printf+0x4d>
 450:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 453:	83 f8 25             	cmp    $0x25,%eax
 456:	0f 84 94 00 00 00    	je     4f0 <printf+0xc4>
        state = '%';
      } else {
        putc(fd, c);
 45c:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 45f:	50                   	push   %eax
 460:	6a 01                	push   $0x1
 462:	57                   	push   %edi
 463:	ff 75 08             	pushl  0x8(%ebp)
 466:	e8 ae fe ff ff       	call   319 <write>
        putc(fd, c);
 46b:	83 c4 10             	add    $0x10,%esp
 46e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  for(i = 0; fmt[i]; i++){
 471:	46                   	inc    %esi
 472:	8a 5e ff             	mov    -0x1(%esi),%bl
 475:	84 db                	test   %bl,%bl
 477:	74 6c                	je     4e5 <printf+0xb9>
    c = fmt[i] & 0xff;
 479:	0f be cb             	movsbl %bl,%ecx
 47c:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 47f:	85 d2                	test   %edx,%edx
 481:	74 cd                	je     450 <printf+0x24>
      }
    } else if(state == '%'){
 483:	83 fa 25             	cmp    $0x25,%edx
 486:	75 e9                	jne    471 <printf+0x45>
      if(c == 'd'){
 488:	83 f8 64             	cmp    $0x64,%eax
 48b:	0f 84 97 00 00 00    	je     528 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 491:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 497:	83 f9 70             	cmp    $0x70,%ecx
 49a:	74 60                	je     4fc <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 49c:	83 f8 73             	cmp    $0x73,%eax
 49f:	0f 84 8f 00 00 00    	je     534 <printf+0x108>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4a5:	83 f8 63             	cmp    $0x63,%eax
 4a8:	0f 84 d6 00 00 00    	je     584 <printf+0x158>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4ae:	83 f8 25             	cmp    $0x25,%eax
 4b1:	0f 84 c1 00 00 00    	je     578 <printf+0x14c>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 4b7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 4bb:	50                   	push   %eax
 4bc:	6a 01                	push   $0x1
 4be:	57                   	push   %edi
 4bf:	ff 75 08             	pushl  0x8(%ebp)
 4c2:	e8 52 fe ff ff       	call   319 <write>
        putc(fd, c);
 4c7:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 4ca:	83 c4 0c             	add    $0xc,%esp
 4cd:	6a 01                	push   $0x1
 4cf:	57                   	push   %edi
 4d0:	ff 75 08             	pushl  0x8(%ebp)
 4d3:	e8 41 fe ff ff       	call   319 <write>
        putc(fd, c);
 4d8:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 4db:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 4dd:	46                   	inc    %esi
 4de:	8a 5e ff             	mov    -0x1(%esi),%bl
 4e1:	84 db                	test   %bl,%bl
 4e3:	75 94                	jne    479 <printf+0x4d>
    }
  }
}
 4e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e8:	5b                   	pop    %ebx
 4e9:	5e                   	pop    %esi
 4ea:	5f                   	pop    %edi
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret    
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
        state = '%';
 4f0:	ba 25 00 00 00       	mov    $0x25,%edx
 4f5:	e9 77 ff ff ff       	jmp    471 <printf+0x45>
 4fa:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 4fc:	83 ec 0c             	sub    $0xc,%esp
 4ff:	6a 00                	push   $0x0
 501:	b9 10 00 00 00       	mov    $0x10,%ecx
 506:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 509:	8b 13                	mov    (%ebx),%edx
 50b:	8b 45 08             	mov    0x8(%ebp),%eax
 50e:	e8 91 fe ff ff       	call   3a4 <printint>
        ap++;
 513:	89 d8                	mov    %ebx,%eax
 515:	83 c0 04             	add    $0x4,%eax
 518:	89 45 d0             	mov    %eax,-0x30(%ebp)
 51b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 51e:	31 d2                	xor    %edx,%edx
        ap++;
 520:	e9 4c ff ff ff       	jmp    471 <printf+0x45>
 525:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 528:	83 ec 0c             	sub    $0xc,%esp
 52b:	6a 01                	push   $0x1
 52d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 532:	eb d2                	jmp    506 <printf+0xda>
        s = (char*)*ap;
 534:	8b 45 d0             	mov    -0x30(%ebp),%eax
 537:	8b 18                	mov    (%eax),%ebx
        ap++;
 539:	83 c0 04             	add    $0x4,%eax
 53c:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 53f:	85 db                	test   %ebx,%ebx
 541:	74 65                	je     5a8 <printf+0x17c>
        while(*s != 0){
 543:	8a 03                	mov    (%ebx),%al
 545:	84 c0                	test   %al,%al
 547:	74 70                	je     5b9 <printf+0x18d>
 549:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 54c:	89 de                	mov    %ebx,%esi
 54e:	8b 5d 08             	mov    0x8(%ebp),%ebx
 551:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 554:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 557:	50                   	push   %eax
 558:	6a 01                	push   $0x1
 55a:	57                   	push   %edi
 55b:	53                   	push   %ebx
 55c:	e8 b8 fd ff ff       	call   319 <write>
          s++;
 561:	46                   	inc    %esi
        while(*s != 0){
 562:	8a 06                	mov    (%esi),%al
 564:	83 c4 10             	add    $0x10,%esp
 567:	84 c0                	test   %al,%al
 569:	75 e9                	jne    554 <printf+0x128>
 56b:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 56e:	31 d2                	xor    %edx,%edx
 570:	e9 fc fe ff ff       	jmp    471 <printf+0x45>
 575:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 578:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 57b:	52                   	push   %edx
 57c:	e9 4c ff ff ff       	jmp    4cd <printf+0xa1>
 581:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, *ap);
 584:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 587:	8b 03                	mov    (%ebx),%eax
 589:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 58c:	51                   	push   %ecx
 58d:	6a 01                	push   $0x1
 58f:	57                   	push   %edi
 590:	ff 75 08             	pushl  0x8(%ebp)
 593:	e8 81 fd ff ff       	call   319 <write>
        ap++;
 598:	83 c3 04             	add    $0x4,%ebx
 59b:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 59e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5a1:	31 d2                	xor    %edx,%edx
 5a3:	e9 c9 fe ff ff       	jmp    471 <printf+0x45>
          s = "(null)";
 5a8:	bb 6f 07 00 00       	mov    $0x76f,%ebx
        while(*s != 0){
 5ad:	b0 28                	mov    $0x28,%al
 5af:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5b2:	89 de                	mov    %ebx,%esi
 5b4:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5b7:	eb 9b                	jmp    554 <printf+0x128>
      state = 0;
 5b9:	31 d2                	xor    %edx,%edx
 5bb:	e9 b1 fe ff ff       	jmp    471 <printf+0x45>

000005c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5c9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5cc:	a1 60 0a 00 00       	mov    0xa60,%eax
 5d1:	8b 10                	mov    (%eax),%edx
 5d3:	39 c8                	cmp    %ecx,%eax
 5d5:	73 11                	jae    5e8 <free+0x28>
 5d7:	90                   	nop
 5d8:	39 d1                	cmp    %edx,%ecx
 5da:	72 14                	jb     5f0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5dc:	39 d0                	cmp    %edx,%eax
 5de:	73 10                	jae    5f0 <free+0x30>
{
 5e0:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e2:	8b 10                	mov    (%eax),%edx
 5e4:	39 c8                	cmp    %ecx,%eax
 5e6:	72 f0                	jb     5d8 <free+0x18>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e8:	39 d0                	cmp    %edx,%eax
 5ea:	72 f4                	jb     5e0 <free+0x20>
 5ec:	39 d1                	cmp    %edx,%ecx
 5ee:	73 f0                	jae    5e0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5f3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5f6:	39 fa                	cmp    %edi,%edx
 5f8:	74 1a                	je     614 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5fd:	8b 50 04             	mov    0x4(%eax),%edx
 600:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 603:	39 f1                	cmp    %esi,%ecx
 605:	74 24                	je     62b <free+0x6b>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 607:	89 08                	mov    %ecx,(%eax)
  freep = p;
 609:	a3 60 0a 00 00       	mov    %eax,0xa60
}
 60e:	5b                   	pop    %ebx
 60f:	5e                   	pop    %esi
 610:	5f                   	pop    %edi
 611:	5d                   	pop    %ebp
 612:	c3                   	ret    
 613:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 614:	03 72 04             	add    0x4(%edx),%esi
 617:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 61a:	8b 10                	mov    (%eax),%edx
 61c:	8b 12                	mov    (%edx),%edx
 61e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 621:	8b 50 04             	mov    0x4(%eax),%edx
 624:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 627:	39 f1                	cmp    %esi,%ecx
 629:	75 dc                	jne    607 <free+0x47>
    p->s.size += bp->s.size;
 62b:	03 53 fc             	add    -0x4(%ebx),%edx
 62e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 631:	8b 53 f8             	mov    -0x8(%ebx),%edx
 634:	89 10                	mov    %edx,(%eax)
  freep = p;
 636:	a3 60 0a 00 00       	mov    %eax,0xa60
}
 63b:	5b                   	pop    %ebx
 63c:	5e                   	pop    %esi
 63d:	5f                   	pop    %edi
 63e:	5d                   	pop    %ebp
 63f:	c3                   	ret    

00000640 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 649:	8b 45 08             	mov    0x8(%ebp),%eax
 64c:	8d 70 07             	lea    0x7(%eax),%esi
 64f:	c1 ee 03             	shr    $0x3,%esi
 652:	46                   	inc    %esi
  if((prevp = freep) == 0){
 653:	8b 3d 60 0a 00 00    	mov    0xa60,%edi
 659:	85 ff                	test   %edi,%edi
 65b:	0f 84 a3 00 00 00    	je     704 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 661:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 663:	8b 48 04             	mov    0x4(%eax),%ecx
 666:	39 f1                	cmp    %esi,%ecx
 668:	73 67                	jae    6d1 <malloc+0x91>
 66a:	89 f3                	mov    %esi,%ebx
 66c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 672:	0f 82 80 00 00 00    	jb     6f8 <malloc+0xb8>
  p = sbrk(nu * sizeof(Header));
 678:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 67f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 682:	eb 11                	jmp    695 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 684:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 686:	8b 4a 04             	mov    0x4(%edx),%ecx
 689:	39 f1                	cmp    %esi,%ecx
 68b:	73 4b                	jae    6d8 <malloc+0x98>
 68d:	8b 3d 60 0a 00 00    	mov    0xa60,%edi
 693:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 695:	39 c7                	cmp    %eax,%edi
 697:	75 eb                	jne    684 <malloc+0x44>
  p = sbrk(nu * sizeof(Header));
 699:	83 ec 0c             	sub    $0xc,%esp
 69c:	ff 75 e4             	pushl  -0x1c(%ebp)
 69f:	e8 dd fc ff ff       	call   381 <sbrk>
  if(p == (char*)-1)
 6a4:	83 c4 10             	add    $0x10,%esp
 6a7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6aa:	74 1b                	je     6c7 <malloc+0x87>
  hp->s.size = nu;
 6ac:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6af:	83 ec 0c             	sub    $0xc,%esp
 6b2:	83 c0 08             	add    $0x8,%eax
 6b5:	50                   	push   %eax
 6b6:	e8 05 ff ff ff       	call   5c0 <free>
  return freep;
 6bb:	a1 60 0a 00 00       	mov    0xa60,%eax
      if((p = morecore(nunits)) == 0)
 6c0:	83 c4 10             	add    $0x10,%esp
 6c3:	85 c0                	test   %eax,%eax
 6c5:	75 bd                	jne    684 <malloc+0x44>
        return 0;
 6c7:	31 c0                	xor    %eax,%eax
  }
}
 6c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cc:	5b                   	pop    %ebx
 6cd:	5e                   	pop    %esi
 6ce:	5f                   	pop    %edi
 6cf:	5d                   	pop    %ebp
 6d0:	c3                   	ret    
    if(p->s.size >= nunits){
 6d1:	89 c2                	mov    %eax,%edx
 6d3:	89 f8                	mov    %edi,%eax
 6d5:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6d8:	39 ce                	cmp    %ecx,%esi
 6da:	74 54                	je     730 <malloc+0xf0>
        p->s.size -= nunits;
 6dc:	29 f1                	sub    %esi,%ecx
 6de:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 6e1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 6e4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 6e7:	a3 60 0a 00 00       	mov    %eax,0xa60
      return (void*)(p + 1);
 6ec:	8d 42 08             	lea    0x8(%edx),%eax
}
 6ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6f2:	5b                   	pop    %ebx
 6f3:	5e                   	pop    %esi
 6f4:	5f                   	pop    %edi
 6f5:	5d                   	pop    %ebp
 6f6:	c3                   	ret    
 6f7:	90                   	nop
 6f8:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6fd:	e9 76 ff ff ff       	jmp    678 <malloc+0x38>
 702:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 704:	c7 05 60 0a 00 00 64 	movl   $0xa64,0xa60
 70b:	0a 00 00 
 70e:	c7 05 64 0a 00 00 64 	movl   $0xa64,0xa64
 715:	0a 00 00 
    base.s.size = 0;
 718:	c7 05 68 0a 00 00 00 	movl   $0x0,0xa68
 71f:	00 00 00 
 722:	bf 64 0a 00 00       	mov    $0xa64,%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 727:	89 f8                	mov    %edi,%eax
 729:	e9 3c ff ff ff       	jmp    66a <malloc+0x2a>
 72e:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 730:	8b 0a                	mov    (%edx),%ecx
 732:	89 08                	mov    %ecx,(%eax)
 734:	eb b1                	jmp    6e7 <malloc+0xa7>
