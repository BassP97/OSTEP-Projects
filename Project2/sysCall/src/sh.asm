
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	52                   	push   %edx
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
   f:	eb 0c                	jmp    1d <main+0x1d>
  11:	8d 76 00             	lea    0x0(%esi),%esi
    if(fd >= 3){
  14:	83 f8 02             	cmp    $0x2,%eax
  17:	0f 8f af 00 00 00    	jg     cc <main+0xcc>
  while((fd = open("console", O_RDWR)) >= 0){
  1d:	83 ec 08             	sub    $0x8,%esp
  20:	6a 02                	push   $0x2
  22:	68 85 10 00 00       	push   $0x1085
  27:	e8 b9 0b 00 00       	call   be5 <open>
  2c:	83 c4 10             	add    $0x10,%esp
  2f:	85 c0                	test   %eax,%eax
  31:	79 e1                	jns    14 <main+0x14>
  33:	eb 2a                	jmp    5f <main+0x5f>
  35:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
  38:	80 3d c2 16 00 00 20 	cmpb   $0x20,0x16c2
  3f:	74 4d                	je     8e <main+0x8e>
  41:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
  44:	e8 54 0b 00 00       	call   b9d <fork>
  if(pid == -1)
  49:	83 f8 ff             	cmp    $0xffffffff,%eax
  4c:	0f 84 9d 00 00 00    	je     ef <main+0xef>
    if(fork1() == 0)
  52:	85 c0                	test   %eax,%eax
  54:	0f 84 80 00 00 00    	je     da <main+0xda>
    wait();
  5a:	e8 4e 0b 00 00       	call   bad <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
  5f:	83 ec 08             	sub    $0x8,%esp
  62:	6a 64                	push   $0x64
  64:	68 c0 16 00 00       	push   $0x16c0
  69:	e8 8e 00 00 00       	call   fc <getcmd>
  6e:	83 c4 10             	add    $0x10,%esp
  71:	85 c0                	test   %eax,%eax
  73:	78 14                	js     89 <main+0x89>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
  75:	80 3d c0 16 00 00 63 	cmpb   $0x63,0x16c0
  7c:	75 c6                	jne    44 <main+0x44>
  7e:	80 3d c1 16 00 00 64 	cmpb   $0x64,0x16c1
  85:	75 bd                	jne    44 <main+0x44>
  87:	eb af                	jmp    38 <main+0x38>
  exit();
  89:	e8 17 0b 00 00       	call   ba5 <exit>
      buf[strlen(buf)-1] = 0;  // chop \n
  8e:	83 ec 0c             	sub    $0xc,%esp
  91:	68 c0 16 00 00       	push   $0x16c0
  96:	e8 ad 09 00 00       	call   a48 <strlen>
  9b:	c6 80 bf 16 00 00 00 	movb   $0x0,0x16bf(%eax)
      if(chdir(buf+3) < 0)
  a2:	c7 04 24 c3 16 00 00 	movl   $0x16c3,(%esp)
  a9:	e8 67 0b 00 00       	call   c15 <chdir>
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	79 aa                	jns    5f <main+0x5f>
        printf(2, "cannot cd %s\n", buf+3);
  b5:	50                   	push   %eax
  b6:	68 c3 16 00 00       	push   $0x16c3
  bb:	68 8d 10 00 00       	push   $0x108d
  c0:	6a 02                	push   $0x2
  c2:	e8 11 0c 00 00       	call   cd8 <printf>
  c7:	83 c4 10             	add    $0x10,%esp
  ca:	eb 93                	jmp    5f <main+0x5f>
      close(fd);
  cc:	83 ec 0c             	sub    $0xc,%esp
  cf:	50                   	push   %eax
  d0:	e8 f8 0a 00 00       	call   bcd <close>
      break;
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	eb 85                	jmp    5f <main+0x5f>
      runcmd(parsecmd(buf));
  da:	83 ec 0c             	sub    $0xc,%esp
  dd:	68 c0 16 00 00       	push   $0x16c0
  e2:	e8 a1 08 00 00       	call   988 <parsecmd>
  e7:	89 04 24             	mov    %eax,(%esp)
  ea:	e8 6d 00 00 00       	call   15c <runcmd>
    panic("fork");
  ef:	83 ec 0c             	sub    $0xc,%esp
  f2:	68 0e 10 00 00       	push   $0x100e
  f7:	e8 44 00 00 00       	call   140 <panic>

000000fc <getcmd>:
{
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	56                   	push   %esi
 100:	53                   	push   %ebx
 101:	8b 5d 08             	mov    0x8(%ebp),%ebx
 104:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
 107:	83 ec 08             	sub    $0x8,%esp
 10a:	68 e4 0f 00 00       	push   $0xfe4
 10f:	6a 02                	push   $0x2
 111:	e8 c2 0b 00 00       	call   cd8 <printf>
  memset(buf, 0, nbuf);
 116:	83 c4 0c             	add    $0xc,%esp
 119:	56                   	push   %esi
 11a:	6a 00                	push   $0x0
 11c:	53                   	push   %ebx
 11d:	e8 4e 09 00 00       	call   a70 <memset>
  gets(buf, nbuf);
 122:	58                   	pop    %eax
 123:	5a                   	pop    %edx
 124:	56                   	push   %esi
 125:	53                   	push   %ebx
 126:	e8 85 09 00 00       	call   ab0 <gets>
  if(buf[0] == 0) // EOF
 12b:	83 c4 10             	add    $0x10,%esp
 12e:	31 c0                	xor    %eax,%eax
 130:	80 3b 00             	cmpb   $0x0,(%ebx)
 133:	0f 94 c0             	sete   %al
 136:	f7 d8                	neg    %eax
}
 138:	8d 65 f8             	lea    -0x8(%ebp),%esp
 13b:	5b                   	pop    %ebx
 13c:	5e                   	pop    %esi
 13d:	5d                   	pop    %ebp
 13e:	c3                   	ret    
 13f:	90                   	nop

00000140 <panic>:
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
 146:	ff 75 08             	pushl  0x8(%ebp)
 149:	68 81 10 00 00       	push   $0x1081
 14e:	6a 02                	push   $0x2
 150:	e8 83 0b 00 00       	call   cd8 <printf>
  exit();
 155:	e8 4b 0a 00 00       	call   ba5 <exit>
 15a:	66 90                	xchg   %ax,%ax

0000015c <runcmd>:
{
 15c:	55                   	push   %ebp
 15d:	89 e5                	mov    %esp,%ebp
 15f:	53                   	push   %ebx
 160:	83 ec 14             	sub    $0x14,%esp
 163:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
 166:	85 db                	test   %ebx,%ebx
 168:	74 76                	je     1e0 <runcmd+0x84>
  switch(cmd->type){
 16a:	83 3b 05             	cmpl   $0x5,(%ebx)
 16d:	0f 87 fc 00 00 00    	ja     26f <runcmd+0x113>
 173:	8b 03                	mov    (%ebx),%eax
 175:	ff 24 85 9c 10 00 00 	jmp    *0x109c(,%eax,4)
    if(pipe(p) < 0)
 17c:	83 ec 0c             	sub    $0xc,%esp
 17f:	8d 45 f0             	lea    -0x10(%ebp),%eax
 182:	50                   	push   %eax
 183:	e8 2d 0a 00 00       	call   bb5 <pipe>
 188:	83 c4 10             	add    $0x10,%esp
 18b:	85 c0                	test   %eax,%eax
 18d:	0f 88 fe 00 00 00    	js     291 <runcmd+0x135>
  pid = fork();
 193:	e8 05 0a 00 00       	call   b9d <fork>
  if(pid == -1)
 198:	83 f8 ff             	cmp    $0xffffffff,%eax
 19b:	0f 84 59 01 00 00    	je     2fa <runcmd+0x19e>
    if(fork1() == 0){
 1a1:	85 c0                	test   %eax,%eax
 1a3:	0f 84 f5 00 00 00    	je     29e <runcmd+0x142>
  pid = fork();
 1a9:	e8 ef 09 00 00       	call   b9d <fork>
  if(pid == -1)
 1ae:	83 f8 ff             	cmp    $0xffffffff,%eax
 1b1:	0f 84 43 01 00 00    	je     2fa <runcmd+0x19e>
    if(fork1() == 0){
 1b7:	85 c0                	test   %eax,%eax
 1b9:	0f 84 0d 01 00 00    	je     2cc <runcmd+0x170>
    close(p[0]);
 1bf:	83 ec 0c             	sub    $0xc,%esp
 1c2:	ff 75 f0             	pushl  -0x10(%ebp)
 1c5:	e8 03 0a 00 00       	call   bcd <close>
    close(p[1]);
 1ca:	58                   	pop    %eax
 1cb:	ff 75 f4             	pushl  -0xc(%ebp)
 1ce:	e8 fa 09 00 00       	call   bcd <close>
    wait();
 1d3:	e8 d5 09 00 00       	call   bad <wait>
    wait();
 1d8:	e8 d0 09 00 00       	call   bad <wait>
    break;
 1dd:	83 c4 10             	add    $0x10,%esp
    exit();
 1e0:	e8 c0 09 00 00       	call   ba5 <exit>
  pid = fork();
 1e5:	e8 b3 09 00 00       	call   b9d <fork>
  if(pid == -1)
 1ea:	83 f8 ff             	cmp    $0xffffffff,%eax
 1ed:	0f 84 07 01 00 00    	je     2fa <runcmd+0x19e>
    if(fork1() == 0)
 1f3:	85 c0                	test   %eax,%eax
 1f5:	75 e9                	jne    1e0 <runcmd+0x84>
 1f7:	eb 6b                	jmp    264 <runcmd+0x108>
    if(ecmd->argv[0] == 0)
 1f9:	8b 43 04             	mov    0x4(%ebx),%eax
 1fc:	85 c0                	test   %eax,%eax
 1fe:	74 e0                	je     1e0 <runcmd+0x84>
    exec(ecmd->argv[0], ecmd->argv);
 200:	51                   	push   %ecx
 201:	51                   	push   %ecx
 202:	8d 53 04             	lea    0x4(%ebx),%edx
 205:	52                   	push   %edx
 206:	50                   	push   %eax
 207:	e8 d1 09 00 00       	call   bdd <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
 20c:	83 c4 0c             	add    $0xc,%esp
 20f:	ff 73 04             	pushl  0x4(%ebx)
 212:	68 ee 0f 00 00       	push   $0xfee
 217:	6a 02                	push   $0x2
 219:	e8 ba 0a 00 00       	call   cd8 <printf>
    break;
 21e:	83 c4 10             	add    $0x10,%esp
 221:	eb bd                	jmp    1e0 <runcmd+0x84>
  pid = fork();
 223:	e8 75 09 00 00       	call   b9d <fork>
  if(pid == -1)
 228:	83 f8 ff             	cmp    $0xffffffff,%eax
 22b:	0f 84 c9 00 00 00    	je     2fa <runcmd+0x19e>
    if(fork1() == 0)
 231:	85 c0                	test   %eax,%eax
 233:	74 2f                	je     264 <runcmd+0x108>
    wait();
 235:	e8 73 09 00 00       	call   bad <wait>
    runcmd(lcmd->right);
 23a:	83 ec 0c             	sub    $0xc,%esp
 23d:	ff 73 08             	pushl  0x8(%ebx)
 240:	e8 17 ff ff ff       	call   15c <runcmd>
    close(rcmd->fd);
 245:	83 ec 0c             	sub    $0xc,%esp
 248:	ff 73 14             	pushl  0x14(%ebx)
 24b:	e8 7d 09 00 00       	call   bcd <close>
    if(open(rcmd->file, rcmd->mode) < 0){
 250:	58                   	pop    %eax
 251:	5a                   	pop    %edx
 252:	ff 73 10             	pushl  0x10(%ebx)
 255:	ff 73 08             	pushl  0x8(%ebx)
 258:	e8 88 09 00 00       	call   be5 <open>
 25d:	83 c4 10             	add    $0x10,%esp
 260:	85 c0                	test   %eax,%eax
 262:	78 18                	js     27c <runcmd+0x120>
      runcmd(bcmd->cmd);
 264:	83 ec 0c             	sub    $0xc,%esp
 267:	ff 73 04             	pushl  0x4(%ebx)
 26a:	e8 ed fe ff ff       	call   15c <runcmd>
    panic("runcmd");
 26f:	83 ec 0c             	sub    $0xc,%esp
 272:	68 e7 0f 00 00       	push   $0xfe7
 277:	e8 c4 fe ff ff       	call   140 <panic>
      printf(2, "open %s failed\n", rcmd->file);
 27c:	51                   	push   %ecx
 27d:	ff 73 08             	pushl  0x8(%ebx)
 280:	68 fe 0f 00 00       	push   $0xffe
 285:	6a 02                	push   $0x2
 287:	e8 4c 0a 00 00       	call   cd8 <printf>
      exit();
 28c:	e8 14 09 00 00       	call   ba5 <exit>
      panic("pipe");
 291:	83 ec 0c             	sub    $0xc,%esp
 294:	68 13 10 00 00       	push   $0x1013
 299:	e8 a2 fe ff ff       	call   140 <panic>
      close(1);
 29e:	83 ec 0c             	sub    $0xc,%esp
 2a1:	6a 01                	push   $0x1
 2a3:	e8 25 09 00 00       	call   bcd <close>
      dup(p[1]);
 2a8:	58                   	pop    %eax
 2a9:	ff 75 f4             	pushl  -0xc(%ebp)
 2ac:	e8 6c 09 00 00       	call   c1d <dup>
      close(p[0]);
 2b1:	58                   	pop    %eax
 2b2:	ff 75 f0             	pushl  -0x10(%ebp)
 2b5:	e8 13 09 00 00       	call   bcd <close>
      close(p[1]);
 2ba:	58                   	pop    %eax
 2bb:	ff 75 f4             	pushl  -0xc(%ebp)
 2be:	e8 0a 09 00 00       	call   bcd <close>
      runcmd(pcmd->left);
 2c3:	5a                   	pop    %edx
 2c4:	ff 73 04             	pushl  0x4(%ebx)
 2c7:	e8 90 fe ff ff       	call   15c <runcmd>
      close(0);
 2cc:	83 ec 0c             	sub    $0xc,%esp
 2cf:	6a 00                	push   $0x0
 2d1:	e8 f7 08 00 00       	call   bcd <close>
      dup(p[0]);
 2d6:	5a                   	pop    %edx
 2d7:	ff 75 f0             	pushl  -0x10(%ebp)
 2da:	e8 3e 09 00 00       	call   c1d <dup>
      close(p[0]);
 2df:	59                   	pop    %ecx
 2e0:	ff 75 f0             	pushl  -0x10(%ebp)
 2e3:	e8 e5 08 00 00       	call   bcd <close>
      close(p[1]);
 2e8:	58                   	pop    %eax
 2e9:	ff 75 f4             	pushl  -0xc(%ebp)
 2ec:	e8 dc 08 00 00       	call   bcd <close>
      runcmd(pcmd->right);
 2f1:	58                   	pop    %eax
 2f2:	ff 73 08             	pushl  0x8(%ebx)
 2f5:	e8 62 fe ff ff       	call   15c <runcmd>
    panic("fork");
 2fa:	83 ec 0c             	sub    $0xc,%esp
 2fd:	68 0e 10 00 00       	push   $0x100e
 302:	e8 39 fe ff ff       	call   140 <panic>
 307:	90                   	nop

00000308 <fork1>:
{
 308:	55                   	push   %ebp
 309:	89 e5                	mov    %esp,%ebp
 30b:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
 30e:	e8 8a 08 00 00       	call   b9d <fork>
  if(pid == -1)
 313:	83 f8 ff             	cmp    $0xffffffff,%eax
 316:	74 02                	je     31a <fork1+0x12>
  return pid;
}
 318:	c9                   	leave  
 319:	c3                   	ret    
    panic("fork");
 31a:	83 ec 0c             	sub    $0xc,%esp
 31d:	68 0e 10 00 00       	push   $0x100e
 322:	e8 19 fe ff ff       	call   140 <panic>
 327:	90                   	nop

00000328 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
 32b:	53                   	push   %ebx
 32c:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
 32f:	6a 54                	push   $0x54
 331:	e8 b6 0b 00 00       	call   eec <malloc>
 336:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 338:	83 c4 0c             	add    $0xc,%esp
 33b:	6a 54                	push   $0x54
 33d:	6a 00                	push   $0x0
 33f:	50                   	push   %eax
 340:	e8 2b 07 00 00       	call   a70 <memset>
  cmd->type = EXEC;
 345:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
 34b:	89 d8                	mov    %ebx,%eax
 34d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 350:	c9                   	leave  
 351:	c3                   	ret    
 352:	66 90                	xchg   %ax,%ax

00000354 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	53                   	push   %ebx
 358:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
 35b:	6a 18                	push   $0x18
 35d:	e8 8a 0b 00 00       	call   eec <malloc>
 362:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 364:	83 c4 0c             	add    $0xc,%esp
 367:	6a 18                	push   $0x18
 369:	6a 00                	push   $0x0
 36b:	50                   	push   %eax
 36c:	e8 ff 06 00 00       	call   a70 <memset>
  cmd->type = REDIR;
 371:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
 377:	8b 45 08             	mov    0x8(%ebp),%eax
 37a:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
 37d:	8b 45 0c             	mov    0xc(%ebp),%eax
 380:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
 383:	8b 45 10             	mov    0x10(%ebp),%eax
 386:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
 389:	8b 45 14             	mov    0x14(%ebp),%eax
 38c:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
 38f:	8b 45 18             	mov    0x18(%ebp),%eax
 392:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
 395:	89 d8                	mov    %ebx,%eax
 397:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 39a:	c9                   	leave  
 39b:	c3                   	ret    

0000039c <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
 39c:	55                   	push   %ebp
 39d:	89 e5                	mov    %esp,%ebp
 39f:	53                   	push   %ebx
 3a0:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
 3a3:	6a 0c                	push   $0xc
 3a5:	e8 42 0b 00 00       	call   eec <malloc>
 3aa:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 3ac:	83 c4 0c             	add    $0xc,%esp
 3af:	6a 0c                	push   $0xc
 3b1:	6a 00                	push   $0x0
 3b3:	50                   	push   %eax
 3b4:	e8 b7 06 00 00       	call   a70 <memset>
  cmd->type = PIPE;
 3b9:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
 3bf:	8b 45 08             	mov    0x8(%ebp),%eax
 3c2:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
 3c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c8:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
 3cb:	89 d8                	mov    %ebx,%eax
 3cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d0:	c9                   	leave  
 3d1:	c3                   	ret    
 3d2:	66 90                	xchg   %ax,%ax

000003d4 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
 3d4:	55                   	push   %ebp
 3d5:	89 e5                	mov    %esp,%ebp
 3d7:	53                   	push   %ebx
 3d8:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
 3db:	6a 0c                	push   $0xc
 3dd:	e8 0a 0b 00 00       	call   eec <malloc>
 3e2:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 3e4:	83 c4 0c             	add    $0xc,%esp
 3e7:	6a 0c                	push   $0xc
 3e9:	6a 00                	push   $0x0
 3eb:	50                   	push   %eax
 3ec:	e8 7f 06 00 00       	call   a70 <memset>
  cmd->type = LIST;
 3f1:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
 3fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 400:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
 403:	89 d8                	mov    %ebx,%eax
 405:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 408:	c9                   	leave  
 409:	c3                   	ret    
 40a:	66 90                	xchg   %ax,%ax

0000040c <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
 40f:	53                   	push   %ebx
 410:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
 413:	6a 08                	push   $0x8
 415:	e8 d2 0a 00 00       	call   eec <malloc>
 41a:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 41c:	83 c4 0c             	add    $0xc,%esp
 41f:	6a 08                	push   $0x8
 421:	6a 00                	push   $0x0
 423:	50                   	push   %eax
 424:	e8 47 06 00 00       	call   a70 <memset>
  cmd->type = BACK;
 429:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
 42f:	8b 45 08             	mov    0x8(%ebp),%eax
 432:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
 435:	89 d8                	mov    %ebx,%eax
 437:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 43a:	c9                   	leave  
 43b:	c3                   	ret    

0000043c <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
 43c:	55                   	push   %ebp
 43d:	89 e5                	mov    %esp,%ebp
 43f:	57                   	push   %edi
 440:	56                   	push   %esi
 441:	53                   	push   %ebx
 442:	83 ec 0c             	sub    $0xc,%esp
 445:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 448:	8b 75 10             	mov    0x10(%ebp),%esi
  char *s;
  int ret;

  s = *ps;
 44b:	8b 45 08             	mov    0x8(%ebp),%eax
 44e:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
 450:	39 df                	cmp    %ebx,%edi
 452:	72 09                	jb     45d <gettoken+0x21>
 454:	eb 1f                	jmp    475 <gettoken+0x39>
 456:	66 90                	xchg   %ax,%ax
    s++;
 458:	47                   	inc    %edi
  while(s < es && strchr(whitespace, *s))
 459:	39 fb                	cmp    %edi,%ebx
 45b:	74 18                	je     475 <gettoken+0x39>
 45d:	83 ec 08             	sub    $0x8,%esp
 460:	0f be 07             	movsbl (%edi),%eax
 463:	50                   	push   %eax
 464:	68 9c 16 00 00       	push   $0x169c
 469:	e8 1a 06 00 00       	call   a88 <strchr>
 46e:	83 c4 10             	add    $0x10,%esp
 471:	85 c0                	test   %eax,%eax
 473:	75 e3                	jne    458 <gettoken+0x1c>
  if(q)
 475:	85 f6                	test   %esi,%esi
 477:	74 02                	je     47b <gettoken+0x3f>
    *q = s;
 479:	89 3e                	mov    %edi,(%esi)
  ret = *s;
 47b:	0f be 07             	movsbl (%edi),%eax
  switch(*s){
 47e:	3c 3c                	cmp    $0x3c,%al
 480:	0f 8f ba 00 00 00    	jg     540 <gettoken+0x104>
 486:	3c 3a                	cmp    $0x3a,%al
 488:	0f 8f a6 00 00 00    	jg     534 <gettoken+0xf8>
 48e:	84 c0                	test   %al,%al
 490:	75 42                	jne    4d4 <gettoken+0x98>
 492:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
 494:	8b 55 14             	mov    0x14(%ebp),%edx
 497:	85 d2                	test   %edx,%edx
 499:	74 05                	je     4a0 <gettoken+0x64>
    *eq = s;
 49b:	8b 45 14             	mov    0x14(%ebp),%eax
 49e:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
 4a0:	39 df                	cmp    %ebx,%edi
 4a2:	72 09                	jb     4ad <gettoken+0x71>
 4a4:	eb 1f                	jmp    4c5 <gettoken+0x89>
 4a6:	66 90                	xchg   %ax,%ax
    s++;
 4a8:	47                   	inc    %edi
  while(s < es && strchr(whitespace, *s))
 4a9:	39 fb                	cmp    %edi,%ebx
 4ab:	74 18                	je     4c5 <gettoken+0x89>
 4ad:	83 ec 08             	sub    $0x8,%esp
 4b0:	0f be 07             	movsbl (%edi),%eax
 4b3:	50                   	push   %eax
 4b4:	68 9c 16 00 00       	push   $0x169c
 4b9:	e8 ca 05 00 00       	call   a88 <strchr>
 4be:	83 c4 10             	add    $0x10,%esp
 4c1:	85 c0                	test   %eax,%eax
 4c3:	75 e3                	jne    4a8 <gettoken+0x6c>
  *ps = s;
 4c5:	8b 45 08             	mov    0x8(%ebp),%eax
 4c8:	89 38                	mov    %edi,(%eax)
  return ret;
}
 4ca:	89 f0                	mov    %esi,%eax
 4cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4cf:	5b                   	pop    %ebx
 4d0:	5e                   	pop    %esi
 4d1:	5f                   	pop    %edi
 4d2:	5d                   	pop    %ebp
 4d3:	c3                   	ret    
  switch(*s){
 4d4:	79 52                	jns    528 <gettoken+0xec>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
 4d6:	39 fb                	cmp    %edi,%ebx
 4d8:	77 2e                	ja     508 <gettoken+0xcc>
  if(eq)
 4da:	be 61 00 00 00       	mov    $0x61,%esi
 4df:	8b 45 14             	mov    0x14(%ebp),%eax
 4e2:	85 c0                	test   %eax,%eax
 4e4:	75 b5                	jne    49b <gettoken+0x5f>
 4e6:	eb dd                	jmp    4c5 <gettoken+0x89>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
 4e8:	83 ec 08             	sub    $0x8,%esp
 4eb:	0f be 07             	movsbl (%edi),%eax
 4ee:	50                   	push   %eax
 4ef:	68 94 16 00 00       	push   $0x1694
 4f4:	e8 8f 05 00 00       	call   a88 <strchr>
 4f9:	83 c4 10             	add    $0x10,%esp
 4fc:	85 c0                	test   %eax,%eax
 4fe:	75 1d                	jne    51d <gettoken+0xe1>
      s++;
 500:	47                   	inc    %edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
 501:	39 fb                	cmp    %edi,%ebx
 503:	74 d5                	je     4da <gettoken+0x9e>
 505:	0f be 07             	movsbl (%edi),%eax
 508:	83 ec 08             	sub    $0x8,%esp
 50b:	50                   	push   %eax
 50c:	68 9c 16 00 00       	push   $0x169c
 511:	e8 72 05 00 00       	call   a88 <strchr>
 516:	83 c4 10             	add    $0x10,%esp
 519:	85 c0                	test   %eax,%eax
 51b:	74 cb                	je     4e8 <gettoken+0xac>
    ret = 'a';
 51d:	be 61 00 00 00       	mov    $0x61,%esi
 522:	e9 6d ff ff ff       	jmp    494 <gettoken+0x58>
 527:	90                   	nop
  switch(*s){
 528:	3c 26                	cmp    $0x26,%al
 52a:	74 08                	je     534 <gettoken+0xf8>
 52c:	8d 48 d8             	lea    -0x28(%eax),%ecx
 52f:	80 f9 01             	cmp    $0x1,%cl
 532:	77 a2                	ja     4d6 <gettoken+0x9a>
  ret = *s;
 534:	0f be f0             	movsbl %al,%esi
    s++;
 537:	47                   	inc    %edi
    break;
 538:	e9 57 ff ff ff       	jmp    494 <gettoken+0x58>
 53d:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
 540:	3c 3e                	cmp    $0x3e,%al
 542:	75 18                	jne    55c <gettoken+0x120>
    s++;
 544:	8d 47 01             	lea    0x1(%edi),%eax
    if(*s == '>'){
 547:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
 54b:	74 18                	je     565 <gettoken+0x129>
    s++;
 54d:	89 c7                	mov    %eax,%edi
 54f:	be 3e 00 00 00       	mov    $0x3e,%esi
 554:	e9 3b ff ff ff       	jmp    494 <gettoken+0x58>
 559:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
 55c:	3c 7c                	cmp    $0x7c,%al
 55e:	74 d4                	je     534 <gettoken+0xf8>
 560:	e9 71 ff ff ff       	jmp    4d6 <gettoken+0x9a>
      s++;
 565:	83 c7 02             	add    $0x2,%edi
      ret = '+';
 568:	be 2b 00 00 00       	mov    $0x2b,%esi
 56d:	e9 22 ff ff ff       	jmp    494 <gettoken+0x58>
 572:	66 90                	xchg   %ax,%ax

00000574 <peek>:

int
peek(char **ps, char *es, char *toks)
{
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	57                   	push   %edi
 578:	56                   	push   %esi
 579:	53                   	push   %ebx
 57a:	83 ec 0c             	sub    $0xc,%esp
 57d:	8b 7d 08             	mov    0x8(%ebp),%edi
 580:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
 583:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
 585:	39 f3                	cmp    %esi,%ebx
 587:	72 08                	jb     591 <peek+0x1d>
 589:	eb 1e                	jmp    5a9 <peek+0x35>
 58b:	90                   	nop
    s++;
 58c:	43                   	inc    %ebx
  while(s < es && strchr(whitespace, *s))
 58d:	39 de                	cmp    %ebx,%esi
 58f:	74 18                	je     5a9 <peek+0x35>
 591:	83 ec 08             	sub    $0x8,%esp
 594:	0f be 03             	movsbl (%ebx),%eax
 597:	50                   	push   %eax
 598:	68 9c 16 00 00       	push   $0x169c
 59d:	e8 e6 04 00 00       	call   a88 <strchr>
 5a2:	83 c4 10             	add    $0x10,%esp
 5a5:	85 c0                	test   %eax,%eax
 5a7:	75 e3                	jne    58c <peek+0x18>
  *ps = s;
 5a9:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
 5ab:	0f be 03             	movsbl (%ebx),%eax
 5ae:	84 c0                	test   %al,%al
 5b0:	75 0a                	jne    5bc <peek+0x48>
 5b2:	31 c0                	xor    %eax,%eax
}
 5b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b7:	5b                   	pop    %ebx
 5b8:	5e                   	pop    %esi
 5b9:	5f                   	pop    %edi
 5ba:	5d                   	pop    %ebp
 5bb:	c3                   	ret    
  return *s && strchr(toks, *s);
 5bc:	83 ec 08             	sub    $0x8,%esp
 5bf:	50                   	push   %eax
 5c0:	ff 75 10             	pushl  0x10(%ebp)
 5c3:	e8 c0 04 00 00       	call   a88 <strchr>
 5c8:	83 c4 10             	add    $0x10,%esp
 5cb:	85 c0                	test   %eax,%eax
 5cd:	0f 95 c0             	setne  %al
 5d0:	0f b6 c0             	movzbl %al,%eax
}
 5d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d6:	5b                   	pop    %ebx
 5d7:	5e                   	pop    %esi
 5d8:	5f                   	pop    %edi
 5d9:	5d                   	pop    %ebp
 5da:	c3                   	ret    
 5db:	90                   	nop

000005dc <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
 5dc:	55                   	push   %ebp
 5dd:	89 e5                	mov    %esp,%ebp
 5df:	57                   	push   %edi
 5e0:	56                   	push   %esi
 5e1:	53                   	push   %ebx
 5e2:	83 ec 1c             	sub    $0x1c,%esp
 5e5:	8b 75 0c             	mov    0xc(%ebp),%esi
 5e8:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
 5eb:	90                   	nop
 5ec:	50                   	push   %eax
 5ed:	68 35 10 00 00       	push   $0x1035
 5f2:	53                   	push   %ebx
 5f3:	56                   	push   %esi
 5f4:	e8 7b ff ff ff       	call   574 <peek>
 5f9:	83 c4 10             	add    $0x10,%esp
 5fc:	85 c0                	test   %eax,%eax
 5fe:	74 60                	je     660 <parseredirs+0x84>
    tok = gettoken(ps, es, 0, 0);
 600:	6a 00                	push   $0x0
 602:	6a 00                	push   $0x0
 604:	53                   	push   %ebx
 605:	56                   	push   %esi
 606:	e8 31 fe ff ff       	call   43c <gettoken>
 60b:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
 60d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 610:	50                   	push   %eax
 611:	8d 45 e0             	lea    -0x20(%ebp),%eax
 614:	50                   	push   %eax
 615:	53                   	push   %ebx
 616:	56                   	push   %esi
 617:	e8 20 fe ff ff       	call   43c <gettoken>
 61c:	83 c4 20             	add    $0x20,%esp
 61f:	83 f8 61             	cmp    $0x61,%eax
 622:	75 47                	jne    66b <parseredirs+0x8f>
      panic("missing file for redirection");
    switch(tok){
 624:	83 ff 3c             	cmp    $0x3c,%edi
 627:	74 2b                	je     654 <parseredirs+0x78>
 629:	83 ff 3e             	cmp    $0x3e,%edi
 62c:	74 05                	je     633 <parseredirs+0x57>
 62e:	83 ff 2b             	cmp    $0x2b,%edi
 631:	75 b9                	jne    5ec <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
 633:	83 ec 0c             	sub    $0xc,%esp
 636:	6a 01                	push   $0x1
 638:	68 01 02 00 00       	push   $0x201
 63d:	ff 75 e4             	pushl  -0x1c(%ebp)
 640:	ff 75 e0             	pushl  -0x20(%ebp)
 643:	ff 75 08             	pushl  0x8(%ebp)
 646:	e8 09 fd ff ff       	call   354 <redircmd>
 64b:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
 64e:	83 c4 20             	add    $0x20,%esp
 651:	eb 99                	jmp    5ec <parseredirs+0x10>
 653:	90                   	nop
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
 654:	83 ec 0c             	sub    $0xc,%esp
 657:	6a 00                	push   $0x0
 659:	6a 00                	push   $0x0
 65b:	eb e0                	jmp    63d <parseredirs+0x61>
 65d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
 660:	8b 45 08             	mov    0x8(%ebp),%eax
 663:	8d 65 f4             	lea    -0xc(%ebp),%esp
 666:	5b                   	pop    %ebx
 667:	5e                   	pop    %esi
 668:	5f                   	pop    %edi
 669:	5d                   	pop    %ebp
 66a:	c3                   	ret    
      panic("missing file for redirection");
 66b:	83 ec 0c             	sub    $0xc,%esp
 66e:	68 18 10 00 00       	push   $0x1018
 673:	e8 c8 fa ff ff       	call   140 <panic>

00000678 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
 678:	55                   	push   %ebp
 679:	89 e5                	mov    %esp,%ebp
 67b:	57                   	push   %edi
 67c:	56                   	push   %esi
 67d:	53                   	push   %ebx
 67e:	83 ec 30             	sub    $0x30,%esp
 681:	8b 75 08             	mov    0x8(%ebp),%esi
 684:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
 687:	68 38 10 00 00       	push   $0x1038
 68c:	57                   	push   %edi
 68d:	56                   	push   %esi
 68e:	e8 e1 fe ff ff       	call   574 <peek>
 693:	83 c4 10             	add    $0x10,%esp
 696:	85 c0                	test   %eax,%eax
 698:	0f 85 82 00 00 00    	jne    720 <parseexec+0xa8>
 69e:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
 6a0:	e8 83 fc ff ff       	call   328 <execcmd>
 6a5:	89 45 d0             	mov    %eax,-0x30(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
 6a8:	51                   	push   %ecx
 6a9:	57                   	push   %edi
 6aa:	56                   	push   %esi
 6ab:	50                   	push   %eax
 6ac:	e8 2b ff ff ff       	call   5dc <parseredirs>
 6b1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
 6b4:	83 c4 10             	add    $0x10,%esp
 6b7:	eb 14                	jmp    6cd <parseexec+0x55>
 6b9:	8d 76 00             	lea    0x0(%esi),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
 6bc:	52                   	push   %edx
 6bd:	57                   	push   %edi
 6be:	56                   	push   %esi
 6bf:	ff 75 d4             	pushl  -0x2c(%ebp)
 6c2:	e8 15 ff ff ff       	call   5dc <parseredirs>
 6c7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6ca:	83 c4 10             	add    $0x10,%esp
  while(!peek(ps, es, "|)&;")){
 6cd:	50                   	push   %eax
 6ce:	68 4f 10 00 00       	push   $0x104f
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	e8 9a fe ff ff       	call   574 <peek>
 6da:	83 c4 10             	add    $0x10,%esp
 6dd:	85 c0                	test   %eax,%eax
 6df:	75 5b                	jne    73c <parseexec+0xc4>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
 6e1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6e4:	50                   	push   %eax
 6e5:	8d 45 e0             	lea    -0x20(%ebp),%eax
 6e8:	50                   	push   %eax
 6e9:	57                   	push   %edi
 6ea:	56                   	push   %esi
 6eb:	e8 4c fd ff ff       	call   43c <gettoken>
 6f0:	83 c4 10             	add    $0x10,%esp
 6f3:	85 c0                	test   %eax,%eax
 6f5:	74 45                	je     73c <parseexec+0xc4>
    if(tok != 'a')
 6f7:	83 f8 61             	cmp    $0x61,%eax
 6fa:	75 5f                	jne    75b <parseexec+0xe3>
    cmd->argv[argc] = q;
 6fc:	8b 45 e0             	mov    -0x20(%ebp),%eax
 6ff:	8b 55 d0             	mov    -0x30(%ebp),%edx
 702:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
 706:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 709:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
 70d:	43                   	inc    %ebx
    if(argc >= MAXARGS)
 70e:	83 fb 0a             	cmp    $0xa,%ebx
 711:	75 a9                	jne    6bc <parseexec+0x44>
      panic("too many args");
 713:	83 ec 0c             	sub    $0xc,%esp
 716:	68 41 10 00 00       	push   $0x1041
 71b:	e8 20 fa ff ff       	call   140 <panic>
    return parseblock(ps, es);
 720:	83 ec 08             	sub    $0x8,%esp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	e8 3a 01 00 00       	call   864 <parseblock>
 72a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 72d:	83 c4 10             	add    $0x10,%esp
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
 730:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 733:	8d 65 f4             	lea    -0xc(%ebp),%esp
 736:	5b                   	pop    %ebx
 737:	5e                   	pop    %esi
 738:	5f                   	pop    %edi
 739:	5d                   	pop    %ebp
 73a:	c3                   	ret    
 73b:	90                   	nop
  cmd->argv[argc] = 0;
 73c:	8b 45 d0             	mov    -0x30(%ebp),%eax
 73f:	8d 04 98             	lea    (%eax,%ebx,4),%eax
 742:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
 749:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
 750:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 753:	8d 65 f4             	lea    -0xc(%ebp),%esp
 756:	5b                   	pop    %ebx
 757:	5e                   	pop    %esi
 758:	5f                   	pop    %edi
 759:	5d                   	pop    %ebp
 75a:	c3                   	ret    
      panic("syntax");
 75b:	83 ec 0c             	sub    $0xc,%esp
 75e:	68 3a 10 00 00       	push   $0x103a
 763:	e8 d8 f9 ff ff       	call   140 <panic>

00000768 <parsepipe>:
{
 768:	55                   	push   %ebp
 769:	89 e5                	mov    %esp,%ebp
 76b:	57                   	push   %edi
 76c:	56                   	push   %esi
 76d:	53                   	push   %ebx
 76e:	83 ec 14             	sub    $0x14,%esp
 771:	8b 75 08             	mov    0x8(%ebp),%esi
 774:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
 777:	57                   	push   %edi
 778:	56                   	push   %esi
 779:	e8 fa fe ff ff       	call   678 <parseexec>
 77e:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
 780:	83 c4 0c             	add    $0xc,%esp
 783:	68 54 10 00 00       	push   $0x1054
 788:	57                   	push   %edi
 789:	56                   	push   %esi
 78a:	e8 e5 fd ff ff       	call   574 <peek>
 78f:	83 c4 10             	add    $0x10,%esp
 792:	85 c0                	test   %eax,%eax
 794:	75 0a                	jne    7a0 <parsepipe+0x38>
}
 796:	89 d8                	mov    %ebx,%eax
 798:	8d 65 f4             	lea    -0xc(%ebp),%esp
 79b:	5b                   	pop    %ebx
 79c:	5e                   	pop    %esi
 79d:	5f                   	pop    %edi
 79e:	5d                   	pop    %ebp
 79f:	c3                   	ret    
    gettoken(ps, es, 0, 0);
 7a0:	6a 00                	push   $0x0
 7a2:	6a 00                	push   $0x0
 7a4:	57                   	push   %edi
 7a5:	56                   	push   %esi
 7a6:	e8 91 fc ff ff       	call   43c <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
 7ab:	58                   	pop    %eax
 7ac:	5a                   	pop    %edx
 7ad:	57                   	push   %edi
 7ae:	56                   	push   %esi
 7af:	e8 b4 ff ff ff       	call   768 <parsepipe>
 7b4:	83 c4 10             	add    $0x10,%esp
 7b7:	89 45 0c             	mov    %eax,0xc(%ebp)
 7ba:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 7bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c0:	5b                   	pop    %ebx
 7c1:	5e                   	pop    %esi
 7c2:	5f                   	pop    %edi
 7c3:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
 7c4:	e9 d3 fb ff ff       	jmp    39c <pipecmd>
 7c9:	8d 76 00             	lea    0x0(%esi),%esi

000007cc <parseline>:
{
 7cc:	55                   	push   %ebp
 7cd:	89 e5                	mov    %esp,%ebp
 7cf:	57                   	push   %edi
 7d0:	56                   	push   %esi
 7d1:	53                   	push   %ebx
 7d2:	83 ec 14             	sub    $0x14,%esp
 7d5:	8b 75 08             	mov    0x8(%ebp),%esi
 7d8:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
 7db:	57                   	push   %edi
 7dc:	56                   	push   %esi
 7dd:	e8 86 ff ff ff       	call   768 <parsepipe>
 7e2:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
 7e4:	83 c4 10             	add    $0x10,%esp
 7e7:	eb 1b                	jmp    804 <parseline+0x38>
 7e9:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
 7ec:	6a 00                	push   $0x0
 7ee:	6a 00                	push   $0x0
 7f0:	57                   	push   %edi
 7f1:	56                   	push   %esi
 7f2:	e8 45 fc ff ff       	call   43c <gettoken>
    cmd = backcmd(cmd);
 7f7:	89 1c 24             	mov    %ebx,(%esp)
 7fa:	e8 0d fc ff ff       	call   40c <backcmd>
 7ff:	89 c3                	mov    %eax,%ebx
 801:	83 c4 10             	add    $0x10,%esp
  while(peek(ps, es, "&")){
 804:	50                   	push   %eax
 805:	68 56 10 00 00       	push   $0x1056
 80a:	57                   	push   %edi
 80b:	56                   	push   %esi
 80c:	e8 63 fd ff ff       	call   574 <peek>
 811:	83 c4 10             	add    $0x10,%esp
 814:	85 c0                	test   %eax,%eax
 816:	75 d4                	jne    7ec <parseline+0x20>
  if(peek(ps, es, ";")){
 818:	51                   	push   %ecx
 819:	68 52 10 00 00       	push   $0x1052
 81e:	57                   	push   %edi
 81f:	56                   	push   %esi
 820:	e8 4f fd ff ff       	call   574 <peek>
 825:	83 c4 10             	add    $0x10,%esp
 828:	85 c0                	test   %eax,%eax
 82a:	75 0c                	jne    838 <parseline+0x6c>
}
 82c:	89 d8                	mov    %ebx,%eax
 82e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 831:	5b                   	pop    %ebx
 832:	5e                   	pop    %esi
 833:	5f                   	pop    %edi
 834:	5d                   	pop    %ebp
 835:	c3                   	ret    
 836:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
 838:	6a 00                	push   $0x0
 83a:	6a 00                	push   $0x0
 83c:	57                   	push   %edi
 83d:	56                   	push   %esi
 83e:	e8 f9 fb ff ff       	call   43c <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
 843:	58                   	pop    %eax
 844:	5a                   	pop    %edx
 845:	57                   	push   %edi
 846:	56                   	push   %esi
 847:	e8 80 ff ff ff       	call   7cc <parseline>
 84c:	83 c4 10             	add    $0x10,%esp
 84f:	89 45 0c             	mov    %eax,0xc(%ebp)
 852:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 855:	8d 65 f4             	lea    -0xc(%ebp),%esp
 858:	5b                   	pop    %ebx
 859:	5e                   	pop    %esi
 85a:	5f                   	pop    %edi
 85b:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
 85c:	e9 73 fb ff ff       	jmp    3d4 <listcmd>
 861:	8d 76 00             	lea    0x0(%esi),%esi

00000864 <parseblock>:
{
 864:	55                   	push   %ebp
 865:	89 e5                	mov    %esp,%ebp
 867:	57                   	push   %edi
 868:	56                   	push   %esi
 869:	53                   	push   %ebx
 86a:	83 ec 10             	sub    $0x10,%esp
 86d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 870:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
 873:	68 38 10 00 00       	push   $0x1038
 878:	56                   	push   %esi
 879:	53                   	push   %ebx
 87a:	e8 f5 fc ff ff       	call   574 <peek>
 87f:	83 c4 10             	add    $0x10,%esp
 882:	85 c0                	test   %eax,%eax
 884:	74 4a                	je     8d0 <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
 886:	6a 00                	push   $0x0
 888:	6a 00                	push   $0x0
 88a:	56                   	push   %esi
 88b:	53                   	push   %ebx
 88c:	e8 ab fb ff ff       	call   43c <gettoken>
  cmd = parseline(ps, es);
 891:	58                   	pop    %eax
 892:	5a                   	pop    %edx
 893:	56                   	push   %esi
 894:	53                   	push   %ebx
 895:	e8 32 ff ff ff       	call   7cc <parseline>
 89a:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
 89c:	83 c4 0c             	add    $0xc,%esp
 89f:	68 74 10 00 00       	push   $0x1074
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	e8 c9 fc ff ff       	call   574 <peek>
 8ab:	83 c4 10             	add    $0x10,%esp
 8ae:	85 c0                	test   %eax,%eax
 8b0:	74 2b                	je     8dd <parseblock+0x79>
  gettoken(ps, es, 0, 0);
 8b2:	6a 00                	push   $0x0
 8b4:	6a 00                	push   $0x0
 8b6:	56                   	push   %esi
 8b7:	53                   	push   %ebx
 8b8:	e8 7f fb ff ff       	call   43c <gettoken>
  cmd = parseredirs(cmd, ps, es);
 8bd:	83 c4 0c             	add    $0xc,%esp
 8c0:	56                   	push   %esi
 8c1:	53                   	push   %ebx
 8c2:	57                   	push   %edi
 8c3:	e8 14 fd ff ff       	call   5dc <parseredirs>
}
 8c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8cb:	5b                   	pop    %ebx
 8cc:	5e                   	pop    %esi
 8cd:	5f                   	pop    %edi
 8ce:	5d                   	pop    %ebp
 8cf:	c3                   	ret    
    panic("parseblock");
 8d0:	83 ec 0c             	sub    $0xc,%esp
 8d3:	68 58 10 00 00       	push   $0x1058
 8d8:	e8 63 f8 ff ff       	call   140 <panic>
    panic("syntax - missing )");
 8dd:	83 ec 0c             	sub    $0xc,%esp
 8e0:	68 63 10 00 00       	push   $0x1063
 8e5:	e8 56 f8 ff ff       	call   140 <panic>
 8ea:	66 90                	xchg   %ax,%ax

000008ec <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
 8ec:	55                   	push   %ebp
 8ed:	89 e5                	mov    %esp,%ebp
 8ef:	53                   	push   %ebx
 8f0:	53                   	push   %ebx
 8f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
 8f4:	85 db                	test   %ebx,%ebx
 8f6:	0f 84 88 00 00 00    	je     984 <nulterminate+0x98>
    return 0;

  switch(cmd->type){
 8fc:	83 3b 05             	cmpl   $0x5,(%ebx)
 8ff:	77 5f                	ja     960 <nulterminate+0x74>
 901:	8b 03                	mov    (%ebx),%eax
 903:	ff 24 85 b4 10 00 00 	jmp    *0x10b4(,%eax,4)
 90a:	66 90                	xchg   %ax,%ax
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
 90c:	83 ec 0c             	sub    $0xc,%esp
 90f:	ff 73 04             	pushl  0x4(%ebx)
 912:	e8 d5 ff ff ff       	call   8ec <nulterminate>
    nulterminate(lcmd->right);
 917:	58                   	pop    %eax
 918:	ff 73 08             	pushl  0x8(%ebx)
 91b:	e8 cc ff ff ff       	call   8ec <nulterminate>
    break;
 920:	83 c4 10             	add    $0x10,%esp
 923:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
 925:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 928:	c9                   	leave  
 929:	c3                   	ret    
 92a:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
 92c:	83 ec 0c             	sub    $0xc,%esp
 92f:	ff 73 04             	pushl  0x4(%ebx)
 932:	e8 b5 ff ff ff       	call   8ec <nulterminate>
    break;
 937:	83 c4 10             	add    $0x10,%esp
 93a:	89 d8                	mov    %ebx,%eax
}
 93c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 93f:	c9                   	leave  
 940:	c3                   	ret    
 941:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
 944:	8d 43 08             	lea    0x8(%ebx),%eax
 947:	8b 4b 04             	mov    0x4(%ebx),%ecx
 94a:	85 c9                	test   %ecx,%ecx
 94c:	74 12                	je     960 <nulterminate+0x74>
 94e:	66 90                	xchg   %ax,%ax
      *ecmd->eargv[i] = 0;
 950:	8b 50 24             	mov    0x24(%eax),%edx
 953:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
 956:	83 c0 04             	add    $0x4,%eax
 959:	8b 50 fc             	mov    -0x4(%eax),%edx
 95c:	85 d2                	test   %edx,%edx
 95e:	75 f0                	jne    950 <nulterminate+0x64>
  switch(cmd->type){
 960:	89 d8                	mov    %ebx,%eax
}
 962:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 965:	c9                   	leave  
 966:	c3                   	ret    
 967:	90                   	nop
    nulterminate(rcmd->cmd);
 968:	83 ec 0c             	sub    $0xc,%esp
 96b:	ff 73 04             	pushl  0x4(%ebx)
 96e:	e8 79 ff ff ff       	call   8ec <nulterminate>
    *rcmd->efile = 0;
 973:	8b 43 0c             	mov    0xc(%ebx),%eax
 976:	c6 00 00             	movb   $0x0,(%eax)
    break;
 979:	83 c4 10             	add    $0x10,%esp
 97c:	89 d8                	mov    %ebx,%eax
}
 97e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 981:	c9                   	leave  
 982:	c3                   	ret    
 983:	90                   	nop
    return 0;
 984:	31 c0                	xor    %eax,%eax
 986:	eb 9d                	jmp    925 <nulterminate+0x39>

00000988 <parsecmd>:
{
 988:	55                   	push   %ebp
 989:	89 e5                	mov    %esp,%ebp
 98b:	56                   	push   %esi
 98c:	53                   	push   %ebx
  es = s + strlen(s);
 98d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 990:	83 ec 0c             	sub    $0xc,%esp
 993:	53                   	push   %ebx
 994:	e8 af 00 00 00       	call   a48 <strlen>
 999:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
 99b:	59                   	pop    %ecx
 99c:	5e                   	pop    %esi
 99d:	53                   	push   %ebx
 99e:	8d 45 08             	lea    0x8(%ebp),%eax
 9a1:	50                   	push   %eax
 9a2:	e8 25 fe ff ff       	call   7cc <parseline>
 9a7:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
 9a9:	83 c4 0c             	add    $0xc,%esp
 9ac:	68 fd 0f 00 00       	push   $0xffd
 9b1:	53                   	push   %ebx
 9b2:	8d 45 08             	lea    0x8(%ebp),%eax
 9b5:	50                   	push   %eax
 9b6:	e8 b9 fb ff ff       	call   574 <peek>
  if(s != es){
 9bb:	8b 45 08             	mov    0x8(%ebp),%eax
 9be:	83 c4 10             	add    $0x10,%esp
 9c1:	39 d8                	cmp    %ebx,%eax
 9c3:	75 12                	jne    9d7 <parsecmd+0x4f>
  nulterminate(cmd);
 9c5:	83 ec 0c             	sub    $0xc,%esp
 9c8:	56                   	push   %esi
 9c9:	e8 1e ff ff ff       	call   8ec <nulterminate>
}
 9ce:	89 f0                	mov    %esi,%eax
 9d0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 9d3:	5b                   	pop    %ebx
 9d4:	5e                   	pop    %esi
 9d5:	5d                   	pop    %ebp
 9d6:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
 9d7:	52                   	push   %edx
 9d8:	50                   	push   %eax
 9d9:	68 76 10 00 00       	push   $0x1076
 9de:	6a 02                	push   $0x2
 9e0:	e8 f3 02 00 00       	call   cd8 <printf>
    panic("syntax");
 9e5:	c7 04 24 3a 10 00 00 	movl   $0x103a,(%esp)
 9ec:	e8 4f f7 ff ff       	call   140 <panic>
 9f1:	66 90                	xchg   %ax,%ax
 9f3:	90                   	nop

000009f4 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 9f4:	55                   	push   %ebp
 9f5:	89 e5                	mov    %esp,%ebp
 9f7:	53                   	push   %ebx
 9f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 9fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 9fe:	31 c0                	xor    %eax,%eax
 a00:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 a03:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 a06:	40                   	inc    %eax
 a07:	84 d2                	test   %dl,%dl
 a09:	75 f5                	jne    a00 <strcpy+0xc>
    ;
  return os;
}
 a0b:	89 c8                	mov    %ecx,%eax
 a0d:	5b                   	pop    %ebx
 a0e:	5d                   	pop    %ebp
 a0f:	c3                   	ret    

00000a10 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	53                   	push   %ebx
 a14:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a17:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 a1a:	0f b6 03             	movzbl (%ebx),%eax
 a1d:	0f b6 0a             	movzbl (%edx),%ecx
 a20:	84 c0                	test   %al,%al
 a22:	75 10                	jne    a34 <strcmp+0x24>
 a24:	eb 1a                	jmp    a40 <strcmp+0x30>
 a26:	66 90                	xchg   %ax,%ax
    p++, q++;
 a28:	43                   	inc    %ebx
 a29:	42                   	inc    %edx
  while(*p && *p == *q)
 a2a:	0f b6 03             	movzbl (%ebx),%eax
 a2d:	0f b6 0a             	movzbl (%edx),%ecx
 a30:	84 c0                	test   %al,%al
 a32:	74 0c                	je     a40 <strcmp+0x30>
 a34:	38 c8                	cmp    %cl,%al
 a36:	74 f0                	je     a28 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 a38:	29 c8                	sub    %ecx,%eax
}
 a3a:	5b                   	pop    %ebx
 a3b:	5d                   	pop    %ebp
 a3c:	c3                   	ret    
 a3d:	8d 76 00             	lea    0x0(%esi),%esi
 a40:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 a42:	29 c8                	sub    %ecx,%eax
}
 a44:	5b                   	pop    %ebx
 a45:	5d                   	pop    %ebp
 a46:	c3                   	ret    
 a47:	90                   	nop

00000a48 <strlen>:

uint
strlen(const char *s)
{
 a48:	55                   	push   %ebp
 a49:	89 e5                	mov    %esp,%ebp
 a4b:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 a4e:	80 3a 00             	cmpb   $0x0,(%edx)
 a51:	74 15                	je     a68 <strlen+0x20>
 a53:	31 c0                	xor    %eax,%eax
 a55:	8d 76 00             	lea    0x0(%esi),%esi
 a58:	40                   	inc    %eax
 a59:	89 c1                	mov    %eax,%ecx
 a5b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 a5f:	75 f7                	jne    a58 <strlen+0x10>
    ;
  return n;
}
 a61:	89 c8                	mov    %ecx,%eax
 a63:	5d                   	pop    %ebp
 a64:	c3                   	ret    
 a65:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 a68:	31 c9                	xor    %ecx,%ecx
}
 a6a:	89 c8                	mov    %ecx,%eax
 a6c:	5d                   	pop    %ebp
 a6d:	c3                   	ret    
 a6e:	66 90                	xchg   %ax,%ax

00000a70 <memset>:

void*
memset(void *dst, int c, uint n)
{
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
 a73:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 a74:	8b 7d 08             	mov    0x8(%ebp),%edi
 a77:	8b 4d 10             	mov    0x10(%ebp),%ecx
 a7a:	8b 45 0c             	mov    0xc(%ebp),%eax
 a7d:	fc                   	cld    
 a7e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 a80:	8b 45 08             	mov    0x8(%ebp),%eax
 a83:	5f                   	pop    %edi
 a84:	5d                   	pop    %ebp
 a85:	c3                   	ret    
 a86:	66 90                	xchg   %ax,%ax

00000a88 <strchr>:

char*
strchr(const char *s, char c)
{
 a88:	55                   	push   %ebp
 a89:	89 e5                	mov    %esp,%ebp
 a8b:	8b 45 08             	mov    0x8(%ebp),%eax
 a8e:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 a91:	8a 10                	mov    (%eax),%dl
 a93:	84 d2                	test   %dl,%dl
 a95:	75 0c                	jne    aa3 <strchr+0x1b>
 a97:	eb 13                	jmp    aac <strchr+0x24>
 a99:	8d 76 00             	lea    0x0(%esi),%esi
 a9c:	40                   	inc    %eax
 a9d:	8a 10                	mov    (%eax),%dl
 a9f:	84 d2                	test   %dl,%dl
 aa1:	74 09                	je     aac <strchr+0x24>
    if(*s == c)
 aa3:	38 d1                	cmp    %dl,%cl
 aa5:	75 f5                	jne    a9c <strchr+0x14>
      return (char*)s;
  return 0;
}
 aa7:	5d                   	pop    %ebp
 aa8:	c3                   	ret    
 aa9:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
 aac:	31 c0                	xor    %eax,%eax
}
 aae:	5d                   	pop    %ebp
 aaf:	c3                   	ret    

00000ab0 <gets>:

char*
gets(char *buf, int max)
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	57                   	push   %edi
 ab4:	56                   	push   %esi
 ab5:	53                   	push   %ebx
 ab6:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 ab9:	8b 75 08             	mov    0x8(%ebp),%esi
 abc:	bb 01 00 00 00       	mov    $0x1,%ebx
 ac1:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
 ac3:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 ac6:	eb 20                	jmp    ae8 <gets+0x38>
    cc = read(0, &c, 1);
 ac8:	50                   	push   %eax
 ac9:	6a 01                	push   $0x1
 acb:	57                   	push   %edi
 acc:	6a 00                	push   $0x0
 ace:	e8 ea 00 00 00       	call   bbd <read>
    if(cc < 1)
 ad3:	83 c4 10             	add    $0x10,%esp
 ad6:	85 c0                	test   %eax,%eax
 ad8:	7e 16                	jle    af0 <gets+0x40>
      break;
    buf[i++] = c;
 ada:	8a 45 e7             	mov    -0x19(%ebp),%al
 add:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
 adf:	46                   	inc    %esi
 ae0:	3c 0a                	cmp    $0xa,%al
 ae2:	74 0c                	je     af0 <gets+0x40>
 ae4:	3c 0d                	cmp    $0xd,%al
 ae6:	74 08                	je     af0 <gets+0x40>
  for(i=0; i+1 < max; ){
 ae8:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 aeb:	39 45 0c             	cmp    %eax,0xc(%ebp)
 aee:	7f d8                	jg     ac8 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 af0:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
 af3:	8b 45 08             	mov    0x8(%ebp),%eax
 af6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 af9:	5b                   	pop    %ebx
 afa:	5e                   	pop    %esi
 afb:	5f                   	pop    %edi
 afc:	5d                   	pop    %ebp
 afd:	c3                   	ret    
 afe:	66 90                	xchg   %ax,%ax

00000b00 <stat>:

int
stat(const char *n, struct stat *st)
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	56                   	push   %esi
 b04:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 b05:	83 ec 08             	sub    $0x8,%esp
 b08:	6a 00                	push   $0x0
 b0a:	ff 75 08             	pushl  0x8(%ebp)
 b0d:	e8 d3 00 00 00       	call   be5 <open>
  if(fd < 0)
 b12:	83 c4 10             	add    $0x10,%esp
 b15:	85 c0                	test   %eax,%eax
 b17:	78 27                	js     b40 <stat+0x40>
 b19:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 b1b:	83 ec 08             	sub    $0x8,%esp
 b1e:	ff 75 0c             	pushl  0xc(%ebp)
 b21:	50                   	push   %eax
 b22:	e8 d6 00 00 00       	call   bfd <fstat>
 b27:	89 c6                	mov    %eax,%esi
  close(fd);
 b29:	89 1c 24             	mov    %ebx,(%esp)
 b2c:	e8 9c 00 00 00       	call   bcd <close>
  return r;
 b31:	83 c4 10             	add    $0x10,%esp
}
 b34:	89 f0                	mov    %esi,%eax
 b36:	8d 65 f8             	lea    -0x8(%ebp),%esp
 b39:	5b                   	pop    %ebx
 b3a:	5e                   	pop    %esi
 b3b:	5d                   	pop    %ebp
 b3c:	c3                   	ret    
 b3d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 b40:	be ff ff ff ff       	mov    $0xffffffff,%esi
 b45:	eb ed                	jmp    b34 <stat+0x34>
 b47:	90                   	nop

00000b48 <atoi>:

int
atoi(const char *s)
{
 b48:	55                   	push   %ebp
 b49:	89 e5                	mov    %esp,%ebp
 b4b:	53                   	push   %ebx
 b4c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 b4f:	0f be 01             	movsbl (%ecx),%eax
 b52:	8d 50 d0             	lea    -0x30(%eax),%edx
 b55:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
 b58:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 b5d:	77 16                	ja     b75 <atoi+0x2d>
 b5f:	90                   	nop
    n = n*10 + *s++ - '0';
 b60:	41                   	inc    %ecx
 b61:	8d 14 92             	lea    (%edx,%edx,4),%edx
 b64:	01 d2                	add    %edx,%edx
 b66:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
 b6a:	0f be 01             	movsbl (%ecx),%eax
 b6d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 b70:	80 fb 09             	cmp    $0x9,%bl
 b73:	76 eb                	jbe    b60 <atoi+0x18>
  return n;
}
 b75:	89 d0                	mov    %edx,%eax
 b77:	5b                   	pop    %ebx
 b78:	5d                   	pop    %ebp
 b79:	c3                   	ret    
 b7a:	66 90                	xchg   %ax,%ax

00000b7c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 b7c:	55                   	push   %ebp
 b7d:	89 e5                	mov    %esp,%ebp
 b7f:	57                   	push   %edi
 b80:	56                   	push   %esi
 b81:	8b 45 08             	mov    0x8(%ebp),%eax
 b84:	8b 75 0c             	mov    0xc(%ebp),%esi
 b87:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 b8a:	85 d2                	test   %edx,%edx
 b8c:	7e 0b                	jle    b99 <memmove+0x1d>
 b8e:	01 c2                	add    %eax,%edx
  dst = vdst;
 b90:	89 c7                	mov    %eax,%edi
 b92:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 b94:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 b95:	39 fa                	cmp    %edi,%edx
 b97:	75 fb                	jne    b94 <memmove+0x18>
  return vdst;
}
 b99:	5e                   	pop    %esi
 b9a:	5f                   	pop    %edi
 b9b:	5d                   	pop    %ebp
 b9c:	c3                   	ret    

00000b9d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 b9d:	b8 01 00 00 00       	mov    $0x1,%eax
 ba2:	cd 40                	int    $0x40
 ba4:	c3                   	ret    

00000ba5 <exit>:
SYSCALL(exit)
 ba5:	b8 02 00 00 00       	mov    $0x2,%eax
 baa:	cd 40                	int    $0x40
 bac:	c3                   	ret    

00000bad <wait>:
SYSCALL(wait)
 bad:	b8 03 00 00 00       	mov    $0x3,%eax
 bb2:	cd 40                	int    $0x40
 bb4:	c3                   	ret    

00000bb5 <pipe>:
SYSCALL(pipe)
 bb5:	b8 04 00 00 00       	mov    $0x4,%eax
 bba:	cd 40                	int    $0x40
 bbc:	c3                   	ret    

00000bbd <read>:
SYSCALL(read)
 bbd:	b8 05 00 00 00       	mov    $0x5,%eax
 bc2:	cd 40                	int    $0x40
 bc4:	c3                   	ret    

00000bc5 <write>:
SYSCALL(write)
 bc5:	b8 10 00 00 00       	mov    $0x10,%eax
 bca:	cd 40                	int    $0x40
 bcc:	c3                   	ret    

00000bcd <close>:
SYSCALL(close)
 bcd:	b8 15 00 00 00       	mov    $0x15,%eax
 bd2:	cd 40                	int    $0x40
 bd4:	c3                   	ret    

00000bd5 <kill>:
SYSCALL(kill)
 bd5:	b8 06 00 00 00       	mov    $0x6,%eax
 bda:	cd 40                	int    $0x40
 bdc:	c3                   	ret    

00000bdd <exec>:
SYSCALL(exec)
 bdd:	b8 07 00 00 00       	mov    $0x7,%eax
 be2:	cd 40                	int    $0x40
 be4:	c3                   	ret    

00000be5 <open>:
SYSCALL(open)
 be5:	b8 0f 00 00 00       	mov    $0xf,%eax
 bea:	cd 40                	int    $0x40
 bec:	c3                   	ret    

00000bed <mknod>:
SYSCALL(mknod)
 bed:	b8 11 00 00 00       	mov    $0x11,%eax
 bf2:	cd 40                	int    $0x40
 bf4:	c3                   	ret    

00000bf5 <unlink>:
SYSCALL(unlink)
 bf5:	b8 12 00 00 00       	mov    $0x12,%eax
 bfa:	cd 40                	int    $0x40
 bfc:	c3                   	ret    

00000bfd <fstat>:
SYSCALL(fstat)
 bfd:	b8 08 00 00 00       	mov    $0x8,%eax
 c02:	cd 40                	int    $0x40
 c04:	c3                   	ret    

00000c05 <link>:
SYSCALL(link)
 c05:	b8 13 00 00 00       	mov    $0x13,%eax
 c0a:	cd 40                	int    $0x40
 c0c:	c3                   	ret    

00000c0d <mkdir>:
SYSCALL(mkdir)
 c0d:	b8 14 00 00 00       	mov    $0x14,%eax
 c12:	cd 40                	int    $0x40
 c14:	c3                   	ret    

00000c15 <chdir>:
SYSCALL(chdir)
 c15:	b8 09 00 00 00       	mov    $0x9,%eax
 c1a:	cd 40                	int    $0x40
 c1c:	c3                   	ret    

00000c1d <dup>:
SYSCALL(dup)
 c1d:	b8 0a 00 00 00       	mov    $0xa,%eax
 c22:	cd 40                	int    $0x40
 c24:	c3                   	ret    

00000c25 <getpid>:
SYSCALL(getpid)
 c25:	b8 0b 00 00 00       	mov    $0xb,%eax
 c2a:	cd 40                	int    $0x40
 c2c:	c3                   	ret    

00000c2d <sbrk>:
SYSCALL(sbrk)
 c2d:	b8 0c 00 00 00       	mov    $0xc,%eax
 c32:	cd 40                	int    $0x40
 c34:	c3                   	ret    

00000c35 <sleep>:
SYSCALL(sleep)
 c35:	b8 0d 00 00 00       	mov    $0xd,%eax
 c3a:	cd 40                	int    $0x40
 c3c:	c3                   	ret    

00000c3d <uptime>:
SYSCALL(uptime)
 c3d:	b8 0e 00 00 00       	mov    $0xe,%eax
 c42:	cd 40                	int    $0x40
 c44:	c3                   	ret    

00000c45 <getreadcount>:
 c45:	b8 16 00 00 00       	mov    $0x16,%eax
 c4a:	cd 40                	int    $0x40
 c4c:	c3                   	ret    
 c4d:	66 90                	xchg   %ax,%ax
 c4f:	90                   	nop

00000c50 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 c50:	55                   	push   %ebp
 c51:	89 e5                	mov    %esp,%ebp
 c53:	57                   	push   %edi
 c54:	56                   	push   %esi
 c55:	53                   	push   %ebx
 c56:	83 ec 3c             	sub    $0x3c,%esp
 c59:	89 45 bc             	mov    %eax,-0x44(%ebp)
 c5c:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 c5f:	89 d1                	mov    %edx,%ecx
  if(sgn && xx < 0){
 c61:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c64:	85 db                	test   %ebx,%ebx
 c66:	74 04                	je     c6c <printint+0x1c>
 c68:	85 d2                	test   %edx,%edx
 c6a:	78 68                	js     cd4 <printint+0x84>
  neg = 0;
 c6c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 c73:	31 ff                	xor    %edi,%edi
 c75:	8d 75 d7             	lea    -0x29(%ebp),%esi
  do{
    buf[i++] = digits[x % base];
 c78:	89 c8                	mov    %ecx,%eax
 c7a:	31 d2                	xor    %edx,%edx
 c7c:	f7 75 c4             	divl   -0x3c(%ebp)
 c7f:	89 fb                	mov    %edi,%ebx
 c81:	8d 7f 01             	lea    0x1(%edi),%edi
 c84:	8a 92 d4 10 00 00    	mov    0x10d4(%edx),%dl
 c8a:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
  }while((x /= base) != 0);
 c8e:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 c91:	89 c1                	mov    %eax,%ecx
 c93:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 c96:	3b 45 c0             	cmp    -0x40(%ebp),%eax
 c99:	76 dd                	jbe    c78 <printint+0x28>
  if(neg)
 c9b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 c9e:	85 c9                	test   %ecx,%ecx
 ca0:	74 09                	je     cab <printint+0x5b>
    buf[i++] = '-';
 ca2:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
 ca7:	89 fb                	mov    %edi,%ebx
    buf[i++] = '-';
 ca9:	b2 2d                	mov    $0x2d,%dl

  while(--i >= 0)
 cab:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 caf:	8b 7d bc             	mov    -0x44(%ebp),%edi
 cb2:	eb 03                	jmp    cb7 <printint+0x67>
 cb4:	8a 13                	mov    (%ebx),%dl
 cb6:	4b                   	dec    %ebx
    putc(fd, buf[i]);
 cb7:	88 55 d7             	mov    %dl,-0x29(%ebp)
  write(fd, &c, 1);
 cba:	50                   	push   %eax
 cbb:	6a 01                	push   $0x1
 cbd:	56                   	push   %esi
 cbe:	57                   	push   %edi
 cbf:	e8 01 ff ff ff       	call   bc5 <write>
  while(--i >= 0)
 cc4:	83 c4 10             	add    $0x10,%esp
 cc7:	39 de                	cmp    %ebx,%esi
 cc9:	75 e9                	jne    cb4 <printint+0x64>
}
 ccb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 cce:	5b                   	pop    %ebx
 ccf:	5e                   	pop    %esi
 cd0:	5f                   	pop    %edi
 cd1:	5d                   	pop    %ebp
 cd2:	c3                   	ret    
 cd3:	90                   	nop
    x = -xx;
 cd4:	f7 d9                	neg    %ecx
 cd6:	eb 9b                	jmp    c73 <printint+0x23>

00000cd8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 cd8:	55                   	push   %ebp
 cd9:	89 e5                	mov    %esp,%ebp
 cdb:	57                   	push   %edi
 cdc:	56                   	push   %esi
 cdd:	53                   	push   %ebx
 cde:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 ce1:	8b 75 0c             	mov    0xc(%ebp),%esi
 ce4:	8a 1e                	mov    (%esi),%bl
 ce6:	84 db                	test   %bl,%bl
 ce8:	0f 84 a3 00 00 00    	je     d91 <printf+0xb9>
 cee:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 cef:	8d 45 10             	lea    0x10(%ebp),%eax
 cf2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  state = 0;
 cf5:	31 d2                	xor    %edx,%edx
  write(fd, &c, 1);
 cf7:	8d 7d e7             	lea    -0x19(%ebp),%edi
 cfa:	eb 29                	jmp    d25 <printf+0x4d>
 cfc:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 cff:	83 f8 25             	cmp    $0x25,%eax
 d02:	0f 84 94 00 00 00    	je     d9c <printf+0xc4>
        state = '%';
      } else {
        putc(fd, c);
 d08:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 d0b:	50                   	push   %eax
 d0c:	6a 01                	push   $0x1
 d0e:	57                   	push   %edi
 d0f:	ff 75 08             	pushl  0x8(%ebp)
 d12:	e8 ae fe ff ff       	call   bc5 <write>
        putc(fd, c);
 d17:	83 c4 10             	add    $0x10,%esp
 d1a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  for(i = 0; fmt[i]; i++){
 d1d:	46                   	inc    %esi
 d1e:	8a 5e ff             	mov    -0x1(%esi),%bl
 d21:	84 db                	test   %bl,%bl
 d23:	74 6c                	je     d91 <printf+0xb9>
    c = fmt[i] & 0xff;
 d25:	0f be cb             	movsbl %bl,%ecx
 d28:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 d2b:	85 d2                	test   %edx,%edx
 d2d:	74 cd                	je     cfc <printf+0x24>
      }
    } else if(state == '%'){
 d2f:	83 fa 25             	cmp    $0x25,%edx
 d32:	75 e9                	jne    d1d <printf+0x45>
      if(c == 'd'){
 d34:	83 f8 64             	cmp    $0x64,%eax
 d37:	0f 84 97 00 00 00    	je     dd4 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 d3d:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 d43:	83 f9 70             	cmp    $0x70,%ecx
 d46:	74 60                	je     da8 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 d48:	83 f8 73             	cmp    $0x73,%eax
 d4b:	0f 84 8f 00 00 00    	je     de0 <printf+0x108>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 d51:	83 f8 63             	cmp    $0x63,%eax
 d54:	0f 84 d6 00 00 00    	je     e30 <printf+0x158>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 d5a:	83 f8 25             	cmp    $0x25,%eax
 d5d:	0f 84 c1 00 00 00    	je     e24 <printf+0x14c>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 d63:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 d67:	50                   	push   %eax
 d68:	6a 01                	push   $0x1
 d6a:	57                   	push   %edi
 d6b:	ff 75 08             	pushl  0x8(%ebp)
 d6e:	e8 52 fe ff ff       	call   bc5 <write>
        putc(fd, c);
 d73:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 d76:	83 c4 0c             	add    $0xc,%esp
 d79:	6a 01                	push   $0x1
 d7b:	57                   	push   %edi
 d7c:	ff 75 08             	pushl  0x8(%ebp)
 d7f:	e8 41 fe ff ff       	call   bc5 <write>
        putc(fd, c);
 d84:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 d87:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 d89:	46                   	inc    %esi
 d8a:	8a 5e ff             	mov    -0x1(%esi),%bl
 d8d:	84 db                	test   %bl,%bl
 d8f:	75 94                	jne    d25 <printf+0x4d>
    }
  }
}
 d91:	8d 65 f4             	lea    -0xc(%ebp),%esp
 d94:	5b                   	pop    %ebx
 d95:	5e                   	pop    %esi
 d96:	5f                   	pop    %edi
 d97:	5d                   	pop    %ebp
 d98:	c3                   	ret    
 d99:	8d 76 00             	lea    0x0(%esi),%esi
        state = '%';
 d9c:	ba 25 00 00 00       	mov    $0x25,%edx
 da1:	e9 77 ff ff ff       	jmp    d1d <printf+0x45>
 da6:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 da8:	83 ec 0c             	sub    $0xc,%esp
 dab:	6a 00                	push   $0x0
 dad:	b9 10 00 00 00       	mov    $0x10,%ecx
 db2:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 db5:	8b 13                	mov    (%ebx),%edx
 db7:	8b 45 08             	mov    0x8(%ebp),%eax
 dba:	e8 91 fe ff ff       	call   c50 <printint>
        ap++;
 dbf:	89 d8                	mov    %ebx,%eax
 dc1:	83 c0 04             	add    $0x4,%eax
 dc4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 dc7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 dca:	31 d2                	xor    %edx,%edx
        ap++;
 dcc:	e9 4c ff ff ff       	jmp    d1d <printf+0x45>
 dd1:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 dd4:	83 ec 0c             	sub    $0xc,%esp
 dd7:	6a 01                	push   $0x1
 dd9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 dde:	eb d2                	jmp    db2 <printf+0xda>
        s = (char*)*ap;
 de0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 de3:	8b 18                	mov    (%eax),%ebx
        ap++;
 de5:	83 c0 04             	add    $0x4,%eax
 de8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 deb:	85 db                	test   %ebx,%ebx
 ded:	74 65                	je     e54 <printf+0x17c>
        while(*s != 0){
 def:	8a 03                	mov    (%ebx),%al
 df1:	84 c0                	test   %al,%al
 df3:	74 70                	je     e65 <printf+0x18d>
 df5:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 df8:	89 de                	mov    %ebx,%esi
 dfa:	8b 5d 08             	mov    0x8(%ebp),%ebx
 dfd:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 e00:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 e03:	50                   	push   %eax
 e04:	6a 01                	push   $0x1
 e06:	57                   	push   %edi
 e07:	53                   	push   %ebx
 e08:	e8 b8 fd ff ff       	call   bc5 <write>
          s++;
 e0d:	46                   	inc    %esi
        while(*s != 0){
 e0e:	8a 06                	mov    (%esi),%al
 e10:	83 c4 10             	add    $0x10,%esp
 e13:	84 c0                	test   %al,%al
 e15:	75 e9                	jne    e00 <printf+0x128>
 e17:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 e1a:	31 d2                	xor    %edx,%edx
 e1c:	e9 fc fe ff ff       	jmp    d1d <printf+0x45>
 e21:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 e24:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 e27:	52                   	push   %edx
 e28:	e9 4c ff ff ff       	jmp    d79 <printf+0xa1>
 e2d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, *ap);
 e30:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 e33:	8b 03                	mov    (%ebx),%eax
 e35:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 e38:	51                   	push   %ecx
 e39:	6a 01                	push   $0x1
 e3b:	57                   	push   %edi
 e3c:	ff 75 08             	pushl  0x8(%ebp)
 e3f:	e8 81 fd ff ff       	call   bc5 <write>
        ap++;
 e44:	83 c3 04             	add    $0x4,%ebx
 e47:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 e4a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 e4d:	31 d2                	xor    %edx,%edx
 e4f:	e9 c9 fe ff ff       	jmp    d1d <printf+0x45>
          s = "(null)";
 e54:	bb cc 10 00 00       	mov    $0x10cc,%ebx
        while(*s != 0){
 e59:	b0 28                	mov    $0x28,%al
 e5b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 e5e:	89 de                	mov    %ebx,%esi
 e60:	8b 5d 08             	mov    0x8(%ebp),%ebx
 e63:	eb 9b                	jmp    e00 <printf+0x128>
      state = 0;
 e65:	31 d2                	xor    %edx,%edx
 e67:	e9 b1 fe ff ff       	jmp    d1d <printf+0x45>

00000e6c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 e6c:	55                   	push   %ebp
 e6d:	89 e5                	mov    %esp,%ebp
 e6f:	57                   	push   %edi
 e70:	56                   	push   %esi
 e71:	53                   	push   %ebx
 e72:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 e75:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 e78:	a1 24 17 00 00       	mov    0x1724,%eax
 e7d:	8b 10                	mov    (%eax),%edx
 e7f:	39 c8                	cmp    %ecx,%eax
 e81:	73 11                	jae    e94 <free+0x28>
 e83:	90                   	nop
 e84:	39 d1                	cmp    %edx,%ecx
 e86:	72 14                	jb     e9c <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 e88:	39 d0                	cmp    %edx,%eax
 e8a:	73 10                	jae    e9c <free+0x30>
{
 e8c:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 e8e:	8b 10                	mov    (%eax),%edx
 e90:	39 c8                	cmp    %ecx,%eax
 e92:	72 f0                	jb     e84 <free+0x18>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 e94:	39 d0                	cmp    %edx,%eax
 e96:	72 f4                	jb     e8c <free+0x20>
 e98:	39 d1                	cmp    %edx,%ecx
 e9a:	73 f0                	jae    e8c <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 e9c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 e9f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 ea2:	39 fa                	cmp    %edi,%edx
 ea4:	74 1a                	je     ec0 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 ea6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 ea9:	8b 50 04             	mov    0x4(%eax),%edx
 eac:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 eaf:	39 f1                	cmp    %esi,%ecx
 eb1:	74 24                	je     ed7 <free+0x6b>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 eb3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 eb5:	a3 24 17 00 00       	mov    %eax,0x1724
}
 eba:	5b                   	pop    %ebx
 ebb:	5e                   	pop    %esi
 ebc:	5f                   	pop    %edi
 ebd:	5d                   	pop    %ebp
 ebe:	c3                   	ret    
 ebf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 ec0:	03 72 04             	add    0x4(%edx),%esi
 ec3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 ec6:	8b 10                	mov    (%eax),%edx
 ec8:	8b 12                	mov    (%edx),%edx
 eca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 ecd:	8b 50 04             	mov    0x4(%eax),%edx
 ed0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ed3:	39 f1                	cmp    %esi,%ecx
 ed5:	75 dc                	jne    eb3 <free+0x47>
    p->s.size += bp->s.size;
 ed7:	03 53 fc             	add    -0x4(%ebx),%edx
 eda:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 edd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 ee0:	89 10                	mov    %edx,(%eax)
  freep = p;
 ee2:	a3 24 17 00 00       	mov    %eax,0x1724
}
 ee7:	5b                   	pop    %ebx
 ee8:	5e                   	pop    %esi
 ee9:	5f                   	pop    %edi
 eea:	5d                   	pop    %ebp
 eeb:	c3                   	ret    

00000eec <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 eec:	55                   	push   %ebp
 eed:	89 e5                	mov    %esp,%ebp
 eef:	57                   	push   %edi
 ef0:	56                   	push   %esi
 ef1:	53                   	push   %ebx
 ef2:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ef5:	8b 45 08             	mov    0x8(%ebp),%eax
 ef8:	8d 70 07             	lea    0x7(%eax),%esi
 efb:	c1 ee 03             	shr    $0x3,%esi
 efe:	46                   	inc    %esi
  if((prevp = freep) == 0){
 eff:	8b 3d 24 17 00 00    	mov    0x1724,%edi
 f05:	85 ff                	test   %edi,%edi
 f07:	0f 84 a3 00 00 00    	je     fb0 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f0d:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 f0f:	8b 48 04             	mov    0x4(%eax),%ecx
 f12:	39 f1                	cmp    %esi,%ecx
 f14:	73 67                	jae    f7d <malloc+0x91>
 f16:	89 f3                	mov    %esi,%ebx
 f18:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 f1e:	0f 82 80 00 00 00    	jb     fa4 <malloc+0xb8>
  p = sbrk(nu * sizeof(Header));
 f24:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 f2b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 f2e:	eb 11                	jmp    f41 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f30:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 f32:	8b 4a 04             	mov    0x4(%edx),%ecx
 f35:	39 f1                	cmp    %esi,%ecx
 f37:	73 4b                	jae    f84 <malloc+0x98>
 f39:	8b 3d 24 17 00 00    	mov    0x1724,%edi
 f3f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 f41:	39 c7                	cmp    %eax,%edi
 f43:	75 eb                	jne    f30 <malloc+0x44>
  p = sbrk(nu * sizeof(Header));
 f45:	83 ec 0c             	sub    $0xc,%esp
 f48:	ff 75 e4             	pushl  -0x1c(%ebp)
 f4b:	e8 dd fc ff ff       	call   c2d <sbrk>
  if(p == (char*)-1)
 f50:	83 c4 10             	add    $0x10,%esp
 f53:	83 f8 ff             	cmp    $0xffffffff,%eax
 f56:	74 1b                	je     f73 <malloc+0x87>
  hp->s.size = nu;
 f58:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 f5b:	83 ec 0c             	sub    $0xc,%esp
 f5e:	83 c0 08             	add    $0x8,%eax
 f61:	50                   	push   %eax
 f62:	e8 05 ff ff ff       	call   e6c <free>
  return freep;
 f67:	a1 24 17 00 00       	mov    0x1724,%eax
      if((p = morecore(nunits)) == 0)
 f6c:	83 c4 10             	add    $0x10,%esp
 f6f:	85 c0                	test   %eax,%eax
 f71:	75 bd                	jne    f30 <malloc+0x44>
        return 0;
 f73:	31 c0                	xor    %eax,%eax
  }
}
 f75:	8d 65 f4             	lea    -0xc(%ebp),%esp
 f78:	5b                   	pop    %ebx
 f79:	5e                   	pop    %esi
 f7a:	5f                   	pop    %edi
 f7b:	5d                   	pop    %ebp
 f7c:	c3                   	ret    
    if(p->s.size >= nunits){
 f7d:	89 c2                	mov    %eax,%edx
 f7f:	89 f8                	mov    %edi,%eax
 f81:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 f84:	39 ce                	cmp    %ecx,%esi
 f86:	74 54                	je     fdc <malloc+0xf0>
        p->s.size -= nunits;
 f88:	29 f1                	sub    %esi,%ecx
 f8a:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 f8d:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 f90:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 f93:	a3 24 17 00 00       	mov    %eax,0x1724
      return (void*)(p + 1);
 f98:	8d 42 08             	lea    0x8(%edx),%eax
}
 f9b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 f9e:	5b                   	pop    %ebx
 f9f:	5e                   	pop    %esi
 fa0:	5f                   	pop    %edi
 fa1:	5d                   	pop    %ebp
 fa2:	c3                   	ret    
 fa3:	90                   	nop
 fa4:	bb 00 10 00 00       	mov    $0x1000,%ebx
 fa9:	e9 76 ff ff ff       	jmp    f24 <malloc+0x38>
 fae:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 fb0:	c7 05 24 17 00 00 28 	movl   $0x1728,0x1724
 fb7:	17 00 00 
 fba:	c7 05 28 17 00 00 28 	movl   $0x1728,0x1728
 fc1:	17 00 00 
    base.s.size = 0;
 fc4:	c7 05 2c 17 00 00 00 	movl   $0x0,0x172c
 fcb:	00 00 00 
 fce:	bf 28 17 00 00       	mov    $0x1728,%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 fd3:	89 f8                	mov    %edi,%eax
 fd5:	e9 3c ff ff ff       	jmp    f16 <malloc+0x2a>
 fda:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 fdc:	8b 0a                	mov    (%edx),%ecx
 fde:	89 08                	mov    %ecx,(%eax)
 fe0:	eb b1                	jmp    f93 <malloc+0xa7>
