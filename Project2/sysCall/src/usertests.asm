
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 b2 49 00 00       	push   $0x49b2
      16:	6a 01                	push   $0x1
      18:	e8 9b 36 00 00       	call   36b8 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	59                   	pop    %ecx
      1e:	58                   	pop    %eax
      1f:	6a 00                	push   $0x0
      21:	68 c6 49 00 00       	push   $0x49c6
      26:	e8 9a 35 00 00       	call   35c5 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 13                	js     45 <main+0x45>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	52                   	push   %edx
      33:	52                   	push   %edx
      34:	68 30 51 00 00       	push   $0x5130
      39:	6a 01                	push   $0x1
      3b:	e8 78 36 00 00       	call   36b8 <printf>
    exit();
      40:	e8 40 35 00 00       	call   3585 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      45:	50                   	push   %eax
      46:	50                   	push   %eax
      47:	68 00 02 00 00       	push   $0x200
      4c:	68 c6 49 00 00       	push   $0x49c6
      51:	e8 6f 35 00 00       	call   35c5 <open>
      56:	89 04 24             	mov    %eax,(%esp)
      59:	e8 4f 35 00 00       	call   35ad <close>

  argptest();
      5e:	e8 e5 32 00 00       	call   3348 <argptest>
  createdelete();
      63:	e8 90 10 00 00       	call   10f8 <createdelete>
  linkunlink();
      68:	e8 97 18 00 00       	call   1904 <linkunlink>
  concreate();
      6d:	e8 d2 15 00 00       	call   1644 <concreate>
  fourfiles();
      72:	e8 b9 0e 00 00       	call   f30 <fourfiles>
  sharedfd();
      77:	e8 1c 0d 00 00       	call   d98 <sharedfd>

  bigargtest();
      7c:	e8 97 2f 00 00       	call   3018 <bigargtest>
  bigwrite();
      81:	e8 92 21 00 00       	call   2218 <bigwrite>
  bigargtest();
      86:	e8 8d 2f 00 00       	call   3018 <bigargtest>
  bsstest();
      8b:	e8 28 2f 00 00       	call   2fb8 <bsstest>
  sbrktest();
      90:	e8 63 2a 00 00       	call   2af8 <sbrktest>
  validatetest();
      95:	e8 72 2e 00 00       	call   2f0c <validatetest>

  opentest();
      9a:	e8 39 03 00 00       	call   3d8 <opentest>
  writetest();
      9f:	e8 c4 03 00 00       	call   468 <writetest>
  writetest1();
      a4:	e8 8b 05 00 00       	call   634 <writetest1>
  createtest();
      a9:	e8 32 07 00 00       	call   7e0 <createtest>

  openiputtest();
      ae:	e8 35 02 00 00       	call   2e8 <openiputtest>
  exitiputtest();
      b3:	e8 3c 01 00 00       	call   1f4 <exitiputtest>
  iputtest();
      b8:	e8 57 00 00 00       	call   114 <iputtest>

  mem();
      bd:	e8 1e 0c 00 00       	call   ce0 <mem>
  pipe1();
      c2:	e8 e1 08 00 00       	call   9a8 <pipe1>
  preempt();
      c7:	e8 5c 0a 00 00       	call   b28 <preempt>
  exitwait();
      cc:	e8 97 0b 00 00       	call   c68 <exitwait>

  rmdot();
      d1:	e8 02 25 00 00       	call   25d8 <rmdot>
  fourteen();
      d6:	e8 c9 23 00 00       	call   24a4 <fourteen>
  bigfile();
      db:	e8 0c 22 00 00       	call   22ec <bigfile>
  subdir();
      e0:	e8 5b 1a 00 00       	call   1b40 <subdir>
  linktest();
      e5:	e8 4e 13 00 00       	call   1438 <linktest>
  unlinkread();
      ea:	e8 c5 11 00 00       	call   12b4 <unlinkread>
  dirfile();
      ef:	e8 58 26 00 00       	call   274c <dirfile>
  iref();
      f4:	e8 4b 28 00 00       	call   2944 <iref>
  forktest();
      f9:	e8 5e 29 00 00       	call   2a5c <forktest>
  bigdir(); // slow
      fe:	e8 11 19 00 00       	call   1a14 <bigdir>

  uio();
     103:	e8 d0 31 00 00       	call   32d8 <uio>

  exectest();
     108:	e8 53 08 00 00       	call   960 <exectest>

  exit();
     10d:	e8 73 34 00 00       	call   3585 <exit>
     112:	66 90                	xchg   %ax,%ax

00000114 <iputtest>:
{
     114:	55                   	push   %ebp
     115:	89 e5                	mov    %esp,%ebp
     117:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     11a:	68 5e 3a 00 00       	push   $0x3a5e
     11f:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     125:	e8 8e 35 00 00       	call   36b8 <printf>
  if(mkdir("iputdir") < 0){
     12a:	c7 04 24 f1 39 00 00 	movl   $0x39f1,(%esp)
     131:	e8 b7 34 00 00       	call   35ed <mkdir>
     136:	83 c4 10             	add    $0x10,%esp
     139:	85 c0                	test   %eax,%eax
     13b:	78 58                	js     195 <iputtest+0x81>
  if(chdir("iputdir") < 0){
     13d:	83 ec 0c             	sub    $0xc,%esp
     140:	68 f1 39 00 00       	push   $0x39f1
     145:	e8 ab 34 00 00       	call   35f5 <chdir>
     14a:	83 c4 10             	add    $0x10,%esp
     14d:	85 c0                	test   %eax,%eax
     14f:	0f 88 85 00 00 00    	js     1da <iputtest+0xc6>
  if(unlink("../iputdir") < 0){
     155:	83 ec 0c             	sub    $0xc,%esp
     158:	68 ee 39 00 00       	push   $0x39ee
     15d:	e8 73 34 00 00       	call   35d5 <unlink>
     162:	83 c4 10             	add    $0x10,%esp
     165:	85 c0                	test   %eax,%eax
     167:	78 5a                	js     1c3 <iputtest+0xaf>
  if(chdir("/") < 0){
     169:	83 ec 0c             	sub    $0xc,%esp
     16c:	68 13 3a 00 00       	push   $0x3a13
     171:	e8 7f 34 00 00       	call   35f5 <chdir>
     176:	83 c4 10             	add    $0x10,%esp
     179:	85 c0                	test   %eax,%eax
     17b:	78 2f                	js     1ac <iputtest+0x98>
  printf(stdout, "iput test ok\n");
     17d:	83 ec 08             	sub    $0x8,%esp
     180:	68 96 3a 00 00       	push   $0x3a96
     185:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     18b:	e8 28 35 00 00       	call   36b8 <printf>
}
     190:	83 c4 10             	add    $0x10,%esp
     193:	c9                   	leave  
     194:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     195:	50                   	push   %eax
     196:	50                   	push   %eax
     197:	68 ca 39 00 00       	push   $0x39ca
     19c:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     1a2:	e8 11 35 00 00       	call   36b8 <printf>
    exit();
     1a7:	e8 d9 33 00 00       	call   3585 <exit>
    printf(stdout, "chdir / failed\n");
     1ac:	50                   	push   %eax
     1ad:	50                   	push   %eax
     1ae:	68 15 3a 00 00       	push   $0x3a15
     1b3:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     1b9:	e8 fa 34 00 00       	call   36b8 <printf>
    exit();
     1be:	e8 c2 33 00 00       	call   3585 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
     1c3:	52                   	push   %edx
     1c4:	52                   	push   %edx
     1c5:	68 f9 39 00 00       	push   $0x39f9
     1ca:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     1d0:	e8 e3 34 00 00       	call   36b8 <printf>
    exit();
     1d5:	e8 ab 33 00 00       	call   3585 <exit>
    printf(stdout, "chdir iputdir failed\n");
     1da:	51                   	push   %ecx
     1db:	51                   	push   %ecx
     1dc:	68 d8 39 00 00       	push   $0x39d8
     1e1:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     1e7:	e8 cc 34 00 00       	call   36b8 <printf>
    exit();
     1ec:	e8 94 33 00 00       	call   3585 <exit>
     1f1:	8d 76 00             	lea    0x0(%esi),%esi

000001f4 <exitiputtest>:
{
     1f4:	55                   	push   %ebp
     1f5:	89 e5                	mov    %esp,%ebp
     1f7:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exitiput test\n");
     1fa:	68 25 3a 00 00       	push   $0x3a25
     1ff:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     205:	e8 ae 34 00 00       	call   36b8 <printf>
  pid = fork();
     20a:	e8 6e 33 00 00       	call   357d <fork>
  if(pid < 0){
     20f:	83 c4 10             	add    $0x10,%esp
     212:	85 c0                	test   %eax,%eax
     214:	0f 88 86 00 00 00    	js     2a0 <exitiputtest+0xac>
  if(pid == 0){
     21a:	75 4c                	jne    268 <exitiputtest+0x74>
    if(mkdir("iputdir") < 0){
     21c:	83 ec 0c             	sub    $0xc,%esp
     21f:	68 f1 39 00 00       	push   $0x39f1
     224:	e8 c4 33 00 00       	call   35ed <mkdir>
     229:	83 c4 10             	add    $0x10,%esp
     22c:	85 c0                	test   %eax,%eax
     22e:	0f 88 83 00 00 00    	js     2b7 <exitiputtest+0xc3>
    if(chdir("iputdir") < 0){
     234:	83 ec 0c             	sub    $0xc,%esp
     237:	68 f1 39 00 00       	push   $0x39f1
     23c:	e8 b4 33 00 00       	call   35f5 <chdir>
     241:	83 c4 10             	add    $0x10,%esp
     244:	85 c0                	test   %eax,%eax
     246:	0f 88 82 00 00 00    	js     2ce <exitiputtest+0xda>
    if(unlink("../iputdir") < 0){
     24c:	83 ec 0c             	sub    $0xc,%esp
     24f:	68 ee 39 00 00       	push   $0x39ee
     254:	e8 7c 33 00 00       	call   35d5 <unlink>
     259:	83 c4 10             	add    $0x10,%esp
     25c:	85 c0                	test   %eax,%eax
     25e:	78 28                	js     288 <exitiputtest+0x94>
    exit();
     260:	e8 20 33 00 00       	call   3585 <exit>
     265:	8d 76 00             	lea    0x0(%esi),%esi
  wait();
     268:	e8 20 33 00 00       	call   358d <wait>
  printf(stdout, "exitiput test ok\n");
     26d:	83 ec 08             	sub    $0x8,%esp
     270:	68 48 3a 00 00       	push   $0x3a48
     275:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     27b:	e8 38 34 00 00       	call   36b8 <printf>
}
     280:	83 c4 10             	add    $0x10,%esp
     283:	c9                   	leave  
     284:	c3                   	ret    
     285:	8d 76 00             	lea    0x0(%esi),%esi
      printf(stdout, "unlink ../iputdir failed\n");
     288:	83 ec 08             	sub    $0x8,%esp
     28b:	68 f9 39 00 00       	push   $0x39f9
     290:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     296:	e8 1d 34 00 00       	call   36b8 <printf>
      exit();
     29b:	e8 e5 32 00 00       	call   3585 <exit>
    printf(stdout, "fork failed\n");
     2a0:	51                   	push   %ecx
     2a1:	51                   	push   %ecx
     2a2:	68 05 49 00 00       	push   $0x4905
     2a7:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     2ad:	e8 06 34 00 00       	call   36b8 <printf>
    exit();
     2b2:	e8 ce 32 00 00       	call   3585 <exit>
      printf(stdout, "mkdir failed\n");
     2b7:	52                   	push   %edx
     2b8:	52                   	push   %edx
     2b9:	68 ca 39 00 00       	push   $0x39ca
     2be:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     2c4:	e8 ef 33 00 00       	call   36b8 <printf>
      exit();
     2c9:	e8 b7 32 00 00       	call   3585 <exit>
      printf(stdout, "child chdir failed\n");
     2ce:	50                   	push   %eax
     2cf:	50                   	push   %eax
     2d0:	68 34 3a 00 00       	push   $0x3a34
     2d5:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     2db:	e8 d8 33 00 00       	call   36b8 <printf>
      exit();
     2e0:	e8 a0 32 00 00       	call   3585 <exit>
     2e5:	8d 76 00             	lea    0x0(%esi),%esi

000002e8 <openiputtest>:
{
     2e8:	55                   	push   %ebp
     2e9:	89 e5                	mov    %esp,%ebp
     2eb:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "openiput test\n");
     2ee:	68 5a 3a 00 00       	push   $0x3a5a
     2f3:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     2f9:	e8 ba 33 00 00       	call   36b8 <printf>
  if(mkdir("oidir") < 0){
     2fe:	c7 04 24 69 3a 00 00 	movl   $0x3a69,(%esp)
     305:	e8 e3 32 00 00       	call   35ed <mkdir>
     30a:	83 c4 10             	add    $0x10,%esp
     30d:	85 c0                	test   %eax,%eax
     30f:	0f 88 93 00 00 00    	js     3a8 <openiputtest+0xc0>
  pid = fork();
     315:	e8 63 32 00 00       	call   357d <fork>
  if(pid < 0){
     31a:	85 c0                	test   %eax,%eax
     31c:	78 73                	js     391 <openiputtest+0xa9>
  if(pid == 0){
     31e:	75 30                	jne    350 <openiputtest+0x68>
    int fd = open("oidir", O_RDWR);
     320:	83 ec 08             	sub    $0x8,%esp
     323:	6a 02                	push   $0x2
     325:	68 69 3a 00 00       	push   $0x3a69
     32a:	e8 96 32 00 00       	call   35c5 <open>
    if(fd >= 0){
     32f:	83 c4 10             	add    $0x10,%esp
     332:	85 c0                	test   %eax,%eax
     334:	78 56                	js     38c <openiputtest+0xa4>
      printf(stdout, "open directory for write succeeded\n");
     336:	83 ec 08             	sub    $0x8,%esp
     339:	68 e8 49 00 00       	push   $0x49e8
     33e:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     344:	e8 6f 33 00 00       	call   36b8 <printf>
      exit();
     349:	e8 37 32 00 00       	call   3585 <exit>
     34e:	66 90                	xchg   %ax,%ax
  sleep(1);
     350:	83 ec 0c             	sub    $0xc,%esp
     353:	6a 01                	push   $0x1
     355:	e8 bb 32 00 00       	call   3615 <sleep>
  if(unlink("oidir") != 0){
     35a:	c7 04 24 69 3a 00 00 	movl   $0x3a69,(%esp)
     361:	e8 6f 32 00 00       	call   35d5 <unlink>
     366:	83 c4 10             	add    $0x10,%esp
     369:	85 c0                	test   %eax,%eax
     36b:	75 52                	jne    3bf <openiputtest+0xd7>
  wait();
     36d:	e8 1b 32 00 00       	call   358d <wait>
  printf(stdout, "openiput test ok\n");
     372:	83 ec 08             	sub    $0x8,%esp
     375:	68 92 3a 00 00       	push   $0x3a92
     37a:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     380:	e8 33 33 00 00       	call   36b8 <printf>
     385:	83 c4 10             	add    $0x10,%esp
}
     388:	c9                   	leave  
     389:	c3                   	ret    
     38a:	66 90                	xchg   %ax,%ax
    exit();
     38c:	e8 f4 31 00 00       	call   3585 <exit>
    printf(stdout, "fork failed\n");
     391:	52                   	push   %edx
     392:	52                   	push   %edx
     393:	68 05 49 00 00       	push   $0x4905
     398:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     39e:	e8 15 33 00 00       	call   36b8 <printf>
    exit();
     3a3:	e8 dd 31 00 00       	call   3585 <exit>
    printf(stdout, "mkdir oidir failed\n");
     3a8:	51                   	push   %ecx
     3a9:	51                   	push   %ecx
     3aa:	68 6f 3a 00 00       	push   $0x3a6f
     3af:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     3b5:	e8 fe 32 00 00       	call   36b8 <printf>
    exit();
     3ba:	e8 c6 31 00 00       	call   3585 <exit>
    printf(stdout, "unlink failed\n");
     3bf:	50                   	push   %eax
     3c0:	50                   	push   %eax
     3c1:	68 83 3a 00 00       	push   $0x3a83
     3c6:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     3cc:	e8 e7 32 00 00       	call   36b8 <printf>
    exit();
     3d1:	e8 af 31 00 00       	call   3585 <exit>
     3d6:	66 90                	xchg   %ax,%ax

000003d8 <opentest>:
{
     3d8:	55                   	push   %ebp
     3d9:	89 e5                	mov    %esp,%ebp
     3db:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "open test\n");
     3de:	68 a4 3a 00 00       	push   $0x3aa4
     3e3:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     3e9:	e8 ca 32 00 00       	call   36b8 <printf>
  fd = open("echo", 0);
     3ee:	58                   	pop    %eax
     3ef:	5a                   	pop    %edx
     3f0:	6a 00                	push   $0x0
     3f2:	68 af 3a 00 00       	push   $0x3aaf
     3f7:	e8 c9 31 00 00       	call   35c5 <open>
  if(fd < 0){
     3fc:	83 c4 10             	add    $0x10,%esp
     3ff:	85 c0                	test   %eax,%eax
     401:	78 36                	js     439 <opentest+0x61>
  close(fd);
     403:	83 ec 0c             	sub    $0xc,%esp
     406:	50                   	push   %eax
     407:	e8 a1 31 00 00       	call   35ad <close>
  fd = open("doesnotexist", 0);
     40c:	5a                   	pop    %edx
     40d:	59                   	pop    %ecx
     40e:	6a 00                	push   $0x0
     410:	68 c7 3a 00 00       	push   $0x3ac7
     415:	e8 ab 31 00 00       	call   35c5 <open>
  if(fd >= 0){
     41a:	83 c4 10             	add    $0x10,%esp
     41d:	85 c0                	test   %eax,%eax
     41f:	79 2f                	jns    450 <opentest+0x78>
  printf(stdout, "open test ok\n");
     421:	83 ec 08             	sub    $0x8,%esp
     424:	68 f2 3a 00 00       	push   $0x3af2
     429:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     42f:	e8 84 32 00 00       	call   36b8 <printf>
}
     434:	83 c4 10             	add    $0x10,%esp
     437:	c9                   	leave  
     438:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     439:	50                   	push   %eax
     43a:	50                   	push   %eax
     43b:	68 b4 3a 00 00       	push   $0x3ab4
     440:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     446:	e8 6d 32 00 00       	call   36b8 <printf>
    exit();
     44b:	e8 35 31 00 00       	call   3585 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     450:	50                   	push   %eax
     451:	50                   	push   %eax
     452:	68 d4 3a 00 00       	push   $0x3ad4
     457:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     45d:	e8 56 32 00 00       	call   36b8 <printf>
    exit();
     462:	e8 1e 31 00 00       	call   3585 <exit>
     467:	90                   	nop

00000468 <writetest>:
{
     468:	55                   	push   %ebp
     469:	89 e5                	mov    %esp,%ebp
     46b:	56                   	push   %esi
     46c:	53                   	push   %ebx
  printf(stdout, "small file test\n");
     46d:	83 ec 08             	sub    $0x8,%esp
     470:	68 00 3b 00 00       	push   $0x3b00
     475:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     47b:	e8 38 32 00 00       	call   36b8 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     480:	5a                   	pop    %edx
     481:	59                   	pop    %ecx
     482:	68 02 02 00 00       	push   $0x202
     487:	68 11 3b 00 00       	push   $0x3b11
     48c:	e8 34 31 00 00       	call   35c5 <open>
  if(fd >= 0){
     491:	83 c4 10             	add    $0x10,%esp
     494:	85 c0                	test   %eax,%eax
     496:	0f 88 7e 01 00 00    	js     61a <writetest+0x1b2>
     49c:	89 c6                	mov    %eax,%esi
    printf(stdout, "creat small succeeded; ok\n");
     49e:	83 ec 08             	sub    $0x8,%esp
     4a1:	68 17 3b 00 00       	push   $0x3b17
     4a6:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     4ac:	e8 07 32 00 00       	call   36b8 <printf>
     4b1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
     4b4:	31 db                	xor    %ebx,%ebx
     4b6:	66 90                	xchg   %ax,%ax
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4b8:	50                   	push   %eax
     4b9:	6a 0a                	push   $0xa
     4bb:	68 4e 3b 00 00       	push   $0x3b4e
     4c0:	56                   	push   %esi
     4c1:	e8 df 30 00 00       	call   35a5 <write>
     4c6:	83 c4 10             	add    $0x10,%esp
     4c9:	83 f8 0a             	cmp    $0xa,%eax
     4cc:	0f 85 d5 00 00 00    	jne    5a7 <writetest+0x13f>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4d2:	50                   	push   %eax
     4d3:	6a 0a                	push   $0xa
     4d5:	68 59 3b 00 00       	push   $0x3b59
     4da:	56                   	push   %esi
     4db:	e8 c5 30 00 00       	call   35a5 <write>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	83 f8 0a             	cmp    $0xa,%eax
     4e6:	0f 85 d2 00 00 00    	jne    5be <writetest+0x156>
  for(i = 0; i < 100; i++){
     4ec:	43                   	inc    %ebx
     4ed:	83 fb 64             	cmp    $0x64,%ebx
     4f0:	75 c6                	jne    4b8 <writetest+0x50>
  printf(stdout, "writes ok\n");
     4f2:	83 ec 08             	sub    $0x8,%esp
     4f5:	68 64 3b 00 00       	push   $0x3b64
     4fa:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     500:	e8 b3 31 00 00       	call   36b8 <printf>
  close(fd);
     505:	89 34 24             	mov    %esi,(%esp)
     508:	e8 a0 30 00 00       	call   35ad <close>
  fd = open("small", O_RDONLY);
     50d:	5b                   	pop    %ebx
     50e:	5e                   	pop    %esi
     50f:	6a 00                	push   $0x0
     511:	68 11 3b 00 00       	push   $0x3b11
     516:	e8 aa 30 00 00       	call   35c5 <open>
     51b:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     51d:	83 c4 10             	add    $0x10,%esp
     520:	85 c0                	test   %eax,%eax
     522:	0f 88 ad 00 00 00    	js     5d5 <writetest+0x16d>
    printf(stdout, "open small succeeded ok\n");
     528:	83 ec 08             	sub    $0x8,%esp
     52b:	68 6f 3b 00 00       	push   $0x3b6f
     530:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     536:	e8 7d 31 00 00       	call   36b8 <printf>
  i = read(fd, buf, 2000);
     53b:	83 c4 0c             	add    $0xc,%esp
     53e:	68 d0 07 00 00       	push   $0x7d0
     543:	68 40 82 00 00       	push   $0x8240
     548:	53                   	push   %ebx
     549:	e8 4f 30 00 00       	call   359d <read>
  if(i == 2000){
     54e:	83 c4 10             	add    $0x10,%esp
     551:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     556:	0f 85 90 00 00 00    	jne    5ec <writetest+0x184>
    printf(stdout, "read succeeded ok\n");
     55c:	83 ec 08             	sub    $0x8,%esp
     55f:	68 a3 3b 00 00       	push   $0x3ba3
     564:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     56a:	e8 49 31 00 00       	call   36b8 <printf>
  close(fd);
     56f:	89 1c 24             	mov    %ebx,(%esp)
     572:	e8 36 30 00 00       	call   35ad <close>
  if(unlink("small") < 0){
     577:	c7 04 24 11 3b 00 00 	movl   $0x3b11,(%esp)
     57e:	e8 52 30 00 00       	call   35d5 <unlink>
     583:	83 c4 10             	add    $0x10,%esp
     586:	85 c0                	test   %eax,%eax
     588:	78 79                	js     603 <writetest+0x19b>
  printf(stdout, "small file test ok\n");
     58a:	83 ec 08             	sub    $0x8,%esp
     58d:	68 cb 3b 00 00       	push   $0x3bcb
     592:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     598:	e8 1b 31 00 00       	call   36b8 <printf>
}
     59d:	83 c4 10             	add    $0x10,%esp
     5a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5a3:	5b                   	pop    %ebx
     5a4:	5e                   	pop    %esi
     5a5:	5d                   	pop    %ebp
     5a6:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
     5a7:	50                   	push   %eax
     5a8:	53                   	push   %ebx
     5a9:	68 0c 4a 00 00       	push   $0x4a0c
     5ae:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     5b4:	e8 ff 30 00 00       	call   36b8 <printf>
      exit();
     5b9:	e8 c7 2f 00 00       	call   3585 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     5be:	50                   	push   %eax
     5bf:	53                   	push   %ebx
     5c0:	68 30 4a 00 00       	push   $0x4a30
     5c5:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     5cb:	e8 e8 30 00 00       	call   36b8 <printf>
      exit();
     5d0:	e8 b0 2f 00 00       	call   3585 <exit>
    printf(stdout, "error: open small failed!\n");
     5d5:	51                   	push   %ecx
     5d6:	51                   	push   %ecx
     5d7:	68 88 3b 00 00       	push   $0x3b88
     5dc:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     5e2:	e8 d1 30 00 00       	call   36b8 <printf>
    exit();
     5e7:	e8 99 2f 00 00       	call   3585 <exit>
    printf(stdout, "read failed\n");
     5ec:	52                   	push   %edx
     5ed:	52                   	push   %edx
     5ee:	68 c9 3e 00 00       	push   $0x3ec9
     5f3:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     5f9:	e8 ba 30 00 00       	call   36b8 <printf>
    exit();
     5fe:	e8 82 2f 00 00       	call   3585 <exit>
    printf(stdout, "unlink small failed\n");
     603:	50                   	push   %eax
     604:	50                   	push   %eax
     605:	68 b6 3b 00 00       	push   $0x3bb6
     60a:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     610:	e8 a3 30 00 00       	call   36b8 <printf>
    exit();
     615:	e8 6b 2f 00 00       	call   3585 <exit>
    printf(stdout, "error: creat small failed!\n");
     61a:	50                   	push   %eax
     61b:	50                   	push   %eax
     61c:	68 32 3b 00 00       	push   $0x3b32
     621:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     627:	e8 8c 30 00 00       	call   36b8 <printf>
    exit();
     62c:	e8 54 2f 00 00       	call   3585 <exit>
     631:	8d 76 00             	lea    0x0(%esi),%esi

00000634 <writetest1>:
{
     634:	55                   	push   %ebp
     635:	89 e5                	mov    %esp,%ebp
     637:	56                   	push   %esi
     638:	53                   	push   %ebx
  printf(stdout, "big files test\n");
     639:	83 ec 08             	sub    $0x8,%esp
     63c:	68 df 3b 00 00       	push   $0x3bdf
     641:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     647:	e8 6c 30 00 00       	call   36b8 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     64c:	58                   	pop    %eax
     64d:	5a                   	pop    %edx
     64e:	68 02 02 00 00       	push   $0x202
     653:	68 59 3c 00 00       	push   $0x3c59
     658:	e8 68 2f 00 00       	call   35c5 <open>
  if(fd < 0){
     65d:	83 c4 10             	add    $0x10,%esp
     660:	85 c0                	test   %eax,%eax
     662:	0f 88 49 01 00 00    	js     7b1 <writetest1+0x17d>
     668:	89 c6                	mov    %eax,%esi
  for(i = 0; i < MAXFILE; i++){
     66a:	31 db                	xor    %ebx,%ebx
    ((int*)buf)[0] = i;
     66c:	89 1d 40 82 00 00    	mov    %ebx,0x8240
    if(write(fd, buf, 512) != 512){
     672:	50                   	push   %eax
     673:	68 00 02 00 00       	push   $0x200
     678:	68 40 82 00 00       	push   $0x8240
     67d:	56                   	push   %esi
     67e:	e8 22 2f 00 00       	call   35a5 <write>
     683:	83 c4 10             	add    $0x10,%esp
     686:	3d 00 02 00 00       	cmp    $0x200,%eax
     68b:	0f 85 a9 00 00 00    	jne    73a <writetest1+0x106>
  for(i = 0; i < MAXFILE; i++){
     691:	43                   	inc    %ebx
     692:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     698:	75 d2                	jne    66c <writetest1+0x38>
  close(fd);
     69a:	83 ec 0c             	sub    $0xc,%esp
     69d:	56                   	push   %esi
     69e:	e8 0a 2f 00 00       	call   35ad <close>
  fd = open("big", O_RDONLY);
     6a3:	58                   	pop    %eax
     6a4:	5a                   	pop    %edx
     6a5:	6a 00                	push   $0x0
     6a7:	68 59 3c 00 00       	push   $0x3c59
     6ac:	e8 14 2f 00 00       	call   35c5 <open>
     6b1:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6b3:	83 c4 10             	add    $0x10,%esp
     6b6:	85 c0                	test   %eax,%eax
     6b8:	0f 88 dc 00 00 00    	js     79a <writetest1+0x166>
  n = 0;
     6be:	31 db                	xor    %ebx,%ebx
     6c0:	eb 17                	jmp    6d9 <writetest1+0xa5>
     6c2:	66 90                	xchg   %ax,%ax
    } else if(i != 512){
     6c4:	3d 00 02 00 00       	cmp    $0x200,%eax
     6c9:	0f 85 99 00 00 00    	jne    768 <writetest1+0x134>
    if(((int*)buf)[0] != n){
     6cf:	a1 40 82 00 00       	mov    0x8240,%eax
     6d4:	39 d8                	cmp    %ebx,%eax
     6d6:	75 79                	jne    751 <writetest1+0x11d>
    n++;
     6d8:	43                   	inc    %ebx
    i = read(fd, buf, 512);
     6d9:	50                   	push   %eax
     6da:	68 00 02 00 00       	push   $0x200
     6df:	68 40 82 00 00       	push   $0x8240
     6e4:	56                   	push   %esi
     6e5:	e8 b3 2e 00 00       	call   359d <read>
    if(i == 0){
     6ea:	83 c4 10             	add    $0x10,%esp
     6ed:	85 c0                	test   %eax,%eax
     6ef:	75 d3                	jne    6c4 <writetest1+0x90>
      if(n == MAXFILE - 1){
     6f1:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     6f7:	0f 84 82 00 00 00    	je     77f <writetest1+0x14b>
  close(fd);
     6fd:	83 ec 0c             	sub    $0xc,%esp
     700:	56                   	push   %esi
     701:	e8 a7 2e 00 00       	call   35ad <close>
  if(unlink("big") < 0){
     706:	c7 04 24 59 3c 00 00 	movl   $0x3c59,(%esp)
     70d:	e8 c3 2e 00 00       	call   35d5 <unlink>
     712:	83 c4 10             	add    $0x10,%esp
     715:	85 c0                	test   %eax,%eax
     717:	0f 88 ab 00 00 00    	js     7c8 <writetest1+0x194>
  printf(stdout, "big files ok\n");
     71d:	83 ec 08             	sub    $0x8,%esp
     720:	68 80 3c 00 00       	push   $0x3c80
     725:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     72b:	e8 88 2f 00 00       	call   36b8 <printf>
}
     730:	83 c4 10             	add    $0x10,%esp
     733:	8d 65 f8             	lea    -0x8(%ebp),%esp
     736:	5b                   	pop    %ebx
     737:	5e                   	pop    %esi
     738:	5d                   	pop    %ebp
     739:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
     73a:	51                   	push   %ecx
     73b:	53                   	push   %ebx
     73c:	68 09 3c 00 00       	push   $0x3c09
     741:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     747:	e8 6c 2f 00 00       	call   36b8 <printf>
      exit();
     74c:	e8 34 2e 00 00       	call   3585 <exit>
      printf(stdout, "read content of block %d is %d\n",
     751:	50                   	push   %eax
     752:	53                   	push   %ebx
     753:	68 54 4a 00 00       	push   $0x4a54
     758:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     75e:	e8 55 2f 00 00       	call   36b8 <printf>
      exit();
     763:	e8 1d 2e 00 00       	call   3585 <exit>
      printf(stdout, "read failed %d\n", i);
     768:	52                   	push   %edx
     769:	50                   	push   %eax
     76a:	68 5d 3c 00 00       	push   $0x3c5d
     76f:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     775:	e8 3e 2f 00 00       	call   36b8 <printf>
      exit();
     77a:	e8 06 2e 00 00       	call   3585 <exit>
        printf(stdout, "read only %d blocks from big", n);
     77f:	51                   	push   %ecx
     780:	68 8b 00 00 00       	push   $0x8b
     785:	68 40 3c 00 00       	push   $0x3c40
     78a:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     790:	e8 23 2f 00 00       	call   36b8 <printf>
        exit();
     795:	e8 eb 2d 00 00       	call   3585 <exit>
    printf(stdout, "error: open big failed!\n");
     79a:	50                   	push   %eax
     79b:	50                   	push   %eax
     79c:	68 27 3c 00 00       	push   $0x3c27
     7a1:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     7a7:	e8 0c 2f 00 00       	call   36b8 <printf>
    exit();
     7ac:	e8 d4 2d 00 00       	call   3585 <exit>
    printf(stdout, "error: creat big failed!\n");
     7b1:	50                   	push   %eax
     7b2:	50                   	push   %eax
     7b3:	68 ef 3b 00 00       	push   $0x3bef
     7b8:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     7be:	e8 f5 2e 00 00       	call   36b8 <printf>
    exit();
     7c3:	e8 bd 2d 00 00       	call   3585 <exit>
    printf(stdout, "unlink big failed\n");
     7c8:	50                   	push   %eax
     7c9:	50                   	push   %eax
     7ca:	68 6d 3c 00 00       	push   $0x3c6d
     7cf:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     7d5:	e8 de 2e 00 00       	call   36b8 <printf>
    exit();
     7da:	e8 a6 2d 00 00       	call   3585 <exit>
     7df:	90                   	nop

000007e0 <createtest>:
{
     7e0:	55                   	push   %ebp
     7e1:	89 e5                	mov    %esp,%ebp
     7e3:	53                   	push   %ebx
     7e4:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "many creates, followed by unlink test\n");
     7e7:	68 74 4a 00 00       	push   $0x4a74
     7ec:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     7f2:	e8 c1 2e 00 00       	call   36b8 <printf>
  name[0] = 'a';
     7f7:	c6 05 40 a2 00 00 61 	movb   $0x61,0xa240
  name[2] = '\0';
     7fe:	c6 05 42 a2 00 00 00 	movb   $0x0,0xa242
     805:	83 c4 10             	add    $0x10,%esp
     808:	b3 30                	mov    $0x30,%bl
     80a:	66 90                	xchg   %ax,%ax
    name[1] = '0' + i;
     80c:	88 1d 41 a2 00 00    	mov    %bl,0xa241
    fd = open(name, O_CREATE|O_RDWR);
     812:	83 ec 08             	sub    $0x8,%esp
     815:	68 02 02 00 00       	push   $0x202
     81a:	68 40 a2 00 00       	push   $0xa240
     81f:	e8 a1 2d 00 00       	call   35c5 <open>
    close(fd);
     824:	89 04 24             	mov    %eax,(%esp)
     827:	e8 81 2d 00 00       	call   35ad <close>
  for(i = 0; i < 52; i++){
     82c:	43                   	inc    %ebx
     82d:	83 c4 10             	add    $0x10,%esp
     830:	80 fb 64             	cmp    $0x64,%bl
     833:	75 d7                	jne    80c <createtest+0x2c>
  name[0] = 'a';
     835:	c6 05 40 a2 00 00 61 	movb   $0x61,0xa240
  name[2] = '\0';
     83c:	c6 05 42 a2 00 00 00 	movb   $0x0,0xa242
     843:	b3 30                	mov    $0x30,%bl
     845:	8d 76 00             	lea    0x0(%esi),%esi
    name[1] = '0' + i;
     848:	88 1d 41 a2 00 00    	mov    %bl,0xa241
    unlink(name);
     84e:	83 ec 0c             	sub    $0xc,%esp
     851:	68 40 a2 00 00       	push   $0xa240
     856:	e8 7a 2d 00 00       	call   35d5 <unlink>
  for(i = 0; i < 52; i++){
     85b:	43                   	inc    %ebx
     85c:	83 c4 10             	add    $0x10,%esp
     85f:	80 fb 64             	cmp    $0x64,%bl
     862:	75 e4                	jne    848 <createtest+0x68>
  printf(stdout, "many creates, followed by unlink; ok\n");
     864:	83 ec 08             	sub    $0x8,%esp
     867:	68 9c 4a 00 00       	push   $0x4a9c
     86c:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     872:	e8 41 2e 00 00       	call   36b8 <printf>
}
     877:	83 c4 10             	add    $0x10,%esp
     87a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     87d:	c9                   	leave  
     87e:	c3                   	ret    
     87f:	90                   	nop

00000880 <dirtest>:
{
     880:	55                   	push   %ebp
     881:	89 e5                	mov    %esp,%ebp
     883:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     886:	68 8e 3c 00 00       	push   $0x3c8e
     88b:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     891:	e8 22 2e 00 00       	call   36b8 <printf>
  if(mkdir("dir0") < 0){
     896:	c7 04 24 9a 3c 00 00 	movl   $0x3c9a,(%esp)
     89d:	e8 4b 2d 00 00       	call   35ed <mkdir>
     8a2:	83 c4 10             	add    $0x10,%esp
     8a5:	85 c0                	test   %eax,%eax
     8a7:	78 58                	js     901 <dirtest+0x81>
  if(chdir("dir0") < 0){
     8a9:	83 ec 0c             	sub    $0xc,%esp
     8ac:	68 9a 3c 00 00       	push   $0x3c9a
     8b1:	e8 3f 2d 00 00       	call   35f5 <chdir>
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	85 c0                	test   %eax,%eax
     8bb:	0f 88 85 00 00 00    	js     946 <dirtest+0xc6>
  if(chdir("..") < 0){
     8c1:	83 ec 0c             	sub    $0xc,%esp
     8c4:	68 39 42 00 00       	push   $0x4239
     8c9:	e8 27 2d 00 00       	call   35f5 <chdir>
     8ce:	83 c4 10             	add    $0x10,%esp
     8d1:	85 c0                	test   %eax,%eax
     8d3:	78 5a                	js     92f <dirtest+0xaf>
  if(unlink("dir0") < 0){
     8d5:	83 ec 0c             	sub    $0xc,%esp
     8d8:	68 9a 3c 00 00       	push   $0x3c9a
     8dd:	e8 f3 2c 00 00       	call   35d5 <unlink>
     8e2:	83 c4 10             	add    $0x10,%esp
     8e5:	85 c0                	test   %eax,%eax
     8e7:	78 2f                	js     918 <dirtest+0x98>
  printf(stdout, "mkdir test ok\n");
     8e9:	83 ec 08             	sub    $0x8,%esp
     8ec:	68 d7 3c 00 00       	push   $0x3cd7
     8f1:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     8f7:	e8 bc 2d 00 00       	call   36b8 <printf>
}
     8fc:	83 c4 10             	add    $0x10,%esp
     8ff:	c9                   	leave  
     900:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     901:	50                   	push   %eax
     902:	50                   	push   %eax
     903:	68 ca 39 00 00       	push   $0x39ca
     908:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     90e:	e8 a5 2d 00 00       	call   36b8 <printf>
    exit();
     913:	e8 6d 2c 00 00       	call   3585 <exit>
    printf(stdout, "unlink dir0 failed\n");
     918:	50                   	push   %eax
     919:	50                   	push   %eax
     91a:	68 c3 3c 00 00       	push   $0x3cc3
     91f:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     925:	e8 8e 2d 00 00       	call   36b8 <printf>
    exit();
     92a:	e8 56 2c 00 00       	call   3585 <exit>
    printf(stdout, "chdir .. failed\n");
     92f:	52                   	push   %edx
     930:	52                   	push   %edx
     931:	68 b2 3c 00 00       	push   $0x3cb2
     936:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     93c:	e8 77 2d 00 00       	call   36b8 <printf>
    exit();
     941:	e8 3f 2c 00 00       	call   3585 <exit>
    printf(stdout, "chdir dir0 failed\n");
     946:	51                   	push   %ecx
     947:	51                   	push   %ecx
     948:	68 9f 3c 00 00       	push   $0x3c9f
     94d:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     953:	e8 60 2d 00 00       	call   36b8 <printf>
    exit();
     958:	e8 28 2c 00 00       	call   3585 <exit>
     95d:	8d 76 00             	lea    0x0(%esi),%esi

00000960 <exectest>:
{
     960:	55                   	push   %ebp
     961:	89 e5                	mov    %esp,%ebp
     963:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     966:	68 e6 3c 00 00       	push   $0x3ce6
     96b:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     971:	e8 42 2d 00 00       	call   36b8 <printf>
  if(exec("echo", echoargv) < 0){
     976:	5a                   	pop    %edx
     977:	59                   	pop    %ecx
     978:	68 50 5a 00 00       	push   $0x5a50
     97d:	68 af 3a 00 00       	push   $0x3aaf
     982:	e8 36 2c 00 00       	call   35bd <exec>
     987:	83 c4 10             	add    $0x10,%esp
     98a:	85 c0                	test   %eax,%eax
     98c:	78 02                	js     990 <exectest+0x30>
}
     98e:	c9                   	leave  
     98f:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
     990:	50                   	push   %eax
     991:	50                   	push   %eax
     992:	68 f1 3c 00 00       	push   $0x3cf1
     997:	ff 35 4c 5a 00 00    	pushl  0x5a4c
     99d:	e8 16 2d 00 00       	call   36b8 <printf>
    exit();
     9a2:	e8 de 2b 00 00       	call   3585 <exit>
     9a7:	90                   	nop

000009a8 <pipe1>:
{
     9a8:	55                   	push   %ebp
     9a9:	89 e5                	mov    %esp,%ebp
     9ab:	57                   	push   %edi
     9ac:	56                   	push   %esi
     9ad:	53                   	push   %ebx
     9ae:	83 ec 38             	sub    $0x38,%esp
  if(pipe(fds) != 0){
     9b1:	8d 45 e0             	lea    -0x20(%ebp),%eax
     9b4:	50                   	push   %eax
     9b5:	e8 db 2b 00 00       	call   3595 <pipe>
     9ba:	83 c4 10             	add    $0x10,%esp
     9bd:	85 c0                	test   %eax,%eax
     9bf:	0f 85 28 01 00 00    	jne    aed <pipe1+0x145>
  pid = fork();
     9c5:	e8 b3 2b 00 00       	call   357d <fork>
  if(pid == 0){
     9ca:	85 c0                	test   %eax,%eax
     9cc:	0f 84 84 00 00 00    	je     a56 <pipe1+0xae>
  } else if(pid > 0){
     9d2:	0f 8e 28 01 00 00    	jle    b00 <pipe1+0x158>
    close(fds[1]);
     9d8:	83 ec 0c             	sub    $0xc,%esp
     9db:	ff 75 e4             	pushl  -0x1c(%ebp)
     9de:	e8 ca 2b 00 00       	call   35ad <close>
    while((n = read(fds[0], buf, cc)) > 0){
     9e3:	83 c4 10             	add    $0x10,%esp
    total = 0;
     9e6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  seq = 0;
     9ed:	31 db                	xor    %ebx,%ebx
    cc = 1;
     9ef:	be 01 00 00 00       	mov    $0x1,%esi
    while((n = read(fds[0], buf, cc)) > 0){
     9f4:	57                   	push   %edi
     9f5:	56                   	push   %esi
     9f6:	68 40 82 00 00       	push   $0x8240
     9fb:	ff 75 e0             	pushl  -0x20(%ebp)
     9fe:	e8 9a 2b 00 00       	call   359d <read>
     a03:	89 c7                	mov    %eax,%edi
     a05:	83 c4 10             	add    $0x10,%esp
     a08:	85 c0                	test   %eax,%eax
     a0a:	0f 8e 99 00 00 00    	jle    aa9 <pipe1+0x101>
     a10:	8d 0c 3b             	lea    (%ebx,%edi,1),%ecx
      for(i = 0; i < n; i++){
     a13:	31 c0                	xor    %eax,%eax
     a15:	8d 76 00             	lea    0x0(%esi),%esi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a18:	89 da                	mov    %ebx,%edx
     a1a:	43                   	inc    %ebx
     a1b:	38 90 40 82 00 00    	cmp    %dl,0x8240(%eax)
     a21:	75 19                	jne    a3c <pipe1+0x94>
      for(i = 0; i < n; i++){
     a23:	40                   	inc    %eax
     a24:	39 d9                	cmp    %ebx,%ecx
     a26:	75 f0                	jne    a18 <pipe1+0x70>
      total += n;
     a28:	01 7d d4             	add    %edi,-0x2c(%ebp)
      if(cc > sizeof(buf))
     a2b:	01 f6                	add    %esi,%esi
     a2d:	81 fe 00 20 00 00    	cmp    $0x2000,%esi
     a33:	7e bf                	jle    9f4 <pipe1+0x4c>
     a35:	be 00 20 00 00       	mov    $0x2000,%esi
     a3a:	eb b8                	jmp    9f4 <pipe1+0x4c>
          printf(1, "pipe1 oops 2\n");
     a3c:	83 ec 08             	sub    $0x8,%esp
     a3f:	68 20 3d 00 00       	push   $0x3d20
     a44:	6a 01                	push   $0x1
     a46:	e8 6d 2c 00 00       	call   36b8 <printf>
          return;
     a4b:	83 c4 10             	add    $0x10,%esp
}
     a4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a51:	5b                   	pop    %ebx
     a52:	5e                   	pop    %esi
     a53:	5f                   	pop    %edi
     a54:	5d                   	pop    %ebp
     a55:	c3                   	ret    
    close(fds[0]);
     a56:	83 ec 0c             	sub    $0xc,%esp
     a59:	ff 75 e0             	pushl  -0x20(%ebp)
     a5c:	e8 4c 2b 00 00       	call   35ad <close>
     a61:	83 c4 10             	add    $0x10,%esp
  seq = 0;
     a64:	31 db                	xor    %ebx,%ebx
      for(i = 0; i < 1033; i++)
     a66:	31 c0                	xor    %eax,%eax
        buf[i] = seq++;
     a68:	8d 14 18             	lea    (%eax,%ebx,1),%edx
     a6b:	88 90 40 82 00 00    	mov    %dl,0x8240(%eax)
      for(i = 0; i < 1033; i++)
     a71:	40                   	inc    %eax
     a72:	3d 09 04 00 00       	cmp    $0x409,%eax
     a77:	75 ef                	jne    a68 <pipe1+0xc0>
     a79:	81 c3 09 04 00 00    	add    $0x409,%ebx
      if(write(fds[1], buf, 1033) != 1033){
     a7f:	50                   	push   %eax
     a80:	68 09 04 00 00       	push   $0x409
     a85:	68 40 82 00 00       	push   $0x8240
     a8a:	ff 75 e4             	pushl  -0x1c(%ebp)
     a8d:	e8 13 2b 00 00       	call   35a5 <write>
     a92:	83 c4 10             	add    $0x10,%esp
     a95:	3d 09 04 00 00       	cmp    $0x409,%eax
     a9a:	75 77                	jne    b13 <pipe1+0x16b>
    for(n = 0; n < 5; n++){
     a9c:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     aa2:	75 c2                	jne    a66 <pipe1+0xbe>
    exit();
     aa4:	e8 dc 2a 00 00       	call   3585 <exit>
    if(total != 5 * 1033){
     aa9:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     ab0:	75 26                	jne    ad8 <pipe1+0x130>
    close(fds[0]);
     ab2:	83 ec 0c             	sub    $0xc,%esp
     ab5:	ff 75 e0             	pushl  -0x20(%ebp)
     ab8:	e8 f0 2a 00 00       	call   35ad <close>
    wait();
     abd:	e8 cb 2a 00 00       	call   358d <wait>
  printf(1, "pipe1 ok\n");
     ac2:	5a                   	pop    %edx
     ac3:	59                   	pop    %ecx
     ac4:	68 45 3d 00 00       	push   $0x3d45
     ac9:	6a 01                	push   $0x1
     acb:	e8 e8 2b 00 00       	call   36b8 <printf>
     ad0:	83 c4 10             	add    $0x10,%esp
     ad3:	e9 76 ff ff ff       	jmp    a4e <pipe1+0xa6>
      printf(1, "pipe1 oops 3 total %d\n", total);
     ad8:	53                   	push   %ebx
     ad9:	ff 75 d4             	pushl  -0x2c(%ebp)
     adc:	68 2e 3d 00 00       	push   $0x3d2e
     ae1:	6a 01                	push   $0x1
     ae3:	e8 d0 2b 00 00       	call   36b8 <printf>
      exit();
     ae8:	e8 98 2a 00 00       	call   3585 <exit>
    printf(1, "pipe() failed\n");
     aed:	50                   	push   %eax
     aee:	50                   	push   %eax
     aef:	68 03 3d 00 00       	push   $0x3d03
     af4:	6a 01                	push   $0x1
     af6:	e8 bd 2b 00 00       	call   36b8 <printf>
    exit();
     afb:	e8 85 2a 00 00       	call   3585 <exit>
    printf(1, "fork() failed\n");
     b00:	50                   	push   %eax
     b01:	50                   	push   %eax
     b02:	68 4f 3d 00 00       	push   $0x3d4f
     b07:	6a 01                	push   $0x1
     b09:	e8 aa 2b 00 00       	call   36b8 <printf>
    exit();
     b0e:	e8 72 2a 00 00       	call   3585 <exit>
        printf(1, "pipe1 oops 1\n");
     b13:	50                   	push   %eax
     b14:	50                   	push   %eax
     b15:	68 12 3d 00 00       	push   $0x3d12
     b1a:	6a 01                	push   $0x1
     b1c:	e8 97 2b 00 00       	call   36b8 <printf>
        exit();
     b21:	e8 5f 2a 00 00       	call   3585 <exit>
     b26:	66 90                	xchg   %ax,%ax

00000b28 <preempt>:
{
     b28:	55                   	push   %ebp
     b29:	89 e5                	mov    %esp,%ebp
     b2b:	57                   	push   %edi
     b2c:	56                   	push   %esi
     b2d:	53                   	push   %ebx
     b2e:	83 ec 24             	sub    $0x24,%esp
  printf(1, "preempt: ");
     b31:	68 5e 3d 00 00       	push   $0x3d5e
     b36:	6a 01                	push   $0x1
     b38:	e8 7b 2b 00 00       	call   36b8 <printf>
  pid1 = fork();
     b3d:	e8 3b 2a 00 00       	call   357d <fork>
  if(pid1 == 0)
     b42:	83 c4 10             	add    $0x10,%esp
     b45:	85 c0                	test   %eax,%eax
     b47:	75 03                	jne    b4c <preempt+0x24>
    for(;;)
     b49:	eb fe                	jmp    b49 <preempt+0x21>
     b4b:	90                   	nop
     b4c:	89 c7                	mov    %eax,%edi
  pid2 = fork();
     b4e:	e8 2a 2a 00 00       	call   357d <fork>
     b53:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     b55:	85 c0                	test   %eax,%eax
     b57:	75 03                	jne    b5c <preempt+0x34>
    for(;;)
     b59:	eb fe                	jmp    b59 <preempt+0x31>
     b5b:	90                   	nop
  pipe(pfds);
     b5c:	83 ec 0c             	sub    $0xc,%esp
     b5f:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b62:	50                   	push   %eax
     b63:	e8 2d 2a 00 00       	call   3595 <pipe>
  pid3 = fork();
     b68:	e8 10 2a 00 00       	call   357d <fork>
     b6d:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     b6f:	83 c4 10             	add    $0x10,%esp
     b72:	85 c0                	test   %eax,%eax
     b74:	75 3a                	jne    bb0 <preempt+0x88>
    close(pfds[0]);
     b76:	83 ec 0c             	sub    $0xc,%esp
     b79:	ff 75 e0             	pushl  -0x20(%ebp)
     b7c:	e8 2c 2a 00 00       	call   35ad <close>
    if(write(pfds[1], "x", 1) != 1)
     b81:	83 c4 0c             	add    $0xc,%esp
     b84:	6a 01                	push   $0x1
     b86:	68 1d 43 00 00       	push   $0x431d
     b8b:	ff 75 e4             	pushl  -0x1c(%ebp)
     b8e:	e8 12 2a 00 00       	call   35a5 <write>
     b93:	83 c4 10             	add    $0x10,%esp
     b96:	48                   	dec    %eax
     b97:	0f 85 a0 00 00 00    	jne    c3d <preempt+0x115>
    close(pfds[1]);
     b9d:	83 ec 0c             	sub    $0xc,%esp
     ba0:	ff 75 e4             	pushl  -0x1c(%ebp)
     ba3:	e8 05 2a 00 00       	call   35ad <close>
     ba8:	83 c4 10             	add    $0x10,%esp
    for(;;)
     bab:	eb fe                	jmp    bab <preempt+0x83>
     bad:	8d 76 00             	lea    0x0(%esi),%esi
  close(pfds[1]);
     bb0:	83 ec 0c             	sub    $0xc,%esp
     bb3:	ff 75 e4             	pushl  -0x1c(%ebp)
     bb6:	e8 f2 29 00 00       	call   35ad <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     bbb:	83 c4 0c             	add    $0xc,%esp
     bbe:	68 00 20 00 00       	push   $0x2000
     bc3:	68 40 82 00 00       	push   $0x8240
     bc8:	ff 75 e0             	pushl  -0x20(%ebp)
     bcb:	e8 cd 29 00 00       	call   359d <read>
     bd0:	83 c4 10             	add    $0x10,%esp
     bd3:	48                   	dec    %eax
     bd4:	75 7e                	jne    c54 <preempt+0x12c>
  close(pfds[0]);
     bd6:	83 ec 0c             	sub    $0xc,%esp
     bd9:	ff 75 e0             	pushl  -0x20(%ebp)
     bdc:	e8 cc 29 00 00       	call   35ad <close>
  printf(1, "kill... ");
     be1:	58                   	pop    %eax
     be2:	5a                   	pop    %edx
     be3:	68 8f 3d 00 00       	push   $0x3d8f
     be8:	6a 01                	push   $0x1
     bea:	e8 c9 2a 00 00       	call   36b8 <printf>
  kill(pid1);
     bef:	89 3c 24             	mov    %edi,(%esp)
     bf2:	e8 be 29 00 00       	call   35b5 <kill>
  kill(pid2);
     bf7:	89 34 24             	mov    %esi,(%esp)
     bfa:	e8 b6 29 00 00       	call   35b5 <kill>
  kill(pid3);
     bff:	89 1c 24             	mov    %ebx,(%esp)
     c02:	e8 ae 29 00 00       	call   35b5 <kill>
  printf(1, "wait... ");
     c07:	59                   	pop    %ecx
     c08:	5b                   	pop    %ebx
     c09:	68 98 3d 00 00       	push   $0x3d98
     c0e:	6a 01                	push   $0x1
     c10:	e8 a3 2a 00 00       	call   36b8 <printf>
  wait();
     c15:	e8 73 29 00 00       	call   358d <wait>
  wait();
     c1a:	e8 6e 29 00 00       	call   358d <wait>
  wait();
     c1f:	e8 69 29 00 00       	call   358d <wait>
  printf(1, "preempt ok\n");
     c24:	5e                   	pop    %esi
     c25:	5f                   	pop    %edi
     c26:	68 a1 3d 00 00       	push   $0x3da1
     c2b:	6a 01                	push   $0x1
     c2d:	e8 86 2a 00 00       	call   36b8 <printf>
     c32:	83 c4 10             	add    $0x10,%esp
}
     c35:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c38:	5b                   	pop    %ebx
     c39:	5e                   	pop    %esi
     c3a:	5f                   	pop    %edi
     c3b:	5d                   	pop    %ebp
     c3c:	c3                   	ret    
      printf(1, "preempt write error");
     c3d:	83 ec 08             	sub    $0x8,%esp
     c40:	68 68 3d 00 00       	push   $0x3d68
     c45:	6a 01                	push   $0x1
     c47:	e8 6c 2a 00 00       	call   36b8 <printf>
     c4c:	83 c4 10             	add    $0x10,%esp
     c4f:	e9 49 ff ff ff       	jmp    b9d <preempt+0x75>
    printf(1, "preempt read error");
     c54:	83 ec 08             	sub    $0x8,%esp
     c57:	68 7c 3d 00 00       	push   $0x3d7c
     c5c:	6a 01                	push   $0x1
     c5e:	e8 55 2a 00 00       	call   36b8 <printf>
    return;
     c63:	83 c4 10             	add    $0x10,%esp
     c66:	eb cd                	jmp    c35 <preempt+0x10d>

00000c68 <exitwait>:
{
     c68:	55                   	push   %ebp
     c69:	89 e5                	mov    %esp,%ebp
     c6b:	56                   	push   %esi
     c6c:	53                   	push   %ebx
     c6d:	be 64 00 00 00       	mov    $0x64,%esi
     c72:	eb 0e                	jmp    c82 <exitwait+0x1a>
    if(pid){
     c74:	74 64                	je     cda <exitwait+0x72>
      if(wait() != pid){
     c76:	e8 12 29 00 00       	call   358d <wait>
     c7b:	39 d8                	cmp    %ebx,%eax
     c7d:	75 29                	jne    ca8 <exitwait+0x40>
  for(i = 0; i < 100; i++){
     c7f:	4e                   	dec    %esi
     c80:	74 3f                	je     cc1 <exitwait+0x59>
    pid = fork();
     c82:	e8 f6 28 00 00       	call   357d <fork>
     c87:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     c89:	85 c0                	test   %eax,%eax
     c8b:	79 e7                	jns    c74 <exitwait+0xc>
      printf(1, "fork failed\n");
     c8d:	83 ec 08             	sub    $0x8,%esp
     c90:	68 05 49 00 00       	push   $0x4905
     c95:	6a 01                	push   $0x1
     c97:	e8 1c 2a 00 00       	call   36b8 <printf>
      return;
     c9c:	83 c4 10             	add    $0x10,%esp
}
     c9f:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ca2:	5b                   	pop    %ebx
     ca3:	5e                   	pop    %esi
     ca4:	5d                   	pop    %ebp
     ca5:	c3                   	ret    
     ca6:	66 90                	xchg   %ax,%ax
        printf(1, "wait wrong pid\n");
     ca8:	83 ec 08             	sub    $0x8,%esp
     cab:	68 ad 3d 00 00       	push   $0x3dad
     cb0:	6a 01                	push   $0x1
     cb2:	e8 01 2a 00 00       	call   36b8 <printf>
        return;
     cb7:	83 c4 10             	add    $0x10,%esp
}
     cba:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cbd:	5b                   	pop    %ebx
     cbe:	5e                   	pop    %esi
     cbf:	5d                   	pop    %ebp
     cc0:	c3                   	ret    
  printf(1, "exitwait ok\n");
     cc1:	83 ec 08             	sub    $0x8,%esp
     cc4:	68 bd 3d 00 00       	push   $0x3dbd
     cc9:	6a 01                	push   $0x1
     ccb:	e8 e8 29 00 00       	call   36b8 <printf>
     cd0:	83 c4 10             	add    $0x10,%esp
}
     cd3:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cd6:	5b                   	pop    %ebx
     cd7:	5e                   	pop    %esi
     cd8:	5d                   	pop    %ebp
     cd9:	c3                   	ret    
      exit();
     cda:	e8 a6 28 00 00       	call   3585 <exit>
     cdf:	90                   	nop

00000ce0 <mem>:
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	56                   	push   %esi
     ce4:	53                   	push   %ebx
  printf(1, "mem test\n");
     ce5:	83 ec 08             	sub    $0x8,%esp
     ce8:	68 ca 3d 00 00       	push   $0x3dca
     ced:	6a 01                	push   $0x1
     cef:	e8 c4 29 00 00       	call   36b8 <printf>
  ppid = getpid();
     cf4:	e8 0c 29 00 00       	call   3605 <getpid>
     cf9:	89 c3                	mov    %eax,%ebx
  if((pid = fork()) == 0){
     cfb:	e8 7d 28 00 00       	call   357d <fork>
     d00:	83 c4 10             	add    $0x10,%esp
     d03:	85 c0                	test   %eax,%eax
     d05:	0f 85 81 00 00 00    	jne    d8c <mem+0xac>
    m1 = 0;
     d0b:	31 f6                	xor    %esi,%esi
     d0d:	eb 05                	jmp    d14 <mem+0x34>
     d0f:	90                   	nop
      *(char**)m2 = m1;
     d10:	89 30                	mov    %esi,(%eax)
     d12:	89 c6                	mov    %eax,%esi
    while((m2 = malloc(10001)) != 0){
     d14:	83 ec 0c             	sub    $0xc,%esp
     d17:	68 11 27 00 00       	push   $0x2711
     d1c:	e8 ab 2b 00 00       	call   38cc <malloc>
     d21:	83 c4 10             	add    $0x10,%esp
     d24:	85 c0                	test   %eax,%eax
     d26:	75 e8                	jne    d10 <mem+0x30>
    while(m1){
     d28:	85 f6                	test   %esi,%esi
     d2a:	74 14                	je     d40 <mem+0x60>
      m2 = *(char**)m1;
     d2c:	89 f0                	mov    %esi,%eax
     d2e:	8b 36                	mov    (%esi),%esi
      free(m1);
     d30:	83 ec 0c             	sub    $0xc,%esp
     d33:	50                   	push   %eax
     d34:	e8 13 2b 00 00       	call   384c <free>
    while(m1){
     d39:	83 c4 10             	add    $0x10,%esp
     d3c:	85 f6                	test   %esi,%esi
     d3e:	75 ec                	jne    d2c <mem+0x4c>
    m1 = malloc(1024*20);
     d40:	83 ec 0c             	sub    $0xc,%esp
     d43:	68 00 50 00 00       	push   $0x5000
     d48:	e8 7f 2b 00 00       	call   38cc <malloc>
    if(m1 == 0){
     d4d:	83 c4 10             	add    $0x10,%esp
     d50:	85 c0                	test   %eax,%eax
     d52:	74 1c                	je     d70 <mem+0x90>
    free(m1);
     d54:	83 ec 0c             	sub    $0xc,%esp
     d57:	50                   	push   %eax
     d58:	e8 ef 2a 00 00       	call   384c <free>
    printf(1, "mem ok\n");
     d5d:	58                   	pop    %eax
     d5e:	5a                   	pop    %edx
     d5f:	68 ee 3d 00 00       	push   $0x3dee
     d64:	6a 01                	push   $0x1
     d66:	e8 4d 29 00 00       	call   36b8 <printf>
    exit();
     d6b:	e8 15 28 00 00       	call   3585 <exit>
      printf(1, "couldn't allocate mem?!!\n");
     d70:	83 ec 08             	sub    $0x8,%esp
     d73:	68 d4 3d 00 00       	push   $0x3dd4
     d78:	6a 01                	push   $0x1
     d7a:	e8 39 29 00 00       	call   36b8 <printf>
      kill(ppid);
     d7f:	89 1c 24             	mov    %ebx,(%esp)
     d82:	e8 2e 28 00 00       	call   35b5 <kill>
      exit();
     d87:	e8 f9 27 00 00       	call   3585 <exit>
}
     d8c:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d8f:	5b                   	pop    %ebx
     d90:	5e                   	pop    %esi
     d91:	5d                   	pop    %ebp
    wait();
     d92:	e9 f6 27 00 00       	jmp    358d <wait>
     d97:	90                   	nop

00000d98 <sharedfd>:
{
     d98:	55                   	push   %ebp
     d99:	89 e5                	mov    %esp,%ebp
     d9b:	57                   	push   %edi
     d9c:	56                   	push   %esi
     d9d:	53                   	push   %ebx
     d9e:	83 ec 34             	sub    $0x34,%esp
  printf(1, "sharedfd test\n");
     da1:	68 f6 3d 00 00       	push   $0x3df6
     da6:	6a 01                	push   $0x1
     da8:	e8 0b 29 00 00       	call   36b8 <printf>
  unlink("sharedfd");
     dad:	c7 04 24 05 3e 00 00 	movl   $0x3e05,(%esp)
     db4:	e8 1c 28 00 00       	call   35d5 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     db9:	59                   	pop    %ecx
     dba:	5b                   	pop    %ebx
     dbb:	68 02 02 00 00       	push   $0x202
     dc0:	68 05 3e 00 00       	push   $0x3e05
     dc5:	e8 fb 27 00 00       	call   35c5 <open>
  if(fd < 0){
     dca:	83 c4 10             	add    $0x10,%esp
     dcd:	85 c0                	test   %eax,%eax
     dcf:	0f 88 0e 01 00 00    	js     ee3 <sharedfd+0x14b>
     dd5:	89 c7                	mov    %eax,%edi
  pid = fork();
     dd7:	e8 a1 27 00 00       	call   357d <fork>
     ddc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ddf:	83 f8 01             	cmp    $0x1,%eax
     de2:	19 c0                	sbb    %eax,%eax
     de4:	83 e0 f3             	and    $0xfffffff3,%eax
     de7:	83 c0 70             	add    $0x70,%eax
     dea:	52                   	push   %edx
     deb:	6a 0a                	push   $0xa
     ded:	50                   	push   %eax
     dee:	8d 75 de             	lea    -0x22(%ebp),%esi
     df1:	56                   	push   %esi
     df2:	e8 59 26 00 00       	call   3450 <memset>
     df7:	83 c4 10             	add    $0x10,%esp
     dfa:	bb e8 03 00 00       	mov    $0x3e8,%ebx
     dff:	eb 06                	jmp    e07 <sharedfd+0x6f>
     e01:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 1000; i++){
     e04:	4b                   	dec    %ebx
     e05:	74 24                	je     e2b <sharedfd+0x93>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     e07:	50                   	push   %eax
     e08:	6a 0a                	push   $0xa
     e0a:	56                   	push   %esi
     e0b:	57                   	push   %edi
     e0c:	e8 94 27 00 00       	call   35a5 <write>
     e11:	83 c4 10             	add    $0x10,%esp
     e14:	83 f8 0a             	cmp    $0xa,%eax
     e17:	74 eb                	je     e04 <sharedfd+0x6c>
      printf(1, "fstests: write sharedfd failed\n");
     e19:	83 ec 08             	sub    $0x8,%esp
     e1c:	68 f0 4a 00 00       	push   $0x4af0
     e21:	6a 01                	push   $0x1
     e23:	e8 90 28 00 00       	call   36b8 <printf>
      break;
     e28:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
     e2b:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
     e2e:	85 db                	test   %ebx,%ebx
     e30:	0f 84 e1 00 00 00    	je     f17 <sharedfd+0x17f>
    wait();
     e36:	e8 52 27 00 00       	call   358d <wait>
  close(fd);
     e3b:	83 ec 0c             	sub    $0xc,%esp
     e3e:	57                   	push   %edi
     e3f:	e8 69 27 00 00       	call   35ad <close>
  fd = open("sharedfd", 0);
     e44:	5a                   	pop    %edx
     e45:	59                   	pop    %ecx
     e46:	6a 00                	push   $0x0
     e48:	68 05 3e 00 00       	push   $0x3e05
     e4d:	e8 73 27 00 00       	call   35c5 <open>
     e52:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     e55:	83 c4 10             	add    $0x10,%esp
     e58:	85 c0                	test   %eax,%eax
     e5a:	0f 88 9d 00 00 00    	js     efd <sharedfd+0x165>
  nc = np = 0;
     e60:	31 d2                	xor    %edx,%edx
     e62:	31 ff                	xor    %edi,%edi
     e64:	8d 5d e8             	lea    -0x18(%ebp),%ebx
     e67:	90                   	nop
     e68:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
     e6b:	50                   	push   %eax
     e6c:	6a 0a                	push   $0xa
     e6e:	56                   	push   %esi
     e6f:	ff 75 d0             	pushl  -0x30(%ebp)
     e72:	e8 26 27 00 00       	call   359d <read>
     e77:	83 c4 10             	add    $0x10,%esp
     e7a:	85 c0                	test   %eax,%eax
     e7c:	7e 1e                	jle    e9c <sharedfd+0x104>
    for(i = 0; i < sizeof(buf); i++){
     e7e:	89 f1                	mov    %esi,%ecx
     e80:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     e83:	eb 0d                	jmp    e92 <sharedfd+0xfa>
     e85:	8d 76 00             	lea    0x0(%esi),%esi
      if(buf[i] == 'p')
     e88:	3c 70                	cmp    $0x70,%al
     e8a:	75 01                	jne    e8d <sharedfd+0xf5>
        np++;
     e8c:	42                   	inc    %edx
    for(i = 0; i < sizeof(buf); i++){
     e8d:	41                   	inc    %ecx
     e8e:	39 cb                	cmp    %ecx,%ebx
     e90:	74 d6                	je     e68 <sharedfd+0xd0>
      if(buf[i] == 'c')
     e92:	8a 01                	mov    (%ecx),%al
     e94:	3c 63                	cmp    $0x63,%al
     e96:	75 f0                	jne    e88 <sharedfd+0xf0>
        nc++;
     e98:	47                   	inc    %edi
      if(buf[i] == 'p')
     e99:	eb f2                	jmp    e8d <sharedfd+0xf5>
     e9b:	90                   	nop
  close(fd);
     e9c:	83 ec 0c             	sub    $0xc,%esp
     e9f:	ff 75 d0             	pushl  -0x30(%ebp)
     ea2:	e8 06 27 00 00       	call   35ad <close>
  unlink("sharedfd");
     ea7:	c7 04 24 05 3e 00 00 	movl   $0x3e05,(%esp)
     eae:	e8 22 27 00 00       	call   35d5 <unlink>
  if(nc == 10000 && np == 10000){
     eb3:	83 c4 10             	add    $0x10,%esp
     eb6:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
     ebc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     ebf:	75 5b                	jne    f1c <sharedfd+0x184>
     ec1:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     ec7:	75 53                	jne    f1c <sharedfd+0x184>
    printf(1, "sharedfd ok\n");
     ec9:	83 ec 08             	sub    $0x8,%esp
     ecc:	68 0e 3e 00 00       	push   $0x3e0e
     ed1:	6a 01                	push   $0x1
     ed3:	e8 e0 27 00 00       	call   36b8 <printf>
     ed8:	83 c4 10             	add    $0x10,%esp
}
     edb:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ede:	5b                   	pop    %ebx
     edf:	5e                   	pop    %esi
     ee0:	5f                   	pop    %edi
     ee1:	5d                   	pop    %ebp
     ee2:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for writing");
     ee3:	83 ec 08             	sub    $0x8,%esp
     ee6:	68 c4 4a 00 00       	push   $0x4ac4
     eeb:	6a 01                	push   $0x1
     eed:	e8 c6 27 00 00       	call   36b8 <printf>
    return;
     ef2:	83 c4 10             	add    $0x10,%esp
}
     ef5:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ef8:	5b                   	pop    %ebx
     ef9:	5e                   	pop    %esi
     efa:	5f                   	pop    %edi
     efb:	5d                   	pop    %ebp
     efc:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for reading\n");
     efd:	83 ec 08             	sub    $0x8,%esp
     f00:	68 10 4b 00 00       	push   $0x4b10
     f05:	6a 01                	push   $0x1
     f07:	e8 ac 27 00 00       	call   36b8 <printf>
    return;
     f0c:	83 c4 10             	add    $0x10,%esp
}
     f0f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f12:	5b                   	pop    %ebx
     f13:	5e                   	pop    %esi
     f14:	5f                   	pop    %edi
     f15:	5d                   	pop    %ebp
     f16:	c3                   	ret    
    exit();
     f17:	e8 69 26 00 00       	call   3585 <exit>
    printf(1, "sharedfd oops %d %d\n", nc, np);
     f1c:	52                   	push   %edx
     f1d:	57                   	push   %edi
     f1e:	68 1b 3e 00 00       	push   $0x3e1b
     f23:	6a 01                	push   $0x1
     f25:	e8 8e 27 00 00       	call   36b8 <printf>
    exit();
     f2a:	e8 56 26 00 00       	call   3585 <exit>
     f2f:	90                   	nop

00000f30 <fourfiles>:
{
     f30:	55                   	push   %ebp
     f31:	89 e5                	mov    %esp,%ebp
     f33:	57                   	push   %edi
     f34:	56                   	push   %esi
     f35:	53                   	push   %ebx
     f36:	83 ec 34             	sub    $0x34,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
     f39:	be 5c 51 00 00       	mov    $0x515c,%esi
     f3e:	b9 04 00 00 00       	mov    $0x4,%ecx
     f43:	8d 7d d8             	lea    -0x28(%ebp),%edi
     f46:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  printf(1, "fourfiles test\n");
     f48:	68 30 3e 00 00       	push   $0x3e30
     f4d:	6a 01                	push   $0x1
     f4f:	e8 64 27 00 00       	call   36b8 <printf>
     f54:	83 c4 10             	add    $0x10,%esp
  for(pi = 0; pi < 4; pi++){
     f57:	31 db                	xor    %ebx,%ebx
    fname = names[pi];
     f59:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    unlink(fname);
     f5d:	83 ec 0c             	sub    $0xc,%esp
     f60:	56                   	push   %esi
     f61:	e8 6f 26 00 00       	call   35d5 <unlink>
    pid = fork();
     f66:	e8 12 26 00 00       	call   357d <fork>
    if(pid < 0){
     f6b:	83 c4 10             	add    $0x10,%esp
     f6e:	85 c0                	test   %eax,%eax
     f70:	0f 88 46 01 00 00    	js     10bc <fourfiles+0x18c>
    if(pid == 0){
     f76:	0f 84 d7 00 00 00    	je     1053 <fourfiles+0x123>
  for(pi = 0; pi < 4; pi++){
     f7c:	43                   	inc    %ebx
     f7d:	83 fb 04             	cmp    $0x4,%ebx
     f80:	75 d7                	jne    f59 <fourfiles+0x29>
    wait();
     f82:	e8 06 26 00 00       	call   358d <wait>
     f87:	e8 01 26 00 00       	call   358d <wait>
     f8c:	e8 fc 25 00 00       	call   358d <wait>
     f91:	e8 f7 25 00 00       	call   358d <wait>
  for(i = 0; i < 2; i++){
     f96:	31 f6                	xor    %esi,%esi
    fname = names[i];
     f98:	8b 44 b5 d8          	mov    -0x28(%ebp,%esi,4),%eax
     f9c:	89 45 d0             	mov    %eax,-0x30(%ebp)
    fd = open(fname, 0);
     f9f:	83 ec 08             	sub    $0x8,%esp
     fa2:	6a 00                	push   $0x0
     fa4:	50                   	push   %eax
     fa5:	e8 1b 26 00 00       	call   35c5 <open>
     faa:	89 c3                	mov    %eax,%ebx
    while((n = read(fd, buf, sizeof(buf))) > 0){
     fac:	83 c4 10             	add    $0x10,%esp
    total = 0;
     faf:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     fb6:	66 90                	xchg   %ax,%ax
    while((n = read(fd, buf, sizeof(buf))) > 0){
     fb8:	52                   	push   %edx
     fb9:	68 00 20 00 00       	push   $0x2000
     fbe:	68 40 82 00 00       	push   $0x8240
     fc3:	53                   	push   %ebx
     fc4:	e8 d4 25 00 00       	call   359d <read>
     fc9:	83 c4 10             	add    $0x10,%esp
     fcc:	85 c0                	test   %eax,%eax
     fce:	7e 21                	jle    ff1 <fourfiles+0xc1>
      for(j = 0; j < n; j++){
     fd0:	31 d2                	xor    %edx,%edx
     fd2:	66 90                	xchg   %ax,%ax
        if(buf[j] != '0'+i){
     fd4:	0f be ba 40 82 00 00 	movsbl 0x8240(%edx),%edi
     fdb:	83 fe 01             	cmp    $0x1,%esi
     fde:	19 c9                	sbb    %ecx,%ecx
     fe0:	83 c1 31             	add    $0x31,%ecx
     fe3:	39 cf                	cmp    %ecx,%edi
     fe5:	75 58                	jne    103f <fourfiles+0x10f>
      for(j = 0; j < n; j++){
     fe7:	42                   	inc    %edx
     fe8:	39 d0                	cmp    %edx,%eax
     fea:	75 e8                	jne    fd4 <fourfiles+0xa4>
      total += n;
     fec:	01 45 d4             	add    %eax,-0x2c(%ebp)
     fef:	eb c7                	jmp    fb8 <fourfiles+0x88>
    close(fd);
     ff1:	83 ec 0c             	sub    $0xc,%esp
     ff4:	53                   	push   %ebx
     ff5:	e8 b3 25 00 00       	call   35ad <close>
    if(total != 12*500){
     ffa:	83 c4 10             	add    $0x10,%esp
     ffd:	81 7d d4 70 17 00 00 	cmpl   $0x1770,-0x2c(%ebp)
    1004:	0f 85 c6 00 00 00    	jne    10d0 <fourfiles+0x1a0>
    unlink(fname);
    100a:	83 ec 0c             	sub    $0xc,%esp
    100d:	ff 75 d0             	pushl  -0x30(%ebp)
    1010:	e8 c0 25 00 00       	call   35d5 <unlink>
  for(i = 0; i < 2; i++){
    1015:	83 c4 10             	add    $0x10,%esp
    1018:	4e                   	dec    %esi
    1019:	75 1a                	jne    1035 <fourfiles+0x105>
  printf(1, "fourfiles ok\n");
    101b:	83 ec 08             	sub    $0x8,%esp
    101e:	68 6e 3e 00 00       	push   $0x3e6e
    1023:	6a 01                	push   $0x1
    1025:	e8 8e 26 00 00       	call   36b8 <printf>
}
    102a:	83 c4 10             	add    $0x10,%esp
    102d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1030:	5b                   	pop    %ebx
    1031:	5e                   	pop    %esi
    1032:	5f                   	pop    %edi
    1033:	5d                   	pop    %ebp
    1034:	c3                   	ret    
    1035:	be 01 00 00 00       	mov    $0x1,%esi
    103a:	e9 59 ff ff ff       	jmp    f98 <fourfiles+0x68>
          printf(1, "wrong char\n");
    103f:	83 ec 08             	sub    $0x8,%esp
    1042:	68 51 3e 00 00       	push   $0x3e51
    1047:	6a 01                	push   $0x1
    1049:	e8 6a 26 00 00       	call   36b8 <printf>
          exit();
    104e:	e8 32 25 00 00       	call   3585 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    1053:	83 ec 08             	sub    $0x8,%esp
    1056:	68 02 02 00 00       	push   $0x202
    105b:	56                   	push   %esi
    105c:	e8 64 25 00 00       	call   35c5 <open>
    1061:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    1063:	83 c4 10             	add    $0x10,%esp
    1066:	85 c0                	test   %eax,%eax
    1068:	78 3f                	js     10a9 <fourfiles+0x179>
      memset(buf, '0'+pi, 512);
    106a:	50                   	push   %eax
    106b:	68 00 02 00 00       	push   $0x200
    1070:	83 c3 30             	add    $0x30,%ebx
    1073:	53                   	push   %ebx
    1074:	68 40 82 00 00       	push   $0x8240
    1079:	e8 d2 23 00 00       	call   3450 <memset>
    107e:	83 c4 10             	add    $0x10,%esp
    1081:	bb 0c 00 00 00       	mov    $0xc,%ebx
        if((n = write(fd, buf, 500)) != 500){
    1086:	57                   	push   %edi
    1087:	68 f4 01 00 00       	push   $0x1f4
    108c:	68 40 82 00 00       	push   $0x8240
    1091:	56                   	push   %esi
    1092:	e8 0e 25 00 00       	call   35a5 <write>
    1097:	83 c4 10             	add    $0x10,%esp
    109a:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    109f:	75 44                	jne    10e5 <fourfiles+0x1b5>
      for(i = 0; i < 12; i++){
    10a1:	4b                   	dec    %ebx
    10a2:	75 e2                	jne    1086 <fourfiles+0x156>
      exit();
    10a4:	e8 dc 24 00 00       	call   3585 <exit>
        printf(1, "create failed\n");
    10a9:	50                   	push   %eax
    10aa:	50                   	push   %eax
    10ab:	68 cb 40 00 00       	push   $0x40cb
    10b0:	6a 01                	push   $0x1
    10b2:	e8 01 26 00 00       	call   36b8 <printf>
        exit();
    10b7:	e8 c9 24 00 00       	call   3585 <exit>
      printf(1, "fork failed\n");
    10bc:	83 ec 08             	sub    $0x8,%esp
    10bf:	68 05 49 00 00       	push   $0x4905
    10c4:	6a 01                	push   $0x1
    10c6:	e8 ed 25 00 00       	call   36b8 <printf>
      exit();
    10cb:	e8 b5 24 00 00       	call   3585 <exit>
      printf(1, "wrong length %d\n", total);
    10d0:	50                   	push   %eax
    10d1:	ff 75 d4             	pushl  -0x2c(%ebp)
    10d4:	68 5d 3e 00 00       	push   $0x3e5d
    10d9:	6a 01                	push   $0x1
    10db:	e8 d8 25 00 00       	call   36b8 <printf>
      exit();
    10e0:	e8 a0 24 00 00       	call   3585 <exit>
          printf(1, "write failed %d\n", n);
    10e5:	51                   	push   %ecx
    10e6:	50                   	push   %eax
    10e7:	68 40 3e 00 00       	push   $0x3e40
    10ec:	6a 01                	push   $0x1
    10ee:	e8 c5 25 00 00       	call   36b8 <printf>
          exit();
    10f3:	e8 8d 24 00 00       	call   3585 <exit>

000010f8 <createdelete>:
{
    10f8:	55                   	push   %ebp
    10f9:	89 e5                	mov    %esp,%ebp
    10fb:	57                   	push   %edi
    10fc:	56                   	push   %esi
    10fd:	53                   	push   %ebx
    10fe:	83 ec 44             	sub    $0x44,%esp
  printf(1, "createdelete test\n");
    1101:	68 7c 3e 00 00       	push   $0x3e7c
    1106:	6a 01                	push   $0x1
    1108:	e8 ab 25 00 00       	call   36b8 <printf>
    110d:	83 c4 10             	add    $0x10,%esp
  for(pi = 0; pi < 4; pi++){
    1110:	31 db                	xor    %ebx,%ebx
    pid = fork();
    1112:	e8 66 24 00 00       	call   357d <fork>
    if(pid < 0){
    1117:	85 c0                	test   %eax,%eax
    1119:	0f 88 6c 01 00 00    	js     128b <createdelete+0x193>
    if(pid == 0){
    111f:	0f 84 d7 00 00 00    	je     11fc <createdelete+0x104>
  for(pi = 0; pi < 4; pi++){
    1125:	43                   	inc    %ebx
    1126:	83 fb 04             	cmp    $0x4,%ebx
    1129:	75 e7                	jne    1112 <createdelete+0x1a>
    wait();
    112b:	e8 5d 24 00 00       	call   358d <wait>
    1130:	e8 58 24 00 00       	call   358d <wait>
    1135:	e8 53 24 00 00       	call   358d <wait>
    113a:	e8 4e 24 00 00       	call   358d <wait>
  name[0] = name[1] = name[2] = 0;
    113f:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1143:	c7 45 c0 ff ff ff ff 	movl   $0xffffffff,-0x40(%ebp)
  for(i = 0; i < N; i++){
    114a:	31 f6                	xor    %esi,%esi
    114c:	8d 7d c8             	lea    -0x38(%ebp),%edi
    114f:	90                   	nop
    for(pi = 0; pi < 4; pi++){
    1150:	8d 46 30             	lea    0x30(%esi),%eax
    1153:	88 45 c7             	mov    %al,-0x39(%ebp)
      name[2] = '\0';
    1156:	b3 70                	mov    $0x70,%bl
      name[0] = 'p' + pi;
    1158:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
    115b:	8a 45 c7             	mov    -0x39(%ebp),%al
    115e:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1161:	83 ec 08             	sub    $0x8,%esp
    1164:	6a 00                	push   $0x0
    1166:	57                   	push   %edi
    1167:	e8 59 24 00 00       	call   35c5 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    116c:	83 c4 10             	add    $0x10,%esp
    116f:	85 f6                	test   %esi,%esi
    1171:	74 05                	je     1178 <createdelete+0x80>
    1173:	83 fe 09             	cmp    $0x9,%esi
    1176:	7e 6c                	jle    11e4 <createdelete+0xec>
    1178:	85 c0                	test   %eax,%eax
    117a:	0f 88 f8 00 00 00    	js     1278 <createdelete+0x180>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1180:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    1184:	76 62                	jbe    11e8 <createdelete+0xf0>
        close(fd);
    1186:	83 ec 0c             	sub    $0xc,%esp
    1189:	50                   	push   %eax
    118a:	e8 1e 24 00 00       	call   35ad <close>
    118f:	83 c4 10             	add    $0x10,%esp
    for(pi = 0; pi < 4; pi++){
    1192:	43                   	inc    %ebx
    1193:	80 fb 74             	cmp    $0x74,%bl
    1196:	75 c0                	jne    1158 <createdelete+0x60>
  for(i = 0; i < N; i++){
    1198:	46                   	inc    %esi
    1199:	ff 45 c0             	incl   -0x40(%ebp)
    119c:	83 fe 14             	cmp    $0x14,%esi
    119f:	75 af                	jne    1150 <createdelete+0x58>
    11a1:	b3 70                	mov    $0x70,%bl
    11a3:	90                   	nop
    for(pi = 0; pi < 4; pi++){
    11a4:	8d 43 c0             	lea    -0x40(%ebx),%eax
    11a7:	88 45 c7             	mov    %al,-0x39(%ebp)
  for(i = 0; i < N; i++){
    11aa:	be 04 00 00 00       	mov    $0x4,%esi
      name[0] = 'p' + i;
    11af:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
    11b2:	8a 45 c7             	mov    -0x39(%ebp),%al
    11b5:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    11b8:	83 ec 0c             	sub    $0xc,%esp
    11bb:	57                   	push   %edi
    11bc:	e8 14 24 00 00       	call   35d5 <unlink>
    for(pi = 0; pi < 4; pi++){
    11c1:	83 c4 10             	add    $0x10,%esp
    11c4:	4e                   	dec    %esi
    11c5:	75 e8                	jne    11af <createdelete+0xb7>
  for(i = 0; i < N; i++){
    11c7:	43                   	inc    %ebx
    11c8:	80 fb 84             	cmp    $0x84,%bl
    11cb:	75 d7                	jne    11a4 <createdelete+0xac>
  printf(1, "createdelete ok\n");
    11cd:	83 ec 08             	sub    $0x8,%esp
    11d0:	68 8f 3e 00 00       	push   $0x3e8f
    11d5:	6a 01                	push   $0x1
    11d7:	e8 dc 24 00 00       	call   36b8 <printf>
}
    11dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11df:	5b                   	pop    %ebx
    11e0:	5e                   	pop    %esi
    11e1:	5f                   	pop    %edi
    11e2:	5d                   	pop    %ebp
    11e3:	c3                   	ret    
      } else if((i >= 1 && i < N/2) && fd >= 0){
    11e4:	85 c0                	test   %eax,%eax
    11e6:	78 aa                	js     1192 <createdelete+0x9a>
        printf(1, "oops createdelete %s did exist\n", name);
    11e8:	50                   	push   %eax
    11e9:	57                   	push   %edi
    11ea:	68 60 4b 00 00       	push   $0x4b60
    11ef:	6a 01                	push   $0x1
    11f1:	e8 c2 24 00 00       	call   36b8 <printf>
        exit();
    11f6:	e8 8a 23 00 00       	call   3585 <exit>
    11fb:	90                   	nop
      name[0] = 'p' + pi;
    11fc:	83 c3 70             	add    $0x70,%ebx
    11ff:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[2] = '\0';
    1202:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1206:	31 db                	xor    %ebx,%ebx
    1208:	8d 7d c8             	lea    -0x38(%ebp),%edi
    120b:	90                   	nop
        name[1] = '0' + i;
    120c:	8d 43 30             	lea    0x30(%ebx),%eax
    120f:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    1212:	83 ec 08             	sub    $0x8,%esp
    1215:	68 02 02 00 00       	push   $0x202
    121a:	57                   	push   %edi
    121b:	e8 a5 23 00 00       	call   35c5 <open>
        if(fd < 0){
    1220:	83 c4 10             	add    $0x10,%esp
    1223:	85 c0                	test   %eax,%eax
    1225:	78 78                	js     129f <createdelete+0x1a7>
        close(fd);
    1227:	83 ec 0c             	sub    $0xc,%esp
    122a:	50                   	push   %eax
    122b:	e8 7d 23 00 00       	call   35ad <close>
        if(i > 0 && (i % 2 ) == 0){
    1230:	83 c4 10             	add    $0x10,%esp
    1233:	85 db                	test   %ebx,%ebx
    1235:	74 0a                	je     1241 <createdelete+0x149>
    1237:	f6 c3 01             	test   $0x1,%bl
    123a:	74 0d                	je     1249 <createdelete+0x151>
      for(i = 0; i < N; i++){
    123c:	83 fb 13             	cmp    $0x13,%ebx
    123f:	74 03                	je     1244 <createdelete+0x14c>
    1241:	43                   	inc    %ebx
    1242:	eb c8                	jmp    120c <createdelete+0x114>
      exit();
    1244:	e8 3c 23 00 00       	call   3585 <exit>
          name[1] = '0' + (i / 2);
    1249:	89 d8                	mov    %ebx,%eax
    124b:	d1 f8                	sar    %eax
    124d:	83 c0 30             	add    $0x30,%eax
    1250:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1253:	83 ec 0c             	sub    $0xc,%esp
    1256:	57                   	push   %edi
    1257:	e8 79 23 00 00       	call   35d5 <unlink>
    125c:	83 c4 10             	add    $0x10,%esp
    125f:	85 c0                	test   %eax,%eax
    1261:	79 d9                	jns    123c <createdelete+0x144>
            printf(1, "unlink failed\n");
    1263:	51                   	push   %ecx
    1264:	51                   	push   %ecx
    1265:	68 83 3a 00 00       	push   $0x3a83
    126a:	6a 01                	push   $0x1
    126c:	e8 47 24 00 00       	call   36b8 <printf>
            exit();
    1271:	e8 0f 23 00 00       	call   3585 <exit>
    1276:	66 90                	xchg   %ax,%ax
        printf(1, "oops createdelete %s didn't exist\n", name);
    1278:	52                   	push   %edx
    1279:	57                   	push   %edi
    127a:	68 3c 4b 00 00       	push   $0x4b3c
    127f:	6a 01                	push   $0x1
    1281:	e8 32 24 00 00       	call   36b8 <printf>
        exit();
    1286:	e8 fa 22 00 00       	call   3585 <exit>
      printf(1, "fork failed\n");
    128b:	83 ec 08             	sub    $0x8,%esp
    128e:	68 05 49 00 00       	push   $0x4905
    1293:	6a 01                	push   $0x1
    1295:	e8 1e 24 00 00       	call   36b8 <printf>
      exit();
    129a:	e8 e6 22 00 00       	call   3585 <exit>
          printf(1, "create failed\n");
    129f:	83 ec 08             	sub    $0x8,%esp
    12a2:	68 cb 40 00 00       	push   $0x40cb
    12a7:	6a 01                	push   $0x1
    12a9:	e8 0a 24 00 00       	call   36b8 <printf>
          exit();
    12ae:	e8 d2 22 00 00       	call   3585 <exit>
    12b3:	90                   	nop

000012b4 <unlinkread>:
{
    12b4:	55                   	push   %ebp
    12b5:	89 e5                	mov    %esp,%ebp
    12b7:	56                   	push   %esi
    12b8:	53                   	push   %ebx
  printf(1, "unlinkread test\n");
    12b9:	83 ec 08             	sub    $0x8,%esp
    12bc:	68 a0 3e 00 00       	push   $0x3ea0
    12c1:	6a 01                	push   $0x1
    12c3:	e8 f0 23 00 00       	call   36b8 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    12c8:	5e                   	pop    %esi
    12c9:	58                   	pop    %eax
    12ca:	68 02 02 00 00       	push   $0x202
    12cf:	68 b1 3e 00 00       	push   $0x3eb1
    12d4:	e8 ec 22 00 00       	call   35c5 <open>
  if(fd < 0){
    12d9:	83 c4 10             	add    $0x10,%esp
    12dc:	85 c0                	test   %eax,%eax
    12de:	0f 88 e2 00 00 00    	js     13c6 <unlinkread+0x112>
    12e4:	89 c3                	mov    %eax,%ebx
  write(fd, "hello", 5);
    12e6:	50                   	push   %eax
    12e7:	6a 05                	push   $0x5
    12e9:	68 d6 3e 00 00       	push   $0x3ed6
    12ee:	53                   	push   %ebx
    12ef:	e8 b1 22 00 00       	call   35a5 <write>
  close(fd);
    12f4:	89 1c 24             	mov    %ebx,(%esp)
    12f7:	e8 b1 22 00 00       	call   35ad <close>
  fd = open("unlinkread", O_RDWR);
    12fc:	5a                   	pop    %edx
    12fd:	59                   	pop    %ecx
    12fe:	6a 02                	push   $0x2
    1300:	68 b1 3e 00 00       	push   $0x3eb1
    1305:	e8 bb 22 00 00       	call   35c5 <open>
    130a:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    130c:	83 c4 10             	add    $0x10,%esp
    130f:	85 c0                	test   %eax,%eax
    1311:	0f 88 0e 01 00 00    	js     1425 <unlinkread+0x171>
  if(unlink("unlinkread") != 0){
    1317:	83 ec 0c             	sub    $0xc,%esp
    131a:	68 b1 3e 00 00       	push   $0x3eb1
    131f:	e8 b1 22 00 00       	call   35d5 <unlink>
    1324:	83 c4 10             	add    $0x10,%esp
    1327:	85 c0                	test   %eax,%eax
    1329:	0f 85 e3 00 00 00    	jne    1412 <unlinkread+0x15e>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    132f:	83 ec 08             	sub    $0x8,%esp
    1332:	68 02 02 00 00       	push   $0x202
    1337:	68 b1 3e 00 00       	push   $0x3eb1
    133c:	e8 84 22 00 00       	call   35c5 <open>
    1341:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    1343:	83 c4 0c             	add    $0xc,%esp
    1346:	6a 03                	push   $0x3
    1348:	68 0e 3f 00 00       	push   $0x3f0e
    134d:	50                   	push   %eax
    134e:	e8 52 22 00 00       	call   35a5 <write>
  close(fd1);
    1353:	89 34 24             	mov    %esi,(%esp)
    1356:	e8 52 22 00 00       	call   35ad <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    135b:	83 c4 0c             	add    $0xc,%esp
    135e:	68 00 20 00 00       	push   $0x2000
    1363:	68 40 82 00 00       	push   $0x8240
    1368:	53                   	push   %ebx
    1369:	e8 2f 22 00 00       	call   359d <read>
    136e:	83 c4 10             	add    $0x10,%esp
    1371:	83 f8 05             	cmp    $0x5,%eax
    1374:	0f 85 85 00 00 00    	jne    13ff <unlinkread+0x14b>
  if(buf[0] != 'h'){
    137a:	80 3d 40 82 00 00 68 	cmpb   $0x68,0x8240
    1381:	75 69                	jne    13ec <unlinkread+0x138>
  if(write(fd, buf, 10) != 10){
    1383:	56                   	push   %esi
    1384:	6a 0a                	push   $0xa
    1386:	68 40 82 00 00       	push   $0x8240
    138b:	53                   	push   %ebx
    138c:	e8 14 22 00 00       	call   35a5 <write>
    1391:	83 c4 10             	add    $0x10,%esp
    1394:	83 f8 0a             	cmp    $0xa,%eax
    1397:	75 40                	jne    13d9 <unlinkread+0x125>
  close(fd);
    1399:	83 ec 0c             	sub    $0xc,%esp
    139c:	53                   	push   %ebx
    139d:	e8 0b 22 00 00       	call   35ad <close>
  unlink("unlinkread");
    13a2:	c7 04 24 b1 3e 00 00 	movl   $0x3eb1,(%esp)
    13a9:	e8 27 22 00 00       	call   35d5 <unlink>
  printf(1, "unlinkread ok\n");
    13ae:	58                   	pop    %eax
    13af:	5a                   	pop    %edx
    13b0:	68 59 3f 00 00       	push   $0x3f59
    13b5:	6a 01                	push   $0x1
    13b7:	e8 fc 22 00 00       	call   36b8 <printf>
}
    13bc:	83 c4 10             	add    $0x10,%esp
    13bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
    13c2:	5b                   	pop    %ebx
    13c3:	5e                   	pop    %esi
    13c4:	5d                   	pop    %ebp
    13c5:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    13c6:	53                   	push   %ebx
    13c7:	53                   	push   %ebx
    13c8:	68 bc 3e 00 00       	push   $0x3ebc
    13cd:	6a 01                	push   $0x1
    13cf:	e8 e4 22 00 00       	call   36b8 <printf>
    exit();
    13d4:	e8 ac 21 00 00       	call   3585 <exit>
    printf(1, "unlinkread write failed\n");
    13d9:	51                   	push   %ecx
    13da:	51                   	push   %ecx
    13db:	68 40 3f 00 00       	push   $0x3f40
    13e0:	6a 01                	push   $0x1
    13e2:	e8 d1 22 00 00       	call   36b8 <printf>
    exit();
    13e7:	e8 99 21 00 00       	call   3585 <exit>
    printf(1, "unlinkread wrong data\n");
    13ec:	50                   	push   %eax
    13ed:	50                   	push   %eax
    13ee:	68 29 3f 00 00       	push   $0x3f29
    13f3:	6a 01                	push   $0x1
    13f5:	e8 be 22 00 00       	call   36b8 <printf>
    exit();
    13fa:	e8 86 21 00 00       	call   3585 <exit>
    printf(1, "unlinkread read failed");
    13ff:	50                   	push   %eax
    1400:	50                   	push   %eax
    1401:	68 12 3f 00 00       	push   $0x3f12
    1406:	6a 01                	push   $0x1
    1408:	e8 ab 22 00 00       	call   36b8 <printf>
    exit();
    140d:	e8 73 21 00 00       	call   3585 <exit>
    printf(1, "unlink unlinkread failed\n");
    1412:	50                   	push   %eax
    1413:	50                   	push   %eax
    1414:	68 f4 3e 00 00       	push   $0x3ef4
    1419:	6a 01                	push   $0x1
    141b:	e8 98 22 00 00       	call   36b8 <printf>
    exit();
    1420:	e8 60 21 00 00       	call   3585 <exit>
    printf(1, "open unlinkread failed\n");
    1425:	50                   	push   %eax
    1426:	50                   	push   %eax
    1427:	68 dc 3e 00 00       	push   $0x3edc
    142c:	6a 01                	push   $0x1
    142e:	e8 85 22 00 00       	call   36b8 <printf>
    exit();
    1433:	e8 4d 21 00 00       	call   3585 <exit>

00001438 <linktest>:
{
    1438:	55                   	push   %ebp
    1439:	89 e5                	mov    %esp,%ebp
    143b:	53                   	push   %ebx
    143c:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "linktest\n");
    143f:	68 68 3f 00 00       	push   $0x3f68
    1444:	6a 01                	push   $0x1
    1446:	e8 6d 22 00 00       	call   36b8 <printf>
  unlink("lf1");
    144b:	c7 04 24 72 3f 00 00 	movl   $0x3f72,(%esp)
    1452:	e8 7e 21 00 00       	call   35d5 <unlink>
  unlink("lf2");
    1457:	c7 04 24 76 3f 00 00 	movl   $0x3f76,(%esp)
    145e:	e8 72 21 00 00       	call   35d5 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    1463:	58                   	pop    %eax
    1464:	5a                   	pop    %edx
    1465:	68 02 02 00 00       	push   $0x202
    146a:	68 72 3f 00 00       	push   $0x3f72
    146f:	e8 51 21 00 00       	call   35c5 <open>
  if(fd < 0){
    1474:	83 c4 10             	add    $0x10,%esp
    1477:	85 c0                	test   %eax,%eax
    1479:	0f 88 1a 01 00 00    	js     1599 <linktest+0x161>
    147f:	89 c3                	mov    %eax,%ebx
  if(write(fd, "hello", 5) != 5){
    1481:	50                   	push   %eax
    1482:	6a 05                	push   $0x5
    1484:	68 d6 3e 00 00       	push   $0x3ed6
    1489:	53                   	push   %ebx
    148a:	e8 16 21 00 00       	call   35a5 <write>
    148f:	83 c4 10             	add    $0x10,%esp
    1492:	83 f8 05             	cmp    $0x5,%eax
    1495:	0f 85 96 01 00 00    	jne    1631 <linktest+0x1f9>
  close(fd);
    149b:	83 ec 0c             	sub    $0xc,%esp
    149e:	53                   	push   %ebx
    149f:	e8 09 21 00 00       	call   35ad <close>
  if(link("lf1", "lf2") < 0){
    14a4:	5b                   	pop    %ebx
    14a5:	58                   	pop    %eax
    14a6:	68 76 3f 00 00       	push   $0x3f76
    14ab:	68 72 3f 00 00       	push   $0x3f72
    14b0:	e8 30 21 00 00       	call   35e5 <link>
    14b5:	83 c4 10             	add    $0x10,%esp
    14b8:	85 c0                	test   %eax,%eax
    14ba:	0f 88 5e 01 00 00    	js     161e <linktest+0x1e6>
  unlink("lf1");
    14c0:	83 ec 0c             	sub    $0xc,%esp
    14c3:	68 72 3f 00 00       	push   $0x3f72
    14c8:	e8 08 21 00 00       	call   35d5 <unlink>
  if(open("lf1", 0) >= 0){
    14cd:	58                   	pop    %eax
    14ce:	5a                   	pop    %edx
    14cf:	6a 00                	push   $0x0
    14d1:	68 72 3f 00 00       	push   $0x3f72
    14d6:	e8 ea 20 00 00       	call   35c5 <open>
    14db:	83 c4 10             	add    $0x10,%esp
    14de:	85 c0                	test   %eax,%eax
    14e0:	0f 89 25 01 00 00    	jns    160b <linktest+0x1d3>
  fd = open("lf2", 0);
    14e6:	83 ec 08             	sub    $0x8,%esp
    14e9:	6a 00                	push   $0x0
    14eb:	68 76 3f 00 00       	push   $0x3f76
    14f0:	e8 d0 20 00 00       	call   35c5 <open>
    14f5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    14f7:	83 c4 10             	add    $0x10,%esp
    14fa:	85 c0                	test   %eax,%eax
    14fc:	0f 88 f6 00 00 00    	js     15f8 <linktest+0x1c0>
  if(read(fd, buf, sizeof(buf)) != 5){
    1502:	50                   	push   %eax
    1503:	68 00 20 00 00       	push   $0x2000
    1508:	68 40 82 00 00       	push   $0x8240
    150d:	53                   	push   %ebx
    150e:	e8 8a 20 00 00       	call   359d <read>
    1513:	83 c4 10             	add    $0x10,%esp
    1516:	83 f8 05             	cmp    $0x5,%eax
    1519:	0f 85 c6 00 00 00    	jne    15e5 <linktest+0x1ad>
  close(fd);
    151f:	83 ec 0c             	sub    $0xc,%esp
    1522:	53                   	push   %ebx
    1523:	e8 85 20 00 00       	call   35ad <close>
  if(link("lf2", "lf2") >= 0){
    1528:	58                   	pop    %eax
    1529:	5a                   	pop    %edx
    152a:	68 76 3f 00 00       	push   $0x3f76
    152f:	68 76 3f 00 00       	push   $0x3f76
    1534:	e8 ac 20 00 00       	call   35e5 <link>
    1539:	83 c4 10             	add    $0x10,%esp
    153c:	85 c0                	test   %eax,%eax
    153e:	0f 89 8e 00 00 00    	jns    15d2 <linktest+0x19a>
  unlink("lf2");
    1544:	83 ec 0c             	sub    $0xc,%esp
    1547:	68 76 3f 00 00       	push   $0x3f76
    154c:	e8 84 20 00 00       	call   35d5 <unlink>
  if(link("lf2", "lf1") >= 0){
    1551:	59                   	pop    %ecx
    1552:	5b                   	pop    %ebx
    1553:	68 72 3f 00 00       	push   $0x3f72
    1558:	68 76 3f 00 00       	push   $0x3f76
    155d:	e8 83 20 00 00       	call   35e5 <link>
    1562:	83 c4 10             	add    $0x10,%esp
    1565:	85 c0                	test   %eax,%eax
    1567:	79 56                	jns    15bf <linktest+0x187>
  if(link(".", "lf1") >= 0){
    1569:	83 ec 08             	sub    $0x8,%esp
    156c:	68 72 3f 00 00       	push   $0x3f72
    1571:	68 3a 42 00 00       	push   $0x423a
    1576:	e8 6a 20 00 00       	call   35e5 <link>
    157b:	83 c4 10             	add    $0x10,%esp
    157e:	85 c0                	test   %eax,%eax
    1580:	79 2a                	jns    15ac <linktest+0x174>
  printf(1, "linktest ok\n");
    1582:	83 ec 08             	sub    $0x8,%esp
    1585:	68 10 40 00 00       	push   $0x4010
    158a:	6a 01                	push   $0x1
    158c:	e8 27 21 00 00       	call   36b8 <printf>
}
    1591:	83 c4 10             	add    $0x10,%esp
    1594:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1597:	c9                   	leave  
    1598:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    1599:	50                   	push   %eax
    159a:	50                   	push   %eax
    159b:	68 7a 3f 00 00       	push   $0x3f7a
    15a0:	6a 01                	push   $0x1
    15a2:	e8 11 21 00 00       	call   36b8 <printf>
    exit();
    15a7:	e8 d9 1f 00 00       	call   3585 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    15ac:	50                   	push   %eax
    15ad:	50                   	push   %eax
    15ae:	68 f4 3f 00 00       	push   $0x3ff4
    15b3:	6a 01                	push   $0x1
    15b5:	e8 fe 20 00 00       	call   36b8 <printf>
    exit();
    15ba:	e8 c6 1f 00 00       	call   3585 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    15bf:	52                   	push   %edx
    15c0:	52                   	push   %edx
    15c1:	68 a8 4b 00 00       	push   $0x4ba8
    15c6:	6a 01                	push   $0x1
    15c8:	e8 eb 20 00 00       	call   36b8 <printf>
    exit();
    15cd:	e8 b3 1f 00 00       	call   3585 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    15d2:	50                   	push   %eax
    15d3:	50                   	push   %eax
    15d4:	68 d6 3f 00 00       	push   $0x3fd6
    15d9:	6a 01                	push   $0x1
    15db:	e8 d8 20 00 00       	call   36b8 <printf>
    exit();
    15e0:	e8 a0 1f 00 00       	call   3585 <exit>
    printf(1, "read lf2 failed\n");
    15e5:	51                   	push   %ecx
    15e6:	51                   	push   %ecx
    15e7:	68 c5 3f 00 00       	push   $0x3fc5
    15ec:	6a 01                	push   $0x1
    15ee:	e8 c5 20 00 00       	call   36b8 <printf>
    exit();
    15f3:	e8 8d 1f 00 00       	call   3585 <exit>
    printf(1, "open lf2 failed\n");
    15f8:	50                   	push   %eax
    15f9:	50                   	push   %eax
    15fa:	68 b4 3f 00 00       	push   $0x3fb4
    15ff:	6a 01                	push   $0x1
    1601:	e8 b2 20 00 00       	call   36b8 <printf>
    exit();
    1606:	e8 7a 1f 00 00       	call   3585 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    160b:	50                   	push   %eax
    160c:	50                   	push   %eax
    160d:	68 80 4b 00 00       	push   $0x4b80
    1612:	6a 01                	push   $0x1
    1614:	e8 9f 20 00 00       	call   36b8 <printf>
    exit();
    1619:	e8 67 1f 00 00       	call   3585 <exit>
    printf(1, "link lf1 lf2 failed\n");
    161e:	51                   	push   %ecx
    161f:	51                   	push   %ecx
    1620:	68 9f 3f 00 00       	push   $0x3f9f
    1625:	6a 01                	push   $0x1
    1627:	e8 8c 20 00 00       	call   36b8 <printf>
    exit();
    162c:	e8 54 1f 00 00       	call   3585 <exit>
    printf(1, "write lf1 failed\n");
    1631:	50                   	push   %eax
    1632:	50                   	push   %eax
    1633:	68 8d 3f 00 00       	push   $0x3f8d
    1638:	6a 01                	push   $0x1
    163a:	e8 79 20 00 00       	call   36b8 <printf>
    exit();
    163f:	e8 41 1f 00 00       	call   3585 <exit>

00001644 <concreate>:
{
    1644:	55                   	push   %ebp
    1645:	89 e5                	mov    %esp,%ebp
    1647:	57                   	push   %edi
    1648:	56                   	push   %esi
    1649:	53                   	push   %ebx
    164a:	83 ec 64             	sub    $0x64,%esp
  printf(1, "concreate test\n");
    164d:	68 1d 40 00 00       	push   $0x401d
    1652:	6a 01                	push   $0x1
    1654:	e8 5f 20 00 00       	call   36b8 <printf>
  file[0] = 'C';
    1659:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    165d:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    1661:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 40; i++){
    1664:	31 f6                	xor    %esi,%esi
    1666:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    1669:	bf 03 00 00 00       	mov    $0x3,%edi
    166e:	eb 3c                	jmp    16ac <concreate+0x68>
    1670:	89 f0                	mov    %esi,%eax
    1672:	99                   	cltd   
    1673:	f7 ff                	idiv   %edi
    if(pid && (i % 3) == 1){
    1675:	4a                   	dec    %edx
    1676:	0f 84 9c 00 00 00    	je     1718 <concreate+0xd4>
      fd = open(file, O_CREATE | O_RDWR);
    167c:	83 ec 08             	sub    $0x8,%esp
    167f:	68 02 02 00 00       	push   $0x202
    1684:	53                   	push   %ebx
    1685:	e8 3b 1f 00 00       	call   35c5 <open>
      if(fd < 0){
    168a:	83 c4 10             	add    $0x10,%esp
    168d:	85 c0                	test   %eax,%eax
    168f:	78 5c                	js     16ed <concreate+0xa9>
      close(fd);
    1691:	83 ec 0c             	sub    $0xc,%esp
    1694:	50                   	push   %eax
    1695:	e8 13 1f 00 00       	call   35ad <close>
    169a:	83 c4 10             	add    $0x10,%esp
      wait();
    169d:	e8 eb 1e 00 00       	call   358d <wait>
  for(i = 0; i < 40; i++){
    16a2:	46                   	inc    %esi
    16a3:	83 fe 28             	cmp    $0x28,%esi
    16a6:	0f 84 8c 00 00 00    	je     1738 <concreate+0xf4>
    file[1] = '0' + i;
    16ac:	8d 46 30             	lea    0x30(%esi),%eax
    16af:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    16b2:	83 ec 0c             	sub    $0xc,%esp
    16b5:	53                   	push   %ebx
    16b6:	e8 1a 1f 00 00       	call   35d5 <unlink>
    pid = fork();
    16bb:	e8 bd 1e 00 00       	call   357d <fork>
    if(pid && (i % 3) == 1){
    16c0:	83 c4 10             	add    $0x10,%esp
    16c3:	85 c0                	test   %eax,%eax
    16c5:	75 a9                	jne    1670 <concreate+0x2c>
      link("C0", file);
    16c7:	b9 05 00 00 00       	mov    $0x5,%ecx
    16cc:	89 f0                	mov    %esi,%eax
    16ce:	99                   	cltd   
    16cf:	f7 f9                	idiv   %ecx
    } else if(pid == 0 && (i % 5) == 1){
    16d1:	4a                   	dec    %edx
    16d2:	74 2c                	je     1700 <concreate+0xbc>
      fd = open(file, O_CREATE | O_RDWR);
    16d4:	83 ec 08             	sub    $0x8,%esp
    16d7:	68 02 02 00 00       	push   $0x202
    16dc:	53                   	push   %ebx
    16dd:	e8 e3 1e 00 00       	call   35c5 <open>
      if(fd < 0){
    16e2:	83 c4 10             	add    $0x10,%esp
    16e5:	85 c0                	test   %eax,%eax
    16e7:	0f 89 05 02 00 00    	jns    18f2 <concreate+0x2ae>
        printf(1, "concreate create %s failed\n", file);
    16ed:	51                   	push   %ecx
    16ee:	53                   	push   %ebx
    16ef:	68 30 40 00 00       	push   $0x4030
    16f4:	6a 01                	push   $0x1
    16f6:	e8 bd 1f 00 00       	call   36b8 <printf>
        exit();
    16fb:	e8 85 1e 00 00       	call   3585 <exit>
      link("C0", file);
    1700:	83 ec 08             	sub    $0x8,%esp
    1703:	53                   	push   %ebx
    1704:	68 2d 40 00 00       	push   $0x402d
    1709:	e8 d7 1e 00 00       	call   35e5 <link>
    170e:	83 c4 10             	add    $0x10,%esp
      exit();
    1711:	e8 6f 1e 00 00       	call   3585 <exit>
    1716:	66 90                	xchg   %ax,%ax
      link("C0", file);
    1718:	83 ec 08             	sub    $0x8,%esp
    171b:	53                   	push   %ebx
    171c:	68 2d 40 00 00       	push   $0x402d
    1721:	e8 bf 1e 00 00       	call   35e5 <link>
    1726:	83 c4 10             	add    $0x10,%esp
      wait();
    1729:	e8 5f 1e 00 00       	call   358d <wait>
  for(i = 0; i < 40; i++){
    172e:	46                   	inc    %esi
    172f:	83 fe 28             	cmp    $0x28,%esi
    1732:	0f 85 74 ff ff ff    	jne    16ac <concreate+0x68>
  memset(fa, 0, sizeof(fa));
    1738:	50                   	push   %eax
    1739:	6a 28                	push   $0x28
    173b:	6a 00                	push   $0x0
    173d:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1740:	50                   	push   %eax
    1741:	e8 0a 1d 00 00       	call   3450 <memset>
  fd = open(".", 0);
    1746:	58                   	pop    %eax
    1747:	5a                   	pop    %edx
    1748:	6a 00                	push   $0x0
    174a:	68 3a 42 00 00       	push   $0x423a
    174f:	e8 71 1e 00 00       	call   35c5 <open>
    1754:	89 c6                	mov    %eax,%esi
  while(read(fd, &de, sizeof(de)) > 0){
    1756:	83 c4 10             	add    $0x10,%esp
  n = 0;
    1759:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    1760:	8d 7d b0             	lea    -0x50(%ebp),%edi
    1763:	90                   	nop
  while(read(fd, &de, sizeof(de)) > 0){
    1764:	50                   	push   %eax
    1765:	6a 10                	push   $0x10
    1767:	57                   	push   %edi
    1768:	56                   	push   %esi
    1769:	e8 2f 1e 00 00       	call   359d <read>
    176e:	83 c4 10             	add    $0x10,%esp
    1771:	85 c0                	test   %eax,%eax
    1773:	7e 3b                	jle    17b0 <concreate+0x16c>
    if(de.inum == 0)
    1775:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    177a:	74 e8                	je     1764 <concreate+0x120>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    177c:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1780:	75 e2                	jne    1764 <concreate+0x120>
    1782:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1786:	75 dc                	jne    1764 <concreate+0x120>
      i = de.name[1] - '0';
    1788:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    178c:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    178f:	83 f8 27             	cmp    $0x27,%eax
    1792:	0f 87 44 01 00 00    	ja     18dc <concreate+0x298>
      if(fa[i]){
    1798:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    179d:	0f 85 23 01 00 00    	jne    18c6 <concreate+0x282>
      fa[i] = 1;
    17a3:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    17a8:	ff 45 a4             	incl   -0x5c(%ebp)
    17ab:	eb b7                	jmp    1764 <concreate+0x120>
    17ad:	8d 76 00             	lea    0x0(%esi),%esi
  close(fd);
    17b0:	83 ec 0c             	sub    $0xc,%esp
    17b3:	56                   	push   %esi
    17b4:	e8 f4 1d 00 00       	call   35ad <close>
  if(n != 40){
    17b9:	83 c4 10             	add    $0x10,%esp
    17bc:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    17c0:	0f 85 ed 00 00 00    	jne    18b3 <concreate+0x26f>
  for(i = 0; i < 40; i++){
    17c6:	31 f6                	xor    %esi,%esi
    17c8:	eb 69                	jmp    1833 <concreate+0x1ef>
    17ca:	66 90                	xchg   %ax,%ax
    if(((i % 3) == 0 && pid == 0) ||
    17cc:	85 ff                	test   %edi,%edi
    17ce:	0f 85 8d 00 00 00    	jne    1861 <concreate+0x21d>
      close(open(file, 0));
    17d4:	83 ec 08             	sub    $0x8,%esp
    17d7:	6a 00                	push   $0x0
    17d9:	53                   	push   %ebx
    17da:	e8 e6 1d 00 00       	call   35c5 <open>
    17df:	89 04 24             	mov    %eax,(%esp)
    17e2:	e8 c6 1d 00 00       	call   35ad <close>
      close(open(file, 0));
    17e7:	58                   	pop    %eax
    17e8:	5a                   	pop    %edx
    17e9:	6a 00                	push   $0x0
    17eb:	53                   	push   %ebx
    17ec:	e8 d4 1d 00 00       	call   35c5 <open>
    17f1:	89 04 24             	mov    %eax,(%esp)
    17f4:	e8 b4 1d 00 00       	call   35ad <close>
      close(open(file, 0));
    17f9:	59                   	pop    %ecx
    17fa:	58                   	pop    %eax
    17fb:	6a 00                	push   $0x0
    17fd:	53                   	push   %ebx
    17fe:	e8 c2 1d 00 00       	call   35c5 <open>
    1803:	89 04 24             	mov    %eax,(%esp)
    1806:	e8 a2 1d 00 00       	call   35ad <close>
      close(open(file, 0));
    180b:	58                   	pop    %eax
    180c:	5a                   	pop    %edx
    180d:	6a 00                	push   $0x0
    180f:	53                   	push   %ebx
    1810:	e8 b0 1d 00 00       	call   35c5 <open>
    1815:	89 04 24             	mov    %eax,(%esp)
    1818:	e8 90 1d 00 00       	call   35ad <close>
    181d:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    1820:	85 ff                	test   %edi,%edi
    1822:	0f 84 e9 fe ff ff    	je     1711 <concreate+0xcd>
      wait();
    1828:	e8 60 1d 00 00       	call   358d <wait>
  for(i = 0; i < 40; i++){
    182d:	46                   	inc    %esi
    182e:	83 fe 28             	cmp    $0x28,%esi
    1831:	74 55                	je     1888 <concreate+0x244>
    file[1] = '0' + i;
    1833:	8d 46 30             	lea    0x30(%esi),%eax
    1836:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    1839:	e8 3f 1d 00 00       	call   357d <fork>
    183e:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1840:	85 c0                	test   %eax,%eax
    1842:	78 5b                	js     189f <concreate+0x25b>
    if(((i % 3) == 0 && pid == 0) ||
    1844:	89 f0                	mov    %esi,%eax
    1846:	b9 03 00 00 00       	mov    $0x3,%ecx
    184b:	99                   	cltd   
    184c:	f7 f9                	idiv   %ecx
    184e:	85 d2                	test   %edx,%edx
    1850:	0f 84 76 ff ff ff    	je     17cc <concreate+0x188>
    1856:	4a                   	dec    %edx
    1857:	75 08                	jne    1861 <concreate+0x21d>
       ((i % 3) == 1 && pid != 0)){
    1859:	85 ff                	test   %edi,%edi
    185b:	0f 85 73 ff ff ff    	jne    17d4 <concreate+0x190>
      unlink(file);
    1861:	83 ec 0c             	sub    $0xc,%esp
    1864:	53                   	push   %ebx
    1865:	e8 6b 1d 00 00       	call   35d5 <unlink>
      unlink(file);
    186a:	89 1c 24             	mov    %ebx,(%esp)
    186d:	e8 63 1d 00 00       	call   35d5 <unlink>
      unlink(file);
    1872:	89 1c 24             	mov    %ebx,(%esp)
    1875:	e8 5b 1d 00 00       	call   35d5 <unlink>
      unlink(file);
    187a:	89 1c 24             	mov    %ebx,(%esp)
    187d:	e8 53 1d 00 00       	call   35d5 <unlink>
    1882:	83 c4 10             	add    $0x10,%esp
    1885:	eb 99                	jmp    1820 <concreate+0x1dc>
    1887:	90                   	nop
  printf(1, "concreate ok\n");
    1888:	83 ec 08             	sub    $0x8,%esp
    188b:	68 82 40 00 00       	push   $0x4082
    1890:	6a 01                	push   $0x1
    1892:	e8 21 1e 00 00       	call   36b8 <printf>
}
    1897:	8d 65 f4             	lea    -0xc(%ebp),%esp
    189a:	5b                   	pop    %ebx
    189b:	5e                   	pop    %esi
    189c:	5f                   	pop    %edi
    189d:	5d                   	pop    %ebp
    189e:	c3                   	ret    
      printf(1, "fork failed\n");
    189f:	83 ec 08             	sub    $0x8,%esp
    18a2:	68 05 49 00 00       	push   $0x4905
    18a7:	6a 01                	push   $0x1
    18a9:	e8 0a 1e 00 00       	call   36b8 <printf>
      exit();
    18ae:	e8 d2 1c 00 00       	call   3585 <exit>
    printf(1, "concreate not enough files in directory listing\n");
    18b3:	51                   	push   %ecx
    18b4:	51                   	push   %ecx
    18b5:	68 cc 4b 00 00       	push   $0x4bcc
    18ba:	6a 01                	push   $0x1
    18bc:	e8 f7 1d 00 00       	call   36b8 <printf>
    exit();
    18c1:	e8 bf 1c 00 00       	call   3585 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    18c6:	50                   	push   %eax
    18c7:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    18ca:	50                   	push   %eax
    18cb:	68 65 40 00 00       	push   $0x4065
    18d0:	6a 01                	push   $0x1
    18d2:	e8 e1 1d 00 00       	call   36b8 <printf>
        exit();
    18d7:	e8 a9 1c 00 00       	call   3585 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    18dc:	50                   	push   %eax
    18dd:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    18e0:	50                   	push   %eax
    18e1:	68 4c 40 00 00       	push   $0x404c
    18e6:	6a 01                	push   $0x1
    18e8:	e8 cb 1d 00 00       	call   36b8 <printf>
        exit();
    18ed:	e8 93 1c 00 00       	call   3585 <exit>
      close(fd);
    18f2:	83 ec 0c             	sub    $0xc,%esp
    18f5:	50                   	push   %eax
    18f6:	e8 b2 1c 00 00       	call   35ad <close>
    18fb:	83 c4 10             	add    $0x10,%esp
    18fe:	e9 0e fe ff ff       	jmp    1711 <concreate+0xcd>
    1903:	90                   	nop

00001904 <linkunlink>:
{
    1904:	55                   	push   %ebp
    1905:	89 e5                	mov    %esp,%ebp
    1907:	57                   	push   %edi
    1908:	56                   	push   %esi
    1909:	53                   	push   %ebx
    190a:	83 ec 24             	sub    $0x24,%esp
  printf(1, "linkunlink test\n");
    190d:	68 90 40 00 00       	push   $0x4090
    1912:	6a 01                	push   $0x1
    1914:	e8 9f 1d 00 00       	call   36b8 <printf>
  unlink("x");
    1919:	c7 04 24 1d 43 00 00 	movl   $0x431d,(%esp)
    1920:	e8 b0 1c 00 00       	call   35d5 <unlink>
  pid = fork();
    1925:	e8 53 1c 00 00       	call   357d <fork>
    192a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    192d:	83 c4 10             	add    $0x10,%esp
    1930:	85 c0                	test   %eax,%eax
    1932:	0f 88 c2 00 00 00    	js     19fa <linkunlink+0xf6>
  unsigned int x = (pid ? 1 : 97);
    1938:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    193c:	19 ff                	sbb    %edi,%edi
    193e:	83 e7 60             	and    $0x60,%edi
    1941:	47                   	inc    %edi
    1942:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    1947:	be 03 00 00 00       	mov    $0x3,%esi
    194c:	eb 1c                	jmp    196a <linkunlink+0x66>
    194e:	66 90                	xchg   %ax,%ax
    } else if((x % 3) == 1){
    1950:	4a                   	dec    %edx
    1951:	0f 84 89 00 00 00    	je     19e0 <linkunlink+0xdc>
      unlink("x");
    1957:	83 ec 0c             	sub    $0xc,%esp
    195a:	68 1d 43 00 00       	push   $0x431d
    195f:	e8 71 1c 00 00       	call   35d5 <unlink>
    1964:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1967:	4b                   	dec    %ebx
    1968:	74 52                	je     19bc <linkunlink+0xb8>
    x = x * 1103515245 + 12345;
    196a:	89 f8                	mov    %edi,%eax
    196c:	c1 e0 09             	shl    $0x9,%eax
    196f:	29 f8                	sub    %edi,%eax
    1971:	8d 14 87             	lea    (%edi,%eax,4),%edx
    1974:	89 d0                	mov    %edx,%eax
    1976:	c1 e0 09             	shl    $0x9,%eax
    1979:	29 d0                	sub    %edx,%eax
    197b:	01 c0                	add    %eax,%eax
    197d:	01 f8                	add    %edi,%eax
    197f:	89 c2                	mov    %eax,%edx
    1981:	c1 e2 05             	shl    $0x5,%edx
    1984:	01 d0                	add    %edx,%eax
    1986:	c1 e0 02             	shl    $0x2,%eax
    1989:	29 f8                	sub    %edi,%eax
    198b:	8d bc 87 39 30 00 00 	lea    0x3039(%edi,%eax,4),%edi
    if((x % 3) == 0){
    1992:	89 f8                	mov    %edi,%eax
    1994:	31 d2                	xor    %edx,%edx
    1996:	f7 f6                	div    %esi
    1998:	85 d2                	test   %edx,%edx
    199a:	75 b4                	jne    1950 <linkunlink+0x4c>
      close(open("x", O_RDWR | O_CREATE));
    199c:	83 ec 08             	sub    $0x8,%esp
    199f:	68 02 02 00 00       	push   $0x202
    19a4:	68 1d 43 00 00       	push   $0x431d
    19a9:	e8 17 1c 00 00       	call   35c5 <open>
    19ae:	89 04 24             	mov    %eax,(%esp)
    19b1:	e8 f7 1b 00 00       	call   35ad <close>
    19b6:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    19b9:	4b                   	dec    %ebx
    19ba:	75 ae                	jne    196a <linkunlink+0x66>
  if(pid)
    19bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    19bf:	85 c0                	test   %eax,%eax
    19c1:	74 4a                	je     1a0d <linkunlink+0x109>
    wait();
    19c3:	e8 c5 1b 00 00       	call   358d <wait>
  printf(1, "linkunlink ok\n");
    19c8:	83 ec 08             	sub    $0x8,%esp
    19cb:	68 a5 40 00 00       	push   $0x40a5
    19d0:	6a 01                	push   $0x1
    19d2:	e8 e1 1c 00 00       	call   36b8 <printf>
}
    19d7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    19da:	5b                   	pop    %ebx
    19db:	5e                   	pop    %esi
    19dc:	5f                   	pop    %edi
    19dd:	5d                   	pop    %ebp
    19de:	c3                   	ret    
    19df:	90                   	nop
      link("cat", "x");
    19e0:	83 ec 08             	sub    $0x8,%esp
    19e3:	68 1d 43 00 00       	push   $0x431d
    19e8:	68 a1 40 00 00       	push   $0x40a1
    19ed:	e8 f3 1b 00 00       	call   35e5 <link>
    19f2:	83 c4 10             	add    $0x10,%esp
    19f5:	e9 6d ff ff ff       	jmp    1967 <linkunlink+0x63>
    printf(1, "fork failed\n");
    19fa:	52                   	push   %edx
    19fb:	52                   	push   %edx
    19fc:	68 05 49 00 00       	push   $0x4905
    1a01:	6a 01                	push   $0x1
    1a03:	e8 b0 1c 00 00       	call   36b8 <printf>
    exit();
    1a08:	e8 78 1b 00 00       	call   3585 <exit>
    exit();
    1a0d:	e8 73 1b 00 00       	call   3585 <exit>
    1a12:	66 90                	xchg   %ax,%ax

00001a14 <bigdir>:
{
    1a14:	55                   	push   %ebp
    1a15:	89 e5                	mov    %esp,%ebp
    1a17:	57                   	push   %edi
    1a18:	56                   	push   %esi
    1a19:	53                   	push   %ebx
    1a1a:	83 ec 24             	sub    $0x24,%esp
  printf(1, "bigdir test\n");
    1a1d:	68 b4 40 00 00       	push   $0x40b4
    1a22:	6a 01                	push   $0x1
    1a24:	e8 8f 1c 00 00       	call   36b8 <printf>
  unlink("bd");
    1a29:	c7 04 24 c1 40 00 00 	movl   $0x40c1,(%esp)
    1a30:	e8 a0 1b 00 00       	call   35d5 <unlink>
  fd = open("bd", O_CREATE);
    1a35:	5a                   	pop    %edx
    1a36:	59                   	pop    %ecx
    1a37:	68 00 02 00 00       	push   $0x200
    1a3c:	68 c1 40 00 00       	push   $0x40c1
    1a41:	e8 7f 1b 00 00       	call   35c5 <open>
  if(fd < 0){
    1a46:	83 c4 10             	add    $0x10,%esp
    1a49:	85 c0                	test   %eax,%eax
    1a4b:	0f 88 dc 00 00 00    	js     1b2d <bigdir+0x119>
  close(fd);
    1a51:	83 ec 0c             	sub    $0xc,%esp
    1a54:	50                   	push   %eax
    1a55:	e8 53 1b 00 00       	call   35ad <close>
    1a5a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    1a5d:	31 f6                	xor    %esi,%esi
    1a5f:	8d 7d de             	lea    -0x22(%ebp),%edi
    1a62:	66 90                	xchg   %ax,%ax
    name[0] = 'x';
    1a64:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1a68:	89 f0                	mov    %esi,%eax
    1a6a:	c1 f8 06             	sar    $0x6,%eax
    1a6d:	83 c0 30             	add    $0x30,%eax
    1a70:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1a73:	89 f0                	mov    %esi,%eax
    1a75:	83 e0 3f             	and    $0x3f,%eax
    1a78:	83 c0 30             	add    $0x30,%eax
    1a7b:	88 45 e0             	mov    %al,-0x20(%ebp)
    name[3] = '\0';
    1a7e:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    if(link("bd", name) != 0){
    1a82:	83 ec 08             	sub    $0x8,%esp
    1a85:	57                   	push   %edi
    1a86:	68 c1 40 00 00       	push   $0x40c1
    1a8b:	e8 55 1b 00 00       	call   35e5 <link>
    1a90:	89 c3                	mov    %eax,%ebx
    1a92:	83 c4 10             	add    $0x10,%esp
    1a95:	85 c0                	test   %eax,%eax
    1a97:	75 6c                	jne    1b05 <bigdir+0xf1>
  for(i = 0; i < 500; i++){
    1a99:	46                   	inc    %esi
    1a9a:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1aa0:	75 c2                	jne    1a64 <bigdir+0x50>
  unlink("bd");
    1aa2:	83 ec 0c             	sub    $0xc,%esp
    1aa5:	68 c1 40 00 00       	push   $0x40c1
    1aaa:	e8 26 1b 00 00       	call   35d5 <unlink>
    1aaf:	83 c4 10             	add    $0x10,%esp
    1ab2:	66 90                	xchg   %ax,%ax
    name[0] = 'x';
    1ab4:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1ab8:	89 d8                	mov    %ebx,%eax
    1aba:	c1 f8 06             	sar    $0x6,%eax
    1abd:	83 c0 30             	add    $0x30,%eax
    1ac0:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1ac3:	89 d8                	mov    %ebx,%eax
    1ac5:	83 e0 3f             	and    $0x3f,%eax
    1ac8:	83 c0 30             	add    $0x30,%eax
    1acb:	88 45 e0             	mov    %al,-0x20(%ebp)
    name[3] = '\0';
    1ace:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    if(unlink(name) != 0){
    1ad2:	83 ec 0c             	sub    $0xc,%esp
    1ad5:	57                   	push   %edi
    1ad6:	e8 fa 1a 00 00       	call   35d5 <unlink>
    1adb:	83 c4 10             	add    $0x10,%esp
    1ade:	85 c0                	test   %eax,%eax
    1ae0:	75 37                	jne    1b19 <bigdir+0x105>
  for(i = 0; i < 500; i++){
    1ae2:	43                   	inc    %ebx
    1ae3:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1ae9:	75 c9                	jne    1ab4 <bigdir+0xa0>
  printf(1, "bigdir ok\n");
    1aeb:	83 ec 08             	sub    $0x8,%esp
    1aee:	68 03 41 00 00       	push   $0x4103
    1af3:	6a 01                	push   $0x1
    1af5:	e8 be 1b 00 00       	call   36b8 <printf>
    1afa:	83 c4 10             	add    $0x10,%esp
}
    1afd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b00:	5b                   	pop    %ebx
    1b01:	5e                   	pop    %esi
    1b02:	5f                   	pop    %edi
    1b03:	5d                   	pop    %ebp
    1b04:	c3                   	ret    
      printf(1, "bigdir link failed\n");
    1b05:	83 ec 08             	sub    $0x8,%esp
    1b08:	68 da 40 00 00       	push   $0x40da
    1b0d:	6a 01                	push   $0x1
    1b0f:	e8 a4 1b 00 00       	call   36b8 <printf>
      exit();
    1b14:	e8 6c 1a 00 00       	call   3585 <exit>
      printf(1, "bigdir unlink failed");
    1b19:	83 ec 08             	sub    $0x8,%esp
    1b1c:	68 ee 40 00 00       	push   $0x40ee
    1b21:	6a 01                	push   $0x1
    1b23:	e8 90 1b 00 00       	call   36b8 <printf>
      exit();
    1b28:	e8 58 1a 00 00       	call   3585 <exit>
    printf(1, "bigdir create failed\n");
    1b2d:	50                   	push   %eax
    1b2e:	50                   	push   %eax
    1b2f:	68 c4 40 00 00       	push   $0x40c4
    1b34:	6a 01                	push   $0x1
    1b36:	e8 7d 1b 00 00       	call   36b8 <printf>
    exit();
    1b3b:	e8 45 1a 00 00       	call   3585 <exit>

00001b40 <subdir>:
{
    1b40:	55                   	push   %ebp
    1b41:	89 e5                	mov    %esp,%ebp
    1b43:	53                   	push   %ebx
    1b44:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "subdir test\n");
    1b47:	68 0e 41 00 00       	push   $0x410e
    1b4c:	6a 01                	push   $0x1
    1b4e:	e8 65 1b 00 00       	call   36b8 <printf>
  unlink("ff");
    1b53:	c7 04 24 97 41 00 00 	movl   $0x4197,(%esp)
    1b5a:	e8 76 1a 00 00       	call   35d5 <unlink>
  if(mkdir("dd") != 0){
    1b5f:	c7 04 24 34 42 00 00 	movl   $0x4234,(%esp)
    1b66:	e8 82 1a 00 00       	call   35ed <mkdir>
    1b6b:	83 c4 10             	add    $0x10,%esp
    1b6e:	85 c0                	test   %eax,%eax
    1b70:	0f 85 ab 05 00 00    	jne    2121 <subdir+0x5e1>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1b76:	83 ec 08             	sub    $0x8,%esp
    1b79:	68 02 02 00 00       	push   $0x202
    1b7e:	68 6d 41 00 00       	push   $0x416d
    1b83:	e8 3d 1a 00 00       	call   35c5 <open>
    1b88:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1b8a:	83 c4 10             	add    $0x10,%esp
    1b8d:	85 c0                	test   %eax,%eax
    1b8f:	0f 88 79 05 00 00    	js     210e <subdir+0x5ce>
  write(fd, "ff", 2);
    1b95:	50                   	push   %eax
    1b96:	6a 02                	push   $0x2
    1b98:	68 97 41 00 00       	push   $0x4197
    1b9d:	53                   	push   %ebx
    1b9e:	e8 02 1a 00 00       	call   35a5 <write>
  close(fd);
    1ba3:	89 1c 24             	mov    %ebx,(%esp)
    1ba6:	e8 02 1a 00 00       	call   35ad <close>
  if(unlink("dd") >= 0){
    1bab:	c7 04 24 34 42 00 00 	movl   $0x4234,(%esp)
    1bb2:	e8 1e 1a 00 00       	call   35d5 <unlink>
    1bb7:	83 c4 10             	add    $0x10,%esp
    1bba:	85 c0                	test   %eax,%eax
    1bbc:	0f 89 39 05 00 00    	jns    20fb <subdir+0x5bb>
  if(mkdir("/dd/dd") != 0){
    1bc2:	83 ec 0c             	sub    $0xc,%esp
    1bc5:	68 48 41 00 00       	push   $0x4148
    1bca:	e8 1e 1a 00 00       	call   35ed <mkdir>
    1bcf:	83 c4 10             	add    $0x10,%esp
    1bd2:	85 c0                	test   %eax,%eax
    1bd4:	0f 85 0e 05 00 00    	jne    20e8 <subdir+0x5a8>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1bda:	83 ec 08             	sub    $0x8,%esp
    1bdd:	68 02 02 00 00       	push   $0x202
    1be2:	68 6a 41 00 00       	push   $0x416a
    1be7:	e8 d9 19 00 00       	call   35c5 <open>
    1bec:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1bee:	83 c4 10             	add    $0x10,%esp
    1bf1:	85 c0                	test   %eax,%eax
    1bf3:	0f 88 1e 04 00 00    	js     2017 <subdir+0x4d7>
  write(fd, "FF", 2);
    1bf9:	50                   	push   %eax
    1bfa:	6a 02                	push   $0x2
    1bfc:	68 8b 41 00 00       	push   $0x418b
    1c01:	53                   	push   %ebx
    1c02:	e8 9e 19 00 00       	call   35a5 <write>
  close(fd);
    1c07:	89 1c 24             	mov    %ebx,(%esp)
    1c0a:	e8 9e 19 00 00       	call   35ad <close>
  fd = open("dd/dd/../ff", 0);
    1c0f:	58                   	pop    %eax
    1c10:	5a                   	pop    %edx
    1c11:	6a 00                	push   $0x0
    1c13:	68 8e 41 00 00       	push   $0x418e
    1c18:	e8 a8 19 00 00       	call   35c5 <open>
    1c1d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1c1f:	83 c4 10             	add    $0x10,%esp
    1c22:	85 c0                	test   %eax,%eax
    1c24:	0f 88 da 03 00 00    	js     2004 <subdir+0x4c4>
  cc = read(fd, buf, sizeof(buf));
    1c2a:	50                   	push   %eax
    1c2b:	68 00 20 00 00       	push   $0x2000
    1c30:	68 40 82 00 00       	push   $0x8240
    1c35:	53                   	push   %ebx
    1c36:	e8 62 19 00 00       	call   359d <read>
  if(cc != 2 || buf[0] != 'f'){
    1c3b:	83 c4 10             	add    $0x10,%esp
    1c3e:	83 f8 02             	cmp    $0x2,%eax
    1c41:	0f 85 38 03 00 00    	jne    1f7f <subdir+0x43f>
    1c47:	80 3d 40 82 00 00 66 	cmpb   $0x66,0x8240
    1c4e:	0f 85 2b 03 00 00    	jne    1f7f <subdir+0x43f>
  close(fd);
    1c54:	83 ec 0c             	sub    $0xc,%esp
    1c57:	53                   	push   %ebx
    1c58:	e8 50 19 00 00       	call   35ad <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1c5d:	58                   	pop    %eax
    1c5e:	5a                   	pop    %edx
    1c5f:	68 ce 41 00 00       	push   $0x41ce
    1c64:	68 6a 41 00 00       	push   $0x416a
    1c69:	e8 77 19 00 00       	call   35e5 <link>
    1c6e:	83 c4 10             	add    $0x10,%esp
    1c71:	85 c0                	test   %eax,%eax
    1c73:	0f 85 c4 03 00 00    	jne    203d <subdir+0x4fd>
  if(unlink("dd/dd/ff") != 0){
    1c79:	83 ec 0c             	sub    $0xc,%esp
    1c7c:	68 6a 41 00 00       	push   $0x416a
    1c81:	e8 4f 19 00 00       	call   35d5 <unlink>
    1c86:	83 c4 10             	add    $0x10,%esp
    1c89:	85 c0                	test   %eax,%eax
    1c8b:	0f 85 14 03 00 00    	jne    1fa5 <subdir+0x465>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1c91:	83 ec 08             	sub    $0x8,%esp
    1c94:	6a 00                	push   $0x0
    1c96:	68 6a 41 00 00       	push   $0x416a
    1c9b:	e8 25 19 00 00       	call   35c5 <open>
    1ca0:	83 c4 10             	add    $0x10,%esp
    1ca3:	85 c0                	test   %eax,%eax
    1ca5:	0f 89 2a 04 00 00    	jns    20d5 <subdir+0x595>
  if(chdir("dd") != 0){
    1cab:	83 ec 0c             	sub    $0xc,%esp
    1cae:	68 34 42 00 00       	push   $0x4234
    1cb3:	e8 3d 19 00 00       	call   35f5 <chdir>
    1cb8:	83 c4 10             	add    $0x10,%esp
    1cbb:	85 c0                	test   %eax,%eax
    1cbd:	0f 85 ff 03 00 00    	jne    20c2 <subdir+0x582>
  if(chdir("dd/../../dd") != 0){
    1cc3:	83 ec 0c             	sub    $0xc,%esp
    1cc6:	68 02 42 00 00       	push   $0x4202
    1ccb:	e8 25 19 00 00       	call   35f5 <chdir>
    1cd0:	83 c4 10             	add    $0x10,%esp
    1cd3:	85 c0                	test   %eax,%eax
    1cd5:	0f 85 b7 02 00 00    	jne    1f92 <subdir+0x452>
  if(chdir("dd/../../../dd") != 0){
    1cdb:	83 ec 0c             	sub    $0xc,%esp
    1cde:	68 28 42 00 00       	push   $0x4228
    1ce3:	e8 0d 19 00 00       	call   35f5 <chdir>
    1ce8:	83 c4 10             	add    $0x10,%esp
    1ceb:	85 c0                	test   %eax,%eax
    1ced:	0f 85 9f 02 00 00    	jne    1f92 <subdir+0x452>
  if(chdir("./..") != 0){
    1cf3:	83 ec 0c             	sub    $0xc,%esp
    1cf6:	68 37 42 00 00       	push   $0x4237
    1cfb:	e8 f5 18 00 00       	call   35f5 <chdir>
    1d00:	83 c4 10             	add    $0x10,%esp
    1d03:	85 c0                	test   %eax,%eax
    1d05:	0f 85 1f 03 00 00    	jne    202a <subdir+0x4ea>
  fd = open("dd/dd/ffff", 0);
    1d0b:	83 ec 08             	sub    $0x8,%esp
    1d0e:	6a 00                	push   $0x0
    1d10:	68 ce 41 00 00       	push   $0x41ce
    1d15:	e8 ab 18 00 00       	call   35c5 <open>
    1d1a:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d1c:	83 c4 10             	add    $0x10,%esp
    1d1f:	85 c0                	test   %eax,%eax
    1d21:	0f 88 de 04 00 00    	js     2205 <subdir+0x6c5>
  if(read(fd, buf, sizeof(buf)) != 2){
    1d27:	50                   	push   %eax
    1d28:	68 00 20 00 00       	push   $0x2000
    1d2d:	68 40 82 00 00       	push   $0x8240
    1d32:	53                   	push   %ebx
    1d33:	e8 65 18 00 00       	call   359d <read>
    1d38:	83 c4 10             	add    $0x10,%esp
    1d3b:	83 f8 02             	cmp    $0x2,%eax
    1d3e:	0f 85 ae 04 00 00    	jne    21f2 <subdir+0x6b2>
  close(fd);
    1d44:	83 ec 0c             	sub    $0xc,%esp
    1d47:	53                   	push   %ebx
    1d48:	e8 60 18 00 00       	call   35ad <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1d4d:	58                   	pop    %eax
    1d4e:	5a                   	pop    %edx
    1d4f:	6a 00                	push   $0x0
    1d51:	68 6a 41 00 00       	push   $0x416a
    1d56:	e8 6a 18 00 00       	call   35c5 <open>
    1d5b:	83 c4 10             	add    $0x10,%esp
    1d5e:	85 c0                	test   %eax,%eax
    1d60:	0f 89 65 02 00 00    	jns    1fcb <subdir+0x48b>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1d66:	83 ec 08             	sub    $0x8,%esp
    1d69:	68 02 02 00 00       	push   $0x202
    1d6e:	68 82 42 00 00       	push   $0x4282
    1d73:	e8 4d 18 00 00       	call   35c5 <open>
    1d78:	83 c4 10             	add    $0x10,%esp
    1d7b:	85 c0                	test   %eax,%eax
    1d7d:	0f 89 35 02 00 00    	jns    1fb8 <subdir+0x478>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1d83:	83 ec 08             	sub    $0x8,%esp
    1d86:	68 02 02 00 00       	push   $0x202
    1d8b:	68 a7 42 00 00       	push   $0x42a7
    1d90:	e8 30 18 00 00       	call   35c5 <open>
    1d95:	83 c4 10             	add    $0x10,%esp
    1d98:	85 c0                	test   %eax,%eax
    1d9a:	0f 89 0f 03 00 00    	jns    20af <subdir+0x56f>
  if(open("dd", O_CREATE) >= 0){
    1da0:	83 ec 08             	sub    $0x8,%esp
    1da3:	68 00 02 00 00       	push   $0x200
    1da8:	68 34 42 00 00       	push   $0x4234
    1dad:	e8 13 18 00 00       	call   35c5 <open>
    1db2:	83 c4 10             	add    $0x10,%esp
    1db5:	85 c0                	test   %eax,%eax
    1db7:	0f 89 df 02 00 00    	jns    209c <subdir+0x55c>
  if(open("dd", O_RDWR) >= 0){
    1dbd:	83 ec 08             	sub    $0x8,%esp
    1dc0:	6a 02                	push   $0x2
    1dc2:	68 34 42 00 00       	push   $0x4234
    1dc7:	e8 f9 17 00 00       	call   35c5 <open>
    1dcc:	83 c4 10             	add    $0x10,%esp
    1dcf:	85 c0                	test   %eax,%eax
    1dd1:	0f 89 b2 02 00 00    	jns    2089 <subdir+0x549>
  if(open("dd", O_WRONLY) >= 0){
    1dd7:	83 ec 08             	sub    $0x8,%esp
    1dda:	6a 01                	push   $0x1
    1ddc:	68 34 42 00 00       	push   $0x4234
    1de1:	e8 df 17 00 00       	call   35c5 <open>
    1de6:	83 c4 10             	add    $0x10,%esp
    1de9:	85 c0                	test   %eax,%eax
    1deb:	0f 89 85 02 00 00    	jns    2076 <subdir+0x536>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1df1:	83 ec 08             	sub    $0x8,%esp
    1df4:	68 16 43 00 00       	push   $0x4316
    1df9:	68 82 42 00 00       	push   $0x4282
    1dfe:	e8 e2 17 00 00       	call   35e5 <link>
    1e03:	83 c4 10             	add    $0x10,%esp
    1e06:	85 c0                	test   %eax,%eax
    1e08:	0f 84 55 02 00 00    	je     2063 <subdir+0x523>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1e0e:	83 ec 08             	sub    $0x8,%esp
    1e11:	68 16 43 00 00       	push   $0x4316
    1e16:	68 a7 42 00 00       	push   $0x42a7
    1e1b:	e8 c5 17 00 00       	call   35e5 <link>
    1e20:	83 c4 10             	add    $0x10,%esp
    1e23:	85 c0                	test   %eax,%eax
    1e25:	0f 84 25 02 00 00    	je     2050 <subdir+0x510>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1e2b:	83 ec 08             	sub    $0x8,%esp
    1e2e:	68 ce 41 00 00       	push   $0x41ce
    1e33:	68 6d 41 00 00       	push   $0x416d
    1e38:	e8 a8 17 00 00       	call   35e5 <link>
    1e3d:	83 c4 10             	add    $0x10,%esp
    1e40:	85 c0                	test   %eax,%eax
    1e42:	0f 84 a9 01 00 00    	je     1ff1 <subdir+0x4b1>
  if(mkdir("dd/ff/ff") == 0){
    1e48:	83 ec 0c             	sub    $0xc,%esp
    1e4b:	68 82 42 00 00       	push   $0x4282
    1e50:	e8 98 17 00 00       	call   35ed <mkdir>
    1e55:	83 c4 10             	add    $0x10,%esp
    1e58:	85 c0                	test   %eax,%eax
    1e5a:	0f 84 7e 01 00 00    	je     1fde <subdir+0x49e>
  if(mkdir("dd/xx/ff") == 0){
    1e60:	83 ec 0c             	sub    $0xc,%esp
    1e63:	68 a7 42 00 00       	push   $0x42a7
    1e68:	e8 80 17 00 00       	call   35ed <mkdir>
    1e6d:	83 c4 10             	add    $0x10,%esp
    1e70:	85 c0                	test   %eax,%eax
    1e72:	0f 84 67 03 00 00    	je     21df <subdir+0x69f>
  if(mkdir("dd/dd/ffff") == 0){
    1e78:	83 ec 0c             	sub    $0xc,%esp
    1e7b:	68 ce 41 00 00       	push   $0x41ce
    1e80:	e8 68 17 00 00       	call   35ed <mkdir>
    1e85:	83 c4 10             	add    $0x10,%esp
    1e88:	85 c0                	test   %eax,%eax
    1e8a:	0f 84 3c 03 00 00    	je     21cc <subdir+0x68c>
  if(unlink("dd/xx/ff") == 0){
    1e90:	83 ec 0c             	sub    $0xc,%esp
    1e93:	68 a7 42 00 00       	push   $0x42a7
    1e98:	e8 38 17 00 00       	call   35d5 <unlink>
    1e9d:	83 c4 10             	add    $0x10,%esp
    1ea0:	85 c0                	test   %eax,%eax
    1ea2:	0f 84 11 03 00 00    	je     21b9 <subdir+0x679>
  if(unlink("dd/ff/ff") == 0){
    1ea8:	83 ec 0c             	sub    $0xc,%esp
    1eab:	68 82 42 00 00       	push   $0x4282
    1eb0:	e8 20 17 00 00       	call   35d5 <unlink>
    1eb5:	83 c4 10             	add    $0x10,%esp
    1eb8:	85 c0                	test   %eax,%eax
    1eba:	0f 84 e6 02 00 00    	je     21a6 <subdir+0x666>
  if(chdir("dd/ff") == 0){
    1ec0:	83 ec 0c             	sub    $0xc,%esp
    1ec3:	68 6d 41 00 00       	push   $0x416d
    1ec8:	e8 28 17 00 00       	call   35f5 <chdir>
    1ecd:	83 c4 10             	add    $0x10,%esp
    1ed0:	85 c0                	test   %eax,%eax
    1ed2:	0f 84 bb 02 00 00    	je     2193 <subdir+0x653>
  if(chdir("dd/xx") == 0){
    1ed8:	83 ec 0c             	sub    $0xc,%esp
    1edb:	68 19 43 00 00       	push   $0x4319
    1ee0:	e8 10 17 00 00       	call   35f5 <chdir>
    1ee5:	83 c4 10             	add    $0x10,%esp
    1ee8:	85 c0                	test   %eax,%eax
    1eea:	0f 84 90 02 00 00    	je     2180 <subdir+0x640>
  if(unlink("dd/dd/ffff") != 0){
    1ef0:	83 ec 0c             	sub    $0xc,%esp
    1ef3:	68 ce 41 00 00       	push   $0x41ce
    1ef8:	e8 d8 16 00 00       	call   35d5 <unlink>
    1efd:	83 c4 10             	add    $0x10,%esp
    1f00:	85 c0                	test   %eax,%eax
    1f02:	0f 85 9d 00 00 00    	jne    1fa5 <subdir+0x465>
  if(unlink("dd/ff") != 0){
    1f08:	83 ec 0c             	sub    $0xc,%esp
    1f0b:	68 6d 41 00 00       	push   $0x416d
    1f10:	e8 c0 16 00 00       	call   35d5 <unlink>
    1f15:	83 c4 10             	add    $0x10,%esp
    1f18:	85 c0                	test   %eax,%eax
    1f1a:	0f 85 4d 02 00 00    	jne    216d <subdir+0x62d>
  if(unlink("dd") == 0){
    1f20:	83 ec 0c             	sub    $0xc,%esp
    1f23:	68 34 42 00 00       	push   $0x4234
    1f28:	e8 a8 16 00 00       	call   35d5 <unlink>
    1f2d:	83 c4 10             	add    $0x10,%esp
    1f30:	85 c0                	test   %eax,%eax
    1f32:	0f 84 22 02 00 00    	je     215a <subdir+0x61a>
  if(unlink("dd/dd") < 0){
    1f38:	83 ec 0c             	sub    $0xc,%esp
    1f3b:	68 49 41 00 00       	push   $0x4149
    1f40:	e8 90 16 00 00       	call   35d5 <unlink>
    1f45:	83 c4 10             	add    $0x10,%esp
    1f48:	85 c0                	test   %eax,%eax
    1f4a:	0f 88 f7 01 00 00    	js     2147 <subdir+0x607>
  if(unlink("dd") < 0){
    1f50:	83 ec 0c             	sub    $0xc,%esp
    1f53:	68 34 42 00 00       	push   $0x4234
    1f58:	e8 78 16 00 00       	call   35d5 <unlink>
    1f5d:	83 c4 10             	add    $0x10,%esp
    1f60:	85 c0                	test   %eax,%eax
    1f62:	0f 88 cc 01 00 00    	js     2134 <subdir+0x5f4>
  printf(1, "subdir ok\n");
    1f68:	83 ec 08             	sub    $0x8,%esp
    1f6b:	68 16 44 00 00       	push   $0x4416
    1f70:	6a 01                	push   $0x1
    1f72:	e8 41 17 00 00       	call   36b8 <printf>
}
    1f77:	83 c4 10             	add    $0x10,%esp
    1f7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1f7d:	c9                   	leave  
    1f7e:	c3                   	ret    
    printf(1, "dd/dd/../ff wrong content\n");
    1f7f:	51                   	push   %ecx
    1f80:	51                   	push   %ecx
    1f81:	68 b3 41 00 00       	push   $0x41b3
    1f86:	6a 01                	push   $0x1
    1f88:	e8 2b 17 00 00       	call   36b8 <printf>
    exit();
    1f8d:	e8 f3 15 00 00       	call   3585 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    1f92:	50                   	push   %eax
    1f93:	50                   	push   %eax
    1f94:	68 0e 42 00 00       	push   $0x420e
    1f99:	6a 01                	push   $0x1
    1f9b:	e8 18 17 00 00       	call   36b8 <printf>
    exit();
    1fa0:	e8 e0 15 00 00       	call   3585 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    1fa5:	51                   	push   %ecx
    1fa6:	51                   	push   %ecx
    1fa7:	68 d9 41 00 00       	push   $0x41d9
    1fac:	6a 01                	push   $0x1
    1fae:	e8 05 17 00 00       	call   36b8 <printf>
    exit();
    1fb3:	e8 cd 15 00 00       	call   3585 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    1fb8:	51                   	push   %ecx
    1fb9:	51                   	push   %ecx
    1fba:	68 8b 42 00 00       	push   $0x428b
    1fbf:	6a 01                	push   $0x1
    1fc1:	e8 f2 16 00 00       	call   36b8 <printf>
    exit();
    1fc6:	e8 ba 15 00 00       	call   3585 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    1fcb:	53                   	push   %ebx
    1fcc:	53                   	push   %ebx
    1fcd:	68 70 4c 00 00       	push   $0x4c70
    1fd2:	6a 01                	push   $0x1
    1fd4:	e8 df 16 00 00       	call   36b8 <printf>
    exit();
    1fd9:	e8 a7 15 00 00       	call   3585 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    1fde:	51                   	push   %ecx
    1fdf:	51                   	push   %ecx
    1fe0:	68 1f 43 00 00       	push   $0x431f
    1fe5:	6a 01                	push   $0x1
    1fe7:	e8 cc 16 00 00       	call   36b8 <printf>
    exit();
    1fec:	e8 94 15 00 00       	call   3585 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    1ff1:	53                   	push   %ebx
    1ff2:	53                   	push   %ebx
    1ff3:	68 e0 4c 00 00       	push   $0x4ce0
    1ff8:	6a 01                	push   $0x1
    1ffa:	e8 b9 16 00 00       	call   36b8 <printf>
    exit();
    1fff:	e8 81 15 00 00       	call   3585 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    2004:	50                   	push   %eax
    2005:	50                   	push   %eax
    2006:	68 9a 41 00 00       	push   $0x419a
    200b:	6a 01                	push   $0x1
    200d:	e8 a6 16 00 00       	call   36b8 <printf>
    exit();
    2012:	e8 6e 15 00 00       	call   3585 <exit>
    printf(1, "create dd/dd/ff failed\n");
    2017:	51                   	push   %ecx
    2018:	51                   	push   %ecx
    2019:	68 73 41 00 00       	push   $0x4173
    201e:	6a 01                	push   $0x1
    2020:	e8 93 16 00 00       	call   36b8 <printf>
    exit();
    2025:	e8 5b 15 00 00       	call   3585 <exit>
    printf(1, "chdir ./.. failed\n");
    202a:	50                   	push   %eax
    202b:	50                   	push   %eax
    202c:	68 3c 42 00 00       	push   $0x423c
    2031:	6a 01                	push   $0x1
    2033:	e8 80 16 00 00       	call   36b8 <printf>
    exit();
    2038:	e8 48 15 00 00       	call   3585 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    203d:	53                   	push   %ebx
    203e:	53                   	push   %ebx
    203f:	68 28 4c 00 00       	push   $0x4c28
    2044:	6a 01                	push   $0x1
    2046:	e8 6d 16 00 00       	call   36b8 <printf>
    exit();
    204b:	e8 35 15 00 00       	call   3585 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2050:	50                   	push   %eax
    2051:	50                   	push   %eax
    2052:	68 bc 4c 00 00       	push   $0x4cbc
    2057:	6a 01                	push   $0x1
    2059:	e8 5a 16 00 00       	call   36b8 <printf>
    exit();
    205e:	e8 22 15 00 00       	call   3585 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    2063:	50                   	push   %eax
    2064:	50                   	push   %eax
    2065:	68 98 4c 00 00       	push   $0x4c98
    206a:	6a 01                	push   $0x1
    206c:	e8 47 16 00 00       	call   36b8 <printf>
    exit();
    2071:	e8 0f 15 00 00       	call   3585 <exit>
    printf(1, "open dd wronly succeeded!\n");
    2076:	50                   	push   %eax
    2077:	50                   	push   %eax
    2078:	68 fb 42 00 00       	push   $0x42fb
    207d:	6a 01                	push   $0x1
    207f:	e8 34 16 00 00       	call   36b8 <printf>
    exit();
    2084:	e8 fc 14 00 00       	call   3585 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    2089:	50                   	push   %eax
    208a:	50                   	push   %eax
    208b:	68 e2 42 00 00       	push   $0x42e2
    2090:	6a 01                	push   $0x1
    2092:	e8 21 16 00 00       	call   36b8 <printf>
    exit();
    2097:	e8 e9 14 00 00       	call   3585 <exit>
    printf(1, "create dd succeeded!\n");
    209c:	50                   	push   %eax
    209d:	50                   	push   %eax
    209e:	68 cc 42 00 00       	push   $0x42cc
    20a3:	6a 01                	push   $0x1
    20a5:	e8 0e 16 00 00       	call   36b8 <printf>
    exit();
    20aa:	e8 d6 14 00 00       	call   3585 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    20af:	52                   	push   %edx
    20b0:	52                   	push   %edx
    20b1:	68 b0 42 00 00       	push   $0x42b0
    20b6:	6a 01                	push   $0x1
    20b8:	e8 fb 15 00 00       	call   36b8 <printf>
    exit();
    20bd:	e8 c3 14 00 00       	call   3585 <exit>
    printf(1, "chdir dd failed\n");
    20c2:	50                   	push   %eax
    20c3:	50                   	push   %eax
    20c4:	68 f1 41 00 00       	push   $0x41f1
    20c9:	6a 01                	push   $0x1
    20cb:	e8 e8 15 00 00       	call   36b8 <printf>
    exit();
    20d0:	e8 b0 14 00 00       	call   3585 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    20d5:	52                   	push   %edx
    20d6:	52                   	push   %edx
    20d7:	68 4c 4c 00 00       	push   $0x4c4c
    20dc:	6a 01                	push   $0x1
    20de:	e8 d5 15 00 00       	call   36b8 <printf>
    exit();
    20e3:	e8 9d 14 00 00       	call   3585 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    20e8:	53                   	push   %ebx
    20e9:	53                   	push   %ebx
    20ea:	68 4f 41 00 00       	push   $0x414f
    20ef:	6a 01                	push   $0x1
    20f1:	e8 c2 15 00 00       	call   36b8 <printf>
    exit();
    20f6:	e8 8a 14 00 00       	call   3585 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    20fb:	50                   	push   %eax
    20fc:	50                   	push   %eax
    20fd:	68 00 4c 00 00       	push   $0x4c00
    2102:	6a 01                	push   $0x1
    2104:	e8 af 15 00 00       	call   36b8 <printf>
    exit();
    2109:	e8 77 14 00 00       	call   3585 <exit>
    printf(1, "create dd/ff failed\n");
    210e:	50                   	push   %eax
    210f:	50                   	push   %eax
    2110:	68 33 41 00 00       	push   $0x4133
    2115:	6a 01                	push   $0x1
    2117:	e8 9c 15 00 00       	call   36b8 <printf>
    exit();
    211c:	e8 64 14 00 00       	call   3585 <exit>
    printf(1, "subdir mkdir dd failed\n");
    2121:	50                   	push   %eax
    2122:	50                   	push   %eax
    2123:	68 1b 41 00 00       	push   $0x411b
    2128:	6a 01                	push   $0x1
    212a:	e8 89 15 00 00       	call   36b8 <printf>
    exit();
    212f:	e8 51 14 00 00       	call   3585 <exit>
    printf(1, "unlink dd failed\n");
    2134:	50                   	push   %eax
    2135:	50                   	push   %eax
    2136:	68 04 44 00 00       	push   $0x4404
    213b:	6a 01                	push   $0x1
    213d:	e8 76 15 00 00       	call   36b8 <printf>
    exit();
    2142:	e8 3e 14 00 00       	call   3585 <exit>
    printf(1, "unlink dd/dd failed\n");
    2147:	52                   	push   %edx
    2148:	52                   	push   %edx
    2149:	68 ef 43 00 00       	push   $0x43ef
    214e:	6a 01                	push   $0x1
    2150:	e8 63 15 00 00       	call   36b8 <printf>
    exit();
    2155:	e8 2b 14 00 00       	call   3585 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    215a:	51                   	push   %ecx
    215b:	51                   	push   %ecx
    215c:	68 04 4d 00 00       	push   $0x4d04
    2161:	6a 01                	push   $0x1
    2163:	e8 50 15 00 00       	call   36b8 <printf>
    exit();
    2168:	e8 18 14 00 00       	call   3585 <exit>
    printf(1, "unlink dd/ff failed\n");
    216d:	53                   	push   %ebx
    216e:	53                   	push   %ebx
    216f:	68 da 43 00 00       	push   $0x43da
    2174:	6a 01                	push   $0x1
    2176:	e8 3d 15 00 00       	call   36b8 <printf>
    exit();
    217b:	e8 05 14 00 00       	call   3585 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    2180:	50                   	push   %eax
    2181:	50                   	push   %eax
    2182:	68 c2 43 00 00       	push   $0x43c2
    2187:	6a 01                	push   $0x1
    2189:	e8 2a 15 00 00       	call   36b8 <printf>
    exit();
    218e:	e8 f2 13 00 00       	call   3585 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    2193:	50                   	push   %eax
    2194:	50                   	push   %eax
    2195:	68 aa 43 00 00       	push   $0x43aa
    219a:	6a 01                	push   $0x1
    219c:	e8 17 15 00 00       	call   36b8 <printf>
    exit();
    21a1:	e8 df 13 00 00       	call   3585 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    21a6:	50                   	push   %eax
    21a7:	50                   	push   %eax
    21a8:	68 8e 43 00 00       	push   $0x438e
    21ad:	6a 01                	push   $0x1
    21af:	e8 04 15 00 00       	call   36b8 <printf>
    exit();
    21b4:	e8 cc 13 00 00       	call   3585 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    21b9:	50                   	push   %eax
    21ba:	50                   	push   %eax
    21bb:	68 72 43 00 00       	push   $0x4372
    21c0:	6a 01                	push   $0x1
    21c2:	e8 f1 14 00 00       	call   36b8 <printf>
    exit();
    21c7:	e8 b9 13 00 00       	call   3585 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    21cc:	50                   	push   %eax
    21cd:	50                   	push   %eax
    21ce:	68 55 43 00 00       	push   $0x4355
    21d3:	6a 01                	push   $0x1
    21d5:	e8 de 14 00 00       	call   36b8 <printf>
    exit();
    21da:	e8 a6 13 00 00       	call   3585 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    21df:	52                   	push   %edx
    21e0:	52                   	push   %edx
    21e1:	68 3a 43 00 00       	push   $0x433a
    21e6:	6a 01                	push   $0x1
    21e8:	e8 cb 14 00 00       	call   36b8 <printf>
    exit();
    21ed:	e8 93 13 00 00       	call   3585 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    21f2:	51                   	push   %ecx
    21f3:	51                   	push   %ecx
    21f4:	68 67 42 00 00       	push   $0x4267
    21f9:	6a 01                	push   $0x1
    21fb:	e8 b8 14 00 00       	call   36b8 <printf>
    exit();
    2200:	e8 80 13 00 00       	call   3585 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    2205:	50                   	push   %eax
    2206:	50                   	push   %eax
    2207:	68 4f 42 00 00       	push   $0x424f
    220c:	6a 01                	push   $0x1
    220e:	e8 a5 14 00 00       	call   36b8 <printf>
    exit();
    2213:	e8 6d 13 00 00       	call   3585 <exit>

00002218 <bigwrite>:
{
    2218:	55                   	push   %ebp
    2219:	89 e5                	mov    %esp,%ebp
    221b:	56                   	push   %esi
    221c:	53                   	push   %ebx
  printf(1, "bigwrite test\n");
    221d:	83 ec 08             	sub    $0x8,%esp
    2220:	68 21 44 00 00       	push   $0x4421
    2225:	6a 01                	push   $0x1
    2227:	e8 8c 14 00 00       	call   36b8 <printf>
  unlink("bigwrite");
    222c:	c7 04 24 30 44 00 00 	movl   $0x4430,(%esp)
    2233:	e8 9d 13 00 00       	call   35d5 <unlink>
    2238:	83 c4 10             	add    $0x10,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    223b:	bb f3 01 00 00       	mov    $0x1f3,%ebx
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2240:	83 ec 08             	sub    $0x8,%esp
    2243:	68 02 02 00 00       	push   $0x202
    2248:	68 30 44 00 00       	push   $0x4430
    224d:	e8 73 13 00 00       	call   35c5 <open>
    2252:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2254:	83 c4 10             	add    $0x10,%esp
    2257:	85 c0                	test   %eax,%eax
    2259:	78 7a                	js     22d5 <bigwrite+0xbd>
      int cc = write(fd, buf, sz);
    225b:	52                   	push   %edx
    225c:	53                   	push   %ebx
    225d:	68 40 82 00 00       	push   $0x8240
    2262:	50                   	push   %eax
    2263:	e8 3d 13 00 00       	call   35a5 <write>
      if(cc != sz){
    2268:	83 c4 10             	add    $0x10,%esp
    226b:	39 d8                	cmp    %ebx,%eax
    226d:	75 53                	jne    22c2 <bigwrite+0xaa>
      int cc = write(fd, buf, sz);
    226f:	50                   	push   %eax
    2270:	53                   	push   %ebx
    2271:	68 40 82 00 00       	push   $0x8240
    2276:	56                   	push   %esi
    2277:	e8 29 13 00 00       	call   35a5 <write>
      if(cc != sz){
    227c:	83 c4 10             	add    $0x10,%esp
    227f:	39 d8                	cmp    %ebx,%eax
    2281:	75 3f                	jne    22c2 <bigwrite+0xaa>
    close(fd);
    2283:	83 ec 0c             	sub    $0xc,%esp
    2286:	56                   	push   %esi
    2287:	e8 21 13 00 00       	call   35ad <close>
    unlink("bigwrite");
    228c:	c7 04 24 30 44 00 00 	movl   $0x4430,(%esp)
    2293:	e8 3d 13 00 00       	call   35d5 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2298:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    229e:	83 c4 10             	add    $0x10,%esp
    22a1:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    22a7:	75 97                	jne    2240 <bigwrite+0x28>
  printf(1, "bigwrite ok\n");
    22a9:	83 ec 08             	sub    $0x8,%esp
    22ac:	68 63 44 00 00       	push   $0x4463
    22b1:	6a 01                	push   $0x1
    22b3:	e8 00 14 00 00       	call   36b8 <printf>
}
    22b8:	83 c4 10             	add    $0x10,%esp
    22bb:	8d 65 f8             	lea    -0x8(%ebp),%esp
    22be:	5b                   	pop    %ebx
    22bf:	5e                   	pop    %esi
    22c0:	5d                   	pop    %ebp
    22c1:	c3                   	ret    
        printf(1, "write(%d) ret %d\n", sz, cc);
    22c2:	50                   	push   %eax
    22c3:	53                   	push   %ebx
    22c4:	68 51 44 00 00       	push   $0x4451
    22c9:	6a 01                	push   $0x1
    22cb:	e8 e8 13 00 00       	call   36b8 <printf>
        exit();
    22d0:	e8 b0 12 00 00       	call   3585 <exit>
      printf(1, "cannot create bigwrite\n");
    22d5:	83 ec 08             	sub    $0x8,%esp
    22d8:	68 39 44 00 00       	push   $0x4439
    22dd:	6a 01                	push   $0x1
    22df:	e8 d4 13 00 00       	call   36b8 <printf>
      exit();
    22e4:	e8 9c 12 00 00       	call   3585 <exit>
    22e9:	8d 76 00             	lea    0x0(%esi),%esi

000022ec <bigfile>:
{
    22ec:	55                   	push   %ebp
    22ed:	89 e5                	mov    %esp,%ebp
    22ef:	57                   	push   %edi
    22f0:	56                   	push   %esi
    22f1:	53                   	push   %ebx
    22f2:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigfile test\n");
    22f5:	68 70 44 00 00       	push   $0x4470
    22fa:	6a 01                	push   $0x1
    22fc:	e8 b7 13 00 00       	call   36b8 <printf>
  unlink("bigfile");
    2301:	c7 04 24 8c 44 00 00 	movl   $0x448c,(%esp)
    2308:	e8 c8 12 00 00       	call   35d5 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    230d:	5e                   	pop    %esi
    230e:	5f                   	pop    %edi
    230f:	68 02 02 00 00       	push   $0x202
    2314:	68 8c 44 00 00       	push   $0x448c
    2319:	e8 a7 12 00 00       	call   35c5 <open>
  if(fd < 0){
    231e:	83 c4 10             	add    $0x10,%esp
    2321:	85 c0                	test   %eax,%eax
    2323:	0f 88 52 01 00 00    	js     247b <bigfile+0x18f>
    2329:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++){
    232b:	31 db                	xor    %ebx,%ebx
    232d:	8d 76 00             	lea    0x0(%esi),%esi
    memset(buf, i, 600);
    2330:	51                   	push   %ecx
    2331:	68 58 02 00 00       	push   $0x258
    2336:	53                   	push   %ebx
    2337:	68 40 82 00 00       	push   $0x8240
    233c:	e8 0f 11 00 00       	call   3450 <memset>
    if(write(fd, buf, 600) != 600){
    2341:	83 c4 0c             	add    $0xc,%esp
    2344:	68 58 02 00 00       	push   $0x258
    2349:	68 40 82 00 00       	push   $0x8240
    234e:	56                   	push   %esi
    234f:	e8 51 12 00 00       	call   35a5 <write>
    2354:	83 c4 10             	add    $0x10,%esp
    2357:	3d 58 02 00 00       	cmp    $0x258,%eax
    235c:	0f 85 f2 00 00 00    	jne    2454 <bigfile+0x168>
  for(i = 0; i < 20; i++){
    2362:	43                   	inc    %ebx
    2363:	83 fb 14             	cmp    $0x14,%ebx
    2366:	75 c8                	jne    2330 <bigfile+0x44>
  close(fd);
    2368:	83 ec 0c             	sub    $0xc,%esp
    236b:	56                   	push   %esi
    236c:	e8 3c 12 00 00       	call   35ad <close>
  fd = open("bigfile", 0);
    2371:	58                   	pop    %eax
    2372:	5a                   	pop    %edx
    2373:	6a 00                	push   $0x0
    2375:	68 8c 44 00 00       	push   $0x448c
    237a:	e8 46 12 00 00       	call   35c5 <open>
    237f:	89 c7                	mov    %eax,%edi
  if(fd < 0){
    2381:	83 c4 10             	add    $0x10,%esp
    2384:	85 c0                	test   %eax,%eax
    2386:	0f 88 dc 00 00 00    	js     2468 <bigfile+0x17c>
  total = 0;
    238c:	31 f6                	xor    %esi,%esi
  for(i = 0; ; i++){
    238e:	31 db                	xor    %ebx,%ebx
    2390:	eb 2e                	jmp    23c0 <bigfile+0xd4>
    2392:	66 90                	xchg   %ax,%ax
    if(cc != 300){
    2394:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2399:	0f 85 8d 00 00 00    	jne    242c <bigfile+0x140>
    if(buf[0] != i/2 || buf[299] != i/2){
    239f:	89 da                	mov    %ebx,%edx
    23a1:	d1 fa                	sar    %edx
    23a3:	0f be 05 40 82 00 00 	movsbl 0x8240,%eax
    23aa:	39 d0                	cmp    %edx,%eax
    23ac:	75 6a                	jne    2418 <bigfile+0x12c>
    23ae:	0f be 15 6b 83 00 00 	movsbl 0x836b,%edx
    23b5:	39 d0                	cmp    %edx,%eax
    23b7:	75 5f                	jne    2418 <bigfile+0x12c>
    total += cc;
    23b9:	81 c6 2c 01 00 00    	add    $0x12c,%esi
  for(i = 0; ; i++){
    23bf:	43                   	inc    %ebx
    cc = read(fd, buf, 300);
    23c0:	50                   	push   %eax
    23c1:	68 2c 01 00 00       	push   $0x12c
    23c6:	68 40 82 00 00       	push   $0x8240
    23cb:	57                   	push   %edi
    23cc:	e8 cc 11 00 00       	call   359d <read>
    if(cc < 0){
    23d1:	83 c4 10             	add    $0x10,%esp
    23d4:	85 c0                	test   %eax,%eax
    23d6:	78 68                	js     2440 <bigfile+0x154>
    if(cc == 0)
    23d8:	75 ba                	jne    2394 <bigfile+0xa8>
  close(fd);
    23da:	83 ec 0c             	sub    $0xc,%esp
    23dd:	57                   	push   %edi
    23de:	e8 ca 11 00 00       	call   35ad <close>
  if(total != 20*600){
    23e3:	83 c4 10             	add    $0x10,%esp
    23e6:	81 fe e0 2e 00 00    	cmp    $0x2ee0,%esi
    23ec:	0f 85 9c 00 00 00    	jne    248e <bigfile+0x1a2>
  unlink("bigfile");
    23f2:	83 ec 0c             	sub    $0xc,%esp
    23f5:	68 8c 44 00 00       	push   $0x448c
    23fa:	e8 d6 11 00 00       	call   35d5 <unlink>
  printf(1, "bigfile test ok\n");
    23ff:	58                   	pop    %eax
    2400:	5a                   	pop    %edx
    2401:	68 1b 45 00 00       	push   $0x451b
    2406:	6a 01                	push   $0x1
    2408:	e8 ab 12 00 00       	call   36b8 <printf>
}
    240d:	83 c4 10             	add    $0x10,%esp
    2410:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2413:	5b                   	pop    %ebx
    2414:	5e                   	pop    %esi
    2415:	5f                   	pop    %edi
    2416:	5d                   	pop    %ebp
    2417:	c3                   	ret    
      printf(1, "read bigfile wrong data\n");
    2418:	83 ec 08             	sub    $0x8,%esp
    241b:	68 e8 44 00 00       	push   $0x44e8
    2420:	6a 01                	push   $0x1
    2422:	e8 91 12 00 00       	call   36b8 <printf>
      exit();
    2427:	e8 59 11 00 00       	call   3585 <exit>
      printf(1, "short read bigfile\n");
    242c:	83 ec 08             	sub    $0x8,%esp
    242f:	68 d4 44 00 00       	push   $0x44d4
    2434:	6a 01                	push   $0x1
    2436:	e8 7d 12 00 00       	call   36b8 <printf>
      exit();
    243b:	e8 45 11 00 00       	call   3585 <exit>
      printf(1, "read bigfile failed\n");
    2440:	83 ec 08             	sub    $0x8,%esp
    2443:	68 bf 44 00 00       	push   $0x44bf
    2448:	6a 01                	push   $0x1
    244a:	e8 69 12 00 00       	call   36b8 <printf>
      exit();
    244f:	e8 31 11 00 00       	call   3585 <exit>
      printf(1, "write bigfile failed\n");
    2454:	83 ec 08             	sub    $0x8,%esp
    2457:	68 94 44 00 00       	push   $0x4494
    245c:	6a 01                	push   $0x1
    245e:	e8 55 12 00 00       	call   36b8 <printf>
      exit();
    2463:	e8 1d 11 00 00       	call   3585 <exit>
    printf(1, "cannot open bigfile\n");
    2468:	50                   	push   %eax
    2469:	50                   	push   %eax
    246a:	68 aa 44 00 00       	push   $0x44aa
    246f:	6a 01                	push   $0x1
    2471:	e8 42 12 00 00       	call   36b8 <printf>
    exit();
    2476:	e8 0a 11 00 00       	call   3585 <exit>
    printf(1, "cannot create bigfile");
    247b:	53                   	push   %ebx
    247c:	53                   	push   %ebx
    247d:	68 7e 44 00 00       	push   $0x447e
    2482:	6a 01                	push   $0x1
    2484:	e8 2f 12 00 00       	call   36b8 <printf>
    exit();
    2489:	e8 f7 10 00 00       	call   3585 <exit>
    printf(1, "read bigfile wrong total\n");
    248e:	51                   	push   %ecx
    248f:	51                   	push   %ecx
    2490:	68 01 45 00 00       	push   $0x4501
    2495:	6a 01                	push   $0x1
    2497:	e8 1c 12 00 00       	call   36b8 <printf>
    exit();
    249c:	e8 e4 10 00 00       	call   3585 <exit>
    24a1:	8d 76 00             	lea    0x0(%esi),%esi

000024a4 <fourteen>:
{
    24a4:	55                   	push   %ebp
    24a5:	89 e5                	mov    %esp,%ebp
    24a7:	83 ec 10             	sub    $0x10,%esp
  printf(1, "fourteen test\n");
    24aa:	68 2c 45 00 00       	push   $0x452c
    24af:	6a 01                	push   $0x1
    24b1:	e8 02 12 00 00       	call   36b8 <printf>
  if(mkdir("12345678901234") != 0){
    24b6:	c7 04 24 67 45 00 00 	movl   $0x4567,(%esp)
    24bd:	e8 2b 11 00 00       	call   35ed <mkdir>
    24c2:	83 c4 10             	add    $0x10,%esp
    24c5:	85 c0                	test   %eax,%eax
    24c7:	0f 85 97 00 00 00    	jne    2564 <fourteen+0xc0>
  if(mkdir("12345678901234/123456789012345") != 0){
    24cd:	83 ec 0c             	sub    $0xc,%esp
    24d0:	68 24 4d 00 00       	push   $0x4d24
    24d5:	e8 13 11 00 00       	call   35ed <mkdir>
    24da:	83 c4 10             	add    $0x10,%esp
    24dd:	85 c0                	test   %eax,%eax
    24df:	0f 85 de 00 00 00    	jne    25c3 <fourteen+0x11f>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    24e5:	83 ec 08             	sub    $0x8,%esp
    24e8:	68 00 02 00 00       	push   $0x200
    24ed:	68 74 4d 00 00       	push   $0x4d74
    24f2:	e8 ce 10 00 00       	call   35c5 <open>
  if(fd < 0){
    24f7:	83 c4 10             	add    $0x10,%esp
    24fa:	85 c0                	test   %eax,%eax
    24fc:	0f 88 ae 00 00 00    	js     25b0 <fourteen+0x10c>
  close(fd);
    2502:	83 ec 0c             	sub    $0xc,%esp
    2505:	50                   	push   %eax
    2506:	e8 a2 10 00 00       	call   35ad <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    250b:	58                   	pop    %eax
    250c:	5a                   	pop    %edx
    250d:	6a 00                	push   $0x0
    250f:	68 e4 4d 00 00       	push   $0x4de4
    2514:	e8 ac 10 00 00       	call   35c5 <open>
  if(fd < 0){
    2519:	83 c4 10             	add    $0x10,%esp
    251c:	85 c0                	test   %eax,%eax
    251e:	78 7d                	js     259d <fourteen+0xf9>
  close(fd);
    2520:	83 ec 0c             	sub    $0xc,%esp
    2523:	50                   	push   %eax
    2524:	e8 84 10 00 00       	call   35ad <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    2529:	c7 04 24 58 45 00 00 	movl   $0x4558,(%esp)
    2530:	e8 b8 10 00 00       	call   35ed <mkdir>
    2535:	83 c4 10             	add    $0x10,%esp
    2538:	85 c0                	test   %eax,%eax
    253a:	74 4e                	je     258a <fourteen+0xe6>
  if(mkdir("123456789012345/12345678901234") == 0){
    253c:	83 ec 0c             	sub    $0xc,%esp
    253f:	68 80 4e 00 00       	push   $0x4e80
    2544:	e8 a4 10 00 00       	call   35ed <mkdir>
    2549:	83 c4 10             	add    $0x10,%esp
    254c:	85 c0                	test   %eax,%eax
    254e:	74 27                	je     2577 <fourteen+0xd3>
  printf(1, "fourteen ok\n");
    2550:	83 ec 08             	sub    $0x8,%esp
    2553:	68 76 45 00 00       	push   $0x4576
    2558:	6a 01                	push   $0x1
    255a:	e8 59 11 00 00       	call   36b8 <printf>
}
    255f:	83 c4 10             	add    $0x10,%esp
    2562:	c9                   	leave  
    2563:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    2564:	50                   	push   %eax
    2565:	50                   	push   %eax
    2566:	68 3b 45 00 00       	push   $0x453b
    256b:	6a 01                	push   $0x1
    256d:	e8 46 11 00 00       	call   36b8 <printf>
    exit();
    2572:	e8 0e 10 00 00       	call   3585 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2577:	50                   	push   %eax
    2578:	50                   	push   %eax
    2579:	68 a0 4e 00 00       	push   $0x4ea0
    257e:	6a 01                	push   $0x1
    2580:	e8 33 11 00 00       	call   36b8 <printf>
    exit();
    2585:	e8 fb 0f 00 00       	call   3585 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    258a:	52                   	push   %edx
    258b:	52                   	push   %edx
    258c:	68 50 4e 00 00       	push   $0x4e50
    2591:	6a 01                	push   $0x1
    2593:	e8 20 11 00 00       	call   36b8 <printf>
    exit();
    2598:	e8 e8 0f 00 00       	call   3585 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    259d:	51                   	push   %ecx
    259e:	51                   	push   %ecx
    259f:	68 14 4e 00 00       	push   $0x4e14
    25a4:	6a 01                	push   $0x1
    25a6:	e8 0d 11 00 00       	call   36b8 <printf>
    exit();
    25ab:	e8 d5 0f 00 00       	call   3585 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    25b0:	51                   	push   %ecx
    25b1:	51                   	push   %ecx
    25b2:	68 a4 4d 00 00       	push   $0x4da4
    25b7:	6a 01                	push   $0x1
    25b9:	e8 fa 10 00 00       	call   36b8 <printf>
    exit();
    25be:	e8 c2 0f 00 00       	call   3585 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    25c3:	50                   	push   %eax
    25c4:	50                   	push   %eax
    25c5:	68 44 4d 00 00       	push   $0x4d44
    25ca:	6a 01                	push   $0x1
    25cc:	e8 e7 10 00 00       	call   36b8 <printf>
    exit();
    25d1:	e8 af 0f 00 00       	call   3585 <exit>
    25d6:	66 90                	xchg   %ax,%ax

000025d8 <rmdot>:
{
    25d8:	55                   	push   %ebp
    25d9:	89 e5                	mov    %esp,%ebp
    25db:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    25de:	68 83 45 00 00       	push   $0x4583
    25e3:	6a 01                	push   $0x1
    25e5:	e8 ce 10 00 00       	call   36b8 <printf>
  if(mkdir("dots") != 0){
    25ea:	c7 04 24 8f 45 00 00 	movl   $0x458f,(%esp)
    25f1:	e8 f7 0f 00 00       	call   35ed <mkdir>
    25f6:	83 c4 10             	add    $0x10,%esp
    25f9:	85 c0                	test   %eax,%eax
    25fb:	0f 85 b0 00 00 00    	jne    26b1 <rmdot+0xd9>
  if(chdir("dots") != 0){
    2601:	83 ec 0c             	sub    $0xc,%esp
    2604:	68 8f 45 00 00       	push   $0x458f
    2609:	e8 e7 0f 00 00       	call   35f5 <chdir>
    260e:	83 c4 10             	add    $0x10,%esp
    2611:	85 c0                	test   %eax,%eax
    2613:	0f 85 1d 01 00 00    	jne    2736 <rmdot+0x15e>
  if(unlink(".") == 0){
    2619:	83 ec 0c             	sub    $0xc,%esp
    261c:	68 3a 42 00 00       	push   $0x423a
    2621:	e8 af 0f 00 00       	call   35d5 <unlink>
    2626:	83 c4 10             	add    $0x10,%esp
    2629:	85 c0                	test   %eax,%eax
    262b:	0f 84 f2 00 00 00    	je     2723 <rmdot+0x14b>
  if(unlink("..") == 0){
    2631:	83 ec 0c             	sub    $0xc,%esp
    2634:	68 39 42 00 00       	push   $0x4239
    2639:	e8 97 0f 00 00       	call   35d5 <unlink>
    263e:	83 c4 10             	add    $0x10,%esp
    2641:	85 c0                	test   %eax,%eax
    2643:	0f 84 c7 00 00 00    	je     2710 <rmdot+0x138>
  if(chdir("/") != 0){
    2649:	83 ec 0c             	sub    $0xc,%esp
    264c:	68 13 3a 00 00       	push   $0x3a13
    2651:	e8 9f 0f 00 00       	call   35f5 <chdir>
    2656:	83 c4 10             	add    $0x10,%esp
    2659:	85 c0                	test   %eax,%eax
    265b:	0f 85 9c 00 00 00    	jne    26fd <rmdot+0x125>
  if(unlink("dots/.") == 0){
    2661:	83 ec 0c             	sub    $0xc,%esp
    2664:	68 d7 45 00 00       	push   $0x45d7
    2669:	e8 67 0f 00 00       	call   35d5 <unlink>
    266e:	83 c4 10             	add    $0x10,%esp
    2671:	85 c0                	test   %eax,%eax
    2673:	74 75                	je     26ea <rmdot+0x112>
  if(unlink("dots/..") == 0){
    2675:	83 ec 0c             	sub    $0xc,%esp
    2678:	68 f5 45 00 00       	push   $0x45f5
    267d:	e8 53 0f 00 00       	call   35d5 <unlink>
    2682:	83 c4 10             	add    $0x10,%esp
    2685:	85 c0                	test   %eax,%eax
    2687:	74 4e                	je     26d7 <rmdot+0xff>
  if(unlink("dots") != 0){
    2689:	83 ec 0c             	sub    $0xc,%esp
    268c:	68 8f 45 00 00       	push   $0x458f
    2691:	e8 3f 0f 00 00       	call   35d5 <unlink>
    2696:	83 c4 10             	add    $0x10,%esp
    2699:	85 c0                	test   %eax,%eax
    269b:	75 27                	jne    26c4 <rmdot+0xec>
  printf(1, "rmdot ok\n");
    269d:	83 ec 08             	sub    $0x8,%esp
    26a0:	68 2a 46 00 00       	push   $0x462a
    26a5:	6a 01                	push   $0x1
    26a7:	e8 0c 10 00 00       	call   36b8 <printf>
}
    26ac:	83 c4 10             	add    $0x10,%esp
    26af:	c9                   	leave  
    26b0:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    26b1:	50                   	push   %eax
    26b2:	50                   	push   %eax
    26b3:	68 94 45 00 00       	push   $0x4594
    26b8:	6a 01                	push   $0x1
    26ba:	e8 f9 0f 00 00       	call   36b8 <printf>
    exit();
    26bf:	e8 c1 0e 00 00       	call   3585 <exit>
    printf(1, "unlink dots failed!\n");
    26c4:	50                   	push   %eax
    26c5:	50                   	push   %eax
    26c6:	68 15 46 00 00       	push   $0x4615
    26cb:	6a 01                	push   $0x1
    26cd:	e8 e6 0f 00 00       	call   36b8 <printf>
    exit();
    26d2:	e8 ae 0e 00 00       	call   3585 <exit>
    printf(1, "unlink dots/.. worked!\n");
    26d7:	52                   	push   %edx
    26d8:	52                   	push   %edx
    26d9:	68 fd 45 00 00       	push   $0x45fd
    26de:	6a 01                	push   $0x1
    26e0:	e8 d3 0f 00 00       	call   36b8 <printf>
    exit();
    26e5:	e8 9b 0e 00 00       	call   3585 <exit>
    printf(1, "unlink dots/. worked!\n");
    26ea:	51                   	push   %ecx
    26eb:	51                   	push   %ecx
    26ec:	68 de 45 00 00       	push   $0x45de
    26f1:	6a 01                	push   $0x1
    26f3:	e8 c0 0f 00 00       	call   36b8 <printf>
    exit();
    26f8:	e8 88 0e 00 00       	call   3585 <exit>
    printf(1, "chdir / failed\n");
    26fd:	50                   	push   %eax
    26fe:	50                   	push   %eax
    26ff:	68 15 3a 00 00       	push   $0x3a15
    2704:	6a 01                	push   $0x1
    2706:	e8 ad 0f 00 00       	call   36b8 <printf>
    exit();
    270b:	e8 75 0e 00 00       	call   3585 <exit>
    printf(1, "rm .. worked!\n");
    2710:	50                   	push   %eax
    2711:	50                   	push   %eax
    2712:	68 c8 45 00 00       	push   $0x45c8
    2717:	6a 01                	push   $0x1
    2719:	e8 9a 0f 00 00       	call   36b8 <printf>
    exit();
    271e:	e8 62 0e 00 00       	call   3585 <exit>
    printf(1, "rm . worked!\n");
    2723:	50                   	push   %eax
    2724:	50                   	push   %eax
    2725:	68 ba 45 00 00       	push   $0x45ba
    272a:	6a 01                	push   $0x1
    272c:	e8 87 0f 00 00       	call   36b8 <printf>
    exit();
    2731:	e8 4f 0e 00 00       	call   3585 <exit>
    printf(1, "chdir dots failed\n");
    2736:	50                   	push   %eax
    2737:	50                   	push   %eax
    2738:	68 a7 45 00 00       	push   $0x45a7
    273d:	6a 01                	push   $0x1
    273f:	e8 74 0f 00 00       	call   36b8 <printf>
    exit();
    2744:	e8 3c 0e 00 00       	call   3585 <exit>
    2749:	8d 76 00             	lea    0x0(%esi),%esi

0000274c <dirfile>:
{
    274c:	55                   	push   %ebp
    274d:	89 e5                	mov    %esp,%ebp
    274f:	53                   	push   %ebx
    2750:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "dir vs file\n");
    2753:	68 34 46 00 00       	push   $0x4634
    2758:	6a 01                	push   $0x1
    275a:	e8 59 0f 00 00       	call   36b8 <printf>
  fd = open("dirfile", O_CREATE);
    275f:	5b                   	pop    %ebx
    2760:	58                   	pop    %eax
    2761:	68 00 02 00 00       	push   $0x200
    2766:	68 41 46 00 00       	push   $0x4641
    276b:	e8 55 0e 00 00       	call   35c5 <open>
  if(fd < 0){
    2770:	83 c4 10             	add    $0x10,%esp
    2773:	85 c0                	test   %eax,%eax
    2775:	0f 88 43 01 00 00    	js     28be <dirfile+0x172>
  close(fd);
    277b:	83 ec 0c             	sub    $0xc,%esp
    277e:	50                   	push   %eax
    277f:	e8 29 0e 00 00       	call   35ad <close>
  if(chdir("dirfile") == 0){
    2784:	c7 04 24 41 46 00 00 	movl   $0x4641,(%esp)
    278b:	e8 65 0e 00 00       	call   35f5 <chdir>
    2790:	83 c4 10             	add    $0x10,%esp
    2793:	85 c0                	test   %eax,%eax
    2795:	0f 84 10 01 00 00    	je     28ab <dirfile+0x15f>
  fd = open("dirfile/xx", 0);
    279b:	83 ec 08             	sub    $0x8,%esp
    279e:	6a 00                	push   $0x0
    27a0:	68 7a 46 00 00       	push   $0x467a
    27a5:	e8 1b 0e 00 00       	call   35c5 <open>
  if(fd >= 0){
    27aa:	83 c4 10             	add    $0x10,%esp
    27ad:	85 c0                	test   %eax,%eax
    27af:	0f 89 e3 00 00 00    	jns    2898 <dirfile+0x14c>
  fd = open("dirfile/xx", O_CREATE);
    27b5:	83 ec 08             	sub    $0x8,%esp
    27b8:	68 00 02 00 00       	push   $0x200
    27bd:	68 7a 46 00 00       	push   $0x467a
    27c2:	e8 fe 0d 00 00       	call   35c5 <open>
  if(fd >= 0){
    27c7:	83 c4 10             	add    $0x10,%esp
    27ca:	85 c0                	test   %eax,%eax
    27cc:	0f 89 c6 00 00 00    	jns    2898 <dirfile+0x14c>
  if(mkdir("dirfile/xx") == 0){
    27d2:	83 ec 0c             	sub    $0xc,%esp
    27d5:	68 7a 46 00 00       	push   $0x467a
    27da:	e8 0e 0e 00 00       	call   35ed <mkdir>
    27df:	83 c4 10             	add    $0x10,%esp
    27e2:	85 c0                	test   %eax,%eax
    27e4:	0f 84 46 01 00 00    	je     2930 <dirfile+0x1e4>
  if(unlink("dirfile/xx") == 0){
    27ea:	83 ec 0c             	sub    $0xc,%esp
    27ed:	68 7a 46 00 00       	push   $0x467a
    27f2:	e8 de 0d 00 00       	call   35d5 <unlink>
    27f7:	83 c4 10             	add    $0x10,%esp
    27fa:	85 c0                	test   %eax,%eax
    27fc:	0f 84 1b 01 00 00    	je     291d <dirfile+0x1d1>
  if(link("README", "dirfile/xx") == 0){
    2802:	83 ec 08             	sub    $0x8,%esp
    2805:	68 7a 46 00 00       	push   $0x467a
    280a:	68 de 46 00 00       	push   $0x46de
    280f:	e8 d1 0d 00 00       	call   35e5 <link>
    2814:	83 c4 10             	add    $0x10,%esp
    2817:	85 c0                	test   %eax,%eax
    2819:	0f 84 eb 00 00 00    	je     290a <dirfile+0x1be>
  if(unlink("dirfile") != 0){
    281f:	83 ec 0c             	sub    $0xc,%esp
    2822:	68 41 46 00 00       	push   $0x4641
    2827:	e8 a9 0d 00 00       	call   35d5 <unlink>
    282c:	83 c4 10             	add    $0x10,%esp
    282f:	85 c0                	test   %eax,%eax
    2831:	0f 85 c0 00 00 00    	jne    28f7 <dirfile+0x1ab>
  fd = open(".", O_RDWR);
    2837:	83 ec 08             	sub    $0x8,%esp
    283a:	6a 02                	push   $0x2
    283c:	68 3a 42 00 00       	push   $0x423a
    2841:	e8 7f 0d 00 00       	call   35c5 <open>
  if(fd >= 0){
    2846:	83 c4 10             	add    $0x10,%esp
    2849:	85 c0                	test   %eax,%eax
    284b:	0f 89 93 00 00 00    	jns    28e4 <dirfile+0x198>
  fd = open(".", 0);
    2851:	83 ec 08             	sub    $0x8,%esp
    2854:	6a 00                	push   $0x0
    2856:	68 3a 42 00 00       	push   $0x423a
    285b:	e8 65 0d 00 00       	call   35c5 <open>
    2860:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2862:	83 c4 0c             	add    $0xc,%esp
    2865:	6a 01                	push   $0x1
    2867:	68 1d 43 00 00       	push   $0x431d
    286c:	50                   	push   %eax
    286d:	e8 33 0d 00 00       	call   35a5 <write>
    2872:	83 c4 10             	add    $0x10,%esp
    2875:	85 c0                	test   %eax,%eax
    2877:	7f 58                	jg     28d1 <dirfile+0x185>
  close(fd);
    2879:	83 ec 0c             	sub    $0xc,%esp
    287c:	53                   	push   %ebx
    287d:	e8 2b 0d 00 00       	call   35ad <close>
  printf(1, "dir vs file OK\n");
    2882:	58                   	pop    %eax
    2883:	5a                   	pop    %edx
    2884:	68 11 47 00 00       	push   $0x4711
    2889:	6a 01                	push   $0x1
    288b:	e8 28 0e 00 00       	call   36b8 <printf>
}
    2890:	83 c4 10             	add    $0x10,%esp
    2893:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2896:	c9                   	leave  
    2897:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    2898:	50                   	push   %eax
    2899:	50                   	push   %eax
    289a:	68 85 46 00 00       	push   $0x4685
    289f:	6a 01                	push   $0x1
    28a1:	e8 12 0e 00 00       	call   36b8 <printf>
    exit();
    28a6:	e8 da 0c 00 00       	call   3585 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    28ab:	52                   	push   %edx
    28ac:	52                   	push   %edx
    28ad:	68 60 46 00 00       	push   $0x4660
    28b2:	6a 01                	push   $0x1
    28b4:	e8 ff 0d 00 00       	call   36b8 <printf>
    exit();
    28b9:	e8 c7 0c 00 00       	call   3585 <exit>
    printf(1, "create dirfile failed\n");
    28be:	51                   	push   %ecx
    28bf:	51                   	push   %ecx
    28c0:	68 49 46 00 00       	push   $0x4649
    28c5:	6a 01                	push   $0x1
    28c7:	e8 ec 0d 00 00       	call   36b8 <printf>
    exit();
    28cc:	e8 b4 0c 00 00       	call   3585 <exit>
    printf(1, "write . succeeded!\n");
    28d1:	51                   	push   %ecx
    28d2:	51                   	push   %ecx
    28d3:	68 fd 46 00 00       	push   $0x46fd
    28d8:	6a 01                	push   $0x1
    28da:	e8 d9 0d 00 00       	call   36b8 <printf>
    exit();
    28df:	e8 a1 0c 00 00       	call   3585 <exit>
    printf(1, "open . for writing succeeded!\n");
    28e4:	53                   	push   %ebx
    28e5:	53                   	push   %ebx
    28e6:	68 f4 4e 00 00       	push   $0x4ef4
    28eb:	6a 01                	push   $0x1
    28ed:	e8 c6 0d 00 00       	call   36b8 <printf>
    exit();
    28f2:	e8 8e 0c 00 00       	call   3585 <exit>
    printf(1, "unlink dirfile failed!\n");
    28f7:	50                   	push   %eax
    28f8:	50                   	push   %eax
    28f9:	68 e5 46 00 00       	push   $0x46e5
    28fe:	6a 01                	push   $0x1
    2900:	e8 b3 0d 00 00       	call   36b8 <printf>
    exit();
    2905:	e8 7b 0c 00 00       	call   3585 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    290a:	50                   	push   %eax
    290b:	50                   	push   %eax
    290c:	68 d4 4e 00 00       	push   $0x4ed4
    2911:	6a 01                	push   $0x1
    2913:	e8 a0 0d 00 00       	call   36b8 <printf>
    exit();
    2918:	e8 68 0c 00 00       	call   3585 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    291d:	50                   	push   %eax
    291e:	50                   	push   %eax
    291f:	68 c0 46 00 00       	push   $0x46c0
    2924:	6a 01                	push   $0x1
    2926:	e8 8d 0d 00 00       	call   36b8 <printf>
    exit();
    292b:	e8 55 0c 00 00       	call   3585 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2930:	50                   	push   %eax
    2931:	50                   	push   %eax
    2932:	68 a3 46 00 00       	push   $0x46a3
    2937:	6a 01                	push   $0x1
    2939:	e8 7a 0d 00 00       	call   36b8 <printf>
    exit();
    293e:	e8 42 0c 00 00       	call   3585 <exit>
    2943:	90                   	nop

00002944 <iref>:
{
    2944:	55                   	push   %ebp
    2945:	89 e5                	mov    %esp,%ebp
    2947:	53                   	push   %ebx
    2948:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "empty file name\n");
    294b:	68 21 47 00 00       	push   $0x4721
    2950:	6a 01                	push   $0x1
    2952:	e8 61 0d 00 00       	call   36b8 <printf>
    2957:	83 c4 10             	add    $0x10,%esp
    295a:	bb 33 00 00 00       	mov    $0x33,%ebx
    295f:	90                   	nop
    if(mkdir("irefd") != 0){
    2960:	83 ec 0c             	sub    $0xc,%esp
    2963:	68 32 47 00 00       	push   $0x4732
    2968:	e8 80 0c 00 00       	call   35ed <mkdir>
    296d:	83 c4 10             	add    $0x10,%esp
    2970:	85 c0                	test   %eax,%eax
    2972:	0f 85 b9 00 00 00    	jne    2a31 <iref+0xed>
    if(chdir("irefd") != 0){
    2978:	83 ec 0c             	sub    $0xc,%esp
    297b:	68 32 47 00 00       	push   $0x4732
    2980:	e8 70 0c 00 00       	call   35f5 <chdir>
    2985:	83 c4 10             	add    $0x10,%esp
    2988:	85 c0                	test   %eax,%eax
    298a:	0f 85 b5 00 00 00    	jne    2a45 <iref+0x101>
    mkdir("");
    2990:	83 ec 0c             	sub    $0xc,%esp
    2993:	68 ed 3d 00 00       	push   $0x3ded
    2998:	e8 50 0c 00 00       	call   35ed <mkdir>
    link("README", "");
    299d:	59                   	pop    %ecx
    299e:	58                   	pop    %eax
    299f:	68 ed 3d 00 00       	push   $0x3ded
    29a4:	68 de 46 00 00       	push   $0x46de
    29a9:	e8 37 0c 00 00       	call   35e5 <link>
    fd = open("", O_CREATE);
    29ae:	58                   	pop    %eax
    29af:	5a                   	pop    %edx
    29b0:	68 00 02 00 00       	push   $0x200
    29b5:	68 ed 3d 00 00       	push   $0x3ded
    29ba:	e8 06 0c 00 00       	call   35c5 <open>
    if(fd >= 0)
    29bf:	83 c4 10             	add    $0x10,%esp
    29c2:	85 c0                	test   %eax,%eax
    29c4:	78 0c                	js     29d2 <iref+0x8e>
      close(fd);
    29c6:	83 ec 0c             	sub    $0xc,%esp
    29c9:	50                   	push   %eax
    29ca:	e8 de 0b 00 00       	call   35ad <close>
    29cf:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    29d2:	83 ec 08             	sub    $0x8,%esp
    29d5:	68 00 02 00 00       	push   $0x200
    29da:	68 1c 43 00 00       	push   $0x431c
    29df:	e8 e1 0b 00 00       	call   35c5 <open>
    if(fd >= 0)
    29e4:	83 c4 10             	add    $0x10,%esp
    29e7:	85 c0                	test   %eax,%eax
    29e9:	78 0c                	js     29f7 <iref+0xb3>
      close(fd);
    29eb:	83 ec 0c             	sub    $0xc,%esp
    29ee:	50                   	push   %eax
    29ef:	e8 b9 0b 00 00       	call   35ad <close>
    29f4:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    29f7:	83 ec 0c             	sub    $0xc,%esp
    29fa:	68 1c 43 00 00       	push   $0x431c
    29ff:	e8 d1 0b 00 00       	call   35d5 <unlink>
  for(i = 0; i < 50 + 1; i++){
    2a04:	83 c4 10             	add    $0x10,%esp
    2a07:	4b                   	dec    %ebx
    2a08:	0f 85 52 ff ff ff    	jne    2960 <iref+0x1c>
  chdir("/");
    2a0e:	83 ec 0c             	sub    $0xc,%esp
    2a11:	68 13 3a 00 00       	push   $0x3a13
    2a16:	e8 da 0b 00 00       	call   35f5 <chdir>
  printf(1, "empty file name OK\n");
    2a1b:	58                   	pop    %eax
    2a1c:	5a                   	pop    %edx
    2a1d:	68 60 47 00 00       	push   $0x4760
    2a22:	6a 01                	push   $0x1
    2a24:	e8 8f 0c 00 00       	call   36b8 <printf>
}
    2a29:	83 c4 10             	add    $0x10,%esp
    2a2c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2a2f:	c9                   	leave  
    2a30:	c3                   	ret    
      printf(1, "mkdir irefd failed\n");
    2a31:	83 ec 08             	sub    $0x8,%esp
    2a34:	68 38 47 00 00       	push   $0x4738
    2a39:	6a 01                	push   $0x1
    2a3b:	e8 78 0c 00 00       	call   36b8 <printf>
      exit();
    2a40:	e8 40 0b 00 00       	call   3585 <exit>
      printf(1, "chdir irefd failed\n");
    2a45:	83 ec 08             	sub    $0x8,%esp
    2a48:	68 4c 47 00 00       	push   $0x474c
    2a4d:	6a 01                	push   $0x1
    2a4f:	e8 64 0c 00 00       	call   36b8 <printf>
      exit();
    2a54:	e8 2c 0b 00 00       	call   3585 <exit>
    2a59:	8d 76 00             	lea    0x0(%esi),%esi

00002a5c <forktest>:
{
    2a5c:	55                   	push   %ebp
    2a5d:	89 e5                	mov    %esp,%ebp
    2a5f:	53                   	push   %ebx
    2a60:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fork test\n");
    2a63:	68 74 47 00 00       	push   $0x4774
    2a68:	6a 01                	push   $0x1
    2a6a:	e8 49 0c 00 00       	call   36b8 <printf>
    2a6f:	83 c4 10             	add    $0x10,%esp
  for(n=0; n<1000; n++){
    2a72:	31 db                	xor    %ebx,%ebx
    2a74:	eb 0d                	jmp    2a83 <forktest+0x27>
    2a76:	66 90                	xchg   %ax,%ax
    if(pid == 0)
    2a78:	74 3e                	je     2ab8 <forktest+0x5c>
  for(n=0; n<1000; n++){
    2a7a:	43                   	inc    %ebx
    2a7b:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2a81:	74 61                	je     2ae4 <forktest+0x88>
    pid = fork();
    2a83:	e8 f5 0a 00 00       	call   357d <fork>
    if(pid < 0)
    2a88:	85 c0                	test   %eax,%eax
    2a8a:	79 ec                	jns    2a78 <forktest+0x1c>
  for(; n > 0; n--){
    2a8c:	85 db                	test   %ebx,%ebx
    2a8e:	74 0c                	je     2a9c <forktest+0x40>
    if(wait() < 0){
    2a90:	e8 f8 0a 00 00       	call   358d <wait>
    2a95:	85 c0                	test   %eax,%eax
    2a97:	78 24                	js     2abd <forktest+0x61>
  for(; n > 0; n--){
    2a99:	4b                   	dec    %ebx
    2a9a:	75 f4                	jne    2a90 <forktest+0x34>
  if(wait() != -1){
    2a9c:	e8 ec 0a 00 00       	call   358d <wait>
    2aa1:	40                   	inc    %eax
    2aa2:	75 2d                	jne    2ad1 <forktest+0x75>
  printf(1, "fork test OK\n");
    2aa4:	83 ec 08             	sub    $0x8,%esp
    2aa7:	68 a6 47 00 00       	push   $0x47a6
    2aac:	6a 01                	push   $0x1
    2aae:	e8 05 0c 00 00       	call   36b8 <printf>
}
    2ab3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2ab6:	c9                   	leave  
    2ab7:	c3                   	ret    
      exit();
    2ab8:	e8 c8 0a 00 00       	call   3585 <exit>
      printf(1, "wait stopped early\n");
    2abd:	83 ec 08             	sub    $0x8,%esp
    2ac0:	68 7f 47 00 00       	push   $0x477f
    2ac5:	6a 01                	push   $0x1
    2ac7:	e8 ec 0b 00 00       	call   36b8 <printf>
      exit();
    2acc:	e8 b4 0a 00 00       	call   3585 <exit>
    printf(1, "wait got too many\n");
    2ad1:	52                   	push   %edx
    2ad2:	52                   	push   %edx
    2ad3:	68 93 47 00 00       	push   $0x4793
    2ad8:	6a 01                	push   $0x1
    2ada:	e8 d9 0b 00 00       	call   36b8 <printf>
    exit();
    2adf:	e8 a1 0a 00 00       	call   3585 <exit>
    printf(1, "fork claimed to work 1000 times!\n");
    2ae4:	50                   	push   %eax
    2ae5:	50                   	push   %eax
    2ae6:	68 14 4f 00 00       	push   $0x4f14
    2aeb:	6a 01                	push   $0x1
    2aed:	e8 c6 0b 00 00       	call   36b8 <printf>
    exit();
    2af2:	e8 8e 0a 00 00       	call   3585 <exit>
    2af7:	90                   	nop

00002af8 <sbrktest>:
{
    2af8:	55                   	push   %ebp
    2af9:	89 e5                	mov    %esp,%ebp
    2afb:	57                   	push   %edi
    2afc:	56                   	push   %esi
    2afd:	53                   	push   %ebx
    2afe:	83 ec 54             	sub    $0x54,%esp
  printf(stdout, "sbrk test\n");
    2b01:	68 b4 47 00 00       	push   $0x47b4
    2b06:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2b0c:	e8 a7 0b 00 00       	call   36b8 <printf>
  oldbrk = sbrk(0);
    2b11:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b18:	e8 f0 0a 00 00       	call   360d <sbrk>
    2b1d:	89 c3                	mov    %eax,%ebx
  a = sbrk(0);
    2b1f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b26:	e8 e2 0a 00 00       	call   360d <sbrk>
    2b2b:	89 c6                	mov    %eax,%esi
    2b2d:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 5000; i++){
    2b30:	31 ff                	xor    %edi,%edi
    2b32:	eb 02                	jmp    2b36 <sbrktest+0x3e>
    a = b + 1;
    2b34:	89 c6                	mov    %eax,%esi
    b = sbrk(1);
    2b36:	83 ec 0c             	sub    $0xc,%esp
    2b39:	6a 01                	push   $0x1
    2b3b:	e8 cd 0a 00 00       	call   360d <sbrk>
    if(b != a){
    2b40:	83 c4 10             	add    $0x10,%esp
    2b43:	39 f0                	cmp    %esi,%eax
    2b45:	0f 85 7c 02 00 00    	jne    2dc7 <sbrktest+0x2cf>
    *b = 1;
    2b4b:	c6 06 01             	movb   $0x1,(%esi)
    a = b + 1;
    2b4e:	8d 46 01             	lea    0x1(%esi),%eax
  for(i = 0; i < 5000; i++){
    2b51:	47                   	inc    %edi
    2b52:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2b58:	75 da                	jne    2b34 <sbrktest+0x3c>
  pid = fork();
    2b5a:	e8 1e 0a 00 00       	call   357d <fork>
    2b5f:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    2b61:	85 c0                	test   %eax,%eax
    2b63:	0f 88 87 03 00 00    	js     2ef0 <sbrktest+0x3f8>
  c = sbrk(1);
    2b69:	83 ec 0c             	sub    $0xc,%esp
    2b6c:	6a 01                	push   $0x1
    2b6e:	e8 9a 0a 00 00       	call   360d <sbrk>
  c = sbrk(1);
    2b73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b7a:	e8 8e 0a 00 00       	call   360d <sbrk>
  if(c != a + 1){
    2b7f:	83 c6 02             	add    $0x2,%esi
    2b82:	83 c4 10             	add    $0x10,%esp
    2b85:	39 c6                	cmp    %eax,%esi
    2b87:	0f 85 4c 03 00 00    	jne    2ed9 <sbrktest+0x3e1>
  if(pid == 0)
    2b8d:	85 ff                	test   %edi,%edi
    2b8f:	0f 84 3f 03 00 00    	je     2ed4 <sbrktest+0x3dc>
  wait();
    2b95:	e8 f3 09 00 00       	call   358d <wait>
  a = sbrk(0);
    2b9a:	83 ec 0c             	sub    $0xc,%esp
    2b9d:	6a 00                	push   $0x0
    2b9f:	e8 69 0a 00 00       	call   360d <sbrk>
    2ba4:	89 c6                	mov    %eax,%esi
  amt = (BIG) - (uint)a;
    2ba6:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2bab:	29 f0                	sub    %esi,%eax
  p = sbrk(amt);
    2bad:	89 04 24             	mov    %eax,(%esp)
    2bb0:	e8 58 0a 00 00       	call   360d <sbrk>
  if (p != a) {
    2bb5:	83 c4 10             	add    $0x10,%esp
    2bb8:	39 c6                	cmp    %eax,%esi
    2bba:	0f 85 fd 02 00 00    	jne    2ebd <sbrktest+0x3c5>
  *lastaddr = 99;
    2bc0:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    2bc7:	83 ec 0c             	sub    $0xc,%esp
    2bca:	6a 00                	push   $0x0
    2bcc:	e8 3c 0a 00 00       	call   360d <sbrk>
    2bd1:	89 c6                	mov    %eax,%esi
  c = sbrk(-4096);
    2bd3:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    2bda:	e8 2e 0a 00 00       	call   360d <sbrk>
  if(c == (char*)0xffffffff){
    2bdf:	83 c4 10             	add    $0x10,%esp
    2be2:	40                   	inc    %eax
    2be3:	0f 84 bd 02 00 00    	je     2ea6 <sbrktest+0x3ae>
  c = sbrk(0);
    2be9:	83 ec 0c             	sub    $0xc,%esp
    2bec:	6a 00                	push   $0x0
    2bee:	e8 1a 0a 00 00       	call   360d <sbrk>
  if(c != a - 4096){
    2bf3:	8d 96 00 f0 ff ff    	lea    -0x1000(%esi),%edx
    2bf9:	83 c4 10             	add    $0x10,%esp
    2bfc:	39 d0                	cmp    %edx,%eax
    2bfe:	0f 85 8b 02 00 00    	jne    2e8f <sbrktest+0x397>
  a = sbrk(0);
    2c04:	83 ec 0c             	sub    $0xc,%esp
    2c07:	6a 00                	push   $0x0
    2c09:	e8 ff 09 00 00       	call   360d <sbrk>
    2c0e:	89 c6                	mov    %eax,%esi
  c = sbrk(4096);
    2c10:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2c17:	e8 f1 09 00 00       	call   360d <sbrk>
    2c1c:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    2c1e:	83 c4 10             	add    $0x10,%esp
    2c21:	39 c6                	cmp    %eax,%esi
    2c23:	0f 85 4f 02 00 00    	jne    2e78 <sbrktest+0x380>
    2c29:	83 ec 0c             	sub    $0xc,%esp
    2c2c:	6a 00                	push   $0x0
    2c2e:	e8 da 09 00 00       	call   360d <sbrk>
    2c33:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    2c39:	83 c4 10             	add    $0x10,%esp
    2c3c:	39 c2                	cmp    %eax,%edx
    2c3e:	0f 85 34 02 00 00    	jne    2e78 <sbrktest+0x380>
  if(*lastaddr == 99){
    2c44:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2c4b:	0f 84 10 02 00 00    	je     2e61 <sbrktest+0x369>
  a = sbrk(0);
    2c51:	83 ec 0c             	sub    $0xc,%esp
    2c54:	6a 00                	push   $0x0
    2c56:	e8 b2 09 00 00       	call   360d <sbrk>
    2c5b:	89 c6                	mov    %eax,%esi
  c = sbrk(-(sbrk(0) - oldbrk));
    2c5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c64:	e8 a4 09 00 00       	call   360d <sbrk>
    2c69:	89 d9                	mov    %ebx,%ecx
    2c6b:	29 c1                	sub    %eax,%ecx
    2c6d:	89 0c 24             	mov    %ecx,(%esp)
    2c70:	e8 98 09 00 00       	call   360d <sbrk>
  if(c != a){
    2c75:	83 c4 10             	add    $0x10,%esp
    2c78:	39 c6                	cmp    %eax,%esi
    2c7a:	0f 85 ca 01 00 00    	jne    2e4a <sbrktest+0x352>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2c80:	be 00 00 00 80       	mov    $0x80000000,%esi
    2c85:	8d 76 00             	lea    0x0(%esi),%esi
    ppid = getpid();
    2c88:	e8 78 09 00 00       	call   3605 <getpid>
    2c8d:	89 c7                	mov    %eax,%edi
    pid = fork();
    2c8f:	e8 e9 08 00 00       	call   357d <fork>
    if(pid < 0){
    2c94:	85 c0                	test   %eax,%eax
    2c96:	0f 88 96 01 00 00    	js     2e32 <sbrktest+0x33a>
    if(pid == 0){
    2c9c:	0f 84 6e 01 00 00    	je     2e10 <sbrktest+0x318>
    wait();
    2ca2:	e8 e6 08 00 00       	call   358d <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ca7:	81 c6 50 c3 00 00    	add    $0xc350,%esi
    2cad:	81 fe 80 84 1e 80    	cmp    $0x801e8480,%esi
    2cb3:	75 d3                	jne    2c88 <sbrktest+0x190>
  if(pipe(fds) != 0){
    2cb5:	83 ec 0c             	sub    $0xc,%esp
    2cb8:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2cbb:	50                   	push   %eax
    2cbc:	e8 d4 08 00 00       	call   3595 <pipe>
    2cc1:	83 c4 10             	add    $0x10,%esp
    2cc4:	85 c0                	test   %eax,%eax
    2cc6:	0f 85 30 01 00 00    	jne    2dfc <sbrktest+0x304>
    2ccc:	8d 75 c0             	lea    -0x40(%ebp),%esi
    2ccf:	89 f7                	mov    %esi,%edi
    if((pids[i] = fork()) == 0){
    2cd1:	e8 a7 08 00 00       	call   357d <fork>
    2cd6:	89 07                	mov    %eax,(%edi)
    2cd8:	85 c0                	test   %eax,%eax
    2cda:	0f 84 89 00 00 00    	je     2d69 <sbrktest+0x271>
    if(pids[i] != -1)
    2ce0:	40                   	inc    %eax
    2ce1:	74 12                	je     2cf5 <sbrktest+0x1fd>
      read(fds[0], &scratch, 1);
    2ce3:	52                   	push   %edx
    2ce4:	6a 01                	push   $0x1
    2ce6:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2ce9:	50                   	push   %eax
    2cea:	ff 75 b8             	pushl  -0x48(%ebp)
    2ced:	e8 ab 08 00 00       	call   359d <read>
    2cf2:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2cf5:	83 c7 04             	add    $0x4,%edi
    2cf8:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2cfb:	39 c7                	cmp    %eax,%edi
    2cfd:	75 d2                	jne    2cd1 <sbrktest+0x1d9>
  c = sbrk(4096);
    2cff:	83 ec 0c             	sub    $0xc,%esp
    2d02:	68 00 10 00 00       	push   $0x1000
    2d07:	e8 01 09 00 00       	call   360d <sbrk>
    2d0c:	89 c7                	mov    %eax,%edi
    2d0e:	83 c4 10             	add    $0x10,%esp
    if(pids[i] == -1)
    2d11:	8b 06                	mov    (%esi),%eax
    2d13:	83 f8 ff             	cmp    $0xffffffff,%eax
    2d16:	74 11                	je     2d29 <sbrktest+0x231>
    kill(pids[i]);
    2d18:	83 ec 0c             	sub    $0xc,%esp
    2d1b:	50                   	push   %eax
    2d1c:	e8 94 08 00 00       	call   35b5 <kill>
    wait();
    2d21:	e8 67 08 00 00       	call   358d <wait>
    2d26:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2d29:	83 c6 04             	add    $0x4,%esi
    2d2c:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2d2f:	39 f0                	cmp    %esi,%eax
    2d31:	75 de                	jne    2d11 <sbrktest+0x219>
  if(c == (char*)0xffffffff){
    2d33:	47                   	inc    %edi
    2d34:	0f 84 ab 00 00 00    	je     2de5 <sbrktest+0x2ed>
  if(sbrk(0) > oldbrk)
    2d3a:	83 ec 0c             	sub    $0xc,%esp
    2d3d:	6a 00                	push   $0x0
    2d3f:	e8 c9 08 00 00       	call   360d <sbrk>
    2d44:	83 c4 10             	add    $0x10,%esp
    2d47:	39 c3                	cmp    %eax,%ebx
    2d49:	72 63                	jb     2dae <sbrktest+0x2b6>
  printf(stdout, "sbrk test OK\n");
    2d4b:	83 ec 08             	sub    $0x8,%esp
    2d4e:	68 5c 48 00 00       	push   $0x485c
    2d53:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2d59:	e8 5a 09 00 00       	call   36b8 <printf>
}
    2d5e:	83 c4 10             	add    $0x10,%esp
    2d61:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2d64:	5b                   	pop    %ebx
    2d65:	5e                   	pop    %esi
    2d66:	5f                   	pop    %edi
    2d67:	5d                   	pop    %ebp
    2d68:	c3                   	ret    
      sbrk(BIG - (uint)sbrk(0));
    2d69:	83 ec 0c             	sub    $0xc,%esp
    2d6c:	6a 00                	push   $0x0
    2d6e:	e8 9a 08 00 00       	call   360d <sbrk>
    2d73:	89 c2                	mov    %eax,%edx
    2d75:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2d7a:	29 d0                	sub    %edx,%eax
    2d7c:	89 04 24             	mov    %eax,(%esp)
    2d7f:	e8 89 08 00 00       	call   360d <sbrk>
      write(fds[1], "x", 1);
    2d84:	83 c4 0c             	add    $0xc,%esp
    2d87:	6a 01                	push   $0x1
    2d89:	68 1d 43 00 00       	push   $0x431d
    2d8e:	ff 75 bc             	pushl  -0x44(%ebp)
    2d91:	e8 0f 08 00 00       	call   35a5 <write>
    2d96:	83 c4 10             	add    $0x10,%esp
    2d99:	8d 76 00             	lea    0x0(%esi),%esi
      for(;;) sleep(1000);
    2d9c:	83 ec 0c             	sub    $0xc,%esp
    2d9f:	68 e8 03 00 00       	push   $0x3e8
    2da4:	e8 6c 08 00 00       	call   3615 <sleep>
    2da9:	83 c4 10             	add    $0x10,%esp
    2dac:	eb ee                	jmp    2d9c <sbrktest+0x2a4>
    sbrk(-(sbrk(0) - oldbrk));
    2dae:	83 ec 0c             	sub    $0xc,%esp
    2db1:	6a 00                	push   $0x0
    2db3:	e8 55 08 00 00       	call   360d <sbrk>
    2db8:	29 c3                	sub    %eax,%ebx
    2dba:	89 1c 24             	mov    %ebx,(%esp)
    2dbd:	e8 4b 08 00 00       	call   360d <sbrk>
    2dc2:	83 c4 10             	add    $0x10,%esp
    2dc5:	eb 84                	jmp    2d4b <sbrktest+0x253>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2dc7:	83 ec 0c             	sub    $0xc,%esp
    2dca:	50                   	push   %eax
    2dcb:	56                   	push   %esi
    2dcc:	57                   	push   %edi
    2dcd:	68 bf 47 00 00       	push   $0x47bf
    2dd2:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2dd8:	e8 db 08 00 00       	call   36b8 <printf>
      exit();
    2ddd:	83 c4 20             	add    $0x20,%esp
    2de0:	e8 a0 07 00 00       	call   3585 <exit>
    printf(stdout, "failed sbrk leaked memory\n");
    2de5:	50                   	push   %eax
    2de6:	50                   	push   %eax
    2de7:	68 41 48 00 00       	push   $0x4841
    2dec:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2df2:	e8 c1 08 00 00       	call   36b8 <printf>
    exit();
    2df7:	e8 89 07 00 00       	call   3585 <exit>
    printf(1, "pipe() failed\n");
    2dfc:	51                   	push   %ecx
    2dfd:	51                   	push   %ecx
    2dfe:	68 03 3d 00 00       	push   $0x3d03
    2e03:	6a 01                	push   $0x1
    2e05:	e8 ae 08 00 00       	call   36b8 <printf>
    exit();
    2e0a:	e8 76 07 00 00       	call   3585 <exit>
    2e0f:	90                   	nop
      printf(stdout, "oops could read %x = %x\n", a, *a);
    2e10:	0f be 06             	movsbl (%esi),%eax
    2e13:	50                   	push   %eax
    2e14:	56                   	push   %esi
    2e15:	68 28 48 00 00       	push   $0x4828
    2e1a:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2e20:	e8 93 08 00 00       	call   36b8 <printf>
      kill(ppid);
    2e25:	89 3c 24             	mov    %edi,(%esp)
    2e28:	e8 88 07 00 00       	call   35b5 <kill>
      exit();
    2e2d:	e8 53 07 00 00       	call   3585 <exit>
      printf(stdout, "fork failed\n");
    2e32:	83 ec 08             	sub    $0x8,%esp
    2e35:	68 05 49 00 00       	push   $0x4905
    2e3a:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2e40:	e8 73 08 00 00       	call   36b8 <printf>
      exit();
    2e45:	e8 3b 07 00 00       	call   3585 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    2e4a:	50                   	push   %eax
    2e4b:	56                   	push   %esi
    2e4c:	68 08 50 00 00       	push   $0x5008
    2e51:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2e57:	e8 5c 08 00 00       	call   36b8 <printf>
    exit();
    2e5c:	e8 24 07 00 00       	call   3585 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    2e61:	53                   	push   %ebx
    2e62:	53                   	push   %ebx
    2e63:	68 d8 4f 00 00       	push   $0x4fd8
    2e68:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2e6e:	e8 45 08 00 00       	call   36b8 <printf>
    exit();
    2e73:	e8 0d 07 00 00       	call   3585 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    2e78:	57                   	push   %edi
    2e79:	56                   	push   %esi
    2e7a:	68 b0 4f 00 00       	push   $0x4fb0
    2e7f:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2e85:	e8 2e 08 00 00       	call   36b8 <printf>
    exit();
    2e8a:	e8 f6 06 00 00       	call   3585 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    2e8f:	50                   	push   %eax
    2e90:	56                   	push   %esi
    2e91:	68 78 4f 00 00       	push   $0x4f78
    2e96:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2e9c:	e8 17 08 00 00       	call   36b8 <printf>
    exit();
    2ea1:	e8 df 06 00 00       	call   3585 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    2ea6:	56                   	push   %esi
    2ea7:	56                   	push   %esi
    2ea8:	68 0d 48 00 00       	push   $0x480d
    2ead:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2eb3:	e8 00 08 00 00       	call   36b8 <printf>
    exit();
    2eb8:	e8 c8 06 00 00       	call   3585 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2ebd:	57                   	push   %edi
    2ebe:	57                   	push   %edi
    2ebf:	68 38 4f 00 00       	push   $0x4f38
    2ec4:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2eca:	e8 e9 07 00 00       	call   36b8 <printf>
    exit();
    2ecf:	e8 b1 06 00 00       	call   3585 <exit>
    exit();
    2ed4:	e8 ac 06 00 00       	call   3585 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    2ed9:	50                   	push   %eax
    2eda:	50                   	push   %eax
    2edb:	68 f1 47 00 00       	push   $0x47f1
    2ee0:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2ee6:	e8 cd 07 00 00       	call   36b8 <printf>
    exit();
    2eeb:	e8 95 06 00 00       	call   3585 <exit>
    printf(stdout, "sbrk test fork failed\n");
    2ef0:	50                   	push   %eax
    2ef1:	50                   	push   %eax
    2ef2:	68 da 47 00 00       	push   $0x47da
    2ef7:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2efd:	e8 b6 07 00 00       	call   36b8 <printf>
    exit();
    2f02:	e8 7e 06 00 00       	call   3585 <exit>
    2f07:	90                   	nop

00002f08 <validateint>:
}
    2f08:	c3                   	ret    
    2f09:	8d 76 00             	lea    0x0(%esi),%esi

00002f0c <validatetest>:
{
    2f0c:	55                   	push   %ebp
    2f0d:	89 e5                	mov    %esp,%ebp
    2f0f:	56                   	push   %esi
    2f10:	53                   	push   %ebx
  printf(stdout, "validate test\n");
    2f11:	83 ec 08             	sub    $0x8,%esp
    2f14:	68 6a 48 00 00       	push   $0x486a
    2f19:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2f1f:	e8 94 07 00 00       	call   36b8 <printf>
    2f24:	83 c4 10             	add    $0x10,%esp
  for(p = 0; p <= (uint)hi; p += 4096){
    2f27:	31 f6                	xor    %esi,%esi
    2f29:	8d 76 00             	lea    0x0(%esi),%esi
    if((pid = fork()) == 0){
    2f2c:	e8 4c 06 00 00       	call   357d <fork>
    2f31:	89 c3                	mov    %eax,%ebx
    2f33:	85 c0                	test   %eax,%eax
    2f35:	74 61                	je     2f98 <validatetest+0x8c>
    sleep(0);
    2f37:	83 ec 0c             	sub    $0xc,%esp
    2f3a:	6a 00                	push   $0x0
    2f3c:	e8 d4 06 00 00       	call   3615 <sleep>
    sleep(0);
    2f41:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f48:	e8 c8 06 00 00       	call   3615 <sleep>
    kill(pid);
    2f4d:	89 1c 24             	mov    %ebx,(%esp)
    2f50:	e8 60 06 00 00       	call   35b5 <kill>
    wait();
    2f55:	e8 33 06 00 00       	call   358d <wait>
    if(link("nosuchfile", (char*)p) != -1){
    2f5a:	58                   	pop    %eax
    2f5b:	5a                   	pop    %edx
    2f5c:	56                   	push   %esi
    2f5d:	68 79 48 00 00       	push   $0x4879
    2f62:	e8 7e 06 00 00       	call   35e5 <link>
    2f67:	83 c4 10             	add    $0x10,%esp
    2f6a:	40                   	inc    %eax
    2f6b:	75 30                	jne    2f9d <validatetest+0x91>
  for(p = 0; p <= (uint)hi; p += 4096){
    2f6d:	81 c6 00 10 00 00    	add    $0x1000,%esi
    2f73:	81 fe 00 40 11 00    	cmp    $0x114000,%esi
    2f79:	75 b1                	jne    2f2c <validatetest+0x20>
  printf(stdout, "validate ok\n");
    2f7b:	83 ec 08             	sub    $0x8,%esp
    2f7e:	68 9d 48 00 00       	push   $0x489d
    2f83:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2f89:	e8 2a 07 00 00       	call   36b8 <printf>
}
    2f8e:	83 c4 10             	add    $0x10,%esp
    2f91:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2f94:	5b                   	pop    %ebx
    2f95:	5e                   	pop    %esi
    2f96:	5d                   	pop    %ebp
    2f97:	c3                   	ret    
      exit();
    2f98:	e8 e8 05 00 00       	call   3585 <exit>
      printf(stdout, "link should not succeed\n");
    2f9d:	83 ec 08             	sub    $0x8,%esp
    2fa0:	68 84 48 00 00       	push   $0x4884
    2fa5:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2fab:	e8 08 07 00 00       	call   36b8 <printf>
      exit();
    2fb0:	e8 d0 05 00 00       	call   3585 <exit>
    2fb5:	8d 76 00             	lea    0x0(%esi),%esi

00002fb8 <bsstest>:
{
    2fb8:	55                   	push   %ebp
    2fb9:	89 e5                	mov    %esp,%ebp
    2fbb:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "bss test\n");
    2fbe:	68 aa 48 00 00       	push   $0x48aa
    2fc3:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2fc9:	e8 ea 06 00 00       	call   36b8 <printf>
    2fce:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(uninit); i++){
    2fd1:	31 c0                	xor    %eax,%eax
    2fd3:	90                   	nop
    if(uninit[i] != '\0'){
    2fd4:	80 b8 20 5b 00 00 00 	cmpb   $0x0,0x5b20(%eax)
    2fdb:	75 20                	jne    2ffd <bsstest+0x45>
  for(i = 0; i < sizeof(uninit); i++){
    2fdd:	40                   	inc    %eax
    2fde:	3d 10 27 00 00       	cmp    $0x2710,%eax
    2fe3:	75 ef                	jne    2fd4 <bsstest+0x1c>
  printf(stdout, "bss test ok\n");
    2fe5:	83 ec 08             	sub    $0x8,%esp
    2fe8:	68 c5 48 00 00       	push   $0x48c5
    2fed:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    2ff3:	e8 c0 06 00 00       	call   36b8 <printf>
}
    2ff8:	83 c4 10             	add    $0x10,%esp
    2ffb:	c9                   	leave  
    2ffc:	c3                   	ret    
      printf(stdout, "bss test failed\n");
    2ffd:	83 ec 08             	sub    $0x8,%esp
    3000:	68 b4 48 00 00       	push   $0x48b4
    3005:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    300b:	e8 a8 06 00 00       	call   36b8 <printf>
      exit();
    3010:	e8 70 05 00 00       	call   3585 <exit>
    3015:	8d 76 00             	lea    0x0(%esi),%esi

00003018 <bigargtest>:
{
    3018:	55                   	push   %ebp
    3019:	89 e5                	mov    %esp,%ebp
    301b:	83 ec 14             	sub    $0x14,%esp
  unlink("bigarg-ok");
    301e:	68 d2 48 00 00       	push   $0x48d2
    3023:	e8 ad 05 00 00       	call   35d5 <unlink>
  pid = fork();
    3028:	e8 50 05 00 00       	call   357d <fork>
  if(pid == 0){
    302d:	83 c4 10             	add    $0x10,%esp
    3030:	85 c0                	test   %eax,%eax
    3032:	74 40                	je     3074 <bigargtest+0x5c>
  } else if(pid < 0){
    3034:	0f 88 bf 00 00 00    	js     30f9 <bigargtest+0xe1>
  wait();
    303a:	e8 4e 05 00 00       	call   358d <wait>
  fd = open("bigarg-ok", 0);
    303f:	83 ec 08             	sub    $0x8,%esp
    3042:	6a 00                	push   $0x0
    3044:	68 d2 48 00 00       	push   $0x48d2
    3049:	e8 77 05 00 00       	call   35c5 <open>
  if(fd < 0){
    304e:	83 c4 10             	add    $0x10,%esp
    3051:	85 c0                	test   %eax,%eax
    3053:	0f 88 89 00 00 00    	js     30e2 <bigargtest+0xca>
  close(fd);
    3059:	83 ec 0c             	sub    $0xc,%esp
    305c:	50                   	push   %eax
    305d:	e8 4b 05 00 00       	call   35ad <close>
  unlink("bigarg-ok");
    3062:	c7 04 24 d2 48 00 00 	movl   $0x48d2,(%esp)
    3069:	e8 67 05 00 00       	call   35d5 <unlink>
}
    306e:	83 c4 10             	add    $0x10,%esp
    3071:	c9                   	leave  
    3072:	c3                   	ret    
    3073:	90                   	nop
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3074:	c7 04 85 80 5a 00 00 	movl   $0x502c,0x5a80(,%eax,4)
    307b:	2c 50 00 00 
    for(i = 0; i < MAXARG-1; i++)
    307f:	40                   	inc    %eax
    3080:	83 f8 1f             	cmp    $0x1f,%eax
    3083:	75 ef                	jne    3074 <bigargtest+0x5c>
    args[MAXARG-1] = 0;
    3085:	c7 05 fc 5a 00 00 00 	movl   $0x0,0x5afc
    308c:	00 00 00 
    printf(stdout, "bigarg test\n");
    308f:	51                   	push   %ecx
    3090:	51                   	push   %ecx
    3091:	68 dc 48 00 00       	push   $0x48dc
    3096:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    309c:	e8 17 06 00 00       	call   36b8 <printf>
    exec("echo", args);
    30a1:	58                   	pop    %eax
    30a2:	5a                   	pop    %edx
    30a3:	68 80 5a 00 00       	push   $0x5a80
    30a8:	68 af 3a 00 00       	push   $0x3aaf
    30ad:	e8 0b 05 00 00       	call   35bd <exec>
    printf(stdout, "bigarg test ok\n");
    30b2:	59                   	pop    %ecx
    30b3:	58                   	pop    %eax
    30b4:	68 e9 48 00 00       	push   $0x48e9
    30b9:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    30bf:	e8 f4 05 00 00       	call   36b8 <printf>
    fd = open("bigarg-ok", O_CREATE);
    30c4:	58                   	pop    %eax
    30c5:	5a                   	pop    %edx
    30c6:	68 00 02 00 00       	push   $0x200
    30cb:	68 d2 48 00 00       	push   $0x48d2
    30d0:	e8 f0 04 00 00       	call   35c5 <open>
    close(fd);
    30d5:	89 04 24             	mov    %eax,(%esp)
    30d8:	e8 d0 04 00 00       	call   35ad <close>
    exit();
    30dd:	e8 a3 04 00 00       	call   3585 <exit>
    printf(stdout, "bigarg test failed!\n");
    30e2:	50                   	push   %eax
    30e3:	50                   	push   %eax
    30e4:	68 12 49 00 00       	push   $0x4912
    30e9:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    30ef:	e8 c4 05 00 00       	call   36b8 <printf>
    exit();
    30f4:	e8 8c 04 00 00       	call   3585 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    30f9:	52                   	push   %edx
    30fa:	52                   	push   %edx
    30fb:	68 f9 48 00 00       	push   $0x48f9
    3100:	ff 35 4c 5a 00 00    	pushl  0x5a4c
    3106:	e8 ad 05 00 00       	call   36b8 <printf>
    exit();
    310b:	e8 75 04 00 00       	call   3585 <exit>

00003110 <fsfull>:
{
    3110:	55                   	push   %ebp
    3111:	89 e5                	mov    %esp,%ebp
    3113:	57                   	push   %edi
    3114:	56                   	push   %esi
    3115:	53                   	push   %ebx
    3116:	83 ec 54             	sub    $0x54,%esp
  printf(1, "fsfull test\n");
    3119:	68 27 49 00 00       	push   $0x4927
    311e:	6a 01                	push   $0x1
    3120:	e8 93 05 00 00       	call   36b8 <printf>
    3125:	83 c4 10             	add    $0x10,%esp
  for(nfiles = 0; ; nfiles++){
    3128:	31 f6                	xor    %esi,%esi
    312a:	66 90                	xchg   %ax,%ax
    name[0] = 'f';
    312c:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    3130:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3135:	f7 e6                	mul    %esi
    3137:	89 d0                	mov    %edx,%eax
    3139:	c1 e8 06             	shr    $0x6,%eax
    313c:	83 c0 30             	add    $0x30,%eax
    313f:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3142:	89 f0                	mov    %esi,%eax
    3144:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
    3149:	99                   	cltd   
    314a:	f7 f9                	idiv   %ecx
    314c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3151:	f7 e2                	mul    %edx
    3153:	89 d0                	mov    %edx,%eax
    3155:	c1 e8 05             	shr    $0x5,%eax
    3158:	83 c0 30             	add    $0x30,%eax
    315b:	88 45 aa             	mov    %al,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    315e:	b9 64 00 00 00       	mov    $0x64,%ecx
    3163:	89 f0                	mov    %esi,%eax
    3165:	99                   	cltd   
    3166:	f7 f9                	idiv   %ecx
    3168:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
    316d:	f7 e2                	mul    %edx
    316f:	89 d0                	mov    %edx,%eax
    3171:	c1 e8 03             	shr    $0x3,%eax
    3174:	83 c0 30             	add    $0x30,%eax
    3177:	88 45 ab             	mov    %al,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    317a:	b9 0a 00 00 00       	mov    $0xa,%ecx
    317f:	89 f0                	mov    %esi,%eax
    3181:	99                   	cltd   
    3182:	f7 f9                	idiv   %ecx
    3184:	83 c2 30             	add    $0x30,%edx
    3187:	88 55 ac             	mov    %dl,-0x54(%ebp)
    name[5] = '\0';
    318a:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    printf(1, "writing %s\n", name);
    318e:	53                   	push   %ebx
    318f:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3192:	50                   	push   %eax
    3193:	68 34 49 00 00       	push   $0x4934
    3198:	6a 01                	push   $0x1
    319a:	e8 19 05 00 00       	call   36b8 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    319f:	5f                   	pop    %edi
    31a0:	58                   	pop    %eax
    31a1:	68 02 02 00 00       	push   $0x202
    31a6:	8d 45 a8             	lea    -0x58(%ebp),%eax
    31a9:	50                   	push   %eax
    31aa:	e8 16 04 00 00       	call   35c5 <open>
    31af:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    31b1:	83 c4 10             	add    $0x10,%esp
    31b4:	85 c0                	test   %eax,%eax
    31b6:	78 44                	js     31fc <fsfull+0xec>
    int total = 0;
    31b8:	31 db                	xor    %ebx,%ebx
    31ba:	eb 02                	jmp    31be <fsfull+0xae>
      total += cc;
    31bc:	01 c3                	add    %eax,%ebx
      int cc = write(fd, buf, 512);
    31be:	52                   	push   %edx
    31bf:	68 00 02 00 00       	push   $0x200
    31c4:	68 40 82 00 00       	push   $0x8240
    31c9:	57                   	push   %edi
    31ca:	e8 d6 03 00 00       	call   35a5 <write>
      if(cc < 512)
    31cf:	83 c4 10             	add    $0x10,%esp
    31d2:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    31d7:	7f e3                	jg     31bc <fsfull+0xac>
    printf(1, "wrote %d bytes\n", total);
    31d9:	50                   	push   %eax
    31da:	53                   	push   %ebx
    31db:	68 50 49 00 00       	push   $0x4950
    31e0:	6a 01                	push   $0x1
    31e2:	e8 d1 04 00 00       	call   36b8 <printf>
    close(fd);
    31e7:	89 3c 24             	mov    %edi,(%esp)
    31ea:	e8 be 03 00 00       	call   35ad <close>
    if(total == 0)
    31ef:	83 c4 10             	add    $0x10,%esp
    31f2:	85 db                	test   %ebx,%ebx
    31f4:	74 1a                	je     3210 <fsfull+0x100>
  for(nfiles = 0; ; nfiles++){
    31f6:	46                   	inc    %esi
    31f7:	e9 30 ff ff ff       	jmp    312c <fsfull+0x1c>
      printf(1, "open %s failed\n", name);
    31fc:	51                   	push   %ecx
    31fd:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3200:	50                   	push   %eax
    3201:	68 40 49 00 00       	push   $0x4940
    3206:	6a 01                	push   $0x1
    3208:	e8 ab 04 00 00       	call   36b8 <printf>
      break;
    320d:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + nfiles / 1000;
    3210:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    name[2] = '0' + (nfiles % 1000) / 100;
    3215:	bb 1f 85 eb 51       	mov    $0x51eb851f,%ebx
    321a:	66 90                	xchg   %ax,%ax
    name[0] = 'f';
    321c:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    3220:	89 f0                	mov    %esi,%eax
    3222:	f7 ef                	imul   %edi
    3224:	89 d0                	mov    %edx,%eax
    3226:	c1 f8 06             	sar    $0x6,%eax
    3229:	89 f1                	mov    %esi,%ecx
    322b:	c1 f9 1f             	sar    $0x1f,%ecx
    322e:	29 c8                	sub    %ecx,%eax
    3230:	8d 50 30             	lea    0x30(%eax),%edx
    3233:	88 55 a9             	mov    %dl,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3236:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3239:	8d 04 80             	lea    (%eax,%eax,4),%eax
    323c:	8d 04 80             	lea    (%eax,%eax,4),%eax
    323f:	c1 e0 03             	shl    $0x3,%eax
    3242:	89 f2                	mov    %esi,%edx
    3244:	29 c2                	sub    %eax,%edx
    3246:	89 d0                	mov    %edx,%eax
    3248:	f7 e3                	mul    %ebx
    324a:	89 d0                	mov    %edx,%eax
    324c:	c1 e8 05             	shr    $0x5,%eax
    324f:	83 c0 30             	add    $0x30,%eax
    3252:	88 45 aa             	mov    %al,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3255:	89 f0                	mov    %esi,%eax
    3257:	f7 eb                	imul   %ebx
    3259:	89 d0                	mov    %edx,%eax
    325b:	c1 f8 05             	sar    $0x5,%eax
    325e:	29 c8                	sub    %ecx,%eax
    3260:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3263:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3266:	c1 e0 02             	shl    $0x2,%eax
    3269:	89 f2                	mov    %esi,%edx
    326b:	29 c2                	sub    %eax,%edx
    326d:	89 d0                	mov    %edx,%eax
    326f:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    3274:	f7 e2                	mul    %edx
    3276:	89 d0                	mov    %edx,%eax
    3278:	c1 e8 03             	shr    $0x3,%eax
    327b:	83 c0 30             	add    $0x30,%eax
    327e:	88 45 ab             	mov    %al,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3281:	b8 67 66 66 66       	mov    $0x66666667,%eax
    3286:	f7 ee                	imul   %esi
    3288:	89 d0                	mov    %edx,%eax
    328a:	c1 f8 02             	sar    $0x2,%eax
    328d:	29 c8                	sub    %ecx,%eax
    328f:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3292:	01 c0                	add    %eax,%eax
    3294:	89 f1                	mov    %esi,%ecx
    3296:	29 c1                	sub    %eax,%ecx
    3298:	89 c8                	mov    %ecx,%eax
    329a:	83 c0 30             	add    $0x30,%eax
    329d:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    32a0:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    unlink(name);
    32a4:	83 ec 0c             	sub    $0xc,%esp
    32a7:	8d 45 a8             	lea    -0x58(%ebp),%eax
    32aa:	50                   	push   %eax
    32ab:	e8 25 03 00 00       	call   35d5 <unlink>
    nfiles--;
    32b0:	4e                   	dec    %esi
  while(nfiles >= 0){
    32b1:	83 c4 10             	add    $0x10,%esp
    32b4:	83 fe ff             	cmp    $0xffffffff,%esi
    32b7:	0f 85 5f ff ff ff    	jne    321c <fsfull+0x10c>
  printf(1, "fsfull test finished\n");
    32bd:	83 ec 08             	sub    $0x8,%esp
    32c0:	68 60 49 00 00       	push   $0x4960
    32c5:	6a 01                	push   $0x1
    32c7:	e8 ec 03 00 00       	call   36b8 <printf>
}
    32cc:	83 c4 10             	add    $0x10,%esp
    32cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    32d2:	5b                   	pop    %ebx
    32d3:	5e                   	pop    %esi
    32d4:	5f                   	pop    %edi
    32d5:	5d                   	pop    %ebp
    32d6:	c3                   	ret    
    32d7:	90                   	nop

000032d8 <uio>:
{
    32d8:	55                   	push   %ebp
    32d9:	89 e5                	mov    %esp,%ebp
    32db:	83 ec 10             	sub    $0x10,%esp
  printf(1, "uio test\n");
    32de:	68 76 49 00 00       	push   $0x4976
    32e3:	6a 01                	push   $0x1
    32e5:	e8 ce 03 00 00       	call   36b8 <printf>
  pid = fork();
    32ea:	e8 8e 02 00 00       	call   357d <fork>
  if(pid == 0){
    32ef:	83 c4 10             	add    $0x10,%esp
    32f2:	85 c0                	test   %eax,%eax
    32f4:	74 1b                	je     3311 <uio+0x39>
  } else if(pid < 0){
    32f6:	78 3a                	js     3332 <uio+0x5a>
  wait();
    32f8:	e8 90 02 00 00       	call   358d <wait>
  printf(1, "uio test done\n");
    32fd:	83 ec 08             	sub    $0x8,%esp
    3300:	68 80 49 00 00       	push   $0x4980
    3305:	6a 01                	push   $0x1
    3307:	e8 ac 03 00 00       	call   36b8 <printf>
}
    330c:	83 c4 10             	add    $0x10,%esp
    330f:	c9                   	leave  
    3310:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3311:	b0 09                	mov    $0x9,%al
    3313:	ba 70 00 00 00       	mov    $0x70,%edx
    3318:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    3319:	ba 71 00 00 00       	mov    $0x71,%edx
    331e:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    331f:	52                   	push   %edx
    3320:	52                   	push   %edx
    3321:	68 0c 51 00 00       	push   $0x510c
    3326:	6a 01                	push   $0x1
    3328:	e8 8b 03 00 00       	call   36b8 <printf>
    exit();
    332d:	e8 53 02 00 00       	call   3585 <exit>
    printf (1, "fork failed\n");
    3332:	50                   	push   %eax
    3333:	50                   	push   %eax
    3334:	68 05 49 00 00       	push   $0x4905
    3339:	6a 01                	push   $0x1
    333b:	e8 78 03 00 00       	call   36b8 <printf>
    exit();
    3340:	e8 40 02 00 00       	call   3585 <exit>
    3345:	8d 76 00             	lea    0x0(%esi),%esi

00003348 <argptest>:
{
    3348:	55                   	push   %ebp
    3349:	89 e5                	mov    %esp,%ebp
    334b:	53                   	push   %ebx
    334c:	83 ec 0c             	sub    $0xc,%esp
  fd = open("init", O_RDONLY);
    334f:	6a 00                	push   $0x0
    3351:	68 8f 49 00 00       	push   $0x498f
    3356:	e8 6a 02 00 00       	call   35c5 <open>
  if (fd < 0) {
    335b:	83 c4 10             	add    $0x10,%esp
    335e:	85 c0                	test   %eax,%eax
    3360:	78 37                	js     3399 <argptest+0x51>
    3362:	89 c3                	mov    %eax,%ebx
  read(fd, sbrk(0) - 1, -1);
    3364:	83 ec 0c             	sub    $0xc,%esp
    3367:	6a 00                	push   $0x0
    3369:	e8 9f 02 00 00       	call   360d <sbrk>
    336e:	83 c4 0c             	add    $0xc,%esp
    3371:	6a ff                	push   $0xffffffff
    3373:	48                   	dec    %eax
    3374:	50                   	push   %eax
    3375:	53                   	push   %ebx
    3376:	e8 22 02 00 00       	call   359d <read>
  close(fd);
    337b:	89 1c 24             	mov    %ebx,(%esp)
    337e:	e8 2a 02 00 00       	call   35ad <close>
  printf(1, "arg test passed\n");
    3383:	58                   	pop    %eax
    3384:	5a                   	pop    %edx
    3385:	68 a1 49 00 00       	push   $0x49a1
    338a:	6a 01                	push   $0x1
    338c:	e8 27 03 00 00       	call   36b8 <printf>
}
    3391:	83 c4 10             	add    $0x10,%esp
    3394:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3397:	c9                   	leave  
    3398:	c3                   	ret    
    printf(2, "open failed\n");
    3399:	51                   	push   %ecx
    339a:	51                   	push   %ecx
    339b:	68 94 49 00 00       	push   $0x4994
    33a0:	6a 02                	push   $0x2
    33a2:	e8 11 03 00 00       	call   36b8 <printf>
    exit();
    33a7:	e8 d9 01 00 00       	call   3585 <exit>

000033ac <rand>:
  randstate = randstate * 1664525 + 1013904223;
    33ac:	a1 48 5a 00 00       	mov    0x5a48,%eax
    33b1:	8d 14 00             	lea    (%eax,%eax,1),%edx
    33b4:	01 c2                	add    %eax,%edx
    33b6:	8d 14 90             	lea    (%eax,%edx,4),%edx
    33b9:	c1 e2 08             	shl    $0x8,%edx
    33bc:	01 c2                	add    %eax,%edx
    33be:	8d 14 92             	lea    (%edx,%edx,4),%edx
    33c1:	8d 04 90             	lea    (%eax,%edx,4),%eax
    33c4:	8d 04 80             	lea    (%eax,%eax,4),%eax
    33c7:	8d 84 80 5f f3 6e 3c 	lea    0x3c6ef35f(%eax,%eax,4),%eax
    33ce:	a3 48 5a 00 00       	mov    %eax,0x5a48
}
    33d3:	c3                   	ret    

000033d4 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    33d4:	55                   	push   %ebp
    33d5:	89 e5                	mov    %esp,%ebp
    33d7:	53                   	push   %ebx
    33d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    33db:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    33de:	31 c0                	xor    %eax,%eax
    33e0:	8a 14 03             	mov    (%ebx,%eax,1),%dl
    33e3:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    33e6:	40                   	inc    %eax
    33e7:	84 d2                	test   %dl,%dl
    33e9:	75 f5                	jne    33e0 <strcpy+0xc>
    ;
  return os;
}
    33eb:	89 c8                	mov    %ecx,%eax
    33ed:	5b                   	pop    %ebx
    33ee:	5d                   	pop    %ebp
    33ef:	c3                   	ret    

000033f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    33f0:	55                   	push   %ebp
    33f1:	89 e5                	mov    %esp,%ebp
    33f3:	53                   	push   %ebx
    33f4:	8b 5d 08             	mov    0x8(%ebp),%ebx
    33f7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    33fa:	0f b6 03             	movzbl (%ebx),%eax
    33fd:	0f b6 0a             	movzbl (%edx),%ecx
    3400:	84 c0                	test   %al,%al
    3402:	75 10                	jne    3414 <strcmp+0x24>
    3404:	eb 1a                	jmp    3420 <strcmp+0x30>
    3406:	66 90                	xchg   %ax,%ax
    p++, q++;
    3408:	43                   	inc    %ebx
    3409:	42                   	inc    %edx
  while(*p && *p == *q)
    340a:	0f b6 03             	movzbl (%ebx),%eax
    340d:	0f b6 0a             	movzbl (%edx),%ecx
    3410:	84 c0                	test   %al,%al
    3412:	74 0c                	je     3420 <strcmp+0x30>
    3414:	38 c8                	cmp    %cl,%al
    3416:	74 f0                	je     3408 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    3418:	29 c8                	sub    %ecx,%eax
}
    341a:	5b                   	pop    %ebx
    341b:	5d                   	pop    %ebp
    341c:	c3                   	ret    
    341d:	8d 76 00             	lea    0x0(%esi),%esi
    3420:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    3422:	29 c8                	sub    %ecx,%eax
}
    3424:	5b                   	pop    %ebx
    3425:	5d                   	pop    %ebp
    3426:	c3                   	ret    
    3427:	90                   	nop

00003428 <strlen>:

uint
strlen(const char *s)
{
    3428:	55                   	push   %ebp
    3429:	89 e5                	mov    %esp,%ebp
    342b:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    342e:	80 3a 00             	cmpb   $0x0,(%edx)
    3431:	74 15                	je     3448 <strlen+0x20>
    3433:	31 c0                	xor    %eax,%eax
    3435:	8d 76 00             	lea    0x0(%esi),%esi
    3438:	40                   	inc    %eax
    3439:	89 c1                	mov    %eax,%ecx
    343b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    343f:	75 f7                	jne    3438 <strlen+0x10>
    ;
  return n;
}
    3441:	89 c8                	mov    %ecx,%eax
    3443:	5d                   	pop    %ebp
    3444:	c3                   	ret    
    3445:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    3448:	31 c9                	xor    %ecx,%ecx
}
    344a:	89 c8                	mov    %ecx,%eax
    344c:	5d                   	pop    %ebp
    344d:	c3                   	ret    
    344e:	66 90                	xchg   %ax,%ax

00003450 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3450:	55                   	push   %ebp
    3451:	89 e5                	mov    %esp,%ebp
    3453:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3454:	8b 7d 08             	mov    0x8(%ebp),%edi
    3457:	8b 4d 10             	mov    0x10(%ebp),%ecx
    345a:	8b 45 0c             	mov    0xc(%ebp),%eax
    345d:	fc                   	cld    
    345e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3460:	8b 45 08             	mov    0x8(%ebp),%eax
    3463:	5f                   	pop    %edi
    3464:	5d                   	pop    %ebp
    3465:	c3                   	ret    
    3466:	66 90                	xchg   %ax,%ax

00003468 <strchr>:

char*
strchr(const char *s, char c)
{
    3468:	55                   	push   %ebp
    3469:	89 e5                	mov    %esp,%ebp
    346b:	8b 45 08             	mov    0x8(%ebp),%eax
    346e:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
    3471:	8a 10                	mov    (%eax),%dl
    3473:	84 d2                	test   %dl,%dl
    3475:	75 0c                	jne    3483 <strchr+0x1b>
    3477:	eb 13                	jmp    348c <strchr+0x24>
    3479:	8d 76 00             	lea    0x0(%esi),%esi
    347c:	40                   	inc    %eax
    347d:	8a 10                	mov    (%eax),%dl
    347f:	84 d2                	test   %dl,%dl
    3481:	74 09                	je     348c <strchr+0x24>
    if(*s == c)
    3483:	38 d1                	cmp    %dl,%cl
    3485:	75 f5                	jne    347c <strchr+0x14>
      return (char*)s;
  return 0;
}
    3487:	5d                   	pop    %ebp
    3488:	c3                   	ret    
    3489:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
    348c:	31 c0                	xor    %eax,%eax
}
    348e:	5d                   	pop    %ebp
    348f:	c3                   	ret    

00003490 <gets>:

char*
gets(char *buf, int max)
{
    3490:	55                   	push   %ebp
    3491:	89 e5                	mov    %esp,%ebp
    3493:	57                   	push   %edi
    3494:	56                   	push   %esi
    3495:	53                   	push   %ebx
    3496:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3499:	8b 75 08             	mov    0x8(%ebp),%esi
    349c:	bb 01 00 00 00       	mov    $0x1,%ebx
    34a1:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
    34a3:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    34a6:	eb 20                	jmp    34c8 <gets+0x38>
    cc = read(0, &c, 1);
    34a8:	50                   	push   %eax
    34a9:	6a 01                	push   $0x1
    34ab:	57                   	push   %edi
    34ac:	6a 00                	push   $0x0
    34ae:	e8 ea 00 00 00       	call   359d <read>
    if(cc < 1)
    34b3:	83 c4 10             	add    $0x10,%esp
    34b6:	85 c0                	test   %eax,%eax
    34b8:	7e 16                	jle    34d0 <gets+0x40>
      break;
    buf[i++] = c;
    34ba:	8a 45 e7             	mov    -0x19(%ebp),%al
    34bd:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
    34bf:	46                   	inc    %esi
    34c0:	3c 0a                	cmp    $0xa,%al
    34c2:	74 0c                	je     34d0 <gets+0x40>
    34c4:	3c 0d                	cmp    $0xd,%al
    34c6:	74 08                	je     34d0 <gets+0x40>
  for(i=0; i+1 < max; ){
    34c8:	8d 04 33             	lea    (%ebx,%esi,1),%eax
    34cb:	39 45 0c             	cmp    %eax,0xc(%ebp)
    34ce:	7f d8                	jg     34a8 <gets+0x18>
      break;
  }
  buf[i] = '\0';
    34d0:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
    34d3:	8b 45 08             	mov    0x8(%ebp),%eax
    34d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    34d9:	5b                   	pop    %ebx
    34da:	5e                   	pop    %esi
    34db:	5f                   	pop    %edi
    34dc:	5d                   	pop    %ebp
    34dd:	c3                   	ret    
    34de:	66 90                	xchg   %ax,%ax

000034e0 <stat>:

int
stat(const char *n, struct stat *st)
{
    34e0:	55                   	push   %ebp
    34e1:	89 e5                	mov    %esp,%ebp
    34e3:	56                   	push   %esi
    34e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    34e5:	83 ec 08             	sub    $0x8,%esp
    34e8:	6a 00                	push   $0x0
    34ea:	ff 75 08             	pushl  0x8(%ebp)
    34ed:	e8 d3 00 00 00       	call   35c5 <open>
  if(fd < 0)
    34f2:	83 c4 10             	add    $0x10,%esp
    34f5:	85 c0                	test   %eax,%eax
    34f7:	78 27                	js     3520 <stat+0x40>
    34f9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
    34fb:	83 ec 08             	sub    $0x8,%esp
    34fe:	ff 75 0c             	pushl  0xc(%ebp)
    3501:	50                   	push   %eax
    3502:	e8 d6 00 00 00       	call   35dd <fstat>
    3507:	89 c6                	mov    %eax,%esi
  close(fd);
    3509:	89 1c 24             	mov    %ebx,(%esp)
    350c:	e8 9c 00 00 00       	call   35ad <close>
  return r;
    3511:	83 c4 10             	add    $0x10,%esp
}
    3514:	89 f0                	mov    %esi,%eax
    3516:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3519:	5b                   	pop    %ebx
    351a:	5e                   	pop    %esi
    351b:	5d                   	pop    %ebp
    351c:	c3                   	ret    
    351d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    3520:	be ff ff ff ff       	mov    $0xffffffff,%esi
    3525:	eb ed                	jmp    3514 <stat+0x34>
    3527:	90                   	nop

00003528 <atoi>:

int
atoi(const char *s)
{
    3528:	55                   	push   %ebp
    3529:	89 e5                	mov    %esp,%ebp
    352b:	53                   	push   %ebx
    352c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    352f:	0f be 01             	movsbl (%ecx),%eax
    3532:	8d 50 d0             	lea    -0x30(%eax),%edx
    3535:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
    3538:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
    353d:	77 16                	ja     3555 <atoi+0x2d>
    353f:	90                   	nop
    n = n*10 + *s++ - '0';
    3540:	41                   	inc    %ecx
    3541:	8d 14 92             	lea    (%edx,%edx,4),%edx
    3544:	01 d2                	add    %edx,%edx
    3546:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
    354a:	0f be 01             	movsbl (%ecx),%eax
    354d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    3550:	80 fb 09             	cmp    $0x9,%bl
    3553:	76 eb                	jbe    3540 <atoi+0x18>
  return n;
}
    3555:	89 d0                	mov    %edx,%eax
    3557:	5b                   	pop    %ebx
    3558:	5d                   	pop    %ebp
    3559:	c3                   	ret    
    355a:	66 90                	xchg   %ax,%ax

0000355c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    355c:	55                   	push   %ebp
    355d:	89 e5                	mov    %esp,%ebp
    355f:	57                   	push   %edi
    3560:	56                   	push   %esi
    3561:	8b 45 08             	mov    0x8(%ebp),%eax
    3564:	8b 75 0c             	mov    0xc(%ebp),%esi
    3567:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    356a:	85 d2                	test   %edx,%edx
    356c:	7e 0b                	jle    3579 <memmove+0x1d>
    356e:	01 c2                	add    %eax,%edx
  dst = vdst;
    3570:	89 c7                	mov    %eax,%edi
    3572:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
    3574:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    3575:	39 fa                	cmp    %edi,%edx
    3577:	75 fb                	jne    3574 <memmove+0x18>
  return vdst;
}
    3579:	5e                   	pop    %esi
    357a:	5f                   	pop    %edi
    357b:	5d                   	pop    %ebp
    357c:	c3                   	ret    

0000357d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    357d:	b8 01 00 00 00       	mov    $0x1,%eax
    3582:	cd 40                	int    $0x40
    3584:	c3                   	ret    

00003585 <exit>:
SYSCALL(exit)
    3585:	b8 02 00 00 00       	mov    $0x2,%eax
    358a:	cd 40                	int    $0x40
    358c:	c3                   	ret    

0000358d <wait>:
SYSCALL(wait)
    358d:	b8 03 00 00 00       	mov    $0x3,%eax
    3592:	cd 40                	int    $0x40
    3594:	c3                   	ret    

00003595 <pipe>:
SYSCALL(pipe)
    3595:	b8 04 00 00 00       	mov    $0x4,%eax
    359a:	cd 40                	int    $0x40
    359c:	c3                   	ret    

0000359d <read>:
SYSCALL(read)
    359d:	b8 05 00 00 00       	mov    $0x5,%eax
    35a2:	cd 40                	int    $0x40
    35a4:	c3                   	ret    

000035a5 <write>:
SYSCALL(write)
    35a5:	b8 10 00 00 00       	mov    $0x10,%eax
    35aa:	cd 40                	int    $0x40
    35ac:	c3                   	ret    

000035ad <close>:
SYSCALL(close)
    35ad:	b8 15 00 00 00       	mov    $0x15,%eax
    35b2:	cd 40                	int    $0x40
    35b4:	c3                   	ret    

000035b5 <kill>:
SYSCALL(kill)
    35b5:	b8 06 00 00 00       	mov    $0x6,%eax
    35ba:	cd 40                	int    $0x40
    35bc:	c3                   	ret    

000035bd <exec>:
SYSCALL(exec)
    35bd:	b8 07 00 00 00       	mov    $0x7,%eax
    35c2:	cd 40                	int    $0x40
    35c4:	c3                   	ret    

000035c5 <open>:
SYSCALL(open)
    35c5:	b8 0f 00 00 00       	mov    $0xf,%eax
    35ca:	cd 40                	int    $0x40
    35cc:	c3                   	ret    

000035cd <mknod>:
SYSCALL(mknod)
    35cd:	b8 11 00 00 00       	mov    $0x11,%eax
    35d2:	cd 40                	int    $0x40
    35d4:	c3                   	ret    

000035d5 <unlink>:
SYSCALL(unlink)
    35d5:	b8 12 00 00 00       	mov    $0x12,%eax
    35da:	cd 40                	int    $0x40
    35dc:	c3                   	ret    

000035dd <fstat>:
SYSCALL(fstat)
    35dd:	b8 08 00 00 00       	mov    $0x8,%eax
    35e2:	cd 40                	int    $0x40
    35e4:	c3                   	ret    

000035e5 <link>:
SYSCALL(link)
    35e5:	b8 13 00 00 00       	mov    $0x13,%eax
    35ea:	cd 40                	int    $0x40
    35ec:	c3                   	ret    

000035ed <mkdir>:
SYSCALL(mkdir)
    35ed:	b8 14 00 00 00       	mov    $0x14,%eax
    35f2:	cd 40                	int    $0x40
    35f4:	c3                   	ret    

000035f5 <chdir>:
SYSCALL(chdir)
    35f5:	b8 09 00 00 00       	mov    $0x9,%eax
    35fa:	cd 40                	int    $0x40
    35fc:	c3                   	ret    

000035fd <dup>:
SYSCALL(dup)
    35fd:	b8 0a 00 00 00       	mov    $0xa,%eax
    3602:	cd 40                	int    $0x40
    3604:	c3                   	ret    

00003605 <getpid>:
SYSCALL(getpid)
    3605:	b8 0b 00 00 00       	mov    $0xb,%eax
    360a:	cd 40                	int    $0x40
    360c:	c3                   	ret    

0000360d <sbrk>:
SYSCALL(sbrk)
    360d:	b8 0c 00 00 00       	mov    $0xc,%eax
    3612:	cd 40                	int    $0x40
    3614:	c3                   	ret    

00003615 <sleep>:
SYSCALL(sleep)
    3615:	b8 0d 00 00 00       	mov    $0xd,%eax
    361a:	cd 40                	int    $0x40
    361c:	c3                   	ret    

0000361d <uptime>:
SYSCALL(uptime)
    361d:	b8 0e 00 00 00       	mov    $0xe,%eax
    3622:	cd 40                	int    $0x40
    3624:	c3                   	ret    

00003625 <getreadcount>:
    3625:	b8 16 00 00 00       	mov    $0x16,%eax
    362a:	cd 40                	int    $0x40
    362c:	c3                   	ret    
    362d:	66 90                	xchg   %ax,%ax
    362f:	90                   	nop

00003630 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3630:	55                   	push   %ebp
    3631:	89 e5                	mov    %esp,%ebp
    3633:	57                   	push   %edi
    3634:	56                   	push   %esi
    3635:	53                   	push   %ebx
    3636:	83 ec 3c             	sub    $0x3c,%esp
    3639:	89 45 bc             	mov    %eax,-0x44(%ebp)
    363c:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    363f:	89 d1                	mov    %edx,%ecx
  if(sgn && xx < 0){
    3641:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3644:	85 db                	test   %ebx,%ebx
    3646:	74 04                	je     364c <printint+0x1c>
    3648:	85 d2                	test   %edx,%edx
    364a:	78 68                	js     36b4 <printint+0x84>
  neg = 0;
    364c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3653:	31 ff                	xor    %edi,%edi
    3655:	8d 75 d7             	lea    -0x29(%ebp),%esi
  do{
    buf[i++] = digits[x % base];
    3658:	89 c8                	mov    %ecx,%eax
    365a:	31 d2                	xor    %edx,%edx
    365c:	f7 75 c4             	divl   -0x3c(%ebp)
    365f:	89 fb                	mov    %edi,%ebx
    3661:	8d 7f 01             	lea    0x1(%edi),%edi
    3664:	8a 92 74 51 00 00    	mov    0x5174(%edx),%dl
    366a:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
  }while((x /= base) != 0);
    366e:	89 4d c0             	mov    %ecx,-0x40(%ebp)
    3671:	89 c1                	mov    %eax,%ecx
    3673:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3676:	3b 45 c0             	cmp    -0x40(%ebp),%eax
    3679:	76 dd                	jbe    3658 <printint+0x28>
  if(neg)
    367b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    367e:	85 c9                	test   %ecx,%ecx
    3680:	74 09                	je     368b <printint+0x5b>
    buf[i++] = '-';
    3682:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
    3687:	89 fb                	mov    %edi,%ebx
    buf[i++] = '-';
    3689:	b2 2d                	mov    $0x2d,%dl

  while(--i >= 0)
    368b:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
    368f:	8b 7d bc             	mov    -0x44(%ebp),%edi
    3692:	eb 03                	jmp    3697 <printint+0x67>
    3694:	8a 13                	mov    (%ebx),%dl
    3696:	4b                   	dec    %ebx
    putc(fd, buf[i]);
    3697:	88 55 d7             	mov    %dl,-0x29(%ebp)
  write(fd, &c, 1);
    369a:	50                   	push   %eax
    369b:	6a 01                	push   $0x1
    369d:	56                   	push   %esi
    369e:	57                   	push   %edi
    369f:	e8 01 ff ff ff       	call   35a5 <write>
  while(--i >= 0)
    36a4:	83 c4 10             	add    $0x10,%esp
    36a7:	39 de                	cmp    %ebx,%esi
    36a9:	75 e9                	jne    3694 <printint+0x64>
}
    36ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
    36ae:	5b                   	pop    %ebx
    36af:	5e                   	pop    %esi
    36b0:	5f                   	pop    %edi
    36b1:	5d                   	pop    %ebp
    36b2:	c3                   	ret    
    36b3:	90                   	nop
    x = -xx;
    36b4:	f7 d9                	neg    %ecx
    36b6:	eb 9b                	jmp    3653 <printint+0x23>

000036b8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    36b8:	55                   	push   %ebp
    36b9:	89 e5                	mov    %esp,%ebp
    36bb:	57                   	push   %edi
    36bc:	56                   	push   %esi
    36bd:	53                   	push   %ebx
    36be:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    36c1:	8b 75 0c             	mov    0xc(%ebp),%esi
    36c4:	8a 1e                	mov    (%esi),%bl
    36c6:	84 db                	test   %bl,%bl
    36c8:	0f 84 a3 00 00 00    	je     3771 <printf+0xb9>
    36ce:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
    36cf:	8d 45 10             	lea    0x10(%ebp),%eax
    36d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  state = 0;
    36d5:	31 d2                	xor    %edx,%edx
  write(fd, &c, 1);
    36d7:	8d 7d e7             	lea    -0x19(%ebp),%edi
    36da:	eb 29                	jmp    3705 <printf+0x4d>
    36dc:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    36df:	83 f8 25             	cmp    $0x25,%eax
    36e2:	0f 84 94 00 00 00    	je     377c <printf+0xc4>
        state = '%';
      } else {
        putc(fd, c);
    36e8:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    36eb:	50                   	push   %eax
    36ec:	6a 01                	push   $0x1
    36ee:	57                   	push   %edi
    36ef:	ff 75 08             	pushl  0x8(%ebp)
    36f2:	e8 ae fe ff ff       	call   35a5 <write>
        putc(fd, c);
    36f7:	83 c4 10             	add    $0x10,%esp
    36fa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  for(i = 0; fmt[i]; i++){
    36fd:	46                   	inc    %esi
    36fe:	8a 5e ff             	mov    -0x1(%esi),%bl
    3701:	84 db                	test   %bl,%bl
    3703:	74 6c                	je     3771 <printf+0xb9>
    c = fmt[i] & 0xff;
    3705:	0f be cb             	movsbl %bl,%ecx
    3708:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    370b:	85 d2                	test   %edx,%edx
    370d:	74 cd                	je     36dc <printf+0x24>
      }
    } else if(state == '%'){
    370f:	83 fa 25             	cmp    $0x25,%edx
    3712:	75 e9                	jne    36fd <printf+0x45>
      if(c == 'd'){
    3714:	83 f8 64             	cmp    $0x64,%eax
    3717:	0f 84 97 00 00 00    	je     37b4 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    371d:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    3723:	83 f9 70             	cmp    $0x70,%ecx
    3726:	74 60                	je     3788 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3728:	83 f8 73             	cmp    $0x73,%eax
    372b:	0f 84 8f 00 00 00    	je     37c0 <printf+0x108>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3731:	83 f8 63             	cmp    $0x63,%eax
    3734:	0f 84 d6 00 00 00    	je     3810 <printf+0x158>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    373a:	83 f8 25             	cmp    $0x25,%eax
    373d:	0f 84 c1 00 00 00    	je     3804 <printf+0x14c>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    3743:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
    3747:	50                   	push   %eax
    3748:	6a 01                	push   $0x1
    374a:	57                   	push   %edi
    374b:	ff 75 08             	pushl  0x8(%ebp)
    374e:	e8 52 fe ff ff       	call   35a5 <write>
        putc(fd, c);
    3753:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    3756:	83 c4 0c             	add    $0xc,%esp
    3759:	6a 01                	push   $0x1
    375b:	57                   	push   %edi
    375c:	ff 75 08             	pushl  0x8(%ebp)
    375f:	e8 41 fe ff ff       	call   35a5 <write>
        putc(fd, c);
    3764:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    3767:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    3769:	46                   	inc    %esi
    376a:	8a 5e ff             	mov    -0x1(%esi),%bl
    376d:	84 db                	test   %bl,%bl
    376f:	75 94                	jne    3705 <printf+0x4d>
    }
  }
}
    3771:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3774:	5b                   	pop    %ebx
    3775:	5e                   	pop    %esi
    3776:	5f                   	pop    %edi
    3777:	5d                   	pop    %ebp
    3778:	c3                   	ret    
    3779:	8d 76 00             	lea    0x0(%esi),%esi
        state = '%';
    377c:	ba 25 00 00 00       	mov    $0x25,%edx
    3781:	e9 77 ff ff ff       	jmp    36fd <printf+0x45>
    3786:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    3788:	83 ec 0c             	sub    $0xc,%esp
    378b:	6a 00                	push   $0x0
    378d:	b9 10 00 00 00       	mov    $0x10,%ecx
    3792:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    3795:	8b 13                	mov    (%ebx),%edx
    3797:	8b 45 08             	mov    0x8(%ebp),%eax
    379a:	e8 91 fe ff ff       	call   3630 <printint>
        ap++;
    379f:	89 d8                	mov    %ebx,%eax
    37a1:	83 c0 04             	add    $0x4,%eax
    37a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
    37a7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    37aa:	31 d2                	xor    %edx,%edx
        ap++;
    37ac:	e9 4c ff ff ff       	jmp    36fd <printf+0x45>
    37b1:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    37b4:	83 ec 0c             	sub    $0xc,%esp
    37b7:	6a 01                	push   $0x1
    37b9:	b9 0a 00 00 00       	mov    $0xa,%ecx
    37be:	eb d2                	jmp    3792 <printf+0xda>
        s = (char*)*ap;
    37c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    37c3:	8b 18                	mov    (%eax),%ebx
        ap++;
    37c5:	83 c0 04             	add    $0x4,%eax
    37c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    37cb:	85 db                	test   %ebx,%ebx
    37cd:	74 65                	je     3834 <printf+0x17c>
        while(*s != 0){
    37cf:	8a 03                	mov    (%ebx),%al
    37d1:	84 c0                	test   %al,%al
    37d3:	74 70                	je     3845 <printf+0x18d>
    37d5:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    37d8:	89 de                	mov    %ebx,%esi
    37da:	8b 5d 08             	mov    0x8(%ebp),%ebx
    37dd:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
    37e0:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    37e3:	50                   	push   %eax
    37e4:	6a 01                	push   $0x1
    37e6:	57                   	push   %edi
    37e7:	53                   	push   %ebx
    37e8:	e8 b8 fd ff ff       	call   35a5 <write>
          s++;
    37ed:	46                   	inc    %esi
        while(*s != 0){
    37ee:	8a 06                	mov    (%esi),%al
    37f0:	83 c4 10             	add    $0x10,%esp
    37f3:	84 c0                	test   %al,%al
    37f5:	75 e9                	jne    37e0 <printf+0x128>
    37f7:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    37fa:	31 d2                	xor    %edx,%edx
    37fc:	e9 fc fe ff ff       	jmp    36fd <printf+0x45>
    3801:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    3804:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    3807:	52                   	push   %edx
    3808:	e9 4c ff ff ff       	jmp    3759 <printf+0xa1>
    380d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, *ap);
    3810:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    3813:	8b 03                	mov    (%ebx),%eax
    3815:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    3818:	51                   	push   %ecx
    3819:	6a 01                	push   $0x1
    381b:	57                   	push   %edi
    381c:	ff 75 08             	pushl  0x8(%ebp)
    381f:	e8 81 fd ff ff       	call   35a5 <write>
        ap++;
    3824:	83 c3 04             	add    $0x4,%ebx
    3827:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    382a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    382d:	31 d2                	xor    %edx,%edx
    382f:	e9 c9 fe ff ff       	jmp    36fd <printf+0x45>
          s = "(null)";
    3834:	bb 6c 51 00 00       	mov    $0x516c,%ebx
        while(*s != 0){
    3839:	b0 28                	mov    $0x28,%al
    383b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    383e:	89 de                	mov    %ebx,%esi
    3840:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3843:	eb 9b                	jmp    37e0 <printf+0x128>
      state = 0;
    3845:	31 d2                	xor    %edx,%edx
    3847:	e9 b1 fe ff ff       	jmp    36fd <printf+0x45>

0000384c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    384c:	55                   	push   %ebp
    384d:	89 e5                	mov    %esp,%ebp
    384f:	57                   	push   %edi
    3850:	56                   	push   %esi
    3851:	53                   	push   %ebx
    3852:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3855:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3858:	a1 00 5b 00 00       	mov    0x5b00,%eax
    385d:	8b 10                	mov    (%eax),%edx
    385f:	39 c8                	cmp    %ecx,%eax
    3861:	73 11                	jae    3874 <free+0x28>
    3863:	90                   	nop
    3864:	39 d1                	cmp    %edx,%ecx
    3866:	72 14                	jb     387c <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3868:	39 d0                	cmp    %edx,%eax
    386a:	73 10                	jae    387c <free+0x30>
{
    386c:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    386e:	8b 10                	mov    (%eax),%edx
    3870:	39 c8                	cmp    %ecx,%eax
    3872:	72 f0                	jb     3864 <free+0x18>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3874:	39 d0                	cmp    %edx,%eax
    3876:	72 f4                	jb     386c <free+0x20>
    3878:	39 d1                	cmp    %edx,%ecx
    387a:	73 f0                	jae    386c <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    387c:	8b 73 fc             	mov    -0x4(%ebx),%esi
    387f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3882:	39 fa                	cmp    %edi,%edx
    3884:	74 1a                	je     38a0 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3886:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3889:	8b 50 04             	mov    0x4(%eax),%edx
    388c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    388f:	39 f1                	cmp    %esi,%ecx
    3891:	74 24                	je     38b7 <free+0x6b>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3893:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3895:	a3 00 5b 00 00       	mov    %eax,0x5b00
}
    389a:	5b                   	pop    %ebx
    389b:	5e                   	pop    %esi
    389c:	5f                   	pop    %edi
    389d:	5d                   	pop    %ebp
    389e:	c3                   	ret    
    389f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    38a0:	03 72 04             	add    0x4(%edx),%esi
    38a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    38a6:	8b 10                	mov    (%eax),%edx
    38a8:	8b 12                	mov    (%edx),%edx
    38aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    38ad:	8b 50 04             	mov    0x4(%eax),%edx
    38b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    38b3:	39 f1                	cmp    %esi,%ecx
    38b5:	75 dc                	jne    3893 <free+0x47>
    p->s.size += bp->s.size;
    38b7:	03 53 fc             	add    -0x4(%ebx),%edx
    38ba:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    38bd:	8b 53 f8             	mov    -0x8(%ebx),%edx
    38c0:	89 10                	mov    %edx,(%eax)
  freep = p;
    38c2:	a3 00 5b 00 00       	mov    %eax,0x5b00
}
    38c7:	5b                   	pop    %ebx
    38c8:	5e                   	pop    %esi
    38c9:	5f                   	pop    %edi
    38ca:	5d                   	pop    %ebp
    38cb:	c3                   	ret    

000038cc <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    38cc:	55                   	push   %ebp
    38cd:	89 e5                	mov    %esp,%ebp
    38cf:	57                   	push   %edi
    38d0:	56                   	push   %esi
    38d1:	53                   	push   %ebx
    38d2:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    38d5:	8b 45 08             	mov    0x8(%ebp),%eax
    38d8:	8d 70 07             	lea    0x7(%eax),%esi
    38db:	c1 ee 03             	shr    $0x3,%esi
    38de:	46                   	inc    %esi
  if((prevp = freep) == 0){
    38df:	8b 3d 00 5b 00 00    	mov    0x5b00,%edi
    38e5:	85 ff                	test   %edi,%edi
    38e7:	0f 84 a3 00 00 00    	je     3990 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    38ed:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    38ef:	8b 48 04             	mov    0x4(%eax),%ecx
    38f2:	39 f1                	cmp    %esi,%ecx
    38f4:	73 67                	jae    395d <malloc+0x91>
    38f6:	89 f3                	mov    %esi,%ebx
    38f8:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    38fe:	0f 82 80 00 00 00    	jb     3984 <malloc+0xb8>
  p = sbrk(nu * sizeof(Header));
    3904:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    390b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    390e:	eb 11                	jmp    3921 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3910:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    3912:	8b 4a 04             	mov    0x4(%edx),%ecx
    3915:	39 f1                	cmp    %esi,%ecx
    3917:	73 4b                	jae    3964 <malloc+0x98>
    3919:	8b 3d 00 5b 00 00    	mov    0x5b00,%edi
    391f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3921:	39 c7                	cmp    %eax,%edi
    3923:	75 eb                	jne    3910 <malloc+0x44>
  p = sbrk(nu * sizeof(Header));
    3925:	83 ec 0c             	sub    $0xc,%esp
    3928:	ff 75 e4             	pushl  -0x1c(%ebp)
    392b:	e8 dd fc ff ff       	call   360d <sbrk>
  if(p == (char*)-1)
    3930:	83 c4 10             	add    $0x10,%esp
    3933:	83 f8 ff             	cmp    $0xffffffff,%eax
    3936:	74 1b                	je     3953 <malloc+0x87>
  hp->s.size = nu;
    3938:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    393b:	83 ec 0c             	sub    $0xc,%esp
    393e:	83 c0 08             	add    $0x8,%eax
    3941:	50                   	push   %eax
    3942:	e8 05 ff ff ff       	call   384c <free>
  return freep;
    3947:	a1 00 5b 00 00       	mov    0x5b00,%eax
      if((p = morecore(nunits)) == 0)
    394c:	83 c4 10             	add    $0x10,%esp
    394f:	85 c0                	test   %eax,%eax
    3951:	75 bd                	jne    3910 <malloc+0x44>
        return 0;
    3953:	31 c0                	xor    %eax,%eax
  }
}
    3955:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3958:	5b                   	pop    %ebx
    3959:	5e                   	pop    %esi
    395a:	5f                   	pop    %edi
    395b:	5d                   	pop    %ebp
    395c:	c3                   	ret    
    if(p->s.size >= nunits){
    395d:	89 c2                	mov    %eax,%edx
    395f:	89 f8                	mov    %edi,%eax
    3961:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    3964:	39 ce                	cmp    %ecx,%esi
    3966:	74 54                	je     39bc <malloc+0xf0>
        p->s.size -= nunits;
    3968:	29 f1                	sub    %esi,%ecx
    396a:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    396d:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    3970:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    3973:	a3 00 5b 00 00       	mov    %eax,0x5b00
      return (void*)(p + 1);
    3978:	8d 42 08             	lea    0x8(%edx),%eax
}
    397b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    397e:	5b                   	pop    %ebx
    397f:	5e                   	pop    %esi
    3980:	5f                   	pop    %edi
    3981:	5d                   	pop    %ebp
    3982:	c3                   	ret    
    3983:	90                   	nop
    3984:	bb 00 10 00 00       	mov    $0x1000,%ebx
    3989:	e9 76 ff ff ff       	jmp    3904 <malloc+0x38>
    398e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    3990:	c7 05 00 5b 00 00 04 	movl   $0x5b04,0x5b00
    3997:	5b 00 00 
    399a:	c7 05 04 5b 00 00 04 	movl   $0x5b04,0x5b04
    39a1:	5b 00 00 
    base.s.size = 0;
    39a4:	c7 05 08 5b 00 00 00 	movl   $0x0,0x5b08
    39ab:	00 00 00 
    39ae:	bf 04 5b 00 00       	mov    $0x5b04,%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    39b3:	89 f8                	mov    %edi,%eax
    39b5:	e9 3c ff ff ff       	jmp    38f6 <malloc+0x2a>
    39ba:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
    39bc:	8b 0a                	mov    (%edx),%ecx
    39be:	89 08                	mov    %ecx,(%eax)
    39c0:	eb b1                	jmp    3973 <malloc+0xa7>
