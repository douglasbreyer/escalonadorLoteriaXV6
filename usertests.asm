
_usertests: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "iput test\n");
       6:	a1 5c 63 00 00       	mov    0x635c,%eax
       b:	83 ec 08             	sub    $0x8,%esp
       e:	68 b6 44 00 00       	push   $0x44b6
      13:	50                   	push   %eax
      14:	e8 d1 40 00 00       	call   40ea <printf>
      19:	83 c4 10             	add    $0x10,%esp

  if(mkdir("iputdir") < 0){
      1c:	83 ec 0c             	sub    $0xc,%esp
      1f:	68 c1 44 00 00       	push   $0x44c1
      24:	e8 b2 3f 00 00       	call   3fdb <mkdir>
      29:	83 c4 10             	add    $0x10,%esp
      2c:	85 c0                	test   %eax,%eax
      2e:	79 1b                	jns    4b <iputtest+0x4b>
    printf(stdout, "mkdir failed\n");
      30:	a1 5c 63 00 00       	mov    0x635c,%eax
      35:	83 ec 08             	sub    $0x8,%esp
      38:	68 c9 44 00 00       	push   $0x44c9
      3d:	50                   	push   %eax
      3e:	e8 a7 40 00 00       	call   40ea <printf>
      43:	83 c4 10             	add    $0x10,%esp
    exit();
      46:	e8 28 3f 00 00       	call   3f73 <exit>
  }
  if(chdir("iputdir") < 0){
      4b:	83 ec 0c             	sub    $0xc,%esp
      4e:	68 c1 44 00 00       	push   $0x44c1
      53:	e8 8b 3f 00 00       	call   3fe3 <chdir>
      58:	83 c4 10             	add    $0x10,%esp
      5b:	85 c0                	test   %eax,%eax
      5d:	79 1b                	jns    7a <iputtest+0x7a>
    printf(stdout, "chdir iputdir failed\n");
      5f:	a1 5c 63 00 00       	mov    0x635c,%eax
      64:	83 ec 08             	sub    $0x8,%esp
      67:	68 d7 44 00 00       	push   $0x44d7
      6c:	50                   	push   %eax
      6d:	e8 78 40 00 00       	call   40ea <printf>
      72:	83 c4 10             	add    $0x10,%esp
    exit();
      75:	e8 f9 3e 00 00       	call   3f73 <exit>
  }
  if(unlink("../iputdir") < 0){
      7a:	83 ec 0c             	sub    $0xc,%esp
      7d:	68 ed 44 00 00       	push   $0x44ed
      82:	e8 3c 3f 00 00       	call   3fc3 <unlink>
      87:	83 c4 10             	add    $0x10,%esp
      8a:	85 c0                	test   %eax,%eax
      8c:	79 1b                	jns    a9 <iputtest+0xa9>
    printf(stdout, "unlink ../iputdir failed\n");
      8e:	a1 5c 63 00 00       	mov    0x635c,%eax
      93:	83 ec 08             	sub    $0x8,%esp
      96:	68 f8 44 00 00       	push   $0x44f8
      9b:	50                   	push   %eax
      9c:	e8 49 40 00 00       	call   40ea <printf>
      a1:	83 c4 10             	add    $0x10,%esp
    exit();
      a4:	e8 ca 3e 00 00       	call   3f73 <exit>
  }
  if(chdir("/") < 0){
      a9:	83 ec 0c             	sub    $0xc,%esp
      ac:	68 12 45 00 00       	push   $0x4512
      b1:	e8 2d 3f 00 00       	call   3fe3 <chdir>
      b6:	83 c4 10             	add    $0x10,%esp
      b9:	85 c0                	test   %eax,%eax
      bb:	79 1b                	jns    d8 <iputtest+0xd8>
    printf(stdout, "chdir / failed\n");
      bd:	a1 5c 63 00 00       	mov    0x635c,%eax
      c2:	83 ec 08             	sub    $0x8,%esp
      c5:	68 14 45 00 00       	push   $0x4514
      ca:	50                   	push   %eax
      cb:	e8 1a 40 00 00       	call   40ea <printf>
      d0:	83 c4 10             	add    $0x10,%esp
    exit();
      d3:	e8 9b 3e 00 00       	call   3f73 <exit>
  }
  printf(stdout, "iput test ok\n");
      d8:	a1 5c 63 00 00       	mov    0x635c,%eax
      dd:	83 ec 08             	sub    $0x8,%esp
      e0:	68 24 45 00 00       	push   $0x4524
      e5:	50                   	push   %eax
      e6:	e8 ff 3f 00 00       	call   40ea <printf>
      eb:	83 c4 10             	add    $0x10,%esp
}
      ee:	90                   	nop
      ef:	c9                   	leave  
      f0:	c3                   	ret    

000000f1 <exitiputtest>:

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
      f1:	55                   	push   %ebp
      f2:	89 e5                	mov    %esp,%ebp
      f4:	83 ec 18             	sub    $0x18,%esp
  int pid;

  printf(stdout, "exitiput test\n");
      f7:	a1 5c 63 00 00       	mov    0x635c,%eax
      fc:	83 ec 08             	sub    $0x8,%esp
      ff:	68 32 45 00 00       	push   $0x4532
     104:	50                   	push   %eax
     105:	e8 e0 3f 00 00       	call   40ea <printf>
     10a:	83 c4 10             	add    $0x10,%esp

  pid = fork(0);
     10d:	83 ec 0c             	sub    $0xc,%esp
     110:	6a 00                	push   $0x0
     112:	e8 54 3e 00 00       	call   3f6b <fork>
     117:	83 c4 10             	add    $0x10,%esp
     11a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid < 0){
     11d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     121:	79 1b                	jns    13e <exitiputtest+0x4d>
    printf(stdout, "fork failed\n");
     123:	a1 5c 63 00 00       	mov    0x635c,%eax
     128:	83 ec 08             	sub    $0x8,%esp
     12b:	68 41 45 00 00       	push   $0x4541
     130:	50                   	push   %eax
     131:	e8 b4 3f 00 00       	call   40ea <printf>
     136:	83 c4 10             	add    $0x10,%esp
    exit();
     139:	e8 35 3e 00 00       	call   3f73 <exit>
  }
  if(pid == 0){
     13e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     142:	0f 85 92 00 00 00    	jne    1da <exitiputtest+0xe9>
    if(mkdir("iputdir") < 0){
     148:	83 ec 0c             	sub    $0xc,%esp
     14b:	68 c1 44 00 00       	push   $0x44c1
     150:	e8 86 3e 00 00       	call   3fdb <mkdir>
     155:	83 c4 10             	add    $0x10,%esp
     158:	85 c0                	test   %eax,%eax
     15a:	79 1b                	jns    177 <exitiputtest+0x86>
      printf(stdout, "mkdir failed\n");
     15c:	a1 5c 63 00 00       	mov    0x635c,%eax
     161:	83 ec 08             	sub    $0x8,%esp
     164:	68 c9 44 00 00       	push   $0x44c9
     169:	50                   	push   %eax
     16a:	e8 7b 3f 00 00       	call   40ea <printf>
     16f:	83 c4 10             	add    $0x10,%esp
      exit();
     172:	e8 fc 3d 00 00       	call   3f73 <exit>
    }
    if(chdir("iputdir") < 0){
     177:	83 ec 0c             	sub    $0xc,%esp
     17a:	68 c1 44 00 00       	push   $0x44c1
     17f:	e8 5f 3e 00 00       	call   3fe3 <chdir>
     184:	83 c4 10             	add    $0x10,%esp
     187:	85 c0                	test   %eax,%eax
     189:	79 1b                	jns    1a6 <exitiputtest+0xb5>
      printf(stdout, "child chdir failed\n");
     18b:	a1 5c 63 00 00       	mov    0x635c,%eax
     190:	83 ec 08             	sub    $0x8,%esp
     193:	68 4e 45 00 00       	push   $0x454e
     198:	50                   	push   %eax
     199:	e8 4c 3f 00 00       	call   40ea <printf>
     19e:	83 c4 10             	add    $0x10,%esp
      exit();
     1a1:	e8 cd 3d 00 00       	call   3f73 <exit>
    }
    if(unlink("../iputdir") < 0){
     1a6:	83 ec 0c             	sub    $0xc,%esp
     1a9:	68 ed 44 00 00       	push   $0x44ed
     1ae:	e8 10 3e 00 00       	call   3fc3 <unlink>
     1b3:	83 c4 10             	add    $0x10,%esp
     1b6:	85 c0                	test   %eax,%eax
     1b8:	79 1b                	jns    1d5 <exitiputtest+0xe4>
      printf(stdout, "unlink ../iputdir failed\n");
     1ba:	a1 5c 63 00 00       	mov    0x635c,%eax
     1bf:	83 ec 08             	sub    $0x8,%esp
     1c2:	68 f8 44 00 00       	push   $0x44f8
     1c7:	50                   	push   %eax
     1c8:	e8 1d 3f 00 00       	call   40ea <printf>
     1cd:	83 c4 10             	add    $0x10,%esp
      exit();
     1d0:	e8 9e 3d 00 00       	call   3f73 <exit>
    }
    exit();
     1d5:	e8 99 3d 00 00       	call   3f73 <exit>
  }
  wait();
     1da:	e8 9c 3d 00 00       	call   3f7b <wait>
  printf(stdout, "exitiput test ok\n");
     1df:	a1 5c 63 00 00       	mov    0x635c,%eax
     1e4:	83 ec 08             	sub    $0x8,%esp
     1e7:	68 62 45 00 00       	push   $0x4562
     1ec:	50                   	push   %eax
     1ed:	e8 f8 3e 00 00       	call   40ea <printf>
     1f2:	83 c4 10             	add    $0x10,%esp
}
     1f5:	90                   	nop
     1f6:	c9                   	leave  
     1f7:	c3                   	ret    

000001f8 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     1f8:	55                   	push   %ebp
     1f9:	89 e5                	mov    %esp,%ebp
     1fb:	83 ec 18             	sub    $0x18,%esp
  int pid;

  printf(stdout, "openiput test\n");
     1fe:	a1 5c 63 00 00       	mov    0x635c,%eax
     203:	83 ec 08             	sub    $0x8,%esp
     206:	68 74 45 00 00       	push   $0x4574
     20b:	50                   	push   %eax
     20c:	e8 d9 3e 00 00       	call   40ea <printf>
     211:	83 c4 10             	add    $0x10,%esp
  if(mkdir("oidir") < 0){
     214:	83 ec 0c             	sub    $0xc,%esp
     217:	68 83 45 00 00       	push   $0x4583
     21c:	e8 ba 3d 00 00       	call   3fdb <mkdir>
     221:	83 c4 10             	add    $0x10,%esp
     224:	85 c0                	test   %eax,%eax
     226:	79 1b                	jns    243 <openiputtest+0x4b>
    printf(stdout, "mkdir oidir failed\n");
     228:	a1 5c 63 00 00       	mov    0x635c,%eax
     22d:	83 ec 08             	sub    $0x8,%esp
     230:	68 89 45 00 00       	push   $0x4589
     235:	50                   	push   %eax
     236:	e8 af 3e 00 00       	call   40ea <printf>
     23b:	83 c4 10             	add    $0x10,%esp
    exit();
     23e:	e8 30 3d 00 00       	call   3f73 <exit>
  }
  pid = fork(0);
     243:	83 ec 0c             	sub    $0xc,%esp
     246:	6a 00                	push   $0x0
     248:	e8 1e 3d 00 00       	call   3f6b <fork>
     24d:	83 c4 10             	add    $0x10,%esp
     250:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid < 0){
     253:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     257:	79 1b                	jns    274 <openiputtest+0x7c>
    printf(stdout, "fork failed\n");
     259:	a1 5c 63 00 00       	mov    0x635c,%eax
     25e:	83 ec 08             	sub    $0x8,%esp
     261:	68 41 45 00 00       	push   $0x4541
     266:	50                   	push   %eax
     267:	e8 7e 3e 00 00       	call   40ea <printf>
     26c:	83 c4 10             	add    $0x10,%esp
    exit();
     26f:	e8 ff 3c 00 00       	call   3f73 <exit>
  }
  if(pid == 0){
     274:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     278:	75 3b                	jne    2b5 <openiputtest+0xbd>
    int fd = open("oidir", O_RDWR);
     27a:	83 ec 08             	sub    $0x8,%esp
     27d:	6a 02                	push   $0x2
     27f:	68 83 45 00 00       	push   $0x4583
     284:	e8 2a 3d 00 00       	call   3fb3 <open>
     289:	83 c4 10             	add    $0x10,%esp
     28c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0){
     28f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     293:	78 1b                	js     2b0 <openiputtest+0xb8>
      printf(stdout, "open directory for write succeeded\n");
     295:	a1 5c 63 00 00       	mov    0x635c,%eax
     29a:	83 ec 08             	sub    $0x8,%esp
     29d:	68 a0 45 00 00       	push   $0x45a0
     2a2:	50                   	push   %eax
     2a3:	e8 42 3e 00 00       	call   40ea <printf>
     2a8:	83 c4 10             	add    $0x10,%esp
      exit();
     2ab:	e8 c3 3c 00 00       	call   3f73 <exit>
    }
    exit();
     2b0:	e8 be 3c 00 00       	call   3f73 <exit>
  }
  sleep(1);
     2b5:	83 ec 0c             	sub    $0xc,%esp
     2b8:	6a 01                	push   $0x1
     2ba:	e8 44 3d 00 00       	call   4003 <sleep>
     2bf:	83 c4 10             	add    $0x10,%esp
  if(unlink("oidir") != 0){
     2c2:	83 ec 0c             	sub    $0xc,%esp
     2c5:	68 83 45 00 00       	push   $0x4583
     2ca:	e8 f4 3c 00 00       	call   3fc3 <unlink>
     2cf:	83 c4 10             	add    $0x10,%esp
     2d2:	85 c0                	test   %eax,%eax
     2d4:	74 1b                	je     2f1 <openiputtest+0xf9>
    printf(stdout, "unlink failed\n");
     2d6:	a1 5c 63 00 00       	mov    0x635c,%eax
     2db:	83 ec 08             	sub    $0x8,%esp
     2de:	68 c4 45 00 00       	push   $0x45c4
     2e3:	50                   	push   %eax
     2e4:	e8 01 3e 00 00       	call   40ea <printf>
     2e9:	83 c4 10             	add    $0x10,%esp
    exit();
     2ec:	e8 82 3c 00 00       	call   3f73 <exit>
  }
  wait();
     2f1:	e8 85 3c 00 00       	call   3f7b <wait>
  printf(stdout, "openiput test ok\n");
     2f6:	a1 5c 63 00 00       	mov    0x635c,%eax
     2fb:	83 ec 08             	sub    $0x8,%esp
     2fe:	68 d3 45 00 00       	push   $0x45d3
     303:	50                   	push   %eax
     304:	e8 e1 3d 00 00       	call   40ea <printf>
     309:	83 c4 10             	add    $0x10,%esp
}
     30c:	90                   	nop
     30d:	c9                   	leave  
     30e:	c3                   	ret    

0000030f <opentest>:

// simple file system tests

void
opentest(void)
{
     30f:	55                   	push   %ebp
     310:	89 e5                	mov    %esp,%ebp
     312:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(stdout, "open test\n");
     315:	a1 5c 63 00 00       	mov    0x635c,%eax
     31a:	83 ec 08             	sub    $0x8,%esp
     31d:	68 e5 45 00 00       	push   $0x45e5
     322:	50                   	push   %eax
     323:	e8 c2 3d 00 00       	call   40ea <printf>
     328:	83 c4 10             	add    $0x10,%esp
  fd = open("echo", 0);
     32b:	83 ec 08             	sub    $0x8,%esp
     32e:	6a 00                	push   $0x0
     330:	68 a0 44 00 00       	push   $0x44a0
     335:	e8 79 3c 00 00       	call   3fb3 <open>
     33a:	83 c4 10             	add    $0x10,%esp
     33d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
     340:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     344:	79 1b                	jns    361 <opentest+0x52>
    printf(stdout, "open echo failed!\n");
     346:	a1 5c 63 00 00       	mov    0x635c,%eax
     34b:	83 ec 08             	sub    $0x8,%esp
     34e:	68 f0 45 00 00       	push   $0x45f0
     353:	50                   	push   %eax
     354:	e8 91 3d 00 00       	call   40ea <printf>
     359:	83 c4 10             	add    $0x10,%esp
    exit();
     35c:	e8 12 3c 00 00       	call   3f73 <exit>
  }
  close(fd);
     361:	83 ec 0c             	sub    $0xc,%esp
     364:	ff 75 f4             	pushl  -0xc(%ebp)
     367:	e8 2f 3c 00 00       	call   3f9b <close>
     36c:	83 c4 10             	add    $0x10,%esp
  fd = open("doesnotexist", 0);
     36f:	83 ec 08             	sub    $0x8,%esp
     372:	6a 00                	push   $0x0
     374:	68 03 46 00 00       	push   $0x4603
     379:	e8 35 3c 00 00       	call   3fb3 <open>
     37e:	83 c4 10             	add    $0x10,%esp
     381:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
     384:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     388:	78 1b                	js     3a5 <opentest+0x96>
    printf(stdout, "open doesnotexist succeeded!\n");
     38a:	a1 5c 63 00 00       	mov    0x635c,%eax
     38f:	83 ec 08             	sub    $0x8,%esp
     392:	68 10 46 00 00       	push   $0x4610
     397:	50                   	push   %eax
     398:	e8 4d 3d 00 00       	call   40ea <printf>
     39d:	83 c4 10             	add    $0x10,%esp
    exit();
     3a0:	e8 ce 3b 00 00       	call   3f73 <exit>
  }
  printf(stdout, "open test ok\n");
     3a5:	a1 5c 63 00 00       	mov    0x635c,%eax
     3aa:	83 ec 08             	sub    $0x8,%esp
     3ad:	68 2e 46 00 00       	push   $0x462e
     3b2:	50                   	push   %eax
     3b3:	e8 32 3d 00 00       	call   40ea <printf>
     3b8:	83 c4 10             	add    $0x10,%esp
}
     3bb:	90                   	nop
     3bc:	c9                   	leave  
     3bd:	c3                   	ret    

000003be <writetest>:

void
writetest(void)
{
     3be:	55                   	push   %ebp
     3bf:	89 e5                	mov    %esp,%ebp
     3c1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int i;

  printf(stdout, "small file test\n");
     3c4:	a1 5c 63 00 00       	mov    0x635c,%eax
     3c9:	83 ec 08             	sub    $0x8,%esp
     3cc:	68 3c 46 00 00       	push   $0x463c
     3d1:	50                   	push   %eax
     3d2:	e8 13 3d 00 00       	call   40ea <printf>
     3d7:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_CREATE|O_RDWR);
     3da:	83 ec 08             	sub    $0x8,%esp
     3dd:	68 02 02 00 00       	push   $0x202
     3e2:	68 4d 46 00 00       	push   $0x464d
     3e7:	e8 c7 3b 00 00       	call   3fb3 <open>
     3ec:	83 c4 10             	add    $0x10,%esp
     3ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     3f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     3f6:	78 22                	js     41a <writetest+0x5c>
    printf(stdout, "creat small succeeded; ok\n");
     3f8:	a1 5c 63 00 00       	mov    0x635c,%eax
     3fd:	83 ec 08             	sub    $0x8,%esp
     400:	68 53 46 00 00       	push   $0x4653
     405:	50                   	push   %eax
     406:	e8 df 3c 00 00       	call   40ea <printf>
     40b:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     40e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     415:	e9 8f 00 00 00       	jmp    4a9 <writetest+0xeb>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     41a:	a1 5c 63 00 00       	mov    0x635c,%eax
     41f:	83 ec 08             	sub    $0x8,%esp
     422:	68 6e 46 00 00       	push   $0x466e
     427:	50                   	push   %eax
     428:	e8 bd 3c 00 00       	call   40ea <printf>
     42d:	83 c4 10             	add    $0x10,%esp
    exit();
     430:	e8 3e 3b 00 00       	call   3f73 <exit>
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     435:	83 ec 04             	sub    $0x4,%esp
     438:	6a 0a                	push   $0xa
     43a:	68 8a 46 00 00       	push   $0x468a
     43f:	ff 75 f0             	pushl  -0x10(%ebp)
     442:	e8 4c 3b 00 00       	call   3f93 <write>
     447:	83 c4 10             	add    $0x10,%esp
     44a:	83 f8 0a             	cmp    $0xa,%eax
     44d:	74 1e                	je     46d <writetest+0xaf>
      printf(stdout, "error: write aa %d new file failed\n", i);
     44f:	a1 5c 63 00 00       	mov    0x635c,%eax
     454:	83 ec 04             	sub    $0x4,%esp
     457:	ff 75 f4             	pushl  -0xc(%ebp)
     45a:	68 98 46 00 00       	push   $0x4698
     45f:	50                   	push   %eax
     460:	e8 85 3c 00 00       	call   40ea <printf>
     465:	83 c4 10             	add    $0x10,%esp
      exit();
     468:	e8 06 3b 00 00       	call   3f73 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     46d:	83 ec 04             	sub    $0x4,%esp
     470:	6a 0a                	push   $0xa
     472:	68 bc 46 00 00       	push   $0x46bc
     477:	ff 75 f0             	pushl  -0x10(%ebp)
     47a:	e8 14 3b 00 00       	call   3f93 <write>
     47f:	83 c4 10             	add    $0x10,%esp
     482:	83 f8 0a             	cmp    $0xa,%eax
     485:	74 1e                	je     4a5 <writetest+0xe7>
      printf(stdout, "error: write bb %d new file failed\n", i);
     487:	a1 5c 63 00 00       	mov    0x635c,%eax
     48c:	83 ec 04             	sub    $0x4,%esp
     48f:	ff 75 f4             	pushl  -0xc(%ebp)
     492:	68 c8 46 00 00       	push   $0x46c8
     497:	50                   	push   %eax
     498:	e8 4d 3c 00 00       	call   40ea <printf>
     49d:	83 c4 10             	add    $0x10,%esp
      exit();
     4a0:	e8 ce 3a 00 00       	call   3f73 <exit>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     4a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     4a9:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     4ad:	7e 86                	jle    435 <writetest+0x77>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     4af:	a1 5c 63 00 00       	mov    0x635c,%eax
     4b4:	83 ec 08             	sub    $0x8,%esp
     4b7:	68 ec 46 00 00       	push   $0x46ec
     4bc:	50                   	push   %eax
     4bd:	e8 28 3c 00 00       	call   40ea <printf>
     4c2:	83 c4 10             	add    $0x10,%esp
  close(fd);
     4c5:	83 ec 0c             	sub    $0xc,%esp
     4c8:	ff 75 f0             	pushl  -0x10(%ebp)
     4cb:	e8 cb 3a 00 00       	call   3f9b <close>
     4d0:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_RDONLY);
     4d3:	83 ec 08             	sub    $0x8,%esp
     4d6:	6a 00                	push   $0x0
     4d8:	68 4d 46 00 00       	push   $0x464d
     4dd:	e8 d1 3a 00 00       	call   3fb3 <open>
     4e2:	83 c4 10             	add    $0x10,%esp
     4e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     4e8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     4ec:	78 3c                	js     52a <writetest+0x16c>
    printf(stdout, "open small succeeded ok\n");
     4ee:	a1 5c 63 00 00       	mov    0x635c,%eax
     4f3:	83 ec 08             	sub    $0x8,%esp
     4f6:	68 f7 46 00 00       	push   $0x46f7
     4fb:	50                   	push   %eax
     4fc:	e8 e9 3b 00 00       	call   40ea <printf>
     501:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     504:	83 ec 04             	sub    $0x4,%esp
     507:	68 d0 07 00 00       	push   $0x7d0
     50c:	68 40 8b 00 00       	push   $0x8b40
     511:	ff 75 f0             	pushl  -0x10(%ebp)
     514:	e8 72 3a 00 00       	call   3f8b <read>
     519:	83 c4 10             	add    $0x10,%esp
     51c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(i == 2000){
     51f:	81 7d f4 d0 07 00 00 	cmpl   $0x7d0,-0xc(%ebp)
     526:	75 57                	jne    57f <writetest+0x1c1>
     528:	eb 1b                	jmp    545 <writetest+0x187>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     52a:	a1 5c 63 00 00       	mov    0x635c,%eax
     52f:	83 ec 08             	sub    $0x8,%esp
     532:	68 10 47 00 00       	push   $0x4710
     537:	50                   	push   %eax
     538:	e8 ad 3b 00 00       	call   40ea <printf>
     53d:	83 c4 10             	add    $0x10,%esp
    exit();
     540:	e8 2e 3a 00 00       	call   3f73 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
     545:	a1 5c 63 00 00       	mov    0x635c,%eax
     54a:	83 ec 08             	sub    $0x8,%esp
     54d:	68 2b 47 00 00       	push   $0x472b
     552:	50                   	push   %eax
     553:	e8 92 3b 00 00       	call   40ea <printf>
     558:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     55b:	83 ec 0c             	sub    $0xc,%esp
     55e:	ff 75 f0             	pushl  -0x10(%ebp)
     561:	e8 35 3a 00 00       	call   3f9b <close>
     566:	83 c4 10             	add    $0x10,%esp

  if(unlink("small") < 0){
     569:	83 ec 0c             	sub    $0xc,%esp
     56c:	68 4d 46 00 00       	push   $0x464d
     571:	e8 4d 3a 00 00       	call   3fc3 <unlink>
     576:	83 c4 10             	add    $0x10,%esp
     579:	85 c0                	test   %eax,%eax
     57b:	79 38                	jns    5b5 <writetest+0x1f7>
     57d:	eb 1b                	jmp    59a <writetest+0x1dc>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     57f:	a1 5c 63 00 00       	mov    0x635c,%eax
     584:	83 ec 08             	sub    $0x8,%esp
     587:	68 3e 47 00 00       	push   $0x473e
     58c:	50                   	push   %eax
     58d:	e8 58 3b 00 00       	call   40ea <printf>
     592:	83 c4 10             	add    $0x10,%esp
    exit();
     595:	e8 d9 39 00 00       	call   3f73 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     59a:	a1 5c 63 00 00       	mov    0x635c,%eax
     59f:	83 ec 08             	sub    $0x8,%esp
     5a2:	68 4b 47 00 00       	push   $0x474b
     5a7:	50                   	push   %eax
     5a8:	e8 3d 3b 00 00       	call   40ea <printf>
     5ad:	83 c4 10             	add    $0x10,%esp
    exit();
     5b0:	e8 be 39 00 00       	call   3f73 <exit>
  }
  printf(stdout, "small file test ok\n");
     5b5:	a1 5c 63 00 00       	mov    0x635c,%eax
     5ba:	83 ec 08             	sub    $0x8,%esp
     5bd:	68 60 47 00 00       	push   $0x4760
     5c2:	50                   	push   %eax
     5c3:	e8 22 3b 00 00       	call   40ea <printf>
     5c8:	83 c4 10             	add    $0x10,%esp
}
     5cb:	90                   	nop
     5cc:	c9                   	leave  
     5cd:	c3                   	ret    

000005ce <writetest1>:

void
writetest1(void)
{
     5ce:	55                   	push   %ebp
     5cf:	89 e5                	mov    %esp,%ebp
     5d1:	83 ec 18             	sub    $0x18,%esp
  int i, fd, n;

  printf(stdout, "big files test\n");
     5d4:	a1 5c 63 00 00       	mov    0x635c,%eax
     5d9:	83 ec 08             	sub    $0x8,%esp
     5dc:	68 74 47 00 00       	push   $0x4774
     5e1:	50                   	push   %eax
     5e2:	e8 03 3b 00 00       	call   40ea <printf>
     5e7:	83 c4 10             	add    $0x10,%esp

  fd = open("big", O_CREATE|O_RDWR);
     5ea:	83 ec 08             	sub    $0x8,%esp
     5ed:	68 02 02 00 00       	push   $0x202
     5f2:	68 84 47 00 00       	push   $0x4784
     5f7:	e8 b7 39 00 00       	call   3fb3 <open>
     5fc:	83 c4 10             	add    $0x10,%esp
     5ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     602:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     606:	79 1b                	jns    623 <writetest1+0x55>
    printf(stdout, "error: creat big failed!\n");
     608:	a1 5c 63 00 00       	mov    0x635c,%eax
     60d:	83 ec 08             	sub    $0x8,%esp
     610:	68 88 47 00 00       	push   $0x4788
     615:	50                   	push   %eax
     616:	e8 cf 3a 00 00       	call   40ea <printf>
     61b:	83 c4 10             	add    $0x10,%esp
    exit();
     61e:	e8 50 39 00 00       	call   3f73 <exit>
  }

  for(i = 0; i < MAXFILE; i++){
     623:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     62a:	eb 4b                	jmp    677 <writetest1+0xa9>
    ((int*)buf)[0] = i;
     62c:	ba 40 8b 00 00       	mov    $0x8b40,%edx
     631:	8b 45 f4             	mov    -0xc(%ebp),%eax
     634:	89 02                	mov    %eax,(%edx)
    if(write(fd, buf, 512) != 512){
     636:	83 ec 04             	sub    $0x4,%esp
     639:	68 00 02 00 00       	push   $0x200
     63e:	68 40 8b 00 00       	push   $0x8b40
     643:	ff 75 ec             	pushl  -0x14(%ebp)
     646:	e8 48 39 00 00       	call   3f93 <write>
     64b:	83 c4 10             	add    $0x10,%esp
     64e:	3d 00 02 00 00       	cmp    $0x200,%eax
     653:	74 1e                	je     673 <writetest1+0xa5>
      printf(stdout, "error: write big file failed\n", i);
     655:	a1 5c 63 00 00       	mov    0x635c,%eax
     65a:	83 ec 04             	sub    $0x4,%esp
     65d:	ff 75 f4             	pushl  -0xc(%ebp)
     660:	68 a2 47 00 00       	push   $0x47a2
     665:	50                   	push   %eax
     666:	e8 7f 3a 00 00       	call   40ea <printf>
     66b:	83 c4 10             	add    $0x10,%esp
      exit();
     66e:	e8 00 39 00 00       	call   3f73 <exit>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     673:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     677:	8b 45 f4             	mov    -0xc(%ebp),%eax
     67a:	3d 8b 00 00 00       	cmp    $0x8b,%eax
     67f:	76 ab                	jbe    62c <writetest1+0x5e>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     681:	83 ec 0c             	sub    $0xc,%esp
     684:	ff 75 ec             	pushl  -0x14(%ebp)
     687:	e8 0f 39 00 00       	call   3f9b <close>
     68c:	83 c4 10             	add    $0x10,%esp

  fd = open("big", O_RDONLY);
     68f:	83 ec 08             	sub    $0x8,%esp
     692:	6a 00                	push   $0x0
     694:	68 84 47 00 00       	push   $0x4784
     699:	e8 15 39 00 00       	call   3fb3 <open>
     69e:	83 c4 10             	add    $0x10,%esp
     6a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     6a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     6a8:	79 1b                	jns    6c5 <writetest1+0xf7>
    printf(stdout, "error: open big failed!\n");
     6aa:	a1 5c 63 00 00       	mov    0x635c,%eax
     6af:	83 ec 08             	sub    $0x8,%esp
     6b2:	68 c0 47 00 00       	push   $0x47c0
     6b7:	50                   	push   %eax
     6b8:	e8 2d 3a 00 00       	call   40ea <printf>
     6bd:	83 c4 10             	add    $0x10,%esp
    exit();
     6c0:	e8 ae 38 00 00       	call   3f73 <exit>
  }

  n = 0;
     6c5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(;;){
    i = read(fd, buf, 512);
     6cc:	83 ec 04             	sub    $0x4,%esp
     6cf:	68 00 02 00 00       	push   $0x200
     6d4:	68 40 8b 00 00       	push   $0x8b40
     6d9:	ff 75 ec             	pushl  -0x14(%ebp)
     6dc:	e8 aa 38 00 00       	call   3f8b <read>
     6e1:	83 c4 10             	add    $0x10,%esp
     6e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(i == 0){
     6e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     6eb:	75 27                	jne    714 <writetest1+0x146>
      if(n == MAXFILE - 1){
     6ed:	81 7d f0 8b 00 00 00 	cmpl   $0x8b,-0x10(%ebp)
     6f4:	75 7d                	jne    773 <writetest1+0x1a5>
        printf(stdout, "read only %d blocks from big", n);
     6f6:	a1 5c 63 00 00       	mov    0x635c,%eax
     6fb:	83 ec 04             	sub    $0x4,%esp
     6fe:	ff 75 f0             	pushl  -0x10(%ebp)
     701:	68 d9 47 00 00       	push   $0x47d9
     706:	50                   	push   %eax
     707:	e8 de 39 00 00       	call   40ea <printf>
     70c:	83 c4 10             	add    $0x10,%esp
        exit();
     70f:	e8 5f 38 00 00       	call   3f73 <exit>
      }
      break;
    } else if(i != 512){
     714:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
     71b:	74 1e                	je     73b <writetest1+0x16d>
      printf(stdout, "read failed %d\n", i);
     71d:	a1 5c 63 00 00       	mov    0x635c,%eax
     722:	83 ec 04             	sub    $0x4,%esp
     725:	ff 75 f4             	pushl  -0xc(%ebp)
     728:	68 f6 47 00 00       	push   $0x47f6
     72d:	50                   	push   %eax
     72e:	e8 b7 39 00 00       	call   40ea <printf>
     733:	83 c4 10             	add    $0x10,%esp
      exit();
     736:	e8 38 38 00 00       	call   3f73 <exit>
    }
    if(((int*)buf)[0] != n){
     73b:	b8 40 8b 00 00       	mov    $0x8b40,%eax
     740:	8b 00                	mov    (%eax),%eax
     742:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     745:	74 23                	je     76a <writetest1+0x19c>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
     747:	b8 40 8b 00 00       	mov    $0x8b40,%eax
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     74c:	8b 10                	mov    (%eax),%edx
     74e:	a1 5c 63 00 00       	mov    0x635c,%eax
     753:	52                   	push   %edx
     754:	ff 75 f0             	pushl  -0x10(%ebp)
     757:	68 08 48 00 00       	push   $0x4808
     75c:	50                   	push   %eax
     75d:	e8 88 39 00 00       	call   40ea <printf>
     762:	83 c4 10             	add    $0x10,%esp
             n, ((int*)buf)[0]);
      exit();
     765:	e8 09 38 00 00       	call   3f73 <exit>
    }
    n++;
     76a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }
     76e:	e9 59 ff ff ff       	jmp    6cc <writetest1+0xfe>
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
     773:	90                   	nop
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     774:	83 ec 0c             	sub    $0xc,%esp
     777:	ff 75 ec             	pushl  -0x14(%ebp)
     77a:	e8 1c 38 00 00       	call   3f9b <close>
     77f:	83 c4 10             	add    $0x10,%esp
  if(unlink("big") < 0){
     782:	83 ec 0c             	sub    $0xc,%esp
     785:	68 84 47 00 00       	push   $0x4784
     78a:	e8 34 38 00 00       	call   3fc3 <unlink>
     78f:	83 c4 10             	add    $0x10,%esp
     792:	85 c0                	test   %eax,%eax
     794:	79 1b                	jns    7b1 <writetest1+0x1e3>
    printf(stdout, "unlink big failed\n");
     796:	a1 5c 63 00 00       	mov    0x635c,%eax
     79b:	83 ec 08             	sub    $0x8,%esp
     79e:	68 28 48 00 00       	push   $0x4828
     7a3:	50                   	push   %eax
     7a4:	e8 41 39 00 00       	call   40ea <printf>
     7a9:	83 c4 10             	add    $0x10,%esp
    exit();
     7ac:	e8 c2 37 00 00       	call   3f73 <exit>
  }
  printf(stdout, "big files ok\n");
     7b1:	a1 5c 63 00 00       	mov    0x635c,%eax
     7b6:	83 ec 08             	sub    $0x8,%esp
     7b9:	68 3b 48 00 00       	push   $0x483b
     7be:	50                   	push   %eax
     7bf:	e8 26 39 00 00       	call   40ea <printf>
     7c4:	83 c4 10             	add    $0x10,%esp
}
     7c7:	90                   	nop
     7c8:	c9                   	leave  
     7c9:	c3                   	ret    

000007ca <createtest>:

void
createtest(void)
{
     7ca:	55                   	push   %ebp
     7cb:	89 e5                	mov    %esp,%ebp
     7cd:	83 ec 18             	sub    $0x18,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     7d0:	a1 5c 63 00 00       	mov    0x635c,%eax
     7d5:	83 ec 08             	sub    $0x8,%esp
     7d8:	68 4c 48 00 00       	push   $0x484c
     7dd:	50                   	push   %eax
     7de:	e8 07 39 00 00       	call   40ea <printf>
     7e3:	83 c4 10             	add    $0x10,%esp

  name[0] = 'a';
     7e6:	c6 05 40 ab 00 00 61 	movb   $0x61,0xab40
  name[2] = '\0';
     7ed:	c6 05 42 ab 00 00 00 	movb   $0x0,0xab42
  for(i = 0; i < 52; i++){
     7f4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     7fb:	eb 35                	jmp    832 <createtest+0x68>
    name[1] = '0' + i;
     7fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     800:	83 c0 30             	add    $0x30,%eax
     803:	a2 41 ab 00 00       	mov    %al,0xab41
    fd = open(name, O_CREATE|O_RDWR);
     808:	83 ec 08             	sub    $0x8,%esp
     80b:	68 02 02 00 00       	push   $0x202
     810:	68 40 ab 00 00       	push   $0xab40
     815:	e8 99 37 00 00       	call   3fb3 <open>
     81a:	83 c4 10             	add    $0x10,%esp
     81d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(fd);
     820:	83 ec 0c             	sub    $0xc,%esp
     823:	ff 75 f0             	pushl  -0x10(%ebp)
     826:	e8 70 37 00 00       	call   3f9b <close>
     82b:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     82e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     832:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     836:	7e c5                	jle    7fd <createtest+0x33>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     838:	c6 05 40 ab 00 00 61 	movb   $0x61,0xab40
  name[2] = '\0';
     83f:	c6 05 42 ab 00 00 00 	movb   $0x0,0xab42
  for(i = 0; i < 52; i++){
     846:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     84d:	eb 1f                	jmp    86e <createtest+0xa4>
    name[1] = '0' + i;
     84f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     852:	83 c0 30             	add    $0x30,%eax
     855:	a2 41 ab 00 00       	mov    %al,0xab41
    unlink(name);
     85a:	83 ec 0c             	sub    $0xc,%esp
     85d:	68 40 ab 00 00       	push   $0xab40
     862:	e8 5c 37 00 00       	call   3fc3 <unlink>
     867:	83 c4 10             	add    $0x10,%esp
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     86a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     86e:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     872:	7e db                	jle    84f <createtest+0x85>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     874:	a1 5c 63 00 00       	mov    0x635c,%eax
     879:	83 ec 08             	sub    $0x8,%esp
     87c:	68 74 48 00 00       	push   $0x4874
     881:	50                   	push   %eax
     882:	e8 63 38 00 00       	call   40ea <printf>
     887:	83 c4 10             	add    $0x10,%esp
}
     88a:	90                   	nop
     88b:	c9                   	leave  
     88c:	c3                   	ret    

0000088d <dirtest>:

void dirtest(void)
{
     88d:	55                   	push   %ebp
     88e:	89 e5                	mov    %esp,%ebp
     890:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "mkdir test\n");
     893:	a1 5c 63 00 00       	mov    0x635c,%eax
     898:	83 ec 08             	sub    $0x8,%esp
     89b:	68 9a 48 00 00       	push   $0x489a
     8a0:	50                   	push   %eax
     8a1:	e8 44 38 00 00       	call   40ea <printf>
     8a6:	83 c4 10             	add    $0x10,%esp

  if(mkdir("dir0") < 0){
     8a9:	83 ec 0c             	sub    $0xc,%esp
     8ac:	68 a6 48 00 00       	push   $0x48a6
     8b1:	e8 25 37 00 00       	call   3fdb <mkdir>
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	85 c0                	test   %eax,%eax
     8bb:	79 1b                	jns    8d8 <dirtest+0x4b>
    printf(stdout, "mkdir failed\n");
     8bd:	a1 5c 63 00 00       	mov    0x635c,%eax
     8c2:	83 ec 08             	sub    $0x8,%esp
     8c5:	68 c9 44 00 00       	push   $0x44c9
     8ca:	50                   	push   %eax
     8cb:	e8 1a 38 00 00       	call   40ea <printf>
     8d0:	83 c4 10             	add    $0x10,%esp
    exit();
     8d3:	e8 9b 36 00 00       	call   3f73 <exit>
  }

  if(chdir("dir0") < 0){
     8d8:	83 ec 0c             	sub    $0xc,%esp
     8db:	68 a6 48 00 00       	push   $0x48a6
     8e0:	e8 fe 36 00 00       	call   3fe3 <chdir>
     8e5:	83 c4 10             	add    $0x10,%esp
     8e8:	85 c0                	test   %eax,%eax
     8ea:	79 1b                	jns    907 <dirtest+0x7a>
    printf(stdout, "chdir dir0 failed\n");
     8ec:	a1 5c 63 00 00       	mov    0x635c,%eax
     8f1:	83 ec 08             	sub    $0x8,%esp
     8f4:	68 ab 48 00 00       	push   $0x48ab
     8f9:	50                   	push   %eax
     8fa:	e8 eb 37 00 00       	call   40ea <printf>
     8ff:	83 c4 10             	add    $0x10,%esp
    exit();
     902:	e8 6c 36 00 00       	call   3f73 <exit>
  }

  if(chdir("..") < 0){
     907:	83 ec 0c             	sub    $0xc,%esp
     90a:	68 be 48 00 00       	push   $0x48be
     90f:	e8 cf 36 00 00       	call   3fe3 <chdir>
     914:	83 c4 10             	add    $0x10,%esp
     917:	85 c0                	test   %eax,%eax
     919:	79 1b                	jns    936 <dirtest+0xa9>
    printf(stdout, "chdir .. failed\n");
     91b:	a1 5c 63 00 00       	mov    0x635c,%eax
     920:	83 ec 08             	sub    $0x8,%esp
     923:	68 c1 48 00 00       	push   $0x48c1
     928:	50                   	push   %eax
     929:	e8 bc 37 00 00       	call   40ea <printf>
     92e:	83 c4 10             	add    $0x10,%esp
    exit();
     931:	e8 3d 36 00 00       	call   3f73 <exit>
  }

  if(unlink("dir0") < 0){
     936:	83 ec 0c             	sub    $0xc,%esp
     939:	68 a6 48 00 00       	push   $0x48a6
     93e:	e8 80 36 00 00       	call   3fc3 <unlink>
     943:	83 c4 10             	add    $0x10,%esp
     946:	85 c0                	test   %eax,%eax
     948:	79 1b                	jns    965 <dirtest+0xd8>
    printf(stdout, "unlink dir0 failed\n");
     94a:	a1 5c 63 00 00       	mov    0x635c,%eax
     94f:	83 ec 08             	sub    $0x8,%esp
     952:	68 d2 48 00 00       	push   $0x48d2
     957:	50                   	push   %eax
     958:	e8 8d 37 00 00       	call   40ea <printf>
     95d:	83 c4 10             	add    $0x10,%esp
    exit();
     960:	e8 0e 36 00 00       	call   3f73 <exit>
  }
  printf(stdout, "mkdir test ok\n");
     965:	a1 5c 63 00 00       	mov    0x635c,%eax
     96a:	83 ec 08             	sub    $0x8,%esp
     96d:	68 e6 48 00 00       	push   $0x48e6
     972:	50                   	push   %eax
     973:	e8 72 37 00 00       	call   40ea <printf>
     978:	83 c4 10             	add    $0x10,%esp
}
     97b:	90                   	nop
     97c:	c9                   	leave  
     97d:	c3                   	ret    

0000097e <exectest>:

void
exectest(void)
{
     97e:	55                   	push   %ebp
     97f:	89 e5                	mov    %esp,%ebp
     981:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "exec test\n");
     984:	a1 5c 63 00 00       	mov    0x635c,%eax
     989:	83 ec 08             	sub    $0x8,%esp
     98c:	68 f5 48 00 00       	push   $0x48f5
     991:	50                   	push   %eax
     992:	e8 53 37 00 00       	call   40ea <printf>
     997:	83 c4 10             	add    $0x10,%esp
  if(exec("echo", echoargv) < 0){
     99a:	83 ec 08             	sub    $0x8,%esp
     99d:	68 48 63 00 00       	push   $0x6348
     9a2:	68 a0 44 00 00       	push   $0x44a0
     9a7:	e8 ff 35 00 00       	call   3fab <exec>
     9ac:	83 c4 10             	add    $0x10,%esp
     9af:	85 c0                	test   %eax,%eax
     9b1:	79 1b                	jns    9ce <exectest+0x50>
    printf(stdout, "exec echo failed\n");
     9b3:	a1 5c 63 00 00       	mov    0x635c,%eax
     9b8:	83 ec 08             	sub    $0x8,%esp
     9bb:	68 00 49 00 00       	push   $0x4900
     9c0:	50                   	push   %eax
     9c1:	e8 24 37 00 00       	call   40ea <printf>
     9c6:	83 c4 10             	add    $0x10,%esp
    exit();
     9c9:	e8 a5 35 00 00       	call   3f73 <exit>
  }
}
     9ce:	90                   	nop
     9cf:	c9                   	leave  
     9d0:	c3                   	ret    

000009d1 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     9d1:	55                   	push   %ebp
     9d2:	89 e5                	mov    %esp,%ebp
     9d4:	83 ec 28             	sub    $0x28,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     9d7:	83 ec 0c             	sub    $0xc,%esp
     9da:	8d 45 d8             	lea    -0x28(%ebp),%eax
     9dd:	50                   	push   %eax
     9de:	e8 a0 35 00 00       	call   3f83 <pipe>
     9e3:	83 c4 10             	add    $0x10,%esp
     9e6:	85 c0                	test   %eax,%eax
     9e8:	74 17                	je     a01 <pipe1+0x30>
    printf(1, "pipe() failed\n");
     9ea:	83 ec 08             	sub    $0x8,%esp
     9ed:	68 12 49 00 00       	push   $0x4912
     9f2:	6a 01                	push   $0x1
     9f4:	e8 f1 36 00 00       	call   40ea <printf>
     9f9:	83 c4 10             	add    $0x10,%esp
    exit();
     9fc:	e8 72 35 00 00       	call   3f73 <exit>
  }
  pid = fork(0);
     a01:	83 ec 0c             	sub    $0xc,%esp
     a04:	6a 00                	push   $0x0
     a06:	e8 60 35 00 00       	call   3f6b <fork>
     a0b:	83 c4 10             	add    $0x10,%esp
     a0e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  seq = 0;
     a11:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(pid == 0){
     a18:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     a1c:	0f 85 89 00 00 00    	jne    aab <pipe1+0xda>
    close(fds[0]);
     a22:	8b 45 d8             	mov    -0x28(%ebp),%eax
     a25:	83 ec 0c             	sub    $0xc,%esp
     a28:	50                   	push   %eax
     a29:	e8 6d 35 00 00       	call   3f9b <close>
     a2e:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
     a31:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     a38:	eb 66                	jmp    aa0 <pipe1+0xcf>
      for(i = 0; i < 1033; i++)
     a3a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     a41:	eb 19                	jmp    a5c <pipe1+0x8b>
        buf[i] = seq++;
     a43:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a46:	8d 50 01             	lea    0x1(%eax),%edx
     a49:	89 55 f4             	mov    %edx,-0xc(%ebp)
     a4c:	89 c2                	mov    %eax,%edx
     a4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a51:	05 40 8b 00 00       	add    $0x8b40,%eax
     a56:	88 10                	mov    %dl,(%eax)
  pid = fork(0);
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     a58:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     a5c:	81 7d f0 08 04 00 00 	cmpl   $0x408,-0x10(%ebp)
     a63:	7e de                	jle    a43 <pipe1+0x72>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     a65:	8b 45 dc             	mov    -0x24(%ebp),%eax
     a68:	83 ec 04             	sub    $0x4,%esp
     a6b:	68 09 04 00 00       	push   $0x409
     a70:	68 40 8b 00 00       	push   $0x8b40
     a75:	50                   	push   %eax
     a76:	e8 18 35 00 00       	call   3f93 <write>
     a7b:	83 c4 10             	add    $0x10,%esp
     a7e:	3d 09 04 00 00       	cmp    $0x409,%eax
     a83:	74 17                	je     a9c <pipe1+0xcb>
        printf(1, "pipe1 oops 1\n");
     a85:	83 ec 08             	sub    $0x8,%esp
     a88:	68 21 49 00 00       	push   $0x4921
     a8d:	6a 01                	push   $0x1
     a8f:	e8 56 36 00 00       	call   40ea <printf>
     a94:	83 c4 10             	add    $0x10,%esp
        exit();
     a97:	e8 d7 34 00 00       	call   3f73 <exit>
  }
  pid = fork(0);
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     a9c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
     aa0:	83 7d ec 04          	cmpl   $0x4,-0x14(%ebp)
     aa4:	7e 94                	jle    a3a <pipe1+0x69>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     aa6:	e8 c8 34 00 00       	call   3f73 <exit>
  } else if(pid > 0){
     aab:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     aaf:	0f 8e f4 00 00 00    	jle    ba9 <pipe1+0x1d8>
    close(fds[1]);
     ab5:	8b 45 dc             	mov    -0x24(%ebp),%eax
     ab8:	83 ec 0c             	sub    $0xc,%esp
     abb:	50                   	push   %eax
     abc:	e8 da 34 00 00       	call   3f9b <close>
     ac1:	83 c4 10             	add    $0x10,%esp
    total = 0;
     ac4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    cc = 1;
     acb:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     ad2:	eb 66                	jmp    b3a <pipe1+0x169>
      for(i = 0; i < n; i++){
     ad4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     adb:	eb 3b                	jmp    b18 <pipe1+0x147>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     add:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ae0:	05 40 8b 00 00       	add    $0x8b40,%eax
     ae5:	0f b6 00             	movzbl (%eax),%eax
     ae8:	0f be c8             	movsbl %al,%ecx
     aeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aee:	8d 50 01             	lea    0x1(%eax),%edx
     af1:	89 55 f4             	mov    %edx,-0xc(%ebp)
     af4:	31 c8                	xor    %ecx,%eax
     af6:	0f b6 c0             	movzbl %al,%eax
     af9:	85 c0                	test   %eax,%eax
     afb:	74 17                	je     b14 <pipe1+0x143>
          printf(1, "pipe1 oops 2\n");
     afd:	83 ec 08             	sub    $0x8,%esp
     b00:	68 2f 49 00 00       	push   $0x492f
     b05:	6a 01                	push   $0x1
     b07:	e8 de 35 00 00       	call   40ea <printf>
     b0c:	83 c4 10             	add    $0x10,%esp
     b0f:	e9 ac 00 00 00       	jmp    bc0 <pipe1+0x1ef>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     b14:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     b18:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b1b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     b1e:	7c bd                	jl     add <pipe1+0x10c>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     b20:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b23:	01 45 e4             	add    %eax,-0x1c(%ebp)
      cc = cc * 2;
     b26:	d1 65 e8             	shll   -0x18(%ebp)
      if(cc > sizeof(buf))
     b29:	8b 45 e8             	mov    -0x18(%ebp),%eax
     b2c:	3d 00 20 00 00       	cmp    $0x2000,%eax
     b31:	76 07                	jbe    b3a <pipe1+0x169>
        cc = sizeof(buf);
     b33:	c7 45 e8 00 20 00 00 	movl   $0x2000,-0x18(%ebp)
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     b3a:	8b 45 d8             	mov    -0x28(%ebp),%eax
     b3d:	83 ec 04             	sub    $0x4,%esp
     b40:	ff 75 e8             	pushl  -0x18(%ebp)
     b43:	68 40 8b 00 00       	push   $0x8b40
     b48:	50                   	push   %eax
     b49:	e8 3d 34 00 00       	call   3f8b <read>
     b4e:	83 c4 10             	add    $0x10,%esp
     b51:	89 45 ec             	mov    %eax,-0x14(%ebp)
     b54:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     b58:	0f 8f 76 ff ff ff    	jg     ad4 <pipe1+0x103>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     b5e:	81 7d e4 2d 14 00 00 	cmpl   $0x142d,-0x1c(%ebp)
     b65:	74 1a                	je     b81 <pipe1+0x1b0>
      printf(1, "pipe1 oops 3 total %d\n", total);
     b67:	83 ec 04             	sub    $0x4,%esp
     b6a:	ff 75 e4             	pushl  -0x1c(%ebp)
     b6d:	68 3d 49 00 00       	push   $0x493d
     b72:	6a 01                	push   $0x1
     b74:	e8 71 35 00 00       	call   40ea <printf>
     b79:	83 c4 10             	add    $0x10,%esp
      exit();
     b7c:	e8 f2 33 00 00       	call   3f73 <exit>
    }
    close(fds[0]);
     b81:	8b 45 d8             	mov    -0x28(%ebp),%eax
     b84:	83 ec 0c             	sub    $0xc,%esp
     b87:	50                   	push   %eax
     b88:	e8 0e 34 00 00       	call   3f9b <close>
     b8d:	83 c4 10             	add    $0x10,%esp
    wait();
     b90:	e8 e6 33 00 00       	call   3f7b <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     b95:	83 ec 08             	sub    $0x8,%esp
     b98:	68 63 49 00 00       	push   $0x4963
     b9d:	6a 01                	push   $0x1
     b9f:	e8 46 35 00 00       	call   40ea <printf>
     ba4:	83 c4 10             	add    $0x10,%esp
     ba7:	eb 17                	jmp    bc0 <pipe1+0x1ef>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     ba9:	83 ec 08             	sub    $0x8,%esp
     bac:	68 54 49 00 00       	push   $0x4954
     bb1:	6a 01                	push   $0x1
     bb3:	e8 32 35 00 00       	call   40ea <printf>
     bb8:	83 c4 10             	add    $0x10,%esp
    exit();
     bbb:	e8 b3 33 00 00       	call   3f73 <exit>
  }
  printf(1, "pipe1 ok\n");
}
     bc0:	c9                   	leave  
     bc1:	c3                   	ret    

00000bc2 <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     bc2:	55                   	push   %ebp
     bc3:	89 e5                	mov    %esp,%ebp
     bc5:	83 ec 28             	sub    $0x28,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     bc8:	83 ec 08             	sub    $0x8,%esp
     bcb:	68 6d 49 00 00       	push   $0x496d
     bd0:	6a 01                	push   $0x1
     bd2:	e8 13 35 00 00       	call   40ea <printf>
     bd7:	83 c4 10             	add    $0x10,%esp
  pid1 = fork(0);
     bda:	83 ec 0c             	sub    $0xc,%esp
     bdd:	6a 00                	push   $0x0
     bdf:	e8 87 33 00 00       	call   3f6b <fork>
     be4:	83 c4 10             	add    $0x10,%esp
     be7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid1 == 0)
     bea:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     bee:	75 02                	jne    bf2 <preempt+0x30>
    for(;;)
      ;
     bf0:	eb fe                	jmp    bf0 <preempt+0x2e>

  pid2 = fork(0);
     bf2:	83 ec 0c             	sub    $0xc,%esp
     bf5:	6a 00                	push   $0x0
     bf7:	e8 6f 33 00 00       	call   3f6b <fork>
     bfc:	83 c4 10             	add    $0x10,%esp
     bff:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid2 == 0)
     c02:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     c06:	75 02                	jne    c0a <preempt+0x48>
    for(;;)
      ;
     c08:	eb fe                	jmp    c08 <preempt+0x46>

  pipe(pfds);
     c0a:	83 ec 0c             	sub    $0xc,%esp
     c0d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     c10:	50                   	push   %eax
     c11:	e8 6d 33 00 00       	call   3f83 <pipe>
     c16:	83 c4 10             	add    $0x10,%esp
  pid3 = fork(0);
     c19:	83 ec 0c             	sub    $0xc,%esp
     c1c:	6a 00                	push   $0x0
     c1e:	e8 48 33 00 00       	call   3f6b <fork>
     c23:	83 c4 10             	add    $0x10,%esp
     c26:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid3 == 0){
     c29:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     c2d:	75 4d                	jne    c7c <preempt+0xba>
    close(pfds[0]);
     c2f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c32:	83 ec 0c             	sub    $0xc,%esp
     c35:	50                   	push   %eax
     c36:	e8 60 33 00 00       	call   3f9b <close>
     c3b:	83 c4 10             	add    $0x10,%esp
    if(write(pfds[1], "x", 1) != 1)
     c3e:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c41:	83 ec 04             	sub    $0x4,%esp
     c44:	6a 01                	push   $0x1
     c46:	68 77 49 00 00       	push   $0x4977
     c4b:	50                   	push   %eax
     c4c:	e8 42 33 00 00       	call   3f93 <write>
     c51:	83 c4 10             	add    $0x10,%esp
     c54:	83 f8 01             	cmp    $0x1,%eax
     c57:	74 12                	je     c6b <preempt+0xa9>
      printf(1, "preempt write error");
     c59:	83 ec 08             	sub    $0x8,%esp
     c5c:	68 79 49 00 00       	push   $0x4979
     c61:	6a 01                	push   $0x1
     c63:	e8 82 34 00 00       	call   40ea <printf>
     c68:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c6b:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c6e:	83 ec 0c             	sub    $0xc,%esp
     c71:	50                   	push   %eax
     c72:	e8 24 33 00 00       	call   3f9b <close>
     c77:	83 c4 10             	add    $0x10,%esp
    for(;;)
      ;
     c7a:	eb fe                	jmp    c7a <preempt+0xb8>
  }

  close(pfds[1]);
     c7c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c7f:	83 ec 0c             	sub    $0xc,%esp
     c82:	50                   	push   %eax
     c83:	e8 13 33 00 00       	call   3f9b <close>
     c88:	83 c4 10             	add    $0x10,%esp
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c8e:	83 ec 04             	sub    $0x4,%esp
     c91:	68 00 20 00 00       	push   $0x2000
     c96:	68 40 8b 00 00       	push   $0x8b40
     c9b:	50                   	push   %eax
     c9c:	e8 ea 32 00 00       	call   3f8b <read>
     ca1:	83 c4 10             	add    $0x10,%esp
     ca4:	83 f8 01             	cmp    $0x1,%eax
     ca7:	74 14                	je     cbd <preempt+0xfb>
    printf(1, "preempt read error");
     ca9:	83 ec 08             	sub    $0x8,%esp
     cac:	68 8d 49 00 00       	push   $0x498d
     cb1:	6a 01                	push   $0x1
     cb3:	e8 32 34 00 00       	call   40ea <printf>
     cb8:	83 c4 10             	add    $0x10,%esp
     cbb:	eb 7e                	jmp    d3b <preempt+0x179>
    return;
  }
  close(pfds[0]);
     cbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     cc0:	83 ec 0c             	sub    $0xc,%esp
     cc3:	50                   	push   %eax
     cc4:	e8 d2 32 00 00       	call   3f9b <close>
     cc9:	83 c4 10             	add    $0x10,%esp
  printf(1, "kill... ");
     ccc:	83 ec 08             	sub    $0x8,%esp
     ccf:	68 a0 49 00 00       	push   $0x49a0
     cd4:	6a 01                	push   $0x1
     cd6:	e8 0f 34 00 00       	call   40ea <printf>
     cdb:	83 c4 10             	add    $0x10,%esp
  kill(pid1);
     cde:	83 ec 0c             	sub    $0xc,%esp
     ce1:	ff 75 f4             	pushl  -0xc(%ebp)
     ce4:	e8 ba 32 00 00       	call   3fa3 <kill>
     ce9:	83 c4 10             	add    $0x10,%esp
  kill(pid2);
     cec:	83 ec 0c             	sub    $0xc,%esp
     cef:	ff 75 f0             	pushl  -0x10(%ebp)
     cf2:	e8 ac 32 00 00       	call   3fa3 <kill>
     cf7:	83 c4 10             	add    $0x10,%esp
  kill(pid3);
     cfa:	83 ec 0c             	sub    $0xc,%esp
     cfd:	ff 75 ec             	pushl  -0x14(%ebp)
     d00:	e8 9e 32 00 00       	call   3fa3 <kill>
     d05:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
     d08:	83 ec 08             	sub    $0x8,%esp
     d0b:	68 a9 49 00 00       	push   $0x49a9
     d10:	6a 01                	push   $0x1
     d12:	e8 d3 33 00 00       	call   40ea <printf>
     d17:	83 c4 10             	add    $0x10,%esp
  wait();
     d1a:	e8 5c 32 00 00       	call   3f7b <wait>
  wait();
     d1f:	e8 57 32 00 00       	call   3f7b <wait>
  wait();
     d24:	e8 52 32 00 00       	call   3f7b <wait>
  printf(1, "preempt ok\n");
     d29:	83 ec 08             	sub    $0x8,%esp
     d2c:	68 b2 49 00 00       	push   $0x49b2
     d31:	6a 01                	push   $0x1
     d33:	e8 b2 33 00 00       	call   40ea <printf>
     d38:	83 c4 10             	add    $0x10,%esp
}
     d3b:	c9                   	leave  
     d3c:	c3                   	ret    

00000d3d <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     d3d:	55                   	push   %ebp
     d3e:	89 e5                	mov    %esp,%ebp
     d40:	83 ec 18             	sub    $0x18,%esp
  int i, pid;

  for(i = 0; i < 100; i++){
     d43:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     d4a:	eb 57                	jmp    da3 <exitwait+0x66>
    pid = fork(0);
     d4c:	83 ec 0c             	sub    $0xc,%esp
     d4f:	6a 00                	push   $0x0
     d51:	e8 15 32 00 00       	call   3f6b <fork>
     d56:	83 c4 10             	add    $0x10,%esp
     d59:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0){
     d5c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     d60:	79 14                	jns    d76 <exitwait+0x39>
      printf(1, "fork failed\n");
     d62:	83 ec 08             	sub    $0x8,%esp
     d65:	68 41 45 00 00       	push   $0x4541
     d6a:	6a 01                	push   $0x1
     d6c:	e8 79 33 00 00       	call   40ea <printf>
     d71:	83 c4 10             	add    $0x10,%esp
      return;
     d74:	eb 45                	jmp    dbb <exitwait+0x7e>
    }
    if(pid){
     d76:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     d7a:	74 1e                	je     d9a <exitwait+0x5d>
      if(wait() != pid){
     d7c:	e8 fa 31 00 00       	call   3f7b <wait>
     d81:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     d84:	74 19                	je     d9f <exitwait+0x62>
        printf(1, "wait wrong pid\n");
     d86:	83 ec 08             	sub    $0x8,%esp
     d89:	68 be 49 00 00       	push   $0x49be
     d8e:	6a 01                	push   $0x1
     d90:	e8 55 33 00 00       	call   40ea <printf>
     d95:	83 c4 10             	add    $0x10,%esp
        return;
     d98:	eb 21                	jmp    dbb <exitwait+0x7e>
      }
    } else {
      exit();
     d9a:	e8 d4 31 00 00       	call   3f73 <exit>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     d9f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     da3:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     da7:	7e a3                	jle    d4c <exitwait+0xf>
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     da9:	83 ec 08             	sub    $0x8,%esp
     dac:	68 ce 49 00 00       	push   $0x49ce
     db1:	6a 01                	push   $0x1
     db3:	e8 32 33 00 00       	call   40ea <printf>
     db8:	83 c4 10             	add    $0x10,%esp
}
     dbb:	c9                   	leave  
     dbc:	c3                   	ret    

00000dbd <mem>:

void
mem(void)
{
     dbd:	55                   	push   %ebp
     dbe:	89 e5                	mov    %esp,%ebp
     dc0:	83 ec 18             	sub    $0x18,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     dc3:	83 ec 08             	sub    $0x8,%esp
     dc6:	68 db 49 00 00       	push   $0x49db
     dcb:	6a 01                	push   $0x1
     dcd:	e8 18 33 00 00       	call   40ea <printf>
     dd2:	83 c4 10             	add    $0x10,%esp
  ppid = getpid();
     dd5:	e8 19 32 00 00       	call   3ff3 <getpid>
     dda:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if((pid = fork(0)) == 0){
     ddd:	83 ec 0c             	sub    $0xc,%esp
     de0:	6a 00                	push   $0x0
     de2:	e8 84 31 00 00       	call   3f6b <fork>
     de7:	83 c4 10             	add    $0x10,%esp
     dea:	89 45 ec             	mov    %eax,-0x14(%ebp)
     ded:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     df1:	0f 85 b7 00 00 00    	jne    eae <mem+0xf1>
    m1 = 0;
     df7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while((m2 = malloc(10001)) != 0){
     dfe:	eb 0e                	jmp    e0e <mem+0x51>
      *(char**)m2 = m1;
     e00:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e03:	8b 55 f4             	mov    -0xc(%ebp),%edx
     e06:	89 10                	mov    %edx,(%eax)
      m1 = m2;
     e08:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e0b:	89 45 f4             	mov    %eax,-0xc(%ebp)

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork(0)) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     e0e:	83 ec 0c             	sub    $0xc,%esp
     e11:	68 11 27 00 00       	push   $0x2711
     e16:	e8 a2 35 00 00       	call   43bd <malloc>
     e1b:	83 c4 10             	add    $0x10,%esp
     e1e:	89 45 e8             	mov    %eax,-0x18(%ebp)
     e21:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     e25:	75 d9                	jne    e00 <mem+0x43>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     e27:	eb 1c                	jmp    e45 <mem+0x88>
      m2 = *(char**)m1;
     e29:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e2c:	8b 00                	mov    (%eax),%eax
     e2e:	89 45 e8             	mov    %eax,-0x18(%ebp)
      free(m1);
     e31:	83 ec 0c             	sub    $0xc,%esp
     e34:	ff 75 f4             	pushl  -0xc(%ebp)
     e37:	e8 3f 34 00 00       	call   427b <free>
     e3c:	83 c4 10             	add    $0x10,%esp
      m1 = m2;
     e3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e42:	89 45 f4             	mov    %eax,-0xc(%ebp)
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     e45:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e49:	75 de                	jne    e29 <mem+0x6c>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     e4b:	83 ec 0c             	sub    $0xc,%esp
     e4e:	68 00 50 00 00       	push   $0x5000
     e53:	e8 65 35 00 00       	call   43bd <malloc>
     e58:	83 c4 10             	add    $0x10,%esp
     e5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(m1 == 0){
     e5e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e62:	75 25                	jne    e89 <mem+0xcc>
      printf(1, "couldn't allocate mem?!!\n");
     e64:	83 ec 08             	sub    $0x8,%esp
     e67:	68 e5 49 00 00       	push   $0x49e5
     e6c:	6a 01                	push   $0x1
     e6e:	e8 77 32 00 00       	call   40ea <printf>
     e73:	83 c4 10             	add    $0x10,%esp
      kill(ppid);
     e76:	83 ec 0c             	sub    $0xc,%esp
     e79:	ff 75 f0             	pushl  -0x10(%ebp)
     e7c:	e8 22 31 00 00       	call   3fa3 <kill>
     e81:	83 c4 10             	add    $0x10,%esp
      exit();
     e84:	e8 ea 30 00 00       	call   3f73 <exit>
    }
    free(m1);
     e89:	83 ec 0c             	sub    $0xc,%esp
     e8c:	ff 75 f4             	pushl  -0xc(%ebp)
     e8f:	e8 e7 33 00 00       	call   427b <free>
     e94:	83 c4 10             	add    $0x10,%esp
    printf(1, "mem ok\n");
     e97:	83 ec 08             	sub    $0x8,%esp
     e9a:	68 ff 49 00 00       	push   $0x49ff
     e9f:	6a 01                	push   $0x1
     ea1:	e8 44 32 00 00       	call   40ea <printf>
     ea6:	83 c4 10             	add    $0x10,%esp
    exit();
     ea9:	e8 c5 30 00 00       	call   3f73 <exit>
  } else {
    wait();
     eae:	e8 c8 30 00 00       	call   3f7b <wait>
  }
}
     eb3:	90                   	nop
     eb4:	c9                   	leave  
     eb5:	c3                   	ret    

00000eb6 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     eb6:	55                   	push   %ebp
     eb7:	89 e5                	mov    %esp,%ebp
     eb9:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     ebc:	83 ec 08             	sub    $0x8,%esp
     ebf:	68 07 4a 00 00       	push   $0x4a07
     ec4:	6a 01                	push   $0x1
     ec6:	e8 1f 32 00 00       	call   40ea <printf>
     ecb:	83 c4 10             	add    $0x10,%esp

  unlink("sharedfd");
     ece:	83 ec 0c             	sub    $0xc,%esp
     ed1:	68 16 4a 00 00       	push   $0x4a16
     ed6:	e8 e8 30 00 00       	call   3fc3 <unlink>
     edb:	83 c4 10             	add    $0x10,%esp
  fd = open("sharedfd", O_CREATE|O_RDWR);
     ede:	83 ec 08             	sub    $0x8,%esp
     ee1:	68 02 02 00 00       	push   $0x202
     ee6:	68 16 4a 00 00       	push   $0x4a16
     eeb:	e8 c3 30 00 00       	call   3fb3 <open>
     ef0:	83 c4 10             	add    $0x10,%esp
     ef3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     ef6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     efa:	79 17                	jns    f13 <sharedfd+0x5d>
    printf(1, "fstests: cannot open sharedfd for writing");
     efc:	83 ec 08             	sub    $0x8,%esp
     eff:	68 20 4a 00 00       	push   $0x4a20
     f04:	6a 01                	push   $0x1
     f06:	e8 df 31 00 00       	call   40ea <printf>
     f0b:	83 c4 10             	add    $0x10,%esp
    return;
     f0e:	e9 8c 01 00 00       	jmp    109f <sharedfd+0x1e9>
  }
  pid = fork(0);
     f13:	83 ec 0c             	sub    $0xc,%esp
     f16:	6a 00                	push   $0x0
     f18:	e8 4e 30 00 00       	call   3f6b <fork>
     f1d:	83 c4 10             	add    $0x10,%esp
     f20:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     f23:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     f27:	75 07                	jne    f30 <sharedfd+0x7a>
     f29:	b8 63 00 00 00       	mov    $0x63,%eax
     f2e:	eb 05                	jmp    f35 <sharedfd+0x7f>
     f30:	b8 70 00 00 00       	mov    $0x70,%eax
     f35:	83 ec 04             	sub    $0x4,%esp
     f38:	6a 0a                	push   $0xa
     f3a:	50                   	push   %eax
     f3b:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     f3e:	50                   	push   %eax
     f3f:	e8 94 2e 00 00       	call   3dd8 <memset>
     f44:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 1000; i++){
     f47:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     f4e:	eb 31                	jmp    f81 <sharedfd+0xcb>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     f50:	83 ec 04             	sub    $0x4,%esp
     f53:	6a 0a                	push   $0xa
     f55:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     f58:	50                   	push   %eax
     f59:	ff 75 e8             	pushl  -0x18(%ebp)
     f5c:	e8 32 30 00 00       	call   3f93 <write>
     f61:	83 c4 10             	add    $0x10,%esp
     f64:	83 f8 0a             	cmp    $0xa,%eax
     f67:	74 14                	je     f7d <sharedfd+0xc7>
      printf(1, "fstests: write sharedfd failed\n");
     f69:	83 ec 08             	sub    $0x8,%esp
     f6c:	68 4c 4a 00 00       	push   $0x4a4c
     f71:	6a 01                	push   $0x1
     f73:	e8 72 31 00 00       	call   40ea <printf>
     f78:	83 c4 10             	add    $0x10,%esp
      break;
     f7b:	eb 0d                	jmp    f8a <sharedfd+0xd4>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork(0);
  memset(buf, pid==0?'c':'p', sizeof(buf));
  for(i = 0; i < 1000; i++){
     f7d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     f81:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
     f88:	7e c6                	jle    f50 <sharedfd+0x9a>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
     f8a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     f8e:	75 05                	jne    f95 <sharedfd+0xdf>
    exit();
     f90:	e8 de 2f 00 00       	call   3f73 <exit>
  else
    wait();
     f95:	e8 e1 2f 00 00       	call   3f7b <wait>
  close(fd);
     f9a:	83 ec 0c             	sub    $0xc,%esp
     f9d:	ff 75 e8             	pushl  -0x18(%ebp)
     fa0:	e8 f6 2f 00 00       	call   3f9b <close>
     fa5:	83 c4 10             	add    $0x10,%esp
  fd = open("sharedfd", 0);
     fa8:	83 ec 08             	sub    $0x8,%esp
     fab:	6a 00                	push   $0x0
     fad:	68 16 4a 00 00       	push   $0x4a16
     fb2:	e8 fc 2f 00 00       	call   3fb3 <open>
     fb7:	83 c4 10             	add    $0x10,%esp
     fba:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     fbd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     fc1:	79 17                	jns    fda <sharedfd+0x124>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     fc3:	83 ec 08             	sub    $0x8,%esp
     fc6:	68 6c 4a 00 00       	push   $0x4a6c
     fcb:	6a 01                	push   $0x1
     fcd:	e8 18 31 00 00       	call   40ea <printf>
     fd2:	83 c4 10             	add    $0x10,%esp
    return;
     fd5:	e9 c5 00 00 00       	jmp    109f <sharedfd+0x1e9>
  }
  nc = np = 0;
     fda:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     fe1:	8b 45 ec             	mov    -0x14(%ebp),%eax
     fe4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
     fe7:	eb 3b                	jmp    1024 <sharedfd+0x16e>
    for(i = 0; i < sizeof(buf); i++){
     fe9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     ff0:	eb 2a                	jmp    101c <sharedfd+0x166>
      if(buf[i] == 'c')
     ff2:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     ff5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ff8:	01 d0                	add    %edx,%eax
     ffa:	0f b6 00             	movzbl (%eax),%eax
     ffd:	3c 63                	cmp    $0x63,%al
     fff:	75 04                	jne    1005 <sharedfd+0x14f>
        nc++;
    1001:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(buf[i] == 'p')
    1005:	8d 55 d6             	lea    -0x2a(%ebp),%edx
    1008:	8b 45 f4             	mov    -0xc(%ebp),%eax
    100b:	01 d0                	add    %edx,%eax
    100d:	0f b6 00             	movzbl (%eax),%eax
    1010:	3c 70                	cmp    $0x70,%al
    1012:	75 04                	jne    1018 <sharedfd+0x162>
        np++;
    1014:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
    1018:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    101c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    101f:	83 f8 09             	cmp    $0x9,%eax
    1022:	76 ce                	jbe    ff2 <sharedfd+0x13c>
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    1024:	83 ec 04             	sub    $0x4,%esp
    1027:	6a 0a                	push   $0xa
    1029:	8d 45 d6             	lea    -0x2a(%ebp),%eax
    102c:	50                   	push   %eax
    102d:	ff 75 e8             	pushl  -0x18(%ebp)
    1030:	e8 56 2f 00 00       	call   3f8b <read>
    1035:	83 c4 10             	add    $0x10,%esp
    1038:	89 45 e0             	mov    %eax,-0x20(%ebp)
    103b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    103f:	7f a8                	jg     fe9 <sharedfd+0x133>
        nc++;
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
    1041:	83 ec 0c             	sub    $0xc,%esp
    1044:	ff 75 e8             	pushl  -0x18(%ebp)
    1047:	e8 4f 2f 00 00       	call   3f9b <close>
    104c:	83 c4 10             	add    $0x10,%esp
  unlink("sharedfd");
    104f:	83 ec 0c             	sub    $0xc,%esp
    1052:	68 16 4a 00 00       	push   $0x4a16
    1057:	e8 67 2f 00 00       	call   3fc3 <unlink>
    105c:	83 c4 10             	add    $0x10,%esp
  if(nc == 10000 && np == 10000){
    105f:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
    1066:	75 1d                	jne    1085 <sharedfd+0x1cf>
    1068:	81 7d ec 10 27 00 00 	cmpl   $0x2710,-0x14(%ebp)
    106f:	75 14                	jne    1085 <sharedfd+0x1cf>
    printf(1, "sharedfd ok\n");
    1071:	83 ec 08             	sub    $0x8,%esp
    1074:	68 97 4a 00 00       	push   $0x4a97
    1079:	6a 01                	push   $0x1
    107b:	e8 6a 30 00 00       	call   40ea <printf>
    1080:	83 c4 10             	add    $0x10,%esp
    1083:	eb 1a                	jmp    109f <sharedfd+0x1e9>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    1085:	ff 75 ec             	pushl  -0x14(%ebp)
    1088:	ff 75 f0             	pushl  -0x10(%ebp)
    108b:	68 a4 4a 00 00       	push   $0x4aa4
    1090:	6a 01                	push   $0x1
    1092:	e8 53 30 00 00       	call   40ea <printf>
    1097:	83 c4 10             	add    $0x10,%esp
    exit();
    109a:	e8 d4 2e 00 00       	call   3f73 <exit>
  }
}
    109f:	c9                   	leave  
    10a0:	c3                   	ret    

000010a1 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    10a1:	55                   	push   %ebp
    10a2:	89 e5                	mov    %esp,%ebp
    10a4:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    10a7:	c7 45 c8 b9 4a 00 00 	movl   $0x4ab9,-0x38(%ebp)
    10ae:	c7 45 cc bc 4a 00 00 	movl   $0x4abc,-0x34(%ebp)
    10b5:	c7 45 d0 bf 4a 00 00 	movl   $0x4abf,-0x30(%ebp)
    10bc:	c7 45 d4 c2 4a 00 00 	movl   $0x4ac2,-0x2c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    10c3:	83 ec 08             	sub    $0x8,%esp
    10c6:	68 c5 4a 00 00       	push   $0x4ac5
    10cb:	6a 01                	push   $0x1
    10cd:	e8 18 30 00 00       	call   40ea <printf>
    10d2:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    10d5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    10dc:	e9 f8 00 00 00       	jmp    11d9 <fourfiles+0x138>
    fname = names[pi];
    10e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10e4:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
    10e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    unlink(fname);
    10eb:	83 ec 0c             	sub    $0xc,%esp
    10ee:	ff 75 e4             	pushl  -0x1c(%ebp)
    10f1:	e8 cd 2e 00 00       	call   3fc3 <unlink>
    10f6:	83 c4 10             	add    $0x10,%esp

    pid = fork(0);
    10f9:	83 ec 0c             	sub    $0xc,%esp
    10fc:	6a 00                	push   $0x0
    10fe:	e8 68 2e 00 00       	call   3f6b <fork>
    1103:	83 c4 10             	add    $0x10,%esp
    1106:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(pid < 0){
    1109:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    110d:	79 17                	jns    1126 <fourfiles+0x85>
      printf(1, "fork failed\n");
    110f:	83 ec 08             	sub    $0x8,%esp
    1112:	68 41 45 00 00       	push   $0x4541
    1117:	6a 01                	push   $0x1
    1119:	e8 cc 2f 00 00       	call   40ea <printf>
    111e:	83 c4 10             	add    $0x10,%esp
      exit();
    1121:	e8 4d 2e 00 00       	call   3f73 <exit>
    }

    if(pid == 0){
    1126:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    112a:	0f 85 a5 00 00 00    	jne    11d5 <fourfiles+0x134>
      fd = open(fname, O_CREATE | O_RDWR);
    1130:	83 ec 08             	sub    $0x8,%esp
    1133:	68 02 02 00 00       	push   $0x202
    1138:	ff 75 e4             	pushl  -0x1c(%ebp)
    113b:	e8 73 2e 00 00       	call   3fb3 <open>
    1140:	83 c4 10             	add    $0x10,%esp
    1143:	89 45 dc             	mov    %eax,-0x24(%ebp)
      if(fd < 0){
    1146:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    114a:	79 17                	jns    1163 <fourfiles+0xc2>
        printf(1, "create failed\n");
    114c:	83 ec 08             	sub    $0x8,%esp
    114f:	68 d5 4a 00 00       	push   $0x4ad5
    1154:	6a 01                	push   $0x1
    1156:	e8 8f 2f 00 00       	call   40ea <printf>
    115b:	83 c4 10             	add    $0x10,%esp
        exit();
    115e:	e8 10 2e 00 00       	call   3f73 <exit>
      }
      
      memset(buf, '0'+pi, 512);
    1163:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1166:	83 c0 30             	add    $0x30,%eax
    1169:	83 ec 04             	sub    $0x4,%esp
    116c:	68 00 02 00 00       	push   $0x200
    1171:	50                   	push   %eax
    1172:	68 40 8b 00 00       	push   $0x8b40
    1177:	e8 5c 2c 00 00       	call   3dd8 <memset>
    117c:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
    117f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1186:	eb 42                	jmp    11ca <fourfiles+0x129>
        if((n = write(fd, buf, 500)) != 500){
    1188:	83 ec 04             	sub    $0x4,%esp
    118b:	68 f4 01 00 00       	push   $0x1f4
    1190:	68 40 8b 00 00       	push   $0x8b40
    1195:	ff 75 dc             	pushl  -0x24(%ebp)
    1198:	e8 f6 2d 00 00       	call   3f93 <write>
    119d:	83 c4 10             	add    $0x10,%esp
    11a0:	89 45 d8             	mov    %eax,-0x28(%ebp)
    11a3:	81 7d d8 f4 01 00 00 	cmpl   $0x1f4,-0x28(%ebp)
    11aa:	74 1a                	je     11c6 <fourfiles+0x125>
          printf(1, "write failed %d\n", n);
    11ac:	83 ec 04             	sub    $0x4,%esp
    11af:	ff 75 d8             	pushl  -0x28(%ebp)
    11b2:	68 e4 4a 00 00       	push   $0x4ae4
    11b7:	6a 01                	push   $0x1
    11b9:	e8 2c 2f 00 00       	call   40ea <printf>
    11be:	83 c4 10             	add    $0x10,%esp
          exit();
    11c1:	e8 ad 2d 00 00       	call   3f73 <exit>
        printf(1, "create failed\n");
        exit();
      }
      
      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    11c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    11ca:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    11ce:	7e b8                	jle    1188 <fourfiles+0xe7>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit();
        }
      }
      exit();
    11d0:	e8 9e 2d 00 00       	call   3f73 <exit>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    11d5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    11d9:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
    11dd:	0f 8e fe fe ff ff    	jle    10e1 <fourfiles+0x40>
      }
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    11e3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    11ea:	eb 09                	jmp    11f5 <fourfiles+0x154>
    wait();
    11ec:	e8 8a 2d 00 00       	call   3f7b <wait>
      }
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    11f1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    11f5:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
    11f9:	7e f1                	jle    11ec <fourfiles+0x14b>
    wait();
  }

  for(i = 0; i < 2; i++){
    11fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1202:	e9 d4 00 00 00       	jmp    12db <fourfiles+0x23a>
    fname = names[i];
    1207:	8b 45 f4             	mov    -0xc(%ebp),%eax
    120a:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
    120e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    fd = open(fname, 0);
    1211:	83 ec 08             	sub    $0x8,%esp
    1214:	6a 00                	push   $0x0
    1216:	ff 75 e4             	pushl  -0x1c(%ebp)
    1219:	e8 95 2d 00 00       	call   3fb3 <open>
    121e:	83 c4 10             	add    $0x10,%esp
    1221:	89 45 dc             	mov    %eax,-0x24(%ebp)
    total = 0;
    1224:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    122b:	eb 4a                	jmp    1277 <fourfiles+0x1d6>
      for(j = 0; j < n; j++){
    122d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1234:	eb 33                	jmp    1269 <fourfiles+0x1c8>
        if(buf[j] != '0'+i){
    1236:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1239:	05 40 8b 00 00       	add    $0x8b40,%eax
    123e:	0f b6 00             	movzbl (%eax),%eax
    1241:	0f be c0             	movsbl %al,%eax
    1244:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1247:	83 c2 30             	add    $0x30,%edx
    124a:	39 d0                	cmp    %edx,%eax
    124c:	74 17                	je     1265 <fourfiles+0x1c4>
          printf(1, "wrong char\n");
    124e:	83 ec 08             	sub    $0x8,%esp
    1251:	68 f5 4a 00 00       	push   $0x4af5
    1256:	6a 01                	push   $0x1
    1258:	e8 8d 2e 00 00       	call   40ea <printf>
    125d:	83 c4 10             	add    $0x10,%esp
          exit();
    1260:	e8 0e 2d 00 00       	call   3f73 <exit>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    1265:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1269:	8b 45 f0             	mov    -0x10(%ebp),%eax
    126c:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    126f:	7c c5                	jl     1236 <fourfiles+0x195>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    1271:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1274:	01 45 ec             	add    %eax,-0x14(%ebp)

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1277:	83 ec 04             	sub    $0x4,%esp
    127a:	68 00 20 00 00       	push   $0x2000
    127f:	68 40 8b 00 00       	push   $0x8b40
    1284:	ff 75 dc             	pushl  -0x24(%ebp)
    1287:	e8 ff 2c 00 00       	call   3f8b <read>
    128c:	83 c4 10             	add    $0x10,%esp
    128f:	89 45 d8             	mov    %eax,-0x28(%ebp)
    1292:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    1296:	7f 95                	jg     122d <fourfiles+0x18c>
          exit();
        }
      }
      total += n;
    }
    close(fd);
    1298:	83 ec 0c             	sub    $0xc,%esp
    129b:	ff 75 dc             	pushl  -0x24(%ebp)
    129e:	e8 f8 2c 00 00       	call   3f9b <close>
    12a3:	83 c4 10             	add    $0x10,%esp
    if(total != 12*500){
    12a6:	81 7d ec 70 17 00 00 	cmpl   $0x1770,-0x14(%ebp)
    12ad:	74 1a                	je     12c9 <fourfiles+0x228>
      printf(1, "wrong length %d\n", total);
    12af:	83 ec 04             	sub    $0x4,%esp
    12b2:	ff 75 ec             	pushl  -0x14(%ebp)
    12b5:	68 01 4b 00 00       	push   $0x4b01
    12ba:	6a 01                	push   $0x1
    12bc:	e8 29 2e 00 00       	call   40ea <printf>
    12c1:	83 c4 10             	add    $0x10,%esp
      exit();
    12c4:	e8 aa 2c 00 00       	call   3f73 <exit>
    }
    unlink(fname);
    12c9:	83 ec 0c             	sub    $0xc,%esp
    12cc:	ff 75 e4             	pushl  -0x1c(%ebp)
    12cf:	e8 ef 2c 00 00       	call   3fc3 <unlink>
    12d4:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    12d7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    12db:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    12df:	0f 8e 22 ff ff ff    	jle    1207 <fourfiles+0x166>
      exit();
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    12e5:	83 ec 08             	sub    $0x8,%esp
    12e8:	68 12 4b 00 00       	push   $0x4b12
    12ed:	6a 01                	push   $0x1
    12ef:	e8 f6 2d 00 00       	call   40ea <printf>
    12f4:	83 c4 10             	add    $0x10,%esp
}
    12f7:	90                   	nop
    12f8:	c9                   	leave  
    12f9:	c3                   	ret    

000012fa <createdelete>:

// four processes create and delete different files in same directory
void
createdelete(void)
{
    12fa:	55                   	push   %ebp
    12fb:	89 e5                	mov    %esp,%ebp
    12fd:	83 ec 38             	sub    $0x38,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    1300:	83 ec 08             	sub    $0x8,%esp
    1303:	68 20 4b 00 00       	push   $0x4b20
    1308:	6a 01                	push   $0x1
    130a:	e8 db 2d 00 00       	call   40ea <printf>
    130f:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    1312:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1319:	e9 fe 00 00 00       	jmp    141c <createdelete+0x122>
    pid = fork(0);
    131e:	83 ec 0c             	sub    $0xc,%esp
    1321:	6a 00                	push   $0x0
    1323:	e8 43 2c 00 00       	call   3f6b <fork>
    1328:	83 c4 10             	add    $0x10,%esp
    132b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    132e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1332:	79 17                	jns    134b <createdelete+0x51>
      printf(1, "fork failed\n");
    1334:	83 ec 08             	sub    $0x8,%esp
    1337:	68 41 45 00 00       	push   $0x4541
    133c:	6a 01                	push   $0x1
    133e:	e8 a7 2d 00 00       	call   40ea <printf>
    1343:	83 c4 10             	add    $0x10,%esp
      exit();
    1346:	e8 28 2c 00 00       	call   3f73 <exit>
    }

    if(pid == 0){
    134b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    134f:	0f 85 c3 00 00 00    	jne    1418 <createdelete+0x11e>
      name[0] = 'p' + pi;
    1355:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1358:	83 c0 70             	add    $0x70,%eax
    135b:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[2] = '\0';
    135e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
      for(i = 0; i < N; i++){
    1362:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1369:	e9 9b 00 00 00       	jmp    1409 <createdelete+0x10f>
        name[1] = '0' + i;
    136e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1371:	83 c0 30             	add    $0x30,%eax
    1374:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    1377:	83 ec 08             	sub    $0x8,%esp
    137a:	68 02 02 00 00       	push   $0x202
    137f:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1382:	50                   	push   %eax
    1383:	e8 2b 2c 00 00       	call   3fb3 <open>
    1388:	83 c4 10             	add    $0x10,%esp
    138b:	89 45 e8             	mov    %eax,-0x18(%ebp)
        if(fd < 0){
    138e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1392:	79 17                	jns    13ab <createdelete+0xb1>
          printf(1, "create failed\n");
    1394:	83 ec 08             	sub    $0x8,%esp
    1397:	68 d5 4a 00 00       	push   $0x4ad5
    139c:	6a 01                	push   $0x1
    139e:	e8 47 2d 00 00       	call   40ea <printf>
    13a3:	83 c4 10             	add    $0x10,%esp
          exit();
    13a6:	e8 c8 2b 00 00       	call   3f73 <exit>
        }
        close(fd);
    13ab:	83 ec 0c             	sub    $0xc,%esp
    13ae:	ff 75 e8             	pushl  -0x18(%ebp)
    13b1:	e8 e5 2b 00 00       	call   3f9b <close>
    13b6:	83 c4 10             	add    $0x10,%esp
        if(i > 0 && (i % 2 ) == 0){
    13b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    13bd:	7e 46                	jle    1405 <createdelete+0x10b>
    13bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13c2:	83 e0 01             	and    $0x1,%eax
    13c5:	85 c0                	test   %eax,%eax
    13c7:	75 3c                	jne    1405 <createdelete+0x10b>
          name[1] = '0' + (i / 2);
    13c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13cc:	89 c2                	mov    %eax,%edx
    13ce:	c1 ea 1f             	shr    $0x1f,%edx
    13d1:	01 d0                	add    %edx,%eax
    13d3:	d1 f8                	sar    %eax
    13d5:	83 c0 30             	add    $0x30,%eax
    13d8:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    13db:	83 ec 0c             	sub    $0xc,%esp
    13de:	8d 45 c8             	lea    -0x38(%ebp),%eax
    13e1:	50                   	push   %eax
    13e2:	e8 dc 2b 00 00       	call   3fc3 <unlink>
    13e7:	83 c4 10             	add    $0x10,%esp
    13ea:	85 c0                	test   %eax,%eax
    13ec:	79 17                	jns    1405 <createdelete+0x10b>
            printf(1, "unlink failed\n");
    13ee:	83 ec 08             	sub    $0x8,%esp
    13f1:	68 c4 45 00 00       	push   $0x45c4
    13f6:	6a 01                	push   $0x1
    13f8:	e8 ed 2c 00 00       	call   40ea <printf>
    13fd:	83 c4 10             	add    $0x10,%esp
            exit();
    1400:	e8 6e 2b 00 00       	call   3f73 <exit>
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
    1405:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1409:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    140d:	0f 8e 5b ff ff ff    	jle    136e <createdelete+0x74>
            printf(1, "unlink failed\n");
            exit();
          }
        }
      }
      exit();
    1413:	e8 5b 2b 00 00       	call   3f73 <exit>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    1418:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    141c:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    1420:	0f 8e f8 fe ff ff    	jle    131e <createdelete+0x24>
      }
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    1426:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    142d:	eb 09                	jmp    1438 <createdelete+0x13e>
    wait();
    142f:	e8 47 2b 00 00       	call   3f7b <wait>
      }
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    1434:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1438:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    143c:	7e f1                	jle    142f <createdelete+0x135>
    wait();
  }

  name[0] = name[1] = name[2] = 0;
    143e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1442:	0f b6 45 ca          	movzbl -0x36(%ebp),%eax
    1446:	88 45 c9             	mov    %al,-0x37(%ebp)
    1449:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
    144d:	88 45 c8             	mov    %al,-0x38(%ebp)
  for(i = 0; i < N; i++){
    1450:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1457:	e9 b2 00 00 00       	jmp    150e <createdelete+0x214>
    for(pi = 0; pi < 4; pi++){
    145c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1463:	e9 98 00 00 00       	jmp    1500 <createdelete+0x206>
      name[0] = 'p' + pi;
    1468:	8b 45 f0             	mov    -0x10(%ebp),%eax
    146b:	83 c0 70             	add    $0x70,%eax
    146e:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    1471:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1474:	83 c0 30             	add    $0x30,%eax
    1477:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    147a:	83 ec 08             	sub    $0x8,%esp
    147d:	6a 00                	push   $0x0
    147f:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1482:	50                   	push   %eax
    1483:	e8 2b 2b 00 00       	call   3fb3 <open>
    1488:	83 c4 10             	add    $0x10,%esp
    148b:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if((i == 0 || i >= N/2) && fd < 0){
    148e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1492:	74 06                	je     149a <createdelete+0x1a0>
    1494:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1498:	7e 21                	jle    14bb <createdelete+0x1c1>
    149a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    149e:	79 1b                	jns    14bb <createdelete+0x1c1>
        printf(1, "oops createdelete %s didn't exist\n", name);
    14a0:	83 ec 04             	sub    $0x4,%esp
    14a3:	8d 45 c8             	lea    -0x38(%ebp),%eax
    14a6:	50                   	push   %eax
    14a7:	68 34 4b 00 00       	push   $0x4b34
    14ac:	6a 01                	push   $0x1
    14ae:	e8 37 2c 00 00       	call   40ea <printf>
    14b3:	83 c4 10             	add    $0x10,%esp
        exit();
    14b6:	e8 b8 2a 00 00       	call   3f73 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    14bb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    14bf:	7e 27                	jle    14e8 <createdelete+0x1ee>
    14c1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    14c5:	7f 21                	jg     14e8 <createdelete+0x1ee>
    14c7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    14cb:	78 1b                	js     14e8 <createdelete+0x1ee>
        printf(1, "oops createdelete %s did exist\n", name);
    14cd:	83 ec 04             	sub    $0x4,%esp
    14d0:	8d 45 c8             	lea    -0x38(%ebp),%eax
    14d3:	50                   	push   %eax
    14d4:	68 58 4b 00 00       	push   $0x4b58
    14d9:	6a 01                	push   $0x1
    14db:	e8 0a 2c 00 00       	call   40ea <printf>
    14e0:	83 c4 10             	add    $0x10,%esp
        exit();
    14e3:	e8 8b 2a 00 00       	call   3f73 <exit>
      }
      if(fd >= 0)
    14e8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    14ec:	78 0e                	js     14fc <createdelete+0x202>
        close(fd);
    14ee:	83 ec 0c             	sub    $0xc,%esp
    14f1:	ff 75 e8             	pushl  -0x18(%ebp)
    14f4:	e8 a2 2a 00 00       	call   3f9b <close>
    14f9:	83 c4 10             	add    $0x10,%esp
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    14fc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1500:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    1504:	0f 8e 5e ff ff ff    	jle    1468 <createdelete+0x16e>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    150a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    150e:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1512:	0f 8e 44 ff ff ff    	jle    145c <createdelete+0x162>
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    1518:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    151f:	eb 38                	jmp    1559 <createdelete+0x25f>
    for(pi = 0; pi < 4; pi++){
    1521:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1528:	eb 25                	jmp    154f <createdelete+0x255>
      name[0] = 'p' + i;
    152a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    152d:	83 c0 70             	add    $0x70,%eax
    1530:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    1533:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1536:	83 c0 30             	add    $0x30,%eax
    1539:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    153c:	83 ec 0c             	sub    $0xc,%esp
    153f:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1542:	50                   	push   %eax
    1543:	e8 7b 2a 00 00       	call   3fc3 <unlink>
    1548:	83 c4 10             	add    $0x10,%esp
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    154b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    154f:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    1553:	7e d5                	jle    152a <createdelete+0x230>
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    1555:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1559:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    155d:	7e c2                	jle    1521 <createdelete+0x227>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    155f:	83 ec 08             	sub    $0x8,%esp
    1562:	68 78 4b 00 00       	push   $0x4b78
    1567:	6a 01                	push   $0x1
    1569:	e8 7c 2b 00 00       	call   40ea <printf>
    156e:	83 c4 10             	add    $0x10,%esp
}
    1571:	90                   	nop
    1572:	c9                   	leave  
    1573:	c3                   	ret    

00001574 <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1574:	55                   	push   %ebp
    1575:	89 e5                	mov    %esp,%ebp
    1577:	83 ec 18             	sub    $0x18,%esp
  int fd, fd1;

  printf(1, "unlinkread test\n");
    157a:	83 ec 08             	sub    $0x8,%esp
    157d:	68 89 4b 00 00       	push   $0x4b89
    1582:	6a 01                	push   $0x1
    1584:	e8 61 2b 00 00       	call   40ea <printf>
    1589:	83 c4 10             	add    $0x10,%esp
  fd = open("unlinkread", O_CREATE | O_RDWR);
    158c:	83 ec 08             	sub    $0x8,%esp
    158f:	68 02 02 00 00       	push   $0x202
    1594:	68 9a 4b 00 00       	push   $0x4b9a
    1599:	e8 15 2a 00 00       	call   3fb3 <open>
    159e:	83 c4 10             	add    $0x10,%esp
    15a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    15a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15a8:	79 17                	jns    15c1 <unlinkread+0x4d>
    printf(1, "create unlinkread failed\n");
    15aa:	83 ec 08             	sub    $0x8,%esp
    15ad:	68 a5 4b 00 00       	push   $0x4ba5
    15b2:	6a 01                	push   $0x1
    15b4:	e8 31 2b 00 00       	call   40ea <printf>
    15b9:	83 c4 10             	add    $0x10,%esp
    exit();
    15bc:	e8 b2 29 00 00       	call   3f73 <exit>
  }
  write(fd, "hello", 5);
    15c1:	83 ec 04             	sub    $0x4,%esp
    15c4:	6a 05                	push   $0x5
    15c6:	68 bf 4b 00 00       	push   $0x4bbf
    15cb:	ff 75 f4             	pushl  -0xc(%ebp)
    15ce:	e8 c0 29 00 00       	call   3f93 <write>
    15d3:	83 c4 10             	add    $0x10,%esp
  close(fd);
    15d6:	83 ec 0c             	sub    $0xc,%esp
    15d9:	ff 75 f4             	pushl  -0xc(%ebp)
    15dc:	e8 ba 29 00 00       	call   3f9b <close>
    15e1:	83 c4 10             	add    $0x10,%esp

  fd = open("unlinkread", O_RDWR);
    15e4:	83 ec 08             	sub    $0x8,%esp
    15e7:	6a 02                	push   $0x2
    15e9:	68 9a 4b 00 00       	push   $0x4b9a
    15ee:	e8 c0 29 00 00       	call   3fb3 <open>
    15f3:	83 c4 10             	add    $0x10,%esp
    15f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    15f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15fd:	79 17                	jns    1616 <unlinkread+0xa2>
    printf(1, "open unlinkread failed\n");
    15ff:	83 ec 08             	sub    $0x8,%esp
    1602:	68 c5 4b 00 00       	push   $0x4bc5
    1607:	6a 01                	push   $0x1
    1609:	e8 dc 2a 00 00       	call   40ea <printf>
    160e:	83 c4 10             	add    $0x10,%esp
    exit();
    1611:	e8 5d 29 00 00       	call   3f73 <exit>
  }
  if(unlink("unlinkread") != 0){
    1616:	83 ec 0c             	sub    $0xc,%esp
    1619:	68 9a 4b 00 00       	push   $0x4b9a
    161e:	e8 a0 29 00 00       	call   3fc3 <unlink>
    1623:	83 c4 10             	add    $0x10,%esp
    1626:	85 c0                	test   %eax,%eax
    1628:	74 17                	je     1641 <unlinkread+0xcd>
    printf(1, "unlink unlinkread failed\n");
    162a:	83 ec 08             	sub    $0x8,%esp
    162d:	68 dd 4b 00 00       	push   $0x4bdd
    1632:	6a 01                	push   $0x1
    1634:	e8 b1 2a 00 00       	call   40ea <printf>
    1639:	83 c4 10             	add    $0x10,%esp
    exit();
    163c:	e8 32 29 00 00       	call   3f73 <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1641:	83 ec 08             	sub    $0x8,%esp
    1644:	68 02 02 00 00       	push   $0x202
    1649:	68 9a 4b 00 00       	push   $0x4b9a
    164e:	e8 60 29 00 00       	call   3fb3 <open>
    1653:	83 c4 10             	add    $0x10,%esp
    1656:	89 45 f0             	mov    %eax,-0x10(%ebp)
  write(fd1, "yyy", 3);
    1659:	83 ec 04             	sub    $0x4,%esp
    165c:	6a 03                	push   $0x3
    165e:	68 f7 4b 00 00       	push   $0x4bf7
    1663:	ff 75 f0             	pushl  -0x10(%ebp)
    1666:	e8 28 29 00 00       	call   3f93 <write>
    166b:	83 c4 10             	add    $0x10,%esp
  close(fd1);
    166e:	83 ec 0c             	sub    $0xc,%esp
    1671:	ff 75 f0             	pushl  -0x10(%ebp)
    1674:	e8 22 29 00 00       	call   3f9b <close>
    1679:	83 c4 10             	add    $0x10,%esp

  if(read(fd, buf, sizeof(buf)) != 5){
    167c:	83 ec 04             	sub    $0x4,%esp
    167f:	68 00 20 00 00       	push   $0x2000
    1684:	68 40 8b 00 00       	push   $0x8b40
    1689:	ff 75 f4             	pushl  -0xc(%ebp)
    168c:	e8 fa 28 00 00       	call   3f8b <read>
    1691:	83 c4 10             	add    $0x10,%esp
    1694:	83 f8 05             	cmp    $0x5,%eax
    1697:	74 17                	je     16b0 <unlinkread+0x13c>
    printf(1, "unlinkread read failed");
    1699:	83 ec 08             	sub    $0x8,%esp
    169c:	68 fb 4b 00 00       	push   $0x4bfb
    16a1:	6a 01                	push   $0x1
    16a3:	e8 42 2a 00 00       	call   40ea <printf>
    16a8:	83 c4 10             	add    $0x10,%esp
    exit();
    16ab:	e8 c3 28 00 00       	call   3f73 <exit>
  }
  if(buf[0] != 'h'){
    16b0:	0f b6 05 40 8b 00 00 	movzbl 0x8b40,%eax
    16b7:	3c 68                	cmp    $0x68,%al
    16b9:	74 17                	je     16d2 <unlinkread+0x15e>
    printf(1, "unlinkread wrong data\n");
    16bb:	83 ec 08             	sub    $0x8,%esp
    16be:	68 12 4c 00 00       	push   $0x4c12
    16c3:	6a 01                	push   $0x1
    16c5:	e8 20 2a 00 00       	call   40ea <printf>
    16ca:	83 c4 10             	add    $0x10,%esp
    exit();
    16cd:	e8 a1 28 00 00       	call   3f73 <exit>
  }
  if(write(fd, buf, 10) != 10){
    16d2:	83 ec 04             	sub    $0x4,%esp
    16d5:	6a 0a                	push   $0xa
    16d7:	68 40 8b 00 00       	push   $0x8b40
    16dc:	ff 75 f4             	pushl  -0xc(%ebp)
    16df:	e8 af 28 00 00       	call   3f93 <write>
    16e4:	83 c4 10             	add    $0x10,%esp
    16e7:	83 f8 0a             	cmp    $0xa,%eax
    16ea:	74 17                	je     1703 <unlinkread+0x18f>
    printf(1, "unlinkread write failed\n");
    16ec:	83 ec 08             	sub    $0x8,%esp
    16ef:	68 29 4c 00 00       	push   $0x4c29
    16f4:	6a 01                	push   $0x1
    16f6:	e8 ef 29 00 00       	call   40ea <printf>
    16fb:	83 c4 10             	add    $0x10,%esp
    exit();
    16fe:	e8 70 28 00 00       	call   3f73 <exit>
  }
  close(fd);
    1703:	83 ec 0c             	sub    $0xc,%esp
    1706:	ff 75 f4             	pushl  -0xc(%ebp)
    1709:	e8 8d 28 00 00       	call   3f9b <close>
    170e:	83 c4 10             	add    $0x10,%esp
  unlink("unlinkread");
    1711:	83 ec 0c             	sub    $0xc,%esp
    1714:	68 9a 4b 00 00       	push   $0x4b9a
    1719:	e8 a5 28 00 00       	call   3fc3 <unlink>
    171e:	83 c4 10             	add    $0x10,%esp
  printf(1, "unlinkread ok\n");
    1721:	83 ec 08             	sub    $0x8,%esp
    1724:	68 42 4c 00 00       	push   $0x4c42
    1729:	6a 01                	push   $0x1
    172b:	e8 ba 29 00 00       	call   40ea <printf>
    1730:	83 c4 10             	add    $0x10,%esp
}
    1733:	90                   	nop
    1734:	c9                   	leave  
    1735:	c3                   	ret    

00001736 <linktest>:

void
linktest(void)
{
    1736:	55                   	push   %ebp
    1737:	89 e5                	mov    %esp,%ebp
    1739:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(1, "linktest\n");
    173c:	83 ec 08             	sub    $0x8,%esp
    173f:	68 51 4c 00 00       	push   $0x4c51
    1744:	6a 01                	push   $0x1
    1746:	e8 9f 29 00 00       	call   40ea <printf>
    174b:	83 c4 10             	add    $0x10,%esp

  unlink("lf1");
    174e:	83 ec 0c             	sub    $0xc,%esp
    1751:	68 5b 4c 00 00       	push   $0x4c5b
    1756:	e8 68 28 00 00       	call   3fc3 <unlink>
    175b:	83 c4 10             	add    $0x10,%esp
  unlink("lf2");
    175e:	83 ec 0c             	sub    $0xc,%esp
    1761:	68 5f 4c 00 00       	push   $0x4c5f
    1766:	e8 58 28 00 00       	call   3fc3 <unlink>
    176b:	83 c4 10             	add    $0x10,%esp

  fd = open("lf1", O_CREATE|O_RDWR);
    176e:	83 ec 08             	sub    $0x8,%esp
    1771:	68 02 02 00 00       	push   $0x202
    1776:	68 5b 4c 00 00       	push   $0x4c5b
    177b:	e8 33 28 00 00       	call   3fb3 <open>
    1780:	83 c4 10             	add    $0x10,%esp
    1783:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1786:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    178a:	79 17                	jns    17a3 <linktest+0x6d>
    printf(1, "create lf1 failed\n");
    178c:	83 ec 08             	sub    $0x8,%esp
    178f:	68 63 4c 00 00       	push   $0x4c63
    1794:	6a 01                	push   $0x1
    1796:	e8 4f 29 00 00       	call   40ea <printf>
    179b:	83 c4 10             	add    $0x10,%esp
    exit();
    179e:	e8 d0 27 00 00       	call   3f73 <exit>
  }
  if(write(fd, "hello", 5) != 5){
    17a3:	83 ec 04             	sub    $0x4,%esp
    17a6:	6a 05                	push   $0x5
    17a8:	68 bf 4b 00 00       	push   $0x4bbf
    17ad:	ff 75 f4             	pushl  -0xc(%ebp)
    17b0:	e8 de 27 00 00       	call   3f93 <write>
    17b5:	83 c4 10             	add    $0x10,%esp
    17b8:	83 f8 05             	cmp    $0x5,%eax
    17bb:	74 17                	je     17d4 <linktest+0x9e>
    printf(1, "write lf1 failed\n");
    17bd:	83 ec 08             	sub    $0x8,%esp
    17c0:	68 76 4c 00 00       	push   $0x4c76
    17c5:	6a 01                	push   $0x1
    17c7:	e8 1e 29 00 00       	call   40ea <printf>
    17cc:	83 c4 10             	add    $0x10,%esp
    exit();
    17cf:	e8 9f 27 00 00       	call   3f73 <exit>
  }
  close(fd);
    17d4:	83 ec 0c             	sub    $0xc,%esp
    17d7:	ff 75 f4             	pushl  -0xc(%ebp)
    17da:	e8 bc 27 00 00       	call   3f9b <close>
    17df:	83 c4 10             	add    $0x10,%esp

  if(link("lf1", "lf2") < 0){
    17e2:	83 ec 08             	sub    $0x8,%esp
    17e5:	68 5f 4c 00 00       	push   $0x4c5f
    17ea:	68 5b 4c 00 00       	push   $0x4c5b
    17ef:	e8 df 27 00 00       	call   3fd3 <link>
    17f4:	83 c4 10             	add    $0x10,%esp
    17f7:	85 c0                	test   %eax,%eax
    17f9:	79 17                	jns    1812 <linktest+0xdc>
    printf(1, "link lf1 lf2 failed\n");
    17fb:	83 ec 08             	sub    $0x8,%esp
    17fe:	68 88 4c 00 00       	push   $0x4c88
    1803:	6a 01                	push   $0x1
    1805:	e8 e0 28 00 00       	call   40ea <printf>
    180a:	83 c4 10             	add    $0x10,%esp
    exit();
    180d:	e8 61 27 00 00       	call   3f73 <exit>
  }
  unlink("lf1");
    1812:	83 ec 0c             	sub    $0xc,%esp
    1815:	68 5b 4c 00 00       	push   $0x4c5b
    181a:	e8 a4 27 00 00       	call   3fc3 <unlink>
    181f:	83 c4 10             	add    $0x10,%esp

  if(open("lf1", 0) >= 0){
    1822:	83 ec 08             	sub    $0x8,%esp
    1825:	6a 00                	push   $0x0
    1827:	68 5b 4c 00 00       	push   $0x4c5b
    182c:	e8 82 27 00 00       	call   3fb3 <open>
    1831:	83 c4 10             	add    $0x10,%esp
    1834:	85 c0                	test   %eax,%eax
    1836:	78 17                	js     184f <linktest+0x119>
    printf(1, "unlinked lf1 but it is still there!\n");
    1838:	83 ec 08             	sub    $0x8,%esp
    183b:	68 a0 4c 00 00       	push   $0x4ca0
    1840:	6a 01                	push   $0x1
    1842:	e8 a3 28 00 00       	call   40ea <printf>
    1847:	83 c4 10             	add    $0x10,%esp
    exit();
    184a:	e8 24 27 00 00       	call   3f73 <exit>
  }

  fd = open("lf2", 0);
    184f:	83 ec 08             	sub    $0x8,%esp
    1852:	6a 00                	push   $0x0
    1854:	68 5f 4c 00 00       	push   $0x4c5f
    1859:	e8 55 27 00 00       	call   3fb3 <open>
    185e:	83 c4 10             	add    $0x10,%esp
    1861:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1864:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1868:	79 17                	jns    1881 <linktest+0x14b>
    printf(1, "open lf2 failed\n");
    186a:	83 ec 08             	sub    $0x8,%esp
    186d:	68 c5 4c 00 00       	push   $0x4cc5
    1872:	6a 01                	push   $0x1
    1874:	e8 71 28 00 00       	call   40ea <printf>
    1879:	83 c4 10             	add    $0x10,%esp
    exit();
    187c:	e8 f2 26 00 00       	call   3f73 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    1881:	83 ec 04             	sub    $0x4,%esp
    1884:	68 00 20 00 00       	push   $0x2000
    1889:	68 40 8b 00 00       	push   $0x8b40
    188e:	ff 75 f4             	pushl  -0xc(%ebp)
    1891:	e8 f5 26 00 00       	call   3f8b <read>
    1896:	83 c4 10             	add    $0x10,%esp
    1899:	83 f8 05             	cmp    $0x5,%eax
    189c:	74 17                	je     18b5 <linktest+0x17f>
    printf(1, "read lf2 failed\n");
    189e:	83 ec 08             	sub    $0x8,%esp
    18a1:	68 d6 4c 00 00       	push   $0x4cd6
    18a6:	6a 01                	push   $0x1
    18a8:	e8 3d 28 00 00       	call   40ea <printf>
    18ad:	83 c4 10             	add    $0x10,%esp
    exit();
    18b0:	e8 be 26 00 00       	call   3f73 <exit>
  }
  close(fd);
    18b5:	83 ec 0c             	sub    $0xc,%esp
    18b8:	ff 75 f4             	pushl  -0xc(%ebp)
    18bb:	e8 db 26 00 00       	call   3f9b <close>
    18c0:	83 c4 10             	add    $0x10,%esp

  if(link("lf2", "lf2") >= 0){
    18c3:	83 ec 08             	sub    $0x8,%esp
    18c6:	68 5f 4c 00 00       	push   $0x4c5f
    18cb:	68 5f 4c 00 00       	push   $0x4c5f
    18d0:	e8 fe 26 00 00       	call   3fd3 <link>
    18d5:	83 c4 10             	add    $0x10,%esp
    18d8:	85 c0                	test   %eax,%eax
    18da:	78 17                	js     18f3 <linktest+0x1bd>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    18dc:	83 ec 08             	sub    $0x8,%esp
    18df:	68 e7 4c 00 00       	push   $0x4ce7
    18e4:	6a 01                	push   $0x1
    18e6:	e8 ff 27 00 00       	call   40ea <printf>
    18eb:	83 c4 10             	add    $0x10,%esp
    exit();
    18ee:	e8 80 26 00 00       	call   3f73 <exit>
  }

  unlink("lf2");
    18f3:	83 ec 0c             	sub    $0xc,%esp
    18f6:	68 5f 4c 00 00       	push   $0x4c5f
    18fb:	e8 c3 26 00 00       	call   3fc3 <unlink>
    1900:	83 c4 10             	add    $0x10,%esp
  if(link("lf2", "lf1") >= 0){
    1903:	83 ec 08             	sub    $0x8,%esp
    1906:	68 5b 4c 00 00       	push   $0x4c5b
    190b:	68 5f 4c 00 00       	push   $0x4c5f
    1910:	e8 be 26 00 00       	call   3fd3 <link>
    1915:	83 c4 10             	add    $0x10,%esp
    1918:	85 c0                	test   %eax,%eax
    191a:	78 17                	js     1933 <linktest+0x1fd>
    printf(1, "link non-existant succeeded! oops\n");
    191c:	83 ec 08             	sub    $0x8,%esp
    191f:	68 08 4d 00 00       	push   $0x4d08
    1924:	6a 01                	push   $0x1
    1926:	e8 bf 27 00 00       	call   40ea <printf>
    192b:	83 c4 10             	add    $0x10,%esp
    exit();
    192e:	e8 40 26 00 00       	call   3f73 <exit>
  }

  if(link(".", "lf1") >= 0){
    1933:	83 ec 08             	sub    $0x8,%esp
    1936:	68 5b 4c 00 00       	push   $0x4c5b
    193b:	68 2b 4d 00 00       	push   $0x4d2b
    1940:	e8 8e 26 00 00       	call   3fd3 <link>
    1945:	83 c4 10             	add    $0x10,%esp
    1948:	85 c0                	test   %eax,%eax
    194a:	78 17                	js     1963 <linktest+0x22d>
    printf(1, "link . lf1 succeeded! oops\n");
    194c:	83 ec 08             	sub    $0x8,%esp
    194f:	68 2d 4d 00 00       	push   $0x4d2d
    1954:	6a 01                	push   $0x1
    1956:	e8 8f 27 00 00       	call   40ea <printf>
    195b:	83 c4 10             	add    $0x10,%esp
    exit();
    195e:	e8 10 26 00 00       	call   3f73 <exit>
  }

  printf(1, "linktest ok\n");
    1963:	83 ec 08             	sub    $0x8,%esp
    1966:	68 49 4d 00 00       	push   $0x4d49
    196b:	6a 01                	push   $0x1
    196d:	e8 78 27 00 00       	call   40ea <printf>
    1972:	83 c4 10             	add    $0x10,%esp
}
    1975:	90                   	nop
    1976:	c9                   	leave  
    1977:	c3                   	ret    

00001978 <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1978:	55                   	push   %ebp
    1979:	89 e5                	mov    %esp,%ebp
    197b:	83 ec 58             	sub    $0x58,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    197e:	83 ec 08             	sub    $0x8,%esp
    1981:	68 56 4d 00 00       	push   $0x4d56
    1986:	6a 01                	push   $0x1
    1988:	e8 5d 27 00 00       	call   40ea <printf>
    198d:	83 c4 10             	add    $0x10,%esp
  file[0] = 'C';
    1990:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    1994:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    1998:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    199f:	e9 04 01 00 00       	jmp    1aa8 <concreate+0x130>
    file[1] = '0' + i;
    19a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19a7:	83 c0 30             	add    $0x30,%eax
    19aa:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    19ad:	83 ec 0c             	sub    $0xc,%esp
    19b0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19b3:	50                   	push   %eax
    19b4:	e8 0a 26 00 00       	call   3fc3 <unlink>
    19b9:	83 c4 10             	add    $0x10,%esp
    pid = fork(0);
    19bc:	83 ec 0c             	sub    $0xc,%esp
    19bf:	6a 00                	push   $0x0
    19c1:	e8 a5 25 00 00       	call   3f6b <fork>
    19c6:	83 c4 10             	add    $0x10,%esp
    19c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid && (i % 3) == 1){
    19cc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19d0:	74 3b                	je     1a0d <concreate+0x95>
    19d2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    19d5:	ba 56 55 55 55       	mov    $0x55555556,%edx
    19da:	89 c8                	mov    %ecx,%eax
    19dc:	f7 ea                	imul   %edx
    19de:	89 c8                	mov    %ecx,%eax
    19e0:	c1 f8 1f             	sar    $0x1f,%eax
    19e3:	29 c2                	sub    %eax,%edx
    19e5:	89 d0                	mov    %edx,%eax
    19e7:	01 c0                	add    %eax,%eax
    19e9:	01 d0                	add    %edx,%eax
    19eb:	29 c1                	sub    %eax,%ecx
    19ed:	89 ca                	mov    %ecx,%edx
    19ef:	83 fa 01             	cmp    $0x1,%edx
    19f2:	75 19                	jne    1a0d <concreate+0x95>
      link("C0", file);
    19f4:	83 ec 08             	sub    $0x8,%esp
    19f7:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19fa:	50                   	push   %eax
    19fb:	68 66 4d 00 00       	push   $0x4d66
    1a00:	e8 ce 25 00 00       	call   3fd3 <link>
    1a05:	83 c4 10             	add    $0x10,%esp
    1a08:	e9 87 00 00 00       	jmp    1a94 <concreate+0x11c>
    } else if(pid == 0 && (i % 5) == 1){
    1a0d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a11:	75 3b                	jne    1a4e <concreate+0xd6>
    1a13:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1a16:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1a1b:	89 c8                	mov    %ecx,%eax
    1a1d:	f7 ea                	imul   %edx
    1a1f:	d1 fa                	sar    %edx
    1a21:	89 c8                	mov    %ecx,%eax
    1a23:	c1 f8 1f             	sar    $0x1f,%eax
    1a26:	29 c2                	sub    %eax,%edx
    1a28:	89 d0                	mov    %edx,%eax
    1a2a:	c1 e0 02             	shl    $0x2,%eax
    1a2d:	01 d0                	add    %edx,%eax
    1a2f:	29 c1                	sub    %eax,%ecx
    1a31:	89 ca                	mov    %ecx,%edx
    1a33:	83 fa 01             	cmp    $0x1,%edx
    1a36:	75 16                	jne    1a4e <concreate+0xd6>
      link("C0", file);
    1a38:	83 ec 08             	sub    $0x8,%esp
    1a3b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1a3e:	50                   	push   %eax
    1a3f:	68 66 4d 00 00       	push   $0x4d66
    1a44:	e8 8a 25 00 00       	call   3fd3 <link>
    1a49:	83 c4 10             	add    $0x10,%esp
    1a4c:	eb 46                	jmp    1a94 <concreate+0x11c>
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1a4e:	83 ec 08             	sub    $0x8,%esp
    1a51:	68 02 02 00 00       	push   $0x202
    1a56:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1a59:	50                   	push   %eax
    1a5a:	e8 54 25 00 00       	call   3fb3 <open>
    1a5f:	83 c4 10             	add    $0x10,%esp
    1a62:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(fd < 0){
    1a65:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1a69:	79 1b                	jns    1a86 <concreate+0x10e>
        printf(1, "concreate create %s failed\n", file);
    1a6b:	83 ec 04             	sub    $0x4,%esp
    1a6e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1a71:	50                   	push   %eax
    1a72:	68 69 4d 00 00       	push   $0x4d69
    1a77:	6a 01                	push   $0x1
    1a79:	e8 6c 26 00 00       	call   40ea <printf>
    1a7e:	83 c4 10             	add    $0x10,%esp
        exit();
    1a81:	e8 ed 24 00 00       	call   3f73 <exit>
      }
      close(fd);
    1a86:	83 ec 0c             	sub    $0xc,%esp
    1a89:	ff 75 e8             	pushl  -0x18(%ebp)
    1a8c:	e8 0a 25 00 00       	call   3f9b <close>
    1a91:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    1a94:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a98:	75 05                	jne    1a9f <concreate+0x127>
      exit();
    1a9a:	e8 d4 24 00 00       	call   3f73 <exit>
    else
      wait();
    1a9f:	e8 d7 24 00 00       	call   3f7b <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1aa4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1aa8:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1aac:	0f 8e f2 fe ff ff    	jle    19a4 <concreate+0x2c>
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    1ab2:	83 ec 04             	sub    $0x4,%esp
    1ab5:	6a 28                	push   $0x28
    1ab7:	6a 00                	push   $0x0
    1ab9:	8d 45 bd             	lea    -0x43(%ebp),%eax
    1abc:	50                   	push   %eax
    1abd:	e8 16 23 00 00       	call   3dd8 <memset>
    1ac2:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    1ac5:	83 ec 08             	sub    $0x8,%esp
    1ac8:	6a 00                	push   $0x0
    1aca:	68 2b 4d 00 00       	push   $0x4d2b
    1acf:	e8 df 24 00 00       	call   3fb3 <open>
    1ad4:	83 c4 10             	add    $0x10,%esp
    1ad7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  n = 0;
    1ada:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    1ae1:	e9 93 00 00 00       	jmp    1b79 <concreate+0x201>
    if(de.inum == 0)
    1ae6:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    1aea:	66 85 c0             	test   %ax,%ax
    1aed:	75 05                	jne    1af4 <concreate+0x17c>
      continue;
    1aef:	e9 85 00 00 00       	jmp    1b79 <concreate+0x201>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1af4:	0f b6 45 ae          	movzbl -0x52(%ebp),%eax
    1af8:	3c 43                	cmp    $0x43,%al
    1afa:	75 7d                	jne    1b79 <concreate+0x201>
    1afc:	0f b6 45 b0          	movzbl -0x50(%ebp),%eax
    1b00:	84 c0                	test   %al,%al
    1b02:	75 75                	jne    1b79 <concreate+0x201>
      i = de.name[1] - '0';
    1b04:	0f b6 45 af          	movzbl -0x51(%ebp),%eax
    1b08:	0f be c0             	movsbl %al,%eax
    1b0b:	83 e8 30             	sub    $0x30,%eax
    1b0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(i < 0 || i >= sizeof(fa)){
    1b11:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1b15:	78 08                	js     1b1f <concreate+0x1a7>
    1b17:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b1a:	83 f8 27             	cmp    $0x27,%eax
    1b1d:	76 1e                	jbe    1b3d <concreate+0x1c5>
        printf(1, "concreate weird file %s\n", de.name);
    1b1f:	83 ec 04             	sub    $0x4,%esp
    1b22:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1b25:	83 c0 02             	add    $0x2,%eax
    1b28:	50                   	push   %eax
    1b29:	68 85 4d 00 00       	push   $0x4d85
    1b2e:	6a 01                	push   $0x1
    1b30:	e8 b5 25 00 00       	call   40ea <printf>
    1b35:	83 c4 10             	add    $0x10,%esp
        exit();
    1b38:	e8 36 24 00 00       	call   3f73 <exit>
      }
      if(fa[i]){
    1b3d:	8d 55 bd             	lea    -0x43(%ebp),%edx
    1b40:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b43:	01 d0                	add    %edx,%eax
    1b45:	0f b6 00             	movzbl (%eax),%eax
    1b48:	84 c0                	test   %al,%al
    1b4a:	74 1e                	je     1b6a <concreate+0x1f2>
        printf(1, "concreate duplicate file %s\n", de.name);
    1b4c:	83 ec 04             	sub    $0x4,%esp
    1b4f:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1b52:	83 c0 02             	add    $0x2,%eax
    1b55:	50                   	push   %eax
    1b56:	68 9e 4d 00 00       	push   $0x4d9e
    1b5b:	6a 01                	push   $0x1
    1b5d:	e8 88 25 00 00       	call   40ea <printf>
    1b62:	83 c4 10             	add    $0x10,%esp
        exit();
    1b65:	e8 09 24 00 00       	call   3f73 <exit>
      }
      fa[i] = 1;
    1b6a:	8d 55 bd             	lea    -0x43(%ebp),%edx
    1b6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b70:	01 d0                	add    %edx,%eax
    1b72:	c6 00 01             	movb   $0x1,(%eax)
      n++;
    1b75:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1b79:	83 ec 04             	sub    $0x4,%esp
    1b7c:	6a 10                	push   $0x10
    1b7e:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1b81:	50                   	push   %eax
    1b82:	ff 75 e8             	pushl  -0x18(%ebp)
    1b85:	e8 01 24 00 00       	call   3f8b <read>
    1b8a:	83 c4 10             	add    $0x10,%esp
    1b8d:	85 c0                	test   %eax,%eax
    1b8f:	0f 8f 51 ff ff ff    	jg     1ae6 <concreate+0x16e>
      }
      fa[i] = 1;
      n++;
    }
  }
  close(fd);
    1b95:	83 ec 0c             	sub    $0xc,%esp
    1b98:	ff 75 e8             	pushl  -0x18(%ebp)
    1b9b:	e8 fb 23 00 00       	call   3f9b <close>
    1ba0:	83 c4 10             	add    $0x10,%esp

  if(n != 40){
    1ba3:	83 7d f0 28          	cmpl   $0x28,-0x10(%ebp)
    1ba7:	74 17                	je     1bc0 <concreate+0x248>
    printf(1, "concreate not enough files in directory listing\n");
    1ba9:	83 ec 08             	sub    $0x8,%esp
    1bac:	68 bc 4d 00 00       	push   $0x4dbc
    1bb1:	6a 01                	push   $0x1
    1bb3:	e8 32 25 00 00       	call   40ea <printf>
    1bb8:	83 c4 10             	add    $0x10,%esp
    exit();
    1bbb:	e8 b3 23 00 00       	call   3f73 <exit>
  }

  for(i = 0; i < 40; i++){
    1bc0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1bc7:	e9 4d 01 00 00       	jmp    1d19 <concreate+0x3a1>
    file[1] = '0' + i;
    1bcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bcf:	83 c0 30             	add    $0x30,%eax
    1bd2:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork(0);
    1bd5:	83 ec 0c             	sub    $0xc,%esp
    1bd8:	6a 00                	push   $0x0
    1bda:	e8 8c 23 00 00       	call   3f6b <fork>
    1bdf:	83 c4 10             	add    $0x10,%esp
    1be2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    1be5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1be9:	79 17                	jns    1c02 <concreate+0x28a>
      printf(1, "fork failed\n");
    1beb:	83 ec 08             	sub    $0x8,%esp
    1bee:	68 41 45 00 00       	push   $0x4541
    1bf3:	6a 01                	push   $0x1
    1bf5:	e8 f0 24 00 00       	call   40ea <printf>
    1bfa:	83 c4 10             	add    $0x10,%esp
      exit();
    1bfd:	e8 71 23 00 00       	call   3f73 <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    1c02:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1c05:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1c0a:	89 c8                	mov    %ecx,%eax
    1c0c:	f7 ea                	imul   %edx
    1c0e:	89 c8                	mov    %ecx,%eax
    1c10:	c1 f8 1f             	sar    $0x1f,%eax
    1c13:	29 c2                	sub    %eax,%edx
    1c15:	89 d0                	mov    %edx,%eax
    1c17:	89 c2                	mov    %eax,%edx
    1c19:	01 d2                	add    %edx,%edx
    1c1b:	01 c2                	add    %eax,%edx
    1c1d:	89 c8                	mov    %ecx,%eax
    1c1f:	29 d0                	sub    %edx,%eax
    1c21:	85 c0                	test   %eax,%eax
    1c23:	75 06                	jne    1c2b <concreate+0x2b3>
    1c25:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c29:	74 28                	je     1c53 <concreate+0x2db>
       ((i % 3) == 1 && pid != 0)){
    1c2b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1c2e:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1c33:	89 c8                	mov    %ecx,%eax
    1c35:	f7 ea                	imul   %edx
    1c37:	89 c8                	mov    %ecx,%eax
    1c39:	c1 f8 1f             	sar    $0x1f,%eax
    1c3c:	29 c2                	sub    %eax,%edx
    1c3e:	89 d0                	mov    %edx,%eax
    1c40:	01 c0                	add    %eax,%eax
    1c42:	01 d0                	add    %edx,%eax
    1c44:	29 c1                	sub    %eax,%ecx
    1c46:	89 ca                	mov    %ecx,%edx
    pid = fork(0);
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    1c48:	83 fa 01             	cmp    $0x1,%edx
    1c4b:	75 7c                	jne    1cc9 <concreate+0x351>
       ((i % 3) == 1 && pid != 0)){
    1c4d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c51:	74 76                	je     1cc9 <concreate+0x351>
      close(open(file, 0));
    1c53:	83 ec 08             	sub    $0x8,%esp
    1c56:	6a 00                	push   $0x0
    1c58:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c5b:	50                   	push   %eax
    1c5c:	e8 52 23 00 00       	call   3fb3 <open>
    1c61:	83 c4 10             	add    $0x10,%esp
    1c64:	83 ec 0c             	sub    $0xc,%esp
    1c67:	50                   	push   %eax
    1c68:	e8 2e 23 00 00       	call   3f9b <close>
    1c6d:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    1c70:	83 ec 08             	sub    $0x8,%esp
    1c73:	6a 00                	push   $0x0
    1c75:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c78:	50                   	push   %eax
    1c79:	e8 35 23 00 00       	call   3fb3 <open>
    1c7e:	83 c4 10             	add    $0x10,%esp
    1c81:	83 ec 0c             	sub    $0xc,%esp
    1c84:	50                   	push   %eax
    1c85:	e8 11 23 00 00       	call   3f9b <close>
    1c8a:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    1c8d:	83 ec 08             	sub    $0x8,%esp
    1c90:	6a 00                	push   $0x0
    1c92:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c95:	50                   	push   %eax
    1c96:	e8 18 23 00 00       	call   3fb3 <open>
    1c9b:	83 c4 10             	add    $0x10,%esp
    1c9e:	83 ec 0c             	sub    $0xc,%esp
    1ca1:	50                   	push   %eax
    1ca2:	e8 f4 22 00 00       	call   3f9b <close>
    1ca7:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    1caa:	83 ec 08             	sub    $0x8,%esp
    1cad:	6a 00                	push   $0x0
    1caf:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1cb2:	50                   	push   %eax
    1cb3:	e8 fb 22 00 00       	call   3fb3 <open>
    1cb8:	83 c4 10             	add    $0x10,%esp
    1cbb:	83 ec 0c             	sub    $0xc,%esp
    1cbe:	50                   	push   %eax
    1cbf:	e8 d7 22 00 00       	call   3f9b <close>
    1cc4:	83 c4 10             	add    $0x10,%esp
    1cc7:	eb 3c                	jmp    1d05 <concreate+0x38d>
    } else {
      unlink(file);
    1cc9:	83 ec 0c             	sub    $0xc,%esp
    1ccc:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1ccf:	50                   	push   %eax
    1cd0:	e8 ee 22 00 00       	call   3fc3 <unlink>
    1cd5:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    1cd8:	83 ec 0c             	sub    $0xc,%esp
    1cdb:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1cde:	50                   	push   %eax
    1cdf:	e8 df 22 00 00       	call   3fc3 <unlink>
    1ce4:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    1ce7:	83 ec 0c             	sub    $0xc,%esp
    1cea:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1ced:	50                   	push   %eax
    1cee:	e8 d0 22 00 00       	call   3fc3 <unlink>
    1cf3:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    1cf6:	83 ec 0c             	sub    $0xc,%esp
    1cf9:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1cfc:	50                   	push   %eax
    1cfd:	e8 c1 22 00 00       	call   3fc3 <unlink>
    1d02:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    1d05:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d09:	75 05                	jne    1d10 <concreate+0x398>
      exit();
    1d0b:	e8 63 22 00 00       	call   3f73 <exit>
    else
      wait();
    1d10:	e8 66 22 00 00       	call   3f7b <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1d15:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1d19:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1d1d:	0f 8e a9 fe ff ff    	jle    1bcc <concreate+0x254>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1d23:	83 ec 08             	sub    $0x8,%esp
    1d26:	68 ed 4d 00 00       	push   $0x4ded
    1d2b:	6a 01                	push   $0x1
    1d2d:	e8 b8 23 00 00       	call   40ea <printf>
    1d32:	83 c4 10             	add    $0x10,%esp
}
    1d35:	90                   	nop
    1d36:	c9                   	leave  
    1d37:	c3                   	ret    

00001d38 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1d38:	55                   	push   %ebp
    1d39:	89 e5                	mov    %esp,%ebp
    1d3b:	83 ec 18             	sub    $0x18,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1d3e:	83 ec 08             	sub    $0x8,%esp
    1d41:	68 fb 4d 00 00       	push   $0x4dfb
    1d46:	6a 01                	push   $0x1
    1d48:	e8 9d 23 00 00       	call   40ea <printf>
    1d4d:	83 c4 10             	add    $0x10,%esp

  unlink("x");
    1d50:	83 ec 0c             	sub    $0xc,%esp
    1d53:	68 77 49 00 00       	push   $0x4977
    1d58:	e8 66 22 00 00       	call   3fc3 <unlink>
    1d5d:	83 c4 10             	add    $0x10,%esp
  pid = fork(0);
    1d60:	83 ec 0c             	sub    $0xc,%esp
    1d63:	6a 00                	push   $0x0
    1d65:	e8 01 22 00 00       	call   3f6b <fork>
    1d6a:	83 c4 10             	add    $0x10,%esp
    1d6d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    1d70:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d74:	79 17                	jns    1d8d <linkunlink+0x55>
    printf(1, "fork failed\n");
    1d76:	83 ec 08             	sub    $0x8,%esp
    1d79:	68 41 45 00 00       	push   $0x4541
    1d7e:	6a 01                	push   $0x1
    1d80:	e8 65 23 00 00       	call   40ea <printf>
    1d85:	83 c4 10             	add    $0x10,%esp
    exit();
    1d88:	e8 e6 21 00 00       	call   3f73 <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    1d8d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d91:	74 07                	je     1d9a <linkunlink+0x62>
    1d93:	b8 01 00 00 00       	mov    $0x1,%eax
    1d98:	eb 05                	jmp    1d9f <linkunlink+0x67>
    1d9a:	b8 61 00 00 00       	mov    $0x61,%eax
    1d9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 100; i++){
    1da2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1da9:	e9 9a 00 00 00       	jmp    1e48 <linkunlink+0x110>
    x = x * 1103515245 + 12345;
    1dae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1db1:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
    1db7:	05 39 30 00 00       	add    $0x3039,%eax
    1dbc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((x % 3) == 0){
    1dbf:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1dc2:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1dc7:	89 c8                	mov    %ecx,%eax
    1dc9:	f7 e2                	mul    %edx
    1dcb:	89 d0                	mov    %edx,%eax
    1dcd:	d1 e8                	shr    %eax
    1dcf:	89 c2                	mov    %eax,%edx
    1dd1:	01 d2                	add    %edx,%edx
    1dd3:	01 c2                	add    %eax,%edx
    1dd5:	89 c8                	mov    %ecx,%eax
    1dd7:	29 d0                	sub    %edx,%eax
    1dd9:	85 c0                	test   %eax,%eax
    1ddb:	75 23                	jne    1e00 <linkunlink+0xc8>
      close(open("x", O_RDWR | O_CREATE));
    1ddd:	83 ec 08             	sub    $0x8,%esp
    1de0:	68 02 02 00 00       	push   $0x202
    1de5:	68 77 49 00 00       	push   $0x4977
    1dea:	e8 c4 21 00 00       	call   3fb3 <open>
    1def:	83 c4 10             	add    $0x10,%esp
    1df2:	83 ec 0c             	sub    $0xc,%esp
    1df5:	50                   	push   %eax
    1df6:	e8 a0 21 00 00       	call   3f9b <close>
    1dfb:	83 c4 10             	add    $0x10,%esp
    1dfe:	eb 44                	jmp    1e44 <linkunlink+0x10c>
    } else if((x % 3) == 1){
    1e00:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1e03:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1e08:	89 c8                	mov    %ecx,%eax
    1e0a:	f7 e2                	mul    %edx
    1e0c:	d1 ea                	shr    %edx
    1e0e:	89 d0                	mov    %edx,%eax
    1e10:	01 c0                	add    %eax,%eax
    1e12:	01 d0                	add    %edx,%eax
    1e14:	29 c1                	sub    %eax,%ecx
    1e16:	89 ca                	mov    %ecx,%edx
    1e18:	83 fa 01             	cmp    $0x1,%edx
    1e1b:	75 17                	jne    1e34 <linkunlink+0xfc>
      link("cat", "x");
    1e1d:	83 ec 08             	sub    $0x8,%esp
    1e20:	68 77 49 00 00       	push   $0x4977
    1e25:	68 0c 4e 00 00       	push   $0x4e0c
    1e2a:	e8 a4 21 00 00       	call   3fd3 <link>
    1e2f:	83 c4 10             	add    $0x10,%esp
    1e32:	eb 10                	jmp    1e44 <linkunlink+0x10c>
    } else {
      unlink("x");
    1e34:	83 ec 0c             	sub    $0xc,%esp
    1e37:	68 77 49 00 00       	push   $0x4977
    1e3c:	e8 82 21 00 00       	call   3fc3 <unlink>
    1e41:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1e44:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1e48:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    1e4c:	0f 8e 5c ff ff ff    	jle    1dae <linkunlink+0x76>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1e52:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1e56:	74 07                	je     1e5f <linkunlink+0x127>
    wait();
    1e58:	e8 1e 21 00 00       	call   3f7b <wait>
    1e5d:	eb 05                	jmp    1e64 <linkunlink+0x12c>
  else 
    exit();
    1e5f:	e8 0f 21 00 00       	call   3f73 <exit>

  printf(1, "linkunlink ok\n");
    1e64:	83 ec 08             	sub    $0x8,%esp
    1e67:	68 10 4e 00 00       	push   $0x4e10
    1e6c:	6a 01                	push   $0x1
    1e6e:	e8 77 22 00 00       	call   40ea <printf>
    1e73:	83 c4 10             	add    $0x10,%esp
}
    1e76:	90                   	nop
    1e77:	c9                   	leave  
    1e78:	c3                   	ret    

00001e79 <bigdir>:

// directory that uses indirect blocks
void
bigdir(void)
{
    1e79:	55                   	push   %ebp
    1e7a:	89 e5                	mov    %esp,%ebp
    1e7c:	83 ec 28             	sub    $0x28,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1e7f:	83 ec 08             	sub    $0x8,%esp
    1e82:	68 1f 4e 00 00       	push   $0x4e1f
    1e87:	6a 01                	push   $0x1
    1e89:	e8 5c 22 00 00       	call   40ea <printf>
    1e8e:	83 c4 10             	add    $0x10,%esp
  unlink("bd");
    1e91:	83 ec 0c             	sub    $0xc,%esp
    1e94:	68 2c 4e 00 00       	push   $0x4e2c
    1e99:	e8 25 21 00 00       	call   3fc3 <unlink>
    1e9e:	83 c4 10             	add    $0x10,%esp

  fd = open("bd", O_CREATE);
    1ea1:	83 ec 08             	sub    $0x8,%esp
    1ea4:	68 00 02 00 00       	push   $0x200
    1ea9:	68 2c 4e 00 00       	push   $0x4e2c
    1eae:	e8 00 21 00 00       	call   3fb3 <open>
    1eb3:	83 c4 10             	add    $0x10,%esp
    1eb6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    1eb9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1ebd:	79 17                	jns    1ed6 <bigdir+0x5d>
    printf(1, "bigdir create failed\n");
    1ebf:	83 ec 08             	sub    $0x8,%esp
    1ec2:	68 2f 4e 00 00       	push   $0x4e2f
    1ec7:	6a 01                	push   $0x1
    1ec9:	e8 1c 22 00 00       	call   40ea <printf>
    1ece:	83 c4 10             	add    $0x10,%esp
    exit();
    1ed1:	e8 9d 20 00 00       	call   3f73 <exit>
  }
  close(fd);
    1ed6:	83 ec 0c             	sub    $0xc,%esp
    1ed9:	ff 75 f0             	pushl  -0x10(%ebp)
    1edc:	e8 ba 20 00 00       	call   3f9b <close>
    1ee1:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 500; i++){
    1ee4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1eeb:	eb 63                	jmp    1f50 <bigdir+0xd7>
    name[0] = 'x';
    1eed:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1ef1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ef4:	8d 50 3f             	lea    0x3f(%eax),%edx
    1ef7:	85 c0                	test   %eax,%eax
    1ef9:	0f 48 c2             	cmovs  %edx,%eax
    1efc:	c1 f8 06             	sar    $0x6,%eax
    1eff:	83 c0 30             	add    $0x30,%eax
    1f02:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1f05:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f08:	99                   	cltd   
    1f09:	c1 ea 1a             	shr    $0x1a,%edx
    1f0c:	01 d0                	add    %edx,%eax
    1f0e:	83 e0 3f             	and    $0x3f,%eax
    1f11:	29 d0                	sub    %edx,%eax
    1f13:	83 c0 30             	add    $0x30,%eax
    1f16:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1f19:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(link("bd", name) != 0){
    1f1d:	83 ec 08             	sub    $0x8,%esp
    1f20:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1f23:	50                   	push   %eax
    1f24:	68 2c 4e 00 00       	push   $0x4e2c
    1f29:	e8 a5 20 00 00       	call   3fd3 <link>
    1f2e:	83 c4 10             	add    $0x10,%esp
    1f31:	85 c0                	test   %eax,%eax
    1f33:	74 17                	je     1f4c <bigdir+0xd3>
      printf(1, "bigdir link failed\n");
    1f35:	83 ec 08             	sub    $0x8,%esp
    1f38:	68 45 4e 00 00       	push   $0x4e45
    1f3d:	6a 01                	push   $0x1
    1f3f:	e8 a6 21 00 00       	call   40ea <printf>
    1f44:	83 c4 10             	add    $0x10,%esp
      exit();
    1f47:	e8 27 20 00 00       	call   3f73 <exit>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1f4c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1f50:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1f57:	7e 94                	jle    1eed <bigdir+0x74>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1f59:	83 ec 0c             	sub    $0xc,%esp
    1f5c:	68 2c 4e 00 00       	push   $0x4e2c
    1f61:	e8 5d 20 00 00       	call   3fc3 <unlink>
    1f66:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    1f69:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1f70:	eb 5e                	jmp    1fd0 <bigdir+0x157>
    name[0] = 'x';
    1f72:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1f76:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f79:	8d 50 3f             	lea    0x3f(%eax),%edx
    1f7c:	85 c0                	test   %eax,%eax
    1f7e:	0f 48 c2             	cmovs  %edx,%eax
    1f81:	c1 f8 06             	sar    $0x6,%eax
    1f84:	83 c0 30             	add    $0x30,%eax
    1f87:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1f8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f8d:	99                   	cltd   
    1f8e:	c1 ea 1a             	shr    $0x1a,%edx
    1f91:	01 d0                	add    %edx,%eax
    1f93:	83 e0 3f             	and    $0x3f,%eax
    1f96:	29 d0                	sub    %edx,%eax
    1f98:	83 c0 30             	add    $0x30,%eax
    1f9b:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1f9e:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(unlink(name) != 0){
    1fa2:	83 ec 0c             	sub    $0xc,%esp
    1fa5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1fa8:	50                   	push   %eax
    1fa9:	e8 15 20 00 00       	call   3fc3 <unlink>
    1fae:	83 c4 10             	add    $0x10,%esp
    1fb1:	85 c0                	test   %eax,%eax
    1fb3:	74 17                	je     1fcc <bigdir+0x153>
      printf(1, "bigdir unlink failed");
    1fb5:	83 ec 08             	sub    $0x8,%esp
    1fb8:	68 59 4e 00 00       	push   $0x4e59
    1fbd:	6a 01                	push   $0x1
    1fbf:	e8 26 21 00 00       	call   40ea <printf>
    1fc4:	83 c4 10             	add    $0x10,%esp
      exit();
    1fc7:	e8 a7 1f 00 00       	call   3f73 <exit>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1fcc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1fd0:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1fd7:	7e 99                	jle    1f72 <bigdir+0xf9>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1fd9:	83 ec 08             	sub    $0x8,%esp
    1fdc:	68 6e 4e 00 00       	push   $0x4e6e
    1fe1:	6a 01                	push   $0x1
    1fe3:	e8 02 21 00 00       	call   40ea <printf>
    1fe8:	83 c4 10             	add    $0x10,%esp
}
    1feb:	90                   	nop
    1fec:	c9                   	leave  
    1fed:	c3                   	ret    

00001fee <subdir>:

void
subdir(void)
{
    1fee:	55                   	push   %ebp
    1fef:	89 e5                	mov    %esp,%ebp
    1ff1:	83 ec 18             	sub    $0x18,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1ff4:	83 ec 08             	sub    $0x8,%esp
    1ff7:	68 79 4e 00 00       	push   $0x4e79
    1ffc:	6a 01                	push   $0x1
    1ffe:	e8 e7 20 00 00       	call   40ea <printf>
    2003:	83 c4 10             	add    $0x10,%esp

  unlink("ff");
    2006:	83 ec 0c             	sub    $0xc,%esp
    2009:	68 86 4e 00 00       	push   $0x4e86
    200e:	e8 b0 1f 00 00       	call   3fc3 <unlink>
    2013:	83 c4 10             	add    $0x10,%esp
  if(mkdir("dd") != 0){
    2016:	83 ec 0c             	sub    $0xc,%esp
    2019:	68 89 4e 00 00       	push   $0x4e89
    201e:	e8 b8 1f 00 00       	call   3fdb <mkdir>
    2023:	83 c4 10             	add    $0x10,%esp
    2026:	85 c0                	test   %eax,%eax
    2028:	74 17                	je     2041 <subdir+0x53>
    printf(1, "subdir mkdir dd failed\n");
    202a:	83 ec 08             	sub    $0x8,%esp
    202d:	68 8c 4e 00 00       	push   $0x4e8c
    2032:	6a 01                	push   $0x1
    2034:	e8 b1 20 00 00       	call   40ea <printf>
    2039:	83 c4 10             	add    $0x10,%esp
    exit();
    203c:	e8 32 1f 00 00       	call   3f73 <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    2041:	83 ec 08             	sub    $0x8,%esp
    2044:	68 02 02 00 00       	push   $0x202
    2049:	68 a4 4e 00 00       	push   $0x4ea4
    204e:	e8 60 1f 00 00       	call   3fb3 <open>
    2053:	83 c4 10             	add    $0x10,%esp
    2056:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2059:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    205d:	79 17                	jns    2076 <subdir+0x88>
    printf(1, "create dd/ff failed\n");
    205f:	83 ec 08             	sub    $0x8,%esp
    2062:	68 aa 4e 00 00       	push   $0x4eaa
    2067:	6a 01                	push   $0x1
    2069:	e8 7c 20 00 00       	call   40ea <printf>
    206e:	83 c4 10             	add    $0x10,%esp
    exit();
    2071:	e8 fd 1e 00 00       	call   3f73 <exit>
  }
  write(fd, "ff", 2);
    2076:	83 ec 04             	sub    $0x4,%esp
    2079:	6a 02                	push   $0x2
    207b:	68 86 4e 00 00       	push   $0x4e86
    2080:	ff 75 f4             	pushl  -0xc(%ebp)
    2083:	e8 0b 1f 00 00       	call   3f93 <write>
    2088:	83 c4 10             	add    $0x10,%esp
  close(fd);
    208b:	83 ec 0c             	sub    $0xc,%esp
    208e:	ff 75 f4             	pushl  -0xc(%ebp)
    2091:	e8 05 1f 00 00       	call   3f9b <close>
    2096:	83 c4 10             	add    $0x10,%esp
  
  if(unlink("dd") >= 0){
    2099:	83 ec 0c             	sub    $0xc,%esp
    209c:	68 89 4e 00 00       	push   $0x4e89
    20a1:	e8 1d 1f 00 00       	call   3fc3 <unlink>
    20a6:	83 c4 10             	add    $0x10,%esp
    20a9:	85 c0                	test   %eax,%eax
    20ab:	78 17                	js     20c4 <subdir+0xd6>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    20ad:	83 ec 08             	sub    $0x8,%esp
    20b0:	68 c0 4e 00 00       	push   $0x4ec0
    20b5:	6a 01                	push   $0x1
    20b7:	e8 2e 20 00 00       	call   40ea <printf>
    20bc:	83 c4 10             	add    $0x10,%esp
    exit();
    20bf:	e8 af 1e 00 00       	call   3f73 <exit>
  }

  if(mkdir("/dd/dd") != 0){
    20c4:	83 ec 0c             	sub    $0xc,%esp
    20c7:	68 e6 4e 00 00       	push   $0x4ee6
    20cc:	e8 0a 1f 00 00       	call   3fdb <mkdir>
    20d1:	83 c4 10             	add    $0x10,%esp
    20d4:	85 c0                	test   %eax,%eax
    20d6:	74 17                	je     20ef <subdir+0x101>
    printf(1, "subdir mkdir dd/dd failed\n");
    20d8:	83 ec 08             	sub    $0x8,%esp
    20db:	68 ed 4e 00 00       	push   $0x4eed
    20e0:	6a 01                	push   $0x1
    20e2:	e8 03 20 00 00       	call   40ea <printf>
    20e7:	83 c4 10             	add    $0x10,%esp
    exit();
    20ea:	e8 84 1e 00 00       	call   3f73 <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    20ef:	83 ec 08             	sub    $0x8,%esp
    20f2:	68 02 02 00 00       	push   $0x202
    20f7:	68 08 4f 00 00       	push   $0x4f08
    20fc:	e8 b2 1e 00 00       	call   3fb3 <open>
    2101:	83 c4 10             	add    $0x10,%esp
    2104:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2107:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    210b:	79 17                	jns    2124 <subdir+0x136>
    printf(1, "create dd/dd/ff failed\n");
    210d:	83 ec 08             	sub    $0x8,%esp
    2110:	68 11 4f 00 00       	push   $0x4f11
    2115:	6a 01                	push   $0x1
    2117:	e8 ce 1f 00 00       	call   40ea <printf>
    211c:	83 c4 10             	add    $0x10,%esp
    exit();
    211f:	e8 4f 1e 00 00       	call   3f73 <exit>
  }
  write(fd, "FF", 2);
    2124:	83 ec 04             	sub    $0x4,%esp
    2127:	6a 02                	push   $0x2
    2129:	68 29 4f 00 00       	push   $0x4f29
    212e:	ff 75 f4             	pushl  -0xc(%ebp)
    2131:	e8 5d 1e 00 00       	call   3f93 <write>
    2136:	83 c4 10             	add    $0x10,%esp
  close(fd);
    2139:	83 ec 0c             	sub    $0xc,%esp
    213c:	ff 75 f4             	pushl  -0xc(%ebp)
    213f:	e8 57 1e 00 00       	call   3f9b <close>
    2144:	83 c4 10             	add    $0x10,%esp

  fd = open("dd/dd/../ff", 0);
    2147:	83 ec 08             	sub    $0x8,%esp
    214a:	6a 00                	push   $0x0
    214c:	68 2c 4f 00 00       	push   $0x4f2c
    2151:	e8 5d 1e 00 00       	call   3fb3 <open>
    2156:	83 c4 10             	add    $0x10,%esp
    2159:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    215c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2160:	79 17                	jns    2179 <subdir+0x18b>
    printf(1, "open dd/dd/../ff failed\n");
    2162:	83 ec 08             	sub    $0x8,%esp
    2165:	68 38 4f 00 00       	push   $0x4f38
    216a:	6a 01                	push   $0x1
    216c:	e8 79 1f 00 00       	call   40ea <printf>
    2171:	83 c4 10             	add    $0x10,%esp
    exit();
    2174:	e8 fa 1d 00 00       	call   3f73 <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    2179:	83 ec 04             	sub    $0x4,%esp
    217c:	68 00 20 00 00       	push   $0x2000
    2181:	68 40 8b 00 00       	push   $0x8b40
    2186:	ff 75 f4             	pushl  -0xc(%ebp)
    2189:	e8 fd 1d 00 00       	call   3f8b <read>
    218e:	83 c4 10             	add    $0x10,%esp
    2191:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(cc != 2 || buf[0] != 'f'){
    2194:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    2198:	75 0b                	jne    21a5 <subdir+0x1b7>
    219a:	0f b6 05 40 8b 00 00 	movzbl 0x8b40,%eax
    21a1:	3c 66                	cmp    $0x66,%al
    21a3:	74 17                	je     21bc <subdir+0x1ce>
    printf(1, "dd/dd/../ff wrong content\n");
    21a5:	83 ec 08             	sub    $0x8,%esp
    21a8:	68 51 4f 00 00       	push   $0x4f51
    21ad:	6a 01                	push   $0x1
    21af:	e8 36 1f 00 00       	call   40ea <printf>
    21b4:	83 c4 10             	add    $0x10,%esp
    exit();
    21b7:	e8 b7 1d 00 00       	call   3f73 <exit>
  }
  close(fd);
    21bc:	83 ec 0c             	sub    $0xc,%esp
    21bf:	ff 75 f4             	pushl  -0xc(%ebp)
    21c2:	e8 d4 1d 00 00       	call   3f9b <close>
    21c7:	83 c4 10             	add    $0x10,%esp

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    21ca:	83 ec 08             	sub    $0x8,%esp
    21cd:	68 6c 4f 00 00       	push   $0x4f6c
    21d2:	68 08 4f 00 00       	push   $0x4f08
    21d7:	e8 f7 1d 00 00       	call   3fd3 <link>
    21dc:	83 c4 10             	add    $0x10,%esp
    21df:	85 c0                	test   %eax,%eax
    21e1:	74 17                	je     21fa <subdir+0x20c>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    21e3:	83 ec 08             	sub    $0x8,%esp
    21e6:	68 78 4f 00 00       	push   $0x4f78
    21eb:	6a 01                	push   $0x1
    21ed:	e8 f8 1e 00 00       	call   40ea <printf>
    21f2:	83 c4 10             	add    $0x10,%esp
    exit();
    21f5:	e8 79 1d 00 00       	call   3f73 <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    21fa:	83 ec 0c             	sub    $0xc,%esp
    21fd:	68 08 4f 00 00       	push   $0x4f08
    2202:	e8 bc 1d 00 00       	call   3fc3 <unlink>
    2207:	83 c4 10             	add    $0x10,%esp
    220a:	85 c0                	test   %eax,%eax
    220c:	74 17                	je     2225 <subdir+0x237>
    printf(1, "unlink dd/dd/ff failed\n");
    220e:	83 ec 08             	sub    $0x8,%esp
    2211:	68 99 4f 00 00       	push   $0x4f99
    2216:	6a 01                	push   $0x1
    2218:	e8 cd 1e 00 00       	call   40ea <printf>
    221d:	83 c4 10             	add    $0x10,%esp
    exit();
    2220:	e8 4e 1d 00 00       	call   3f73 <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2225:	83 ec 08             	sub    $0x8,%esp
    2228:	6a 00                	push   $0x0
    222a:	68 08 4f 00 00       	push   $0x4f08
    222f:	e8 7f 1d 00 00       	call   3fb3 <open>
    2234:	83 c4 10             	add    $0x10,%esp
    2237:	85 c0                	test   %eax,%eax
    2239:	78 17                	js     2252 <subdir+0x264>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    223b:	83 ec 08             	sub    $0x8,%esp
    223e:	68 b4 4f 00 00       	push   $0x4fb4
    2243:	6a 01                	push   $0x1
    2245:	e8 a0 1e 00 00       	call   40ea <printf>
    224a:	83 c4 10             	add    $0x10,%esp
    exit();
    224d:	e8 21 1d 00 00       	call   3f73 <exit>
  }

  if(chdir("dd") != 0){
    2252:	83 ec 0c             	sub    $0xc,%esp
    2255:	68 89 4e 00 00       	push   $0x4e89
    225a:	e8 84 1d 00 00       	call   3fe3 <chdir>
    225f:	83 c4 10             	add    $0x10,%esp
    2262:	85 c0                	test   %eax,%eax
    2264:	74 17                	je     227d <subdir+0x28f>
    printf(1, "chdir dd failed\n");
    2266:	83 ec 08             	sub    $0x8,%esp
    2269:	68 d8 4f 00 00       	push   $0x4fd8
    226e:	6a 01                	push   $0x1
    2270:	e8 75 1e 00 00       	call   40ea <printf>
    2275:	83 c4 10             	add    $0x10,%esp
    exit();
    2278:	e8 f6 1c 00 00       	call   3f73 <exit>
  }
  if(chdir("dd/../../dd") != 0){
    227d:	83 ec 0c             	sub    $0xc,%esp
    2280:	68 e9 4f 00 00       	push   $0x4fe9
    2285:	e8 59 1d 00 00       	call   3fe3 <chdir>
    228a:	83 c4 10             	add    $0x10,%esp
    228d:	85 c0                	test   %eax,%eax
    228f:	74 17                	je     22a8 <subdir+0x2ba>
    printf(1, "chdir dd/../../dd failed\n");
    2291:	83 ec 08             	sub    $0x8,%esp
    2294:	68 f5 4f 00 00       	push   $0x4ff5
    2299:	6a 01                	push   $0x1
    229b:	e8 4a 1e 00 00       	call   40ea <printf>
    22a0:	83 c4 10             	add    $0x10,%esp
    exit();
    22a3:	e8 cb 1c 00 00       	call   3f73 <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    22a8:	83 ec 0c             	sub    $0xc,%esp
    22ab:	68 0f 50 00 00       	push   $0x500f
    22b0:	e8 2e 1d 00 00       	call   3fe3 <chdir>
    22b5:	83 c4 10             	add    $0x10,%esp
    22b8:	85 c0                	test   %eax,%eax
    22ba:	74 17                	je     22d3 <subdir+0x2e5>
    printf(1, "chdir dd/../../dd failed\n");
    22bc:	83 ec 08             	sub    $0x8,%esp
    22bf:	68 f5 4f 00 00       	push   $0x4ff5
    22c4:	6a 01                	push   $0x1
    22c6:	e8 1f 1e 00 00       	call   40ea <printf>
    22cb:	83 c4 10             	add    $0x10,%esp
    exit();
    22ce:	e8 a0 1c 00 00       	call   3f73 <exit>
  }
  if(chdir("./..") != 0){
    22d3:	83 ec 0c             	sub    $0xc,%esp
    22d6:	68 1e 50 00 00       	push   $0x501e
    22db:	e8 03 1d 00 00       	call   3fe3 <chdir>
    22e0:	83 c4 10             	add    $0x10,%esp
    22e3:	85 c0                	test   %eax,%eax
    22e5:	74 17                	je     22fe <subdir+0x310>
    printf(1, "chdir ./.. failed\n");
    22e7:	83 ec 08             	sub    $0x8,%esp
    22ea:	68 23 50 00 00       	push   $0x5023
    22ef:	6a 01                	push   $0x1
    22f1:	e8 f4 1d 00 00       	call   40ea <printf>
    22f6:	83 c4 10             	add    $0x10,%esp
    exit();
    22f9:	e8 75 1c 00 00       	call   3f73 <exit>
  }

  fd = open("dd/dd/ffff", 0);
    22fe:	83 ec 08             	sub    $0x8,%esp
    2301:	6a 00                	push   $0x0
    2303:	68 6c 4f 00 00       	push   $0x4f6c
    2308:	e8 a6 1c 00 00       	call   3fb3 <open>
    230d:	83 c4 10             	add    $0x10,%esp
    2310:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2313:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2317:	79 17                	jns    2330 <subdir+0x342>
    printf(1, "open dd/dd/ffff failed\n");
    2319:	83 ec 08             	sub    $0x8,%esp
    231c:	68 36 50 00 00       	push   $0x5036
    2321:	6a 01                	push   $0x1
    2323:	e8 c2 1d 00 00       	call   40ea <printf>
    2328:	83 c4 10             	add    $0x10,%esp
    exit();
    232b:	e8 43 1c 00 00       	call   3f73 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    2330:	83 ec 04             	sub    $0x4,%esp
    2333:	68 00 20 00 00       	push   $0x2000
    2338:	68 40 8b 00 00       	push   $0x8b40
    233d:	ff 75 f4             	pushl  -0xc(%ebp)
    2340:	e8 46 1c 00 00       	call   3f8b <read>
    2345:	83 c4 10             	add    $0x10,%esp
    2348:	83 f8 02             	cmp    $0x2,%eax
    234b:	74 17                	je     2364 <subdir+0x376>
    printf(1, "read dd/dd/ffff wrong len\n");
    234d:	83 ec 08             	sub    $0x8,%esp
    2350:	68 4e 50 00 00       	push   $0x504e
    2355:	6a 01                	push   $0x1
    2357:	e8 8e 1d 00 00       	call   40ea <printf>
    235c:	83 c4 10             	add    $0x10,%esp
    exit();
    235f:	e8 0f 1c 00 00       	call   3f73 <exit>
  }
  close(fd);
    2364:	83 ec 0c             	sub    $0xc,%esp
    2367:	ff 75 f4             	pushl  -0xc(%ebp)
    236a:	e8 2c 1c 00 00       	call   3f9b <close>
    236f:	83 c4 10             	add    $0x10,%esp

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2372:	83 ec 08             	sub    $0x8,%esp
    2375:	6a 00                	push   $0x0
    2377:	68 08 4f 00 00       	push   $0x4f08
    237c:	e8 32 1c 00 00       	call   3fb3 <open>
    2381:	83 c4 10             	add    $0x10,%esp
    2384:	85 c0                	test   %eax,%eax
    2386:	78 17                	js     239f <subdir+0x3b1>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2388:	83 ec 08             	sub    $0x8,%esp
    238b:	68 6c 50 00 00       	push   $0x506c
    2390:	6a 01                	push   $0x1
    2392:	e8 53 1d 00 00       	call   40ea <printf>
    2397:	83 c4 10             	add    $0x10,%esp
    exit();
    239a:	e8 d4 1b 00 00       	call   3f73 <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    239f:	83 ec 08             	sub    $0x8,%esp
    23a2:	68 02 02 00 00       	push   $0x202
    23a7:	68 91 50 00 00       	push   $0x5091
    23ac:	e8 02 1c 00 00       	call   3fb3 <open>
    23b1:	83 c4 10             	add    $0x10,%esp
    23b4:	85 c0                	test   %eax,%eax
    23b6:	78 17                	js     23cf <subdir+0x3e1>
    printf(1, "create dd/ff/ff succeeded!\n");
    23b8:	83 ec 08             	sub    $0x8,%esp
    23bb:	68 9a 50 00 00       	push   $0x509a
    23c0:	6a 01                	push   $0x1
    23c2:	e8 23 1d 00 00       	call   40ea <printf>
    23c7:	83 c4 10             	add    $0x10,%esp
    exit();
    23ca:	e8 a4 1b 00 00       	call   3f73 <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    23cf:	83 ec 08             	sub    $0x8,%esp
    23d2:	68 02 02 00 00       	push   $0x202
    23d7:	68 b6 50 00 00       	push   $0x50b6
    23dc:	e8 d2 1b 00 00       	call   3fb3 <open>
    23e1:	83 c4 10             	add    $0x10,%esp
    23e4:	85 c0                	test   %eax,%eax
    23e6:	78 17                	js     23ff <subdir+0x411>
    printf(1, "create dd/xx/ff succeeded!\n");
    23e8:	83 ec 08             	sub    $0x8,%esp
    23eb:	68 bf 50 00 00       	push   $0x50bf
    23f0:	6a 01                	push   $0x1
    23f2:	e8 f3 1c 00 00       	call   40ea <printf>
    23f7:	83 c4 10             	add    $0x10,%esp
    exit();
    23fa:	e8 74 1b 00 00       	call   3f73 <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    23ff:	83 ec 08             	sub    $0x8,%esp
    2402:	68 00 02 00 00       	push   $0x200
    2407:	68 89 4e 00 00       	push   $0x4e89
    240c:	e8 a2 1b 00 00       	call   3fb3 <open>
    2411:	83 c4 10             	add    $0x10,%esp
    2414:	85 c0                	test   %eax,%eax
    2416:	78 17                	js     242f <subdir+0x441>
    printf(1, "create dd succeeded!\n");
    2418:	83 ec 08             	sub    $0x8,%esp
    241b:	68 db 50 00 00       	push   $0x50db
    2420:	6a 01                	push   $0x1
    2422:	e8 c3 1c 00 00       	call   40ea <printf>
    2427:	83 c4 10             	add    $0x10,%esp
    exit();
    242a:	e8 44 1b 00 00       	call   3f73 <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    242f:	83 ec 08             	sub    $0x8,%esp
    2432:	6a 02                	push   $0x2
    2434:	68 89 4e 00 00       	push   $0x4e89
    2439:	e8 75 1b 00 00       	call   3fb3 <open>
    243e:	83 c4 10             	add    $0x10,%esp
    2441:	85 c0                	test   %eax,%eax
    2443:	78 17                	js     245c <subdir+0x46e>
    printf(1, "open dd rdwr succeeded!\n");
    2445:	83 ec 08             	sub    $0x8,%esp
    2448:	68 f1 50 00 00       	push   $0x50f1
    244d:	6a 01                	push   $0x1
    244f:	e8 96 1c 00 00       	call   40ea <printf>
    2454:	83 c4 10             	add    $0x10,%esp
    exit();
    2457:	e8 17 1b 00 00       	call   3f73 <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    245c:	83 ec 08             	sub    $0x8,%esp
    245f:	6a 01                	push   $0x1
    2461:	68 89 4e 00 00       	push   $0x4e89
    2466:	e8 48 1b 00 00       	call   3fb3 <open>
    246b:	83 c4 10             	add    $0x10,%esp
    246e:	85 c0                	test   %eax,%eax
    2470:	78 17                	js     2489 <subdir+0x49b>
    printf(1, "open dd wronly succeeded!\n");
    2472:	83 ec 08             	sub    $0x8,%esp
    2475:	68 0a 51 00 00       	push   $0x510a
    247a:	6a 01                	push   $0x1
    247c:	e8 69 1c 00 00       	call   40ea <printf>
    2481:	83 c4 10             	add    $0x10,%esp
    exit();
    2484:	e8 ea 1a 00 00       	call   3f73 <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2489:	83 ec 08             	sub    $0x8,%esp
    248c:	68 25 51 00 00       	push   $0x5125
    2491:	68 91 50 00 00       	push   $0x5091
    2496:	e8 38 1b 00 00       	call   3fd3 <link>
    249b:	83 c4 10             	add    $0x10,%esp
    249e:	85 c0                	test   %eax,%eax
    24a0:	75 17                	jne    24b9 <subdir+0x4cb>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    24a2:	83 ec 08             	sub    $0x8,%esp
    24a5:	68 30 51 00 00       	push   $0x5130
    24aa:	6a 01                	push   $0x1
    24ac:	e8 39 1c 00 00       	call   40ea <printf>
    24b1:	83 c4 10             	add    $0x10,%esp
    exit();
    24b4:	e8 ba 1a 00 00       	call   3f73 <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    24b9:	83 ec 08             	sub    $0x8,%esp
    24bc:	68 25 51 00 00       	push   $0x5125
    24c1:	68 b6 50 00 00       	push   $0x50b6
    24c6:	e8 08 1b 00 00       	call   3fd3 <link>
    24cb:	83 c4 10             	add    $0x10,%esp
    24ce:	85 c0                	test   %eax,%eax
    24d0:	75 17                	jne    24e9 <subdir+0x4fb>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    24d2:	83 ec 08             	sub    $0x8,%esp
    24d5:	68 54 51 00 00       	push   $0x5154
    24da:	6a 01                	push   $0x1
    24dc:	e8 09 1c 00 00       	call   40ea <printf>
    24e1:	83 c4 10             	add    $0x10,%esp
    exit();
    24e4:	e8 8a 1a 00 00       	call   3f73 <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    24e9:	83 ec 08             	sub    $0x8,%esp
    24ec:	68 6c 4f 00 00       	push   $0x4f6c
    24f1:	68 a4 4e 00 00       	push   $0x4ea4
    24f6:	e8 d8 1a 00 00       	call   3fd3 <link>
    24fb:	83 c4 10             	add    $0x10,%esp
    24fe:	85 c0                	test   %eax,%eax
    2500:	75 17                	jne    2519 <subdir+0x52b>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2502:	83 ec 08             	sub    $0x8,%esp
    2505:	68 78 51 00 00       	push   $0x5178
    250a:	6a 01                	push   $0x1
    250c:	e8 d9 1b 00 00       	call   40ea <printf>
    2511:	83 c4 10             	add    $0x10,%esp
    exit();
    2514:	e8 5a 1a 00 00       	call   3f73 <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    2519:	83 ec 0c             	sub    $0xc,%esp
    251c:	68 91 50 00 00       	push   $0x5091
    2521:	e8 b5 1a 00 00       	call   3fdb <mkdir>
    2526:	83 c4 10             	add    $0x10,%esp
    2529:	85 c0                	test   %eax,%eax
    252b:	75 17                	jne    2544 <subdir+0x556>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    252d:	83 ec 08             	sub    $0x8,%esp
    2530:	68 9a 51 00 00       	push   $0x519a
    2535:	6a 01                	push   $0x1
    2537:	e8 ae 1b 00 00       	call   40ea <printf>
    253c:	83 c4 10             	add    $0x10,%esp
    exit();
    253f:	e8 2f 1a 00 00       	call   3f73 <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    2544:	83 ec 0c             	sub    $0xc,%esp
    2547:	68 b6 50 00 00       	push   $0x50b6
    254c:	e8 8a 1a 00 00       	call   3fdb <mkdir>
    2551:	83 c4 10             	add    $0x10,%esp
    2554:	85 c0                	test   %eax,%eax
    2556:	75 17                	jne    256f <subdir+0x581>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2558:	83 ec 08             	sub    $0x8,%esp
    255b:	68 b5 51 00 00       	push   $0x51b5
    2560:	6a 01                	push   $0x1
    2562:	e8 83 1b 00 00       	call   40ea <printf>
    2567:	83 c4 10             	add    $0x10,%esp
    exit();
    256a:	e8 04 1a 00 00       	call   3f73 <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    256f:	83 ec 0c             	sub    $0xc,%esp
    2572:	68 6c 4f 00 00       	push   $0x4f6c
    2577:	e8 5f 1a 00 00       	call   3fdb <mkdir>
    257c:	83 c4 10             	add    $0x10,%esp
    257f:	85 c0                	test   %eax,%eax
    2581:	75 17                	jne    259a <subdir+0x5ac>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2583:	83 ec 08             	sub    $0x8,%esp
    2586:	68 d0 51 00 00       	push   $0x51d0
    258b:	6a 01                	push   $0x1
    258d:	e8 58 1b 00 00       	call   40ea <printf>
    2592:	83 c4 10             	add    $0x10,%esp
    exit();
    2595:	e8 d9 19 00 00       	call   3f73 <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    259a:	83 ec 0c             	sub    $0xc,%esp
    259d:	68 b6 50 00 00       	push   $0x50b6
    25a2:	e8 1c 1a 00 00       	call   3fc3 <unlink>
    25a7:	83 c4 10             	add    $0x10,%esp
    25aa:	85 c0                	test   %eax,%eax
    25ac:	75 17                	jne    25c5 <subdir+0x5d7>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    25ae:	83 ec 08             	sub    $0x8,%esp
    25b1:	68 ed 51 00 00       	push   $0x51ed
    25b6:	6a 01                	push   $0x1
    25b8:	e8 2d 1b 00 00       	call   40ea <printf>
    25bd:	83 c4 10             	add    $0x10,%esp
    exit();
    25c0:	e8 ae 19 00 00       	call   3f73 <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    25c5:	83 ec 0c             	sub    $0xc,%esp
    25c8:	68 91 50 00 00       	push   $0x5091
    25cd:	e8 f1 19 00 00       	call   3fc3 <unlink>
    25d2:	83 c4 10             	add    $0x10,%esp
    25d5:	85 c0                	test   %eax,%eax
    25d7:	75 17                	jne    25f0 <subdir+0x602>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    25d9:	83 ec 08             	sub    $0x8,%esp
    25dc:	68 09 52 00 00       	push   $0x5209
    25e1:	6a 01                	push   $0x1
    25e3:	e8 02 1b 00 00       	call   40ea <printf>
    25e8:	83 c4 10             	add    $0x10,%esp
    exit();
    25eb:	e8 83 19 00 00       	call   3f73 <exit>
  }
  if(chdir("dd/ff") == 0){
    25f0:	83 ec 0c             	sub    $0xc,%esp
    25f3:	68 a4 4e 00 00       	push   $0x4ea4
    25f8:	e8 e6 19 00 00       	call   3fe3 <chdir>
    25fd:	83 c4 10             	add    $0x10,%esp
    2600:	85 c0                	test   %eax,%eax
    2602:	75 17                	jne    261b <subdir+0x62d>
    printf(1, "chdir dd/ff succeeded!\n");
    2604:	83 ec 08             	sub    $0x8,%esp
    2607:	68 25 52 00 00       	push   $0x5225
    260c:	6a 01                	push   $0x1
    260e:	e8 d7 1a 00 00       	call   40ea <printf>
    2613:	83 c4 10             	add    $0x10,%esp
    exit();
    2616:	e8 58 19 00 00       	call   3f73 <exit>
  }
  if(chdir("dd/xx") == 0){
    261b:	83 ec 0c             	sub    $0xc,%esp
    261e:	68 3d 52 00 00       	push   $0x523d
    2623:	e8 bb 19 00 00       	call   3fe3 <chdir>
    2628:	83 c4 10             	add    $0x10,%esp
    262b:	85 c0                	test   %eax,%eax
    262d:	75 17                	jne    2646 <subdir+0x658>
    printf(1, "chdir dd/xx succeeded!\n");
    262f:	83 ec 08             	sub    $0x8,%esp
    2632:	68 43 52 00 00       	push   $0x5243
    2637:	6a 01                	push   $0x1
    2639:	e8 ac 1a 00 00       	call   40ea <printf>
    263e:	83 c4 10             	add    $0x10,%esp
    exit();
    2641:	e8 2d 19 00 00       	call   3f73 <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    2646:	83 ec 0c             	sub    $0xc,%esp
    2649:	68 6c 4f 00 00       	push   $0x4f6c
    264e:	e8 70 19 00 00       	call   3fc3 <unlink>
    2653:	83 c4 10             	add    $0x10,%esp
    2656:	85 c0                	test   %eax,%eax
    2658:	74 17                	je     2671 <subdir+0x683>
    printf(1, "unlink dd/dd/ff failed\n");
    265a:	83 ec 08             	sub    $0x8,%esp
    265d:	68 99 4f 00 00       	push   $0x4f99
    2662:	6a 01                	push   $0x1
    2664:	e8 81 1a 00 00       	call   40ea <printf>
    2669:	83 c4 10             	add    $0x10,%esp
    exit();
    266c:	e8 02 19 00 00       	call   3f73 <exit>
  }
  if(unlink("dd/ff") != 0){
    2671:	83 ec 0c             	sub    $0xc,%esp
    2674:	68 a4 4e 00 00       	push   $0x4ea4
    2679:	e8 45 19 00 00       	call   3fc3 <unlink>
    267e:	83 c4 10             	add    $0x10,%esp
    2681:	85 c0                	test   %eax,%eax
    2683:	74 17                	je     269c <subdir+0x6ae>
    printf(1, "unlink dd/ff failed\n");
    2685:	83 ec 08             	sub    $0x8,%esp
    2688:	68 5b 52 00 00       	push   $0x525b
    268d:	6a 01                	push   $0x1
    268f:	e8 56 1a 00 00       	call   40ea <printf>
    2694:	83 c4 10             	add    $0x10,%esp
    exit();
    2697:	e8 d7 18 00 00       	call   3f73 <exit>
  }
  if(unlink("dd") == 0){
    269c:	83 ec 0c             	sub    $0xc,%esp
    269f:	68 89 4e 00 00       	push   $0x4e89
    26a4:	e8 1a 19 00 00       	call   3fc3 <unlink>
    26a9:	83 c4 10             	add    $0x10,%esp
    26ac:	85 c0                	test   %eax,%eax
    26ae:	75 17                	jne    26c7 <subdir+0x6d9>
    printf(1, "unlink non-empty dd succeeded!\n");
    26b0:	83 ec 08             	sub    $0x8,%esp
    26b3:	68 70 52 00 00       	push   $0x5270
    26b8:	6a 01                	push   $0x1
    26ba:	e8 2b 1a 00 00       	call   40ea <printf>
    26bf:	83 c4 10             	add    $0x10,%esp
    exit();
    26c2:	e8 ac 18 00 00       	call   3f73 <exit>
  }
  if(unlink("dd/dd") < 0){
    26c7:	83 ec 0c             	sub    $0xc,%esp
    26ca:	68 90 52 00 00       	push   $0x5290
    26cf:	e8 ef 18 00 00       	call   3fc3 <unlink>
    26d4:	83 c4 10             	add    $0x10,%esp
    26d7:	85 c0                	test   %eax,%eax
    26d9:	79 17                	jns    26f2 <subdir+0x704>
    printf(1, "unlink dd/dd failed\n");
    26db:	83 ec 08             	sub    $0x8,%esp
    26de:	68 96 52 00 00       	push   $0x5296
    26e3:	6a 01                	push   $0x1
    26e5:	e8 00 1a 00 00       	call   40ea <printf>
    26ea:	83 c4 10             	add    $0x10,%esp
    exit();
    26ed:	e8 81 18 00 00       	call   3f73 <exit>
  }
  if(unlink("dd") < 0){
    26f2:	83 ec 0c             	sub    $0xc,%esp
    26f5:	68 89 4e 00 00       	push   $0x4e89
    26fa:	e8 c4 18 00 00       	call   3fc3 <unlink>
    26ff:	83 c4 10             	add    $0x10,%esp
    2702:	85 c0                	test   %eax,%eax
    2704:	79 17                	jns    271d <subdir+0x72f>
    printf(1, "unlink dd failed\n");
    2706:	83 ec 08             	sub    $0x8,%esp
    2709:	68 ab 52 00 00       	push   $0x52ab
    270e:	6a 01                	push   $0x1
    2710:	e8 d5 19 00 00       	call   40ea <printf>
    2715:	83 c4 10             	add    $0x10,%esp
    exit();
    2718:	e8 56 18 00 00       	call   3f73 <exit>
  }

  printf(1, "subdir ok\n");
    271d:	83 ec 08             	sub    $0x8,%esp
    2720:	68 bd 52 00 00       	push   $0x52bd
    2725:	6a 01                	push   $0x1
    2727:	e8 be 19 00 00       	call   40ea <printf>
    272c:	83 c4 10             	add    $0x10,%esp
}
    272f:	90                   	nop
    2730:	c9                   	leave  
    2731:	c3                   	ret    

00002732 <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    2732:	55                   	push   %ebp
    2733:	89 e5                	mov    %esp,%ebp
    2735:	83 ec 18             	sub    $0x18,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    2738:	83 ec 08             	sub    $0x8,%esp
    273b:	68 c8 52 00 00       	push   $0x52c8
    2740:	6a 01                	push   $0x1
    2742:	e8 a3 19 00 00       	call   40ea <printf>
    2747:	83 c4 10             	add    $0x10,%esp

  unlink("bigwrite");
    274a:	83 ec 0c             	sub    $0xc,%esp
    274d:	68 d7 52 00 00       	push   $0x52d7
    2752:	e8 6c 18 00 00       	call   3fc3 <unlink>
    2757:	83 c4 10             	add    $0x10,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    275a:	c7 45 f4 f3 01 00 00 	movl   $0x1f3,-0xc(%ebp)
    2761:	e9 a8 00 00 00       	jmp    280e <bigwrite+0xdc>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2766:	83 ec 08             	sub    $0x8,%esp
    2769:	68 02 02 00 00       	push   $0x202
    276e:	68 d7 52 00 00       	push   $0x52d7
    2773:	e8 3b 18 00 00       	call   3fb3 <open>
    2778:	83 c4 10             	add    $0x10,%esp
    277b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    277e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2782:	79 17                	jns    279b <bigwrite+0x69>
      printf(1, "cannot create bigwrite\n");
    2784:	83 ec 08             	sub    $0x8,%esp
    2787:	68 e0 52 00 00       	push   $0x52e0
    278c:	6a 01                	push   $0x1
    278e:	e8 57 19 00 00       	call   40ea <printf>
    2793:	83 c4 10             	add    $0x10,%esp
      exit();
    2796:	e8 d8 17 00 00       	call   3f73 <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    279b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    27a2:	eb 3f                	jmp    27e3 <bigwrite+0xb1>
      int cc = write(fd, buf, sz);
    27a4:	83 ec 04             	sub    $0x4,%esp
    27a7:	ff 75 f4             	pushl  -0xc(%ebp)
    27aa:	68 40 8b 00 00       	push   $0x8b40
    27af:	ff 75 ec             	pushl  -0x14(%ebp)
    27b2:	e8 dc 17 00 00       	call   3f93 <write>
    27b7:	83 c4 10             	add    $0x10,%esp
    27ba:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(cc != sz){
    27bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27c0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    27c3:	74 1a                	je     27df <bigwrite+0xad>
        printf(1, "write(%d) ret %d\n", sz, cc);
    27c5:	ff 75 e8             	pushl  -0x18(%ebp)
    27c8:	ff 75 f4             	pushl  -0xc(%ebp)
    27cb:	68 f8 52 00 00       	push   $0x52f8
    27d0:	6a 01                	push   $0x1
    27d2:	e8 13 19 00 00       	call   40ea <printf>
    27d7:	83 c4 10             	add    $0x10,%esp
        exit();
    27da:	e8 94 17 00 00       	call   3f73 <exit>
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
    27df:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    27e3:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    27e7:	7e bb                	jle    27a4 <bigwrite+0x72>
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    27e9:	83 ec 0c             	sub    $0xc,%esp
    27ec:	ff 75 ec             	pushl  -0x14(%ebp)
    27ef:	e8 a7 17 00 00       	call   3f9b <close>
    27f4:	83 c4 10             	add    $0x10,%esp
    unlink("bigwrite");
    27f7:	83 ec 0c             	sub    $0xc,%esp
    27fa:	68 d7 52 00 00       	push   $0x52d7
    27ff:	e8 bf 17 00 00       	call   3fc3 <unlink>
    2804:	83 c4 10             	add    $0x10,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2807:	81 45 f4 d7 01 00 00 	addl   $0x1d7,-0xc(%ebp)
    280e:	81 7d f4 ff 17 00 00 	cmpl   $0x17ff,-0xc(%ebp)
    2815:	0f 8e 4b ff ff ff    	jle    2766 <bigwrite+0x34>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    281b:	83 ec 08             	sub    $0x8,%esp
    281e:	68 0a 53 00 00       	push   $0x530a
    2823:	6a 01                	push   $0x1
    2825:	e8 c0 18 00 00       	call   40ea <printf>
    282a:	83 c4 10             	add    $0x10,%esp
}
    282d:	90                   	nop
    282e:	c9                   	leave  
    282f:	c3                   	ret    

00002830 <bigfile>:

void
bigfile(void)
{
    2830:	55                   	push   %ebp
    2831:	89 e5                	mov    %esp,%ebp
    2833:	83 ec 18             	sub    $0x18,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2836:	83 ec 08             	sub    $0x8,%esp
    2839:	68 17 53 00 00       	push   $0x5317
    283e:	6a 01                	push   $0x1
    2840:	e8 a5 18 00 00       	call   40ea <printf>
    2845:	83 c4 10             	add    $0x10,%esp

  unlink("bigfile");
    2848:	83 ec 0c             	sub    $0xc,%esp
    284b:	68 25 53 00 00       	push   $0x5325
    2850:	e8 6e 17 00 00       	call   3fc3 <unlink>
    2855:	83 c4 10             	add    $0x10,%esp
  fd = open("bigfile", O_CREATE | O_RDWR);
    2858:	83 ec 08             	sub    $0x8,%esp
    285b:	68 02 02 00 00       	push   $0x202
    2860:	68 25 53 00 00       	push   $0x5325
    2865:	e8 49 17 00 00       	call   3fb3 <open>
    286a:	83 c4 10             	add    $0x10,%esp
    286d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    2870:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2874:	79 17                	jns    288d <bigfile+0x5d>
    printf(1, "cannot create bigfile");
    2876:	83 ec 08             	sub    $0x8,%esp
    2879:	68 2d 53 00 00       	push   $0x532d
    287e:	6a 01                	push   $0x1
    2880:	e8 65 18 00 00       	call   40ea <printf>
    2885:	83 c4 10             	add    $0x10,%esp
    exit();
    2888:	e8 e6 16 00 00       	call   3f73 <exit>
  }
  for(i = 0; i < 20; i++){
    288d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2894:	eb 52                	jmp    28e8 <bigfile+0xb8>
    memset(buf, i, 600);
    2896:	83 ec 04             	sub    $0x4,%esp
    2899:	68 58 02 00 00       	push   $0x258
    289e:	ff 75 f4             	pushl  -0xc(%ebp)
    28a1:	68 40 8b 00 00       	push   $0x8b40
    28a6:	e8 2d 15 00 00       	call   3dd8 <memset>
    28ab:	83 c4 10             	add    $0x10,%esp
    if(write(fd, buf, 600) != 600){
    28ae:	83 ec 04             	sub    $0x4,%esp
    28b1:	68 58 02 00 00       	push   $0x258
    28b6:	68 40 8b 00 00       	push   $0x8b40
    28bb:	ff 75 ec             	pushl  -0x14(%ebp)
    28be:	e8 d0 16 00 00       	call   3f93 <write>
    28c3:	83 c4 10             	add    $0x10,%esp
    28c6:	3d 58 02 00 00       	cmp    $0x258,%eax
    28cb:	74 17                	je     28e4 <bigfile+0xb4>
      printf(1, "write bigfile failed\n");
    28cd:	83 ec 08             	sub    $0x8,%esp
    28d0:	68 43 53 00 00       	push   $0x5343
    28d5:	6a 01                	push   $0x1
    28d7:	e8 0e 18 00 00       	call   40ea <printf>
    28dc:	83 c4 10             	add    $0x10,%esp
      exit();
    28df:	e8 8f 16 00 00       	call   3f73 <exit>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    28e4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    28e8:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    28ec:	7e a8                	jle    2896 <bigfile+0x66>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    28ee:	83 ec 0c             	sub    $0xc,%esp
    28f1:	ff 75 ec             	pushl  -0x14(%ebp)
    28f4:	e8 a2 16 00 00       	call   3f9b <close>
    28f9:	83 c4 10             	add    $0x10,%esp

  fd = open("bigfile", 0);
    28fc:	83 ec 08             	sub    $0x8,%esp
    28ff:	6a 00                	push   $0x0
    2901:	68 25 53 00 00       	push   $0x5325
    2906:	e8 a8 16 00 00       	call   3fb3 <open>
    290b:	83 c4 10             	add    $0x10,%esp
    290e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    2911:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2915:	79 17                	jns    292e <bigfile+0xfe>
    printf(1, "cannot open bigfile\n");
    2917:	83 ec 08             	sub    $0x8,%esp
    291a:	68 59 53 00 00       	push   $0x5359
    291f:	6a 01                	push   $0x1
    2921:	e8 c4 17 00 00       	call   40ea <printf>
    2926:	83 c4 10             	add    $0x10,%esp
    exit();
    2929:	e8 45 16 00 00       	call   3f73 <exit>
  }
  total = 0;
    292e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(i = 0; ; i++){
    2935:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    cc = read(fd, buf, 300);
    293c:	83 ec 04             	sub    $0x4,%esp
    293f:	68 2c 01 00 00       	push   $0x12c
    2944:	68 40 8b 00 00       	push   $0x8b40
    2949:	ff 75 ec             	pushl  -0x14(%ebp)
    294c:	e8 3a 16 00 00       	call   3f8b <read>
    2951:	83 c4 10             	add    $0x10,%esp
    2954:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(cc < 0){
    2957:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    295b:	79 17                	jns    2974 <bigfile+0x144>
      printf(1, "read bigfile failed\n");
    295d:	83 ec 08             	sub    $0x8,%esp
    2960:	68 6e 53 00 00       	push   $0x536e
    2965:	6a 01                	push   $0x1
    2967:	e8 7e 17 00 00       	call   40ea <printf>
    296c:	83 c4 10             	add    $0x10,%esp
      exit();
    296f:	e8 ff 15 00 00       	call   3f73 <exit>
    }
    if(cc == 0)
    2974:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2978:	74 7a                	je     29f4 <bigfile+0x1c4>
      break;
    if(cc != 300){
    297a:	81 7d e8 2c 01 00 00 	cmpl   $0x12c,-0x18(%ebp)
    2981:	74 17                	je     299a <bigfile+0x16a>
      printf(1, "short read bigfile\n");
    2983:	83 ec 08             	sub    $0x8,%esp
    2986:	68 83 53 00 00       	push   $0x5383
    298b:	6a 01                	push   $0x1
    298d:	e8 58 17 00 00       	call   40ea <printf>
    2992:	83 c4 10             	add    $0x10,%esp
      exit();
    2995:	e8 d9 15 00 00       	call   3f73 <exit>
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    299a:	0f b6 05 40 8b 00 00 	movzbl 0x8b40,%eax
    29a1:	0f be d0             	movsbl %al,%edx
    29a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29a7:	89 c1                	mov    %eax,%ecx
    29a9:	c1 e9 1f             	shr    $0x1f,%ecx
    29ac:	01 c8                	add    %ecx,%eax
    29ae:	d1 f8                	sar    %eax
    29b0:	39 c2                	cmp    %eax,%edx
    29b2:	75 1a                	jne    29ce <bigfile+0x19e>
    29b4:	0f b6 05 6b 8c 00 00 	movzbl 0x8c6b,%eax
    29bb:	0f be d0             	movsbl %al,%edx
    29be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29c1:	89 c1                	mov    %eax,%ecx
    29c3:	c1 e9 1f             	shr    $0x1f,%ecx
    29c6:	01 c8                	add    %ecx,%eax
    29c8:	d1 f8                	sar    %eax
    29ca:	39 c2                	cmp    %eax,%edx
    29cc:	74 17                	je     29e5 <bigfile+0x1b5>
      printf(1, "read bigfile wrong data\n");
    29ce:	83 ec 08             	sub    $0x8,%esp
    29d1:	68 97 53 00 00       	push   $0x5397
    29d6:	6a 01                	push   $0x1
    29d8:	e8 0d 17 00 00       	call   40ea <printf>
    29dd:	83 c4 10             	add    $0x10,%esp
      exit();
    29e0:	e8 8e 15 00 00       	call   3f73 <exit>
    }
    total += cc;
    29e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    29e8:	01 45 f0             	add    %eax,-0x10(%ebp)
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    29eb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
    29ef:	e9 48 ff ff ff       	jmp    293c <bigfile+0x10c>
    if(cc < 0){
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    29f4:	90                   	nop
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    29f5:	83 ec 0c             	sub    $0xc,%esp
    29f8:	ff 75 ec             	pushl  -0x14(%ebp)
    29fb:	e8 9b 15 00 00       	call   3f9b <close>
    2a00:	83 c4 10             	add    $0x10,%esp
  if(total != 20*600){
    2a03:	81 7d f0 e0 2e 00 00 	cmpl   $0x2ee0,-0x10(%ebp)
    2a0a:	74 17                	je     2a23 <bigfile+0x1f3>
    printf(1, "read bigfile wrong total\n");
    2a0c:	83 ec 08             	sub    $0x8,%esp
    2a0f:	68 b0 53 00 00       	push   $0x53b0
    2a14:	6a 01                	push   $0x1
    2a16:	e8 cf 16 00 00       	call   40ea <printf>
    2a1b:	83 c4 10             	add    $0x10,%esp
    exit();
    2a1e:	e8 50 15 00 00       	call   3f73 <exit>
  }
  unlink("bigfile");
    2a23:	83 ec 0c             	sub    $0xc,%esp
    2a26:	68 25 53 00 00       	push   $0x5325
    2a2b:	e8 93 15 00 00       	call   3fc3 <unlink>
    2a30:	83 c4 10             	add    $0x10,%esp

  printf(1, "bigfile test ok\n");
    2a33:	83 ec 08             	sub    $0x8,%esp
    2a36:	68 ca 53 00 00       	push   $0x53ca
    2a3b:	6a 01                	push   $0x1
    2a3d:	e8 a8 16 00 00       	call   40ea <printf>
    2a42:	83 c4 10             	add    $0x10,%esp
}
    2a45:	90                   	nop
    2a46:	c9                   	leave  
    2a47:	c3                   	ret    

00002a48 <fourteen>:

void
fourteen(void)
{
    2a48:	55                   	push   %ebp
    2a49:	89 e5                	mov    %esp,%ebp
    2a4b:	83 ec 18             	sub    $0x18,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2a4e:	83 ec 08             	sub    $0x8,%esp
    2a51:	68 db 53 00 00       	push   $0x53db
    2a56:	6a 01                	push   $0x1
    2a58:	e8 8d 16 00 00       	call   40ea <printf>
    2a5d:	83 c4 10             	add    $0x10,%esp

  if(mkdir("12345678901234") != 0){
    2a60:	83 ec 0c             	sub    $0xc,%esp
    2a63:	68 ea 53 00 00       	push   $0x53ea
    2a68:	e8 6e 15 00 00       	call   3fdb <mkdir>
    2a6d:	83 c4 10             	add    $0x10,%esp
    2a70:	85 c0                	test   %eax,%eax
    2a72:	74 17                	je     2a8b <fourteen+0x43>
    printf(1, "mkdir 12345678901234 failed\n");
    2a74:	83 ec 08             	sub    $0x8,%esp
    2a77:	68 f9 53 00 00       	push   $0x53f9
    2a7c:	6a 01                	push   $0x1
    2a7e:	e8 67 16 00 00       	call   40ea <printf>
    2a83:	83 c4 10             	add    $0x10,%esp
    exit();
    2a86:	e8 e8 14 00 00       	call   3f73 <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2a8b:	83 ec 0c             	sub    $0xc,%esp
    2a8e:	68 18 54 00 00       	push   $0x5418
    2a93:	e8 43 15 00 00       	call   3fdb <mkdir>
    2a98:	83 c4 10             	add    $0x10,%esp
    2a9b:	85 c0                	test   %eax,%eax
    2a9d:	74 17                	je     2ab6 <fourteen+0x6e>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2a9f:	83 ec 08             	sub    $0x8,%esp
    2aa2:	68 38 54 00 00       	push   $0x5438
    2aa7:	6a 01                	push   $0x1
    2aa9:	e8 3c 16 00 00       	call   40ea <printf>
    2aae:	83 c4 10             	add    $0x10,%esp
    exit();
    2ab1:	e8 bd 14 00 00       	call   3f73 <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2ab6:	83 ec 08             	sub    $0x8,%esp
    2ab9:	68 00 02 00 00       	push   $0x200
    2abe:	68 68 54 00 00       	push   $0x5468
    2ac3:	e8 eb 14 00 00       	call   3fb3 <open>
    2ac8:	83 c4 10             	add    $0x10,%esp
    2acb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2ace:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2ad2:	79 17                	jns    2aeb <fourteen+0xa3>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2ad4:	83 ec 08             	sub    $0x8,%esp
    2ad7:	68 98 54 00 00       	push   $0x5498
    2adc:	6a 01                	push   $0x1
    2ade:	e8 07 16 00 00       	call   40ea <printf>
    2ae3:	83 c4 10             	add    $0x10,%esp
    exit();
    2ae6:	e8 88 14 00 00       	call   3f73 <exit>
  }
  close(fd);
    2aeb:	83 ec 0c             	sub    $0xc,%esp
    2aee:	ff 75 f4             	pushl  -0xc(%ebp)
    2af1:	e8 a5 14 00 00       	call   3f9b <close>
    2af6:	83 c4 10             	add    $0x10,%esp
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2af9:	83 ec 08             	sub    $0x8,%esp
    2afc:	6a 00                	push   $0x0
    2afe:	68 d8 54 00 00       	push   $0x54d8
    2b03:	e8 ab 14 00 00       	call   3fb3 <open>
    2b08:	83 c4 10             	add    $0x10,%esp
    2b0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2b0e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b12:	79 17                	jns    2b2b <fourteen+0xe3>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2b14:	83 ec 08             	sub    $0x8,%esp
    2b17:	68 08 55 00 00       	push   $0x5508
    2b1c:	6a 01                	push   $0x1
    2b1e:	e8 c7 15 00 00       	call   40ea <printf>
    2b23:	83 c4 10             	add    $0x10,%esp
    exit();
    2b26:	e8 48 14 00 00       	call   3f73 <exit>
  }
  close(fd);
    2b2b:	83 ec 0c             	sub    $0xc,%esp
    2b2e:	ff 75 f4             	pushl  -0xc(%ebp)
    2b31:	e8 65 14 00 00       	call   3f9b <close>
    2b36:	83 c4 10             	add    $0x10,%esp

  if(mkdir("12345678901234/12345678901234") == 0){
    2b39:	83 ec 0c             	sub    $0xc,%esp
    2b3c:	68 42 55 00 00       	push   $0x5542
    2b41:	e8 95 14 00 00       	call   3fdb <mkdir>
    2b46:	83 c4 10             	add    $0x10,%esp
    2b49:	85 c0                	test   %eax,%eax
    2b4b:	75 17                	jne    2b64 <fourteen+0x11c>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2b4d:	83 ec 08             	sub    $0x8,%esp
    2b50:	68 60 55 00 00       	push   $0x5560
    2b55:	6a 01                	push   $0x1
    2b57:	e8 8e 15 00 00       	call   40ea <printf>
    2b5c:	83 c4 10             	add    $0x10,%esp
    exit();
    2b5f:	e8 0f 14 00 00       	call   3f73 <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2b64:	83 ec 0c             	sub    $0xc,%esp
    2b67:	68 90 55 00 00       	push   $0x5590
    2b6c:	e8 6a 14 00 00       	call   3fdb <mkdir>
    2b71:	83 c4 10             	add    $0x10,%esp
    2b74:	85 c0                	test   %eax,%eax
    2b76:	75 17                	jne    2b8f <fourteen+0x147>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2b78:	83 ec 08             	sub    $0x8,%esp
    2b7b:	68 b0 55 00 00       	push   $0x55b0
    2b80:	6a 01                	push   $0x1
    2b82:	e8 63 15 00 00       	call   40ea <printf>
    2b87:	83 c4 10             	add    $0x10,%esp
    exit();
    2b8a:	e8 e4 13 00 00       	call   3f73 <exit>
  }

  printf(1, "fourteen ok\n");
    2b8f:	83 ec 08             	sub    $0x8,%esp
    2b92:	68 e1 55 00 00       	push   $0x55e1
    2b97:	6a 01                	push   $0x1
    2b99:	e8 4c 15 00 00       	call   40ea <printf>
    2b9e:	83 c4 10             	add    $0x10,%esp
}
    2ba1:	90                   	nop
    2ba2:	c9                   	leave  
    2ba3:	c3                   	ret    

00002ba4 <rmdot>:

void
rmdot(void)
{
    2ba4:	55                   	push   %ebp
    2ba5:	89 e5                	mov    %esp,%ebp
    2ba7:	83 ec 08             	sub    $0x8,%esp
  printf(1, "rmdot test\n");
    2baa:	83 ec 08             	sub    $0x8,%esp
    2bad:	68 ee 55 00 00       	push   $0x55ee
    2bb2:	6a 01                	push   $0x1
    2bb4:	e8 31 15 00 00       	call   40ea <printf>
    2bb9:	83 c4 10             	add    $0x10,%esp
  if(mkdir("dots") != 0){
    2bbc:	83 ec 0c             	sub    $0xc,%esp
    2bbf:	68 fa 55 00 00       	push   $0x55fa
    2bc4:	e8 12 14 00 00       	call   3fdb <mkdir>
    2bc9:	83 c4 10             	add    $0x10,%esp
    2bcc:	85 c0                	test   %eax,%eax
    2bce:	74 17                	je     2be7 <rmdot+0x43>
    printf(1, "mkdir dots failed\n");
    2bd0:	83 ec 08             	sub    $0x8,%esp
    2bd3:	68 ff 55 00 00       	push   $0x55ff
    2bd8:	6a 01                	push   $0x1
    2bda:	e8 0b 15 00 00       	call   40ea <printf>
    2bdf:	83 c4 10             	add    $0x10,%esp
    exit();
    2be2:	e8 8c 13 00 00       	call   3f73 <exit>
  }
  if(chdir("dots") != 0){
    2be7:	83 ec 0c             	sub    $0xc,%esp
    2bea:	68 fa 55 00 00       	push   $0x55fa
    2bef:	e8 ef 13 00 00       	call   3fe3 <chdir>
    2bf4:	83 c4 10             	add    $0x10,%esp
    2bf7:	85 c0                	test   %eax,%eax
    2bf9:	74 17                	je     2c12 <rmdot+0x6e>
    printf(1, "chdir dots failed\n");
    2bfb:	83 ec 08             	sub    $0x8,%esp
    2bfe:	68 12 56 00 00       	push   $0x5612
    2c03:	6a 01                	push   $0x1
    2c05:	e8 e0 14 00 00       	call   40ea <printf>
    2c0a:	83 c4 10             	add    $0x10,%esp
    exit();
    2c0d:	e8 61 13 00 00       	call   3f73 <exit>
  }
  if(unlink(".") == 0){
    2c12:	83 ec 0c             	sub    $0xc,%esp
    2c15:	68 2b 4d 00 00       	push   $0x4d2b
    2c1a:	e8 a4 13 00 00       	call   3fc3 <unlink>
    2c1f:	83 c4 10             	add    $0x10,%esp
    2c22:	85 c0                	test   %eax,%eax
    2c24:	75 17                	jne    2c3d <rmdot+0x99>
    printf(1, "rm . worked!\n");
    2c26:	83 ec 08             	sub    $0x8,%esp
    2c29:	68 25 56 00 00       	push   $0x5625
    2c2e:	6a 01                	push   $0x1
    2c30:	e8 b5 14 00 00       	call   40ea <printf>
    2c35:	83 c4 10             	add    $0x10,%esp
    exit();
    2c38:	e8 36 13 00 00       	call   3f73 <exit>
  }
  if(unlink("..") == 0){
    2c3d:	83 ec 0c             	sub    $0xc,%esp
    2c40:	68 be 48 00 00       	push   $0x48be
    2c45:	e8 79 13 00 00       	call   3fc3 <unlink>
    2c4a:	83 c4 10             	add    $0x10,%esp
    2c4d:	85 c0                	test   %eax,%eax
    2c4f:	75 17                	jne    2c68 <rmdot+0xc4>
    printf(1, "rm .. worked!\n");
    2c51:	83 ec 08             	sub    $0x8,%esp
    2c54:	68 33 56 00 00       	push   $0x5633
    2c59:	6a 01                	push   $0x1
    2c5b:	e8 8a 14 00 00       	call   40ea <printf>
    2c60:	83 c4 10             	add    $0x10,%esp
    exit();
    2c63:	e8 0b 13 00 00       	call   3f73 <exit>
  }
  if(chdir("/") != 0){
    2c68:	83 ec 0c             	sub    $0xc,%esp
    2c6b:	68 12 45 00 00       	push   $0x4512
    2c70:	e8 6e 13 00 00       	call   3fe3 <chdir>
    2c75:	83 c4 10             	add    $0x10,%esp
    2c78:	85 c0                	test   %eax,%eax
    2c7a:	74 17                	je     2c93 <rmdot+0xef>
    printf(1, "chdir / failed\n");
    2c7c:	83 ec 08             	sub    $0x8,%esp
    2c7f:	68 14 45 00 00       	push   $0x4514
    2c84:	6a 01                	push   $0x1
    2c86:	e8 5f 14 00 00       	call   40ea <printf>
    2c8b:	83 c4 10             	add    $0x10,%esp
    exit();
    2c8e:	e8 e0 12 00 00       	call   3f73 <exit>
  }
  if(unlink("dots/.") == 0){
    2c93:	83 ec 0c             	sub    $0xc,%esp
    2c96:	68 42 56 00 00       	push   $0x5642
    2c9b:	e8 23 13 00 00       	call   3fc3 <unlink>
    2ca0:	83 c4 10             	add    $0x10,%esp
    2ca3:	85 c0                	test   %eax,%eax
    2ca5:	75 17                	jne    2cbe <rmdot+0x11a>
    printf(1, "unlink dots/. worked!\n");
    2ca7:	83 ec 08             	sub    $0x8,%esp
    2caa:	68 49 56 00 00       	push   $0x5649
    2caf:	6a 01                	push   $0x1
    2cb1:	e8 34 14 00 00       	call   40ea <printf>
    2cb6:	83 c4 10             	add    $0x10,%esp
    exit();
    2cb9:	e8 b5 12 00 00       	call   3f73 <exit>
  }
  if(unlink("dots/..") == 0){
    2cbe:	83 ec 0c             	sub    $0xc,%esp
    2cc1:	68 60 56 00 00       	push   $0x5660
    2cc6:	e8 f8 12 00 00       	call   3fc3 <unlink>
    2ccb:	83 c4 10             	add    $0x10,%esp
    2cce:	85 c0                	test   %eax,%eax
    2cd0:	75 17                	jne    2ce9 <rmdot+0x145>
    printf(1, "unlink dots/.. worked!\n");
    2cd2:	83 ec 08             	sub    $0x8,%esp
    2cd5:	68 68 56 00 00       	push   $0x5668
    2cda:	6a 01                	push   $0x1
    2cdc:	e8 09 14 00 00       	call   40ea <printf>
    2ce1:	83 c4 10             	add    $0x10,%esp
    exit();
    2ce4:	e8 8a 12 00 00       	call   3f73 <exit>
  }
  if(unlink("dots") != 0){
    2ce9:	83 ec 0c             	sub    $0xc,%esp
    2cec:	68 fa 55 00 00       	push   $0x55fa
    2cf1:	e8 cd 12 00 00       	call   3fc3 <unlink>
    2cf6:	83 c4 10             	add    $0x10,%esp
    2cf9:	85 c0                	test   %eax,%eax
    2cfb:	74 17                	je     2d14 <rmdot+0x170>
    printf(1, "unlink dots failed!\n");
    2cfd:	83 ec 08             	sub    $0x8,%esp
    2d00:	68 80 56 00 00       	push   $0x5680
    2d05:	6a 01                	push   $0x1
    2d07:	e8 de 13 00 00       	call   40ea <printf>
    2d0c:	83 c4 10             	add    $0x10,%esp
    exit();
    2d0f:	e8 5f 12 00 00       	call   3f73 <exit>
  }
  printf(1, "rmdot ok\n");
    2d14:	83 ec 08             	sub    $0x8,%esp
    2d17:	68 95 56 00 00       	push   $0x5695
    2d1c:	6a 01                	push   $0x1
    2d1e:	e8 c7 13 00 00       	call   40ea <printf>
    2d23:	83 c4 10             	add    $0x10,%esp
}
    2d26:	90                   	nop
    2d27:	c9                   	leave  
    2d28:	c3                   	ret    

00002d29 <dirfile>:

void
dirfile(void)
{
    2d29:	55                   	push   %ebp
    2d2a:	89 e5                	mov    %esp,%ebp
    2d2c:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(1, "dir vs file\n");
    2d2f:	83 ec 08             	sub    $0x8,%esp
    2d32:	68 9f 56 00 00       	push   $0x569f
    2d37:	6a 01                	push   $0x1
    2d39:	e8 ac 13 00 00       	call   40ea <printf>
    2d3e:	83 c4 10             	add    $0x10,%esp

  fd = open("dirfile", O_CREATE);
    2d41:	83 ec 08             	sub    $0x8,%esp
    2d44:	68 00 02 00 00       	push   $0x200
    2d49:	68 ac 56 00 00       	push   $0x56ac
    2d4e:	e8 60 12 00 00       	call   3fb3 <open>
    2d53:	83 c4 10             	add    $0x10,%esp
    2d56:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2d59:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2d5d:	79 17                	jns    2d76 <dirfile+0x4d>
    printf(1, "create dirfile failed\n");
    2d5f:	83 ec 08             	sub    $0x8,%esp
    2d62:	68 b4 56 00 00       	push   $0x56b4
    2d67:	6a 01                	push   $0x1
    2d69:	e8 7c 13 00 00       	call   40ea <printf>
    2d6e:	83 c4 10             	add    $0x10,%esp
    exit();
    2d71:	e8 fd 11 00 00       	call   3f73 <exit>
  }
  close(fd);
    2d76:	83 ec 0c             	sub    $0xc,%esp
    2d79:	ff 75 f4             	pushl  -0xc(%ebp)
    2d7c:	e8 1a 12 00 00       	call   3f9b <close>
    2d81:	83 c4 10             	add    $0x10,%esp
  if(chdir("dirfile") == 0){
    2d84:	83 ec 0c             	sub    $0xc,%esp
    2d87:	68 ac 56 00 00       	push   $0x56ac
    2d8c:	e8 52 12 00 00       	call   3fe3 <chdir>
    2d91:	83 c4 10             	add    $0x10,%esp
    2d94:	85 c0                	test   %eax,%eax
    2d96:	75 17                	jne    2daf <dirfile+0x86>
    printf(1, "chdir dirfile succeeded!\n");
    2d98:	83 ec 08             	sub    $0x8,%esp
    2d9b:	68 cb 56 00 00       	push   $0x56cb
    2da0:	6a 01                	push   $0x1
    2da2:	e8 43 13 00 00       	call   40ea <printf>
    2da7:	83 c4 10             	add    $0x10,%esp
    exit();
    2daa:	e8 c4 11 00 00       	call   3f73 <exit>
  }
  fd = open("dirfile/xx", 0);
    2daf:	83 ec 08             	sub    $0x8,%esp
    2db2:	6a 00                	push   $0x0
    2db4:	68 e5 56 00 00       	push   $0x56e5
    2db9:	e8 f5 11 00 00       	call   3fb3 <open>
    2dbe:	83 c4 10             	add    $0x10,%esp
    2dc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2dc4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2dc8:	78 17                	js     2de1 <dirfile+0xb8>
    printf(1, "create dirfile/xx succeeded!\n");
    2dca:	83 ec 08             	sub    $0x8,%esp
    2dcd:	68 f0 56 00 00       	push   $0x56f0
    2dd2:	6a 01                	push   $0x1
    2dd4:	e8 11 13 00 00       	call   40ea <printf>
    2dd9:	83 c4 10             	add    $0x10,%esp
    exit();
    2ddc:	e8 92 11 00 00       	call   3f73 <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    2de1:	83 ec 08             	sub    $0x8,%esp
    2de4:	68 00 02 00 00       	push   $0x200
    2de9:	68 e5 56 00 00       	push   $0x56e5
    2dee:	e8 c0 11 00 00       	call   3fb3 <open>
    2df3:	83 c4 10             	add    $0x10,%esp
    2df6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2df9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2dfd:	78 17                	js     2e16 <dirfile+0xed>
    printf(1, "create dirfile/xx succeeded!\n");
    2dff:	83 ec 08             	sub    $0x8,%esp
    2e02:	68 f0 56 00 00       	push   $0x56f0
    2e07:	6a 01                	push   $0x1
    2e09:	e8 dc 12 00 00       	call   40ea <printf>
    2e0e:	83 c4 10             	add    $0x10,%esp
    exit();
    2e11:	e8 5d 11 00 00       	call   3f73 <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    2e16:	83 ec 0c             	sub    $0xc,%esp
    2e19:	68 e5 56 00 00       	push   $0x56e5
    2e1e:	e8 b8 11 00 00       	call   3fdb <mkdir>
    2e23:	83 c4 10             	add    $0x10,%esp
    2e26:	85 c0                	test   %eax,%eax
    2e28:	75 17                	jne    2e41 <dirfile+0x118>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2e2a:	83 ec 08             	sub    $0x8,%esp
    2e2d:	68 0e 57 00 00       	push   $0x570e
    2e32:	6a 01                	push   $0x1
    2e34:	e8 b1 12 00 00       	call   40ea <printf>
    2e39:	83 c4 10             	add    $0x10,%esp
    exit();
    2e3c:	e8 32 11 00 00       	call   3f73 <exit>
  }
  if(unlink("dirfile/xx") == 0){
    2e41:	83 ec 0c             	sub    $0xc,%esp
    2e44:	68 e5 56 00 00       	push   $0x56e5
    2e49:	e8 75 11 00 00       	call   3fc3 <unlink>
    2e4e:	83 c4 10             	add    $0x10,%esp
    2e51:	85 c0                	test   %eax,%eax
    2e53:	75 17                	jne    2e6c <dirfile+0x143>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2e55:	83 ec 08             	sub    $0x8,%esp
    2e58:	68 2b 57 00 00       	push   $0x572b
    2e5d:	6a 01                	push   $0x1
    2e5f:	e8 86 12 00 00       	call   40ea <printf>
    2e64:	83 c4 10             	add    $0x10,%esp
    exit();
    2e67:	e8 07 11 00 00       	call   3f73 <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    2e6c:	83 ec 08             	sub    $0x8,%esp
    2e6f:	68 e5 56 00 00       	push   $0x56e5
    2e74:	68 49 57 00 00       	push   $0x5749
    2e79:	e8 55 11 00 00       	call   3fd3 <link>
    2e7e:	83 c4 10             	add    $0x10,%esp
    2e81:	85 c0                	test   %eax,%eax
    2e83:	75 17                	jne    2e9c <dirfile+0x173>
    printf(1, "link to dirfile/xx succeeded!\n");
    2e85:	83 ec 08             	sub    $0x8,%esp
    2e88:	68 50 57 00 00       	push   $0x5750
    2e8d:	6a 01                	push   $0x1
    2e8f:	e8 56 12 00 00       	call   40ea <printf>
    2e94:	83 c4 10             	add    $0x10,%esp
    exit();
    2e97:	e8 d7 10 00 00       	call   3f73 <exit>
  }
  if(unlink("dirfile") != 0){
    2e9c:	83 ec 0c             	sub    $0xc,%esp
    2e9f:	68 ac 56 00 00       	push   $0x56ac
    2ea4:	e8 1a 11 00 00       	call   3fc3 <unlink>
    2ea9:	83 c4 10             	add    $0x10,%esp
    2eac:	85 c0                	test   %eax,%eax
    2eae:	74 17                	je     2ec7 <dirfile+0x19e>
    printf(1, "unlink dirfile failed!\n");
    2eb0:	83 ec 08             	sub    $0x8,%esp
    2eb3:	68 6f 57 00 00       	push   $0x576f
    2eb8:	6a 01                	push   $0x1
    2eba:	e8 2b 12 00 00       	call   40ea <printf>
    2ebf:	83 c4 10             	add    $0x10,%esp
    exit();
    2ec2:	e8 ac 10 00 00       	call   3f73 <exit>
  }

  fd = open(".", O_RDWR);
    2ec7:	83 ec 08             	sub    $0x8,%esp
    2eca:	6a 02                	push   $0x2
    2ecc:	68 2b 4d 00 00       	push   $0x4d2b
    2ed1:	e8 dd 10 00 00       	call   3fb3 <open>
    2ed6:	83 c4 10             	add    $0x10,%esp
    2ed9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2edc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2ee0:	78 17                	js     2ef9 <dirfile+0x1d0>
    printf(1, "open . for writing succeeded!\n");
    2ee2:	83 ec 08             	sub    $0x8,%esp
    2ee5:	68 88 57 00 00       	push   $0x5788
    2eea:	6a 01                	push   $0x1
    2eec:	e8 f9 11 00 00       	call   40ea <printf>
    2ef1:	83 c4 10             	add    $0x10,%esp
    exit();
    2ef4:	e8 7a 10 00 00       	call   3f73 <exit>
  }
  fd = open(".", 0);
    2ef9:	83 ec 08             	sub    $0x8,%esp
    2efc:	6a 00                	push   $0x0
    2efe:	68 2b 4d 00 00       	push   $0x4d2b
    2f03:	e8 ab 10 00 00       	call   3fb3 <open>
    2f08:	83 c4 10             	add    $0x10,%esp
    2f0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(write(fd, "x", 1) > 0){
    2f0e:	83 ec 04             	sub    $0x4,%esp
    2f11:	6a 01                	push   $0x1
    2f13:	68 77 49 00 00       	push   $0x4977
    2f18:	ff 75 f4             	pushl  -0xc(%ebp)
    2f1b:	e8 73 10 00 00       	call   3f93 <write>
    2f20:	83 c4 10             	add    $0x10,%esp
    2f23:	85 c0                	test   %eax,%eax
    2f25:	7e 17                	jle    2f3e <dirfile+0x215>
    printf(1, "write . succeeded!\n");
    2f27:	83 ec 08             	sub    $0x8,%esp
    2f2a:	68 a7 57 00 00       	push   $0x57a7
    2f2f:	6a 01                	push   $0x1
    2f31:	e8 b4 11 00 00       	call   40ea <printf>
    2f36:	83 c4 10             	add    $0x10,%esp
    exit();
    2f39:	e8 35 10 00 00       	call   3f73 <exit>
  }
  close(fd);
    2f3e:	83 ec 0c             	sub    $0xc,%esp
    2f41:	ff 75 f4             	pushl  -0xc(%ebp)
    2f44:	e8 52 10 00 00       	call   3f9b <close>
    2f49:	83 c4 10             	add    $0x10,%esp

  printf(1, "dir vs file OK\n");
    2f4c:	83 ec 08             	sub    $0x8,%esp
    2f4f:	68 bb 57 00 00       	push   $0x57bb
    2f54:	6a 01                	push   $0x1
    2f56:	e8 8f 11 00 00       	call   40ea <printf>
    2f5b:	83 c4 10             	add    $0x10,%esp
}
    2f5e:	90                   	nop
    2f5f:	c9                   	leave  
    2f60:	c3                   	ret    

00002f61 <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2f61:	55                   	push   %ebp
    2f62:	89 e5                	mov    %esp,%ebp
    2f64:	83 ec 18             	sub    $0x18,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2f67:	83 ec 08             	sub    $0x8,%esp
    2f6a:	68 cb 57 00 00       	push   $0x57cb
    2f6f:	6a 01                	push   $0x1
    2f71:	e8 74 11 00 00       	call   40ea <printf>
    2f76:	83 c4 10             	add    $0x10,%esp

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2f79:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2f80:	e9 e7 00 00 00       	jmp    306c <iref+0x10b>
    if(mkdir("irefd") != 0){
    2f85:	83 ec 0c             	sub    $0xc,%esp
    2f88:	68 dc 57 00 00       	push   $0x57dc
    2f8d:	e8 49 10 00 00       	call   3fdb <mkdir>
    2f92:	83 c4 10             	add    $0x10,%esp
    2f95:	85 c0                	test   %eax,%eax
    2f97:	74 17                	je     2fb0 <iref+0x4f>
      printf(1, "mkdir irefd failed\n");
    2f99:	83 ec 08             	sub    $0x8,%esp
    2f9c:	68 e2 57 00 00       	push   $0x57e2
    2fa1:	6a 01                	push   $0x1
    2fa3:	e8 42 11 00 00       	call   40ea <printf>
    2fa8:	83 c4 10             	add    $0x10,%esp
      exit();
    2fab:	e8 c3 0f 00 00       	call   3f73 <exit>
    }
    if(chdir("irefd") != 0){
    2fb0:	83 ec 0c             	sub    $0xc,%esp
    2fb3:	68 dc 57 00 00       	push   $0x57dc
    2fb8:	e8 26 10 00 00       	call   3fe3 <chdir>
    2fbd:	83 c4 10             	add    $0x10,%esp
    2fc0:	85 c0                	test   %eax,%eax
    2fc2:	74 17                	je     2fdb <iref+0x7a>
      printf(1, "chdir irefd failed\n");
    2fc4:	83 ec 08             	sub    $0x8,%esp
    2fc7:	68 f6 57 00 00       	push   $0x57f6
    2fcc:	6a 01                	push   $0x1
    2fce:	e8 17 11 00 00       	call   40ea <printf>
    2fd3:	83 c4 10             	add    $0x10,%esp
      exit();
    2fd6:	e8 98 0f 00 00       	call   3f73 <exit>
    }

    mkdir("");
    2fdb:	83 ec 0c             	sub    $0xc,%esp
    2fde:	68 0a 58 00 00       	push   $0x580a
    2fe3:	e8 f3 0f 00 00       	call   3fdb <mkdir>
    2fe8:	83 c4 10             	add    $0x10,%esp
    link("README", "");
    2feb:	83 ec 08             	sub    $0x8,%esp
    2fee:	68 0a 58 00 00       	push   $0x580a
    2ff3:	68 49 57 00 00       	push   $0x5749
    2ff8:	e8 d6 0f 00 00       	call   3fd3 <link>
    2ffd:	83 c4 10             	add    $0x10,%esp
    fd = open("", O_CREATE);
    3000:	83 ec 08             	sub    $0x8,%esp
    3003:	68 00 02 00 00       	push   $0x200
    3008:	68 0a 58 00 00       	push   $0x580a
    300d:	e8 a1 0f 00 00       	call   3fb3 <open>
    3012:	83 c4 10             	add    $0x10,%esp
    3015:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    3018:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    301c:	78 0e                	js     302c <iref+0xcb>
      close(fd);
    301e:	83 ec 0c             	sub    $0xc,%esp
    3021:	ff 75 f0             	pushl  -0x10(%ebp)
    3024:	e8 72 0f 00 00       	call   3f9b <close>
    3029:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    302c:	83 ec 08             	sub    $0x8,%esp
    302f:	68 00 02 00 00       	push   $0x200
    3034:	68 0b 58 00 00       	push   $0x580b
    3039:	e8 75 0f 00 00       	call   3fb3 <open>
    303e:	83 c4 10             	add    $0x10,%esp
    3041:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    3044:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3048:	78 0e                	js     3058 <iref+0xf7>
      close(fd);
    304a:	83 ec 0c             	sub    $0xc,%esp
    304d:	ff 75 f0             	pushl  -0x10(%ebp)
    3050:	e8 46 0f 00 00       	call   3f9b <close>
    3055:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    3058:	83 ec 0c             	sub    $0xc,%esp
    305b:	68 0b 58 00 00       	push   $0x580b
    3060:	e8 5e 0f 00 00       	call   3fc3 <unlink>
    3065:	83 c4 10             	add    $0x10,%esp
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    3068:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    306c:	83 7d f4 32          	cmpl   $0x32,-0xc(%ebp)
    3070:	0f 8e 0f ff ff ff    	jle    2f85 <iref+0x24>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    3076:	83 ec 0c             	sub    $0xc,%esp
    3079:	68 12 45 00 00       	push   $0x4512
    307e:	e8 60 0f 00 00       	call   3fe3 <chdir>
    3083:	83 c4 10             	add    $0x10,%esp
  printf(1, "empty file name OK\n");
    3086:	83 ec 08             	sub    $0x8,%esp
    3089:	68 0e 58 00 00       	push   $0x580e
    308e:	6a 01                	push   $0x1
    3090:	e8 55 10 00 00       	call   40ea <printf>
    3095:	83 c4 10             	add    $0x10,%esp
}
    3098:	90                   	nop
    3099:	c9                   	leave  
    309a:	c3                   	ret    

0000309b <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    309b:	55                   	push   %ebp
    309c:	89 e5                	mov    %esp,%ebp
    309e:	83 ec 18             	sub    $0x18,%esp
  int n, pid;

  printf(1, "fork test\n");
    30a1:	83 ec 08             	sub    $0x8,%esp
    30a4:	68 22 58 00 00       	push   $0x5822
    30a9:	6a 01                	push   $0x1
    30ab:	e8 3a 10 00 00       	call   40ea <printf>
    30b0:	83 c4 10             	add    $0x10,%esp

  for(n=0; n<1000; n++){
    30b3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    30ba:	eb 25                	jmp    30e1 <forktest+0x46>
    pid = fork(0);
    30bc:	83 ec 0c             	sub    $0xc,%esp
    30bf:	6a 00                	push   $0x0
    30c1:	e8 a5 0e 00 00       	call   3f6b <fork>
    30c6:	83 c4 10             	add    $0x10,%esp
    30c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
    30cc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    30d0:	78 1a                	js     30ec <forktest+0x51>
      break;
    if(pid == 0)
    30d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    30d6:	75 05                	jne    30dd <forktest+0x42>
      exit();
    30d8:	e8 96 0e 00 00       	call   3f73 <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    30dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    30e1:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    30e8:	7e d2                	jle    30bc <forktest+0x21>
    30ea:	eb 01                	jmp    30ed <forktest+0x52>
    pid = fork(0);
    if(pid < 0)
      break;
    30ec:	90                   	nop
    if(pid == 0)
      exit();
  }
  
  if(n == 1000){
    30ed:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
    30f4:	75 3b                	jne    3131 <forktest+0x96>
    printf(1, "fork claimed to work 1000 times!\n");
    30f6:	83 ec 08             	sub    $0x8,%esp
    30f9:	68 30 58 00 00       	push   $0x5830
    30fe:	6a 01                	push   $0x1
    3100:	e8 e5 0f 00 00       	call   40ea <printf>
    3105:	83 c4 10             	add    $0x10,%esp
    exit();
    3108:	e8 66 0e 00 00       	call   3f73 <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
    310d:	e8 69 0e 00 00       	call   3f7b <wait>
    3112:	85 c0                	test   %eax,%eax
    3114:	79 17                	jns    312d <forktest+0x92>
      printf(1, "wait stopped early\n");
    3116:	83 ec 08             	sub    $0x8,%esp
    3119:	68 52 58 00 00       	push   $0x5852
    311e:	6a 01                	push   $0x1
    3120:	e8 c5 0f 00 00       	call   40ea <printf>
    3125:	83 c4 10             	add    $0x10,%esp
      exit();
    3128:	e8 46 0e 00 00       	call   3f73 <exit>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }
  
  for(; n > 0; n--){
    312d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    3131:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3135:	7f d6                	jg     310d <forktest+0x72>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    3137:	e8 3f 0e 00 00       	call   3f7b <wait>
    313c:	83 f8 ff             	cmp    $0xffffffff,%eax
    313f:	74 17                	je     3158 <forktest+0xbd>
    printf(1, "wait got too many\n");
    3141:	83 ec 08             	sub    $0x8,%esp
    3144:	68 66 58 00 00       	push   $0x5866
    3149:	6a 01                	push   $0x1
    314b:	e8 9a 0f 00 00       	call   40ea <printf>
    3150:	83 c4 10             	add    $0x10,%esp
    exit();
    3153:	e8 1b 0e 00 00       	call   3f73 <exit>
  }
  
  printf(1, "fork test OK\n");
    3158:	83 ec 08             	sub    $0x8,%esp
    315b:	68 79 58 00 00       	push   $0x5879
    3160:	6a 01                	push   $0x1
    3162:	e8 83 0f 00 00       	call   40ea <printf>
    3167:	83 c4 10             	add    $0x10,%esp
}
    316a:	90                   	nop
    316b:	c9                   	leave  
    316c:	c3                   	ret    

0000316d <sbrktest>:

void
sbrktest(void)
{
    316d:	55                   	push   %ebp
    316e:	89 e5                	mov    %esp,%ebp
    3170:	53                   	push   %ebx
    3171:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    3174:	a1 5c 63 00 00       	mov    0x635c,%eax
    3179:	83 ec 08             	sub    $0x8,%esp
    317c:	68 87 58 00 00       	push   $0x5887
    3181:	50                   	push   %eax
    3182:	e8 63 0f 00 00       	call   40ea <printf>
    3187:	83 c4 10             	add    $0x10,%esp
  oldbrk = sbrk(0);
    318a:	83 ec 0c             	sub    $0xc,%esp
    318d:	6a 00                	push   $0x0
    318f:	e8 67 0e 00 00       	call   3ffb <sbrk>
    3194:	83 c4 10             	add    $0x10,%esp
    3197:	89 45 ec             	mov    %eax,-0x14(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    319a:	83 ec 0c             	sub    $0xc,%esp
    319d:	6a 00                	push   $0x0
    319f:	e8 57 0e 00 00       	call   3ffb <sbrk>
    31a4:	83 c4 10             	add    $0x10,%esp
    31a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  int i;
  for(i = 0; i < 5000; i++){ 
    31aa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    31b1:	eb 4f                	jmp    3202 <sbrktest+0x95>
    b = sbrk(1);
    31b3:	83 ec 0c             	sub    $0xc,%esp
    31b6:	6a 01                	push   $0x1
    31b8:	e8 3e 0e 00 00       	call   3ffb <sbrk>
    31bd:	83 c4 10             	add    $0x10,%esp
    31c0:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(b != a){
    31c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    31c6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    31c9:	74 24                	je     31ef <sbrktest+0x82>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    31cb:	a1 5c 63 00 00       	mov    0x635c,%eax
    31d0:	83 ec 0c             	sub    $0xc,%esp
    31d3:	ff 75 e8             	pushl  -0x18(%ebp)
    31d6:	ff 75 f4             	pushl  -0xc(%ebp)
    31d9:	ff 75 f0             	pushl  -0x10(%ebp)
    31dc:	68 92 58 00 00       	push   $0x5892
    31e1:	50                   	push   %eax
    31e2:	e8 03 0f 00 00       	call   40ea <printf>
    31e7:	83 c4 20             	add    $0x20,%esp
      exit();
    31ea:	e8 84 0d 00 00       	call   3f73 <exit>
    }
    *b = 1;
    31ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
    31f2:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    31f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    31f8:	83 c0 01             	add    $0x1,%eax
    31fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    31fe:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3202:	81 7d f0 87 13 00 00 	cmpl   $0x1387,-0x10(%ebp)
    3209:	7e a8                	jle    31b3 <sbrktest+0x46>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork(0);
    320b:	83 ec 0c             	sub    $0xc,%esp
    320e:	6a 00                	push   $0x0
    3210:	e8 56 0d 00 00       	call   3f6b <fork>
    3215:	83 c4 10             	add    $0x10,%esp
    3218:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    321b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    321f:	79 1b                	jns    323c <sbrktest+0xcf>
    printf(stdout, "sbrk test fork failed\n");
    3221:	a1 5c 63 00 00       	mov    0x635c,%eax
    3226:	83 ec 08             	sub    $0x8,%esp
    3229:	68 ad 58 00 00       	push   $0x58ad
    322e:	50                   	push   %eax
    322f:	e8 b6 0e 00 00       	call   40ea <printf>
    3234:	83 c4 10             	add    $0x10,%esp
    exit();
    3237:	e8 37 0d 00 00       	call   3f73 <exit>
  }
  c = sbrk(1);
    323c:	83 ec 0c             	sub    $0xc,%esp
    323f:	6a 01                	push   $0x1
    3241:	e8 b5 0d 00 00       	call   3ffb <sbrk>
    3246:	83 c4 10             	add    $0x10,%esp
    3249:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c = sbrk(1);
    324c:	83 ec 0c             	sub    $0xc,%esp
    324f:	6a 01                	push   $0x1
    3251:	e8 a5 0d 00 00       	call   3ffb <sbrk>
    3256:	83 c4 10             	add    $0x10,%esp
    3259:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a + 1){
    325c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    325f:	83 c0 01             	add    $0x1,%eax
    3262:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    3265:	74 1b                	je     3282 <sbrktest+0x115>
    printf(stdout, "sbrk test failed post-fork\n");
    3267:	a1 5c 63 00 00       	mov    0x635c,%eax
    326c:	83 ec 08             	sub    $0x8,%esp
    326f:	68 c4 58 00 00       	push   $0x58c4
    3274:	50                   	push   %eax
    3275:	e8 70 0e 00 00       	call   40ea <printf>
    327a:	83 c4 10             	add    $0x10,%esp
    exit();
    327d:	e8 f1 0c 00 00       	call   3f73 <exit>
  }
  if(pid == 0)
    3282:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3286:	75 05                	jne    328d <sbrktest+0x120>
    exit();
    3288:	e8 e6 0c 00 00       	call   3f73 <exit>
  wait();
    328d:	e8 e9 0c 00 00       	call   3f7b <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    3292:	83 ec 0c             	sub    $0xc,%esp
    3295:	6a 00                	push   $0x0
    3297:	e8 5f 0d 00 00       	call   3ffb <sbrk>
    329c:	83 c4 10             	add    $0x10,%esp
    329f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  amt = (BIG) - (uint)a;
    32a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32a5:	ba 00 00 40 06       	mov    $0x6400000,%edx
    32aa:	29 c2                	sub    %eax,%edx
    32ac:	89 d0                	mov    %edx,%eax
    32ae:	89 45 dc             	mov    %eax,-0x24(%ebp)
  p = sbrk(amt);
    32b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    32b4:	83 ec 0c             	sub    $0xc,%esp
    32b7:	50                   	push   %eax
    32b8:	e8 3e 0d 00 00       	call   3ffb <sbrk>
    32bd:	83 c4 10             	add    $0x10,%esp
    32c0:	89 45 d8             	mov    %eax,-0x28(%ebp)
  if (p != a) { 
    32c3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    32c6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    32c9:	74 1b                	je     32e6 <sbrktest+0x179>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    32cb:	a1 5c 63 00 00       	mov    0x635c,%eax
    32d0:	83 ec 08             	sub    $0x8,%esp
    32d3:	68 e0 58 00 00       	push   $0x58e0
    32d8:	50                   	push   %eax
    32d9:	e8 0c 0e 00 00       	call   40ea <printf>
    32de:	83 c4 10             	add    $0x10,%esp
    exit();
    32e1:	e8 8d 0c 00 00       	call   3f73 <exit>
  }
  lastaddr = (char*) (BIG-1);
    32e6:	c7 45 d4 ff ff 3f 06 	movl   $0x63fffff,-0x2c(%ebp)
  *lastaddr = 99;
    32ed:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    32f0:	c6 00 63             	movb   $0x63,(%eax)

  // can one de-allocate?
  a = sbrk(0);
    32f3:	83 ec 0c             	sub    $0xc,%esp
    32f6:	6a 00                	push   $0x0
    32f8:	e8 fe 0c 00 00       	call   3ffb <sbrk>
    32fd:	83 c4 10             	add    $0x10,%esp
    3300:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-4096);
    3303:	83 ec 0c             	sub    $0xc,%esp
    3306:	68 00 f0 ff ff       	push   $0xfffff000
    330b:	e8 eb 0c 00 00       	call   3ffb <sbrk>
    3310:	83 c4 10             	add    $0x10,%esp
    3313:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c == (char*)0xffffffff){
    3316:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    331a:	75 1b                	jne    3337 <sbrktest+0x1ca>
    printf(stdout, "sbrk could not deallocate\n");
    331c:	a1 5c 63 00 00       	mov    0x635c,%eax
    3321:	83 ec 08             	sub    $0x8,%esp
    3324:	68 1e 59 00 00       	push   $0x591e
    3329:	50                   	push   %eax
    332a:	e8 bb 0d 00 00       	call   40ea <printf>
    332f:	83 c4 10             	add    $0x10,%esp
    exit();
    3332:	e8 3c 0c 00 00       	call   3f73 <exit>
  }
  c = sbrk(0);
    3337:	83 ec 0c             	sub    $0xc,%esp
    333a:	6a 00                	push   $0x0
    333c:	e8 ba 0c 00 00       	call   3ffb <sbrk>
    3341:	83 c4 10             	add    $0x10,%esp
    3344:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a - 4096){
    3347:	8b 45 f4             	mov    -0xc(%ebp),%eax
    334a:	2d 00 10 00 00       	sub    $0x1000,%eax
    334f:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    3352:	74 1e                	je     3372 <sbrktest+0x205>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3354:	a1 5c 63 00 00       	mov    0x635c,%eax
    3359:	ff 75 e0             	pushl  -0x20(%ebp)
    335c:	ff 75 f4             	pushl  -0xc(%ebp)
    335f:	68 3c 59 00 00       	push   $0x593c
    3364:	50                   	push   %eax
    3365:	e8 80 0d 00 00       	call   40ea <printf>
    336a:	83 c4 10             	add    $0x10,%esp
    exit();
    336d:	e8 01 0c 00 00       	call   3f73 <exit>
  }

  // can one re-allocate that page?
  a = sbrk(0);
    3372:	83 ec 0c             	sub    $0xc,%esp
    3375:	6a 00                	push   $0x0
    3377:	e8 7f 0c 00 00       	call   3ffb <sbrk>
    337c:	83 c4 10             	add    $0x10,%esp
    337f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(4096);
    3382:	83 ec 0c             	sub    $0xc,%esp
    3385:	68 00 10 00 00       	push   $0x1000
    338a:	e8 6c 0c 00 00       	call   3ffb <sbrk>
    338f:	83 c4 10             	add    $0x10,%esp
    3392:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a || sbrk(0) != a + 4096){
    3395:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3398:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    339b:	75 1b                	jne    33b8 <sbrktest+0x24b>
    339d:	83 ec 0c             	sub    $0xc,%esp
    33a0:	6a 00                	push   $0x0
    33a2:	e8 54 0c 00 00       	call   3ffb <sbrk>
    33a7:	83 c4 10             	add    $0x10,%esp
    33aa:	89 c2                	mov    %eax,%edx
    33ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33af:	05 00 10 00 00       	add    $0x1000,%eax
    33b4:	39 c2                	cmp    %eax,%edx
    33b6:	74 1e                	je     33d6 <sbrktest+0x269>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    33b8:	a1 5c 63 00 00       	mov    0x635c,%eax
    33bd:	ff 75 e0             	pushl  -0x20(%ebp)
    33c0:	ff 75 f4             	pushl  -0xc(%ebp)
    33c3:	68 74 59 00 00       	push   $0x5974
    33c8:	50                   	push   %eax
    33c9:	e8 1c 0d 00 00       	call   40ea <printf>
    33ce:	83 c4 10             	add    $0x10,%esp
    exit();
    33d1:	e8 9d 0b 00 00       	call   3f73 <exit>
  }
  if(*lastaddr == 99){
    33d6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    33d9:	0f b6 00             	movzbl (%eax),%eax
    33dc:	3c 63                	cmp    $0x63,%al
    33de:	75 1b                	jne    33fb <sbrktest+0x28e>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    33e0:	a1 5c 63 00 00       	mov    0x635c,%eax
    33e5:	83 ec 08             	sub    $0x8,%esp
    33e8:	68 9c 59 00 00       	push   $0x599c
    33ed:	50                   	push   %eax
    33ee:	e8 f7 0c 00 00       	call   40ea <printf>
    33f3:	83 c4 10             	add    $0x10,%esp
    exit();
    33f6:	e8 78 0b 00 00       	call   3f73 <exit>
  }

  a = sbrk(0);
    33fb:	83 ec 0c             	sub    $0xc,%esp
    33fe:	6a 00                	push   $0x0
    3400:	e8 f6 0b 00 00       	call   3ffb <sbrk>
    3405:	83 c4 10             	add    $0x10,%esp
    3408:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-(sbrk(0) - oldbrk));
    340b:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    340e:	83 ec 0c             	sub    $0xc,%esp
    3411:	6a 00                	push   $0x0
    3413:	e8 e3 0b 00 00       	call   3ffb <sbrk>
    3418:	83 c4 10             	add    $0x10,%esp
    341b:	29 c3                	sub    %eax,%ebx
    341d:	89 d8                	mov    %ebx,%eax
    341f:	83 ec 0c             	sub    $0xc,%esp
    3422:	50                   	push   %eax
    3423:	e8 d3 0b 00 00       	call   3ffb <sbrk>
    3428:	83 c4 10             	add    $0x10,%esp
    342b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a){
    342e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3431:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3434:	74 1e                	je     3454 <sbrktest+0x2e7>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    3436:	a1 5c 63 00 00       	mov    0x635c,%eax
    343b:	ff 75 e0             	pushl  -0x20(%ebp)
    343e:	ff 75 f4             	pushl  -0xc(%ebp)
    3441:	68 cc 59 00 00       	push   $0x59cc
    3446:	50                   	push   %eax
    3447:	e8 9e 0c 00 00       	call   40ea <printf>
    344c:	83 c4 10             	add    $0x10,%esp
    exit();
    344f:	e8 1f 0b 00 00       	call   3f73 <exit>
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3454:	c7 45 f4 00 00 00 80 	movl   $0x80000000,-0xc(%ebp)
    345b:	eb 7e                	jmp    34db <sbrktest+0x36e>
    ppid = getpid();
    345d:	e8 91 0b 00 00       	call   3ff3 <getpid>
    3462:	89 45 d0             	mov    %eax,-0x30(%ebp)
    pid = fork(0);
    3465:	83 ec 0c             	sub    $0xc,%esp
    3468:	6a 00                	push   $0x0
    346a:	e8 fc 0a 00 00       	call   3f6b <fork>
    346f:	83 c4 10             	add    $0x10,%esp
    3472:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pid < 0){
    3475:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3479:	79 1b                	jns    3496 <sbrktest+0x329>
      printf(stdout, "fork failed\n");
    347b:	a1 5c 63 00 00       	mov    0x635c,%eax
    3480:	83 ec 08             	sub    $0x8,%esp
    3483:	68 41 45 00 00       	push   $0x4541
    3488:	50                   	push   %eax
    3489:	e8 5c 0c 00 00       	call   40ea <printf>
    348e:	83 c4 10             	add    $0x10,%esp
      exit();
    3491:	e8 dd 0a 00 00       	call   3f73 <exit>
    }
    if(pid == 0){
    3496:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    349a:	75 33                	jne    34cf <sbrktest+0x362>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    349c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    349f:	0f b6 00             	movzbl (%eax),%eax
    34a2:	0f be d0             	movsbl %al,%edx
    34a5:	a1 5c 63 00 00       	mov    0x635c,%eax
    34aa:	52                   	push   %edx
    34ab:	ff 75 f4             	pushl  -0xc(%ebp)
    34ae:	68 ed 59 00 00       	push   $0x59ed
    34b3:	50                   	push   %eax
    34b4:	e8 31 0c 00 00       	call   40ea <printf>
    34b9:	83 c4 10             	add    $0x10,%esp
      kill(ppid);
    34bc:	83 ec 0c             	sub    $0xc,%esp
    34bf:	ff 75 d0             	pushl  -0x30(%ebp)
    34c2:	e8 dc 0a 00 00       	call   3fa3 <kill>
    34c7:	83 c4 10             	add    $0x10,%esp
      exit();
    34ca:	e8 a4 0a 00 00       	call   3f73 <exit>
    }
    wait();
    34cf:	e8 a7 0a 00 00       	call   3f7b <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    34d4:	81 45 f4 50 c3 00 00 	addl   $0xc350,-0xc(%ebp)
    34db:	81 7d f4 7f 84 1e 80 	cmpl   $0x801e847f,-0xc(%ebp)
    34e2:	0f 86 75 ff ff ff    	jbe    345d <sbrktest+0x2f0>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    34e8:	83 ec 0c             	sub    $0xc,%esp
    34eb:	8d 45 c8             	lea    -0x38(%ebp),%eax
    34ee:	50                   	push   %eax
    34ef:	e8 8f 0a 00 00       	call   3f83 <pipe>
    34f4:	83 c4 10             	add    $0x10,%esp
    34f7:	85 c0                	test   %eax,%eax
    34f9:	74 17                	je     3512 <sbrktest+0x3a5>
    printf(1, "pipe() failed\n");
    34fb:	83 ec 08             	sub    $0x8,%esp
    34fe:	68 12 49 00 00       	push   $0x4912
    3503:	6a 01                	push   $0x1
    3505:	e8 e0 0b 00 00       	call   40ea <printf>
    350a:	83 c4 10             	add    $0x10,%esp
    exit();
    350d:	e8 61 0a 00 00       	call   3f73 <exit>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3512:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3519:	e9 90 00 00 00       	jmp    35ae <sbrktest+0x441>
    if((pids[i] = fork(0)) == 0){
    351e:	83 ec 0c             	sub    $0xc,%esp
    3521:	6a 00                	push   $0x0
    3523:	e8 43 0a 00 00       	call   3f6b <fork>
    3528:	83 c4 10             	add    $0x10,%esp
    352b:	89 c2                	mov    %eax,%edx
    352d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3530:	89 54 85 a0          	mov    %edx,-0x60(%ebp,%eax,4)
    3534:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3537:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    353b:	85 c0                	test   %eax,%eax
    353d:	75 4a                	jne    3589 <sbrktest+0x41c>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    353f:	83 ec 0c             	sub    $0xc,%esp
    3542:	6a 00                	push   $0x0
    3544:	e8 b2 0a 00 00       	call   3ffb <sbrk>
    3549:	83 c4 10             	add    $0x10,%esp
    354c:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3551:	29 c2                	sub    %eax,%edx
    3553:	89 d0                	mov    %edx,%eax
    3555:	83 ec 0c             	sub    $0xc,%esp
    3558:	50                   	push   %eax
    3559:	e8 9d 0a 00 00       	call   3ffb <sbrk>
    355e:	83 c4 10             	add    $0x10,%esp
      write(fds[1], "x", 1);
    3561:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3564:	83 ec 04             	sub    $0x4,%esp
    3567:	6a 01                	push   $0x1
    3569:	68 77 49 00 00       	push   $0x4977
    356e:	50                   	push   %eax
    356f:	e8 1f 0a 00 00       	call   3f93 <write>
    3574:	83 c4 10             	add    $0x10,%esp
      // sit around until killed
      for(;;) sleep(1000);
    3577:	83 ec 0c             	sub    $0xc,%esp
    357a:	68 e8 03 00 00       	push   $0x3e8
    357f:	e8 7f 0a 00 00       	call   4003 <sleep>
    3584:	83 c4 10             	add    $0x10,%esp
    3587:	eb ee                	jmp    3577 <sbrktest+0x40a>
    }
    if(pids[i] != -1)
    3589:	8b 45 f0             	mov    -0x10(%ebp),%eax
    358c:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3590:	83 f8 ff             	cmp    $0xffffffff,%eax
    3593:	74 15                	je     35aa <sbrktest+0x43d>
      read(fds[0], &scratch, 1);
    3595:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3598:	83 ec 04             	sub    $0x4,%esp
    359b:	6a 01                	push   $0x1
    359d:	8d 55 9f             	lea    -0x61(%ebp),%edx
    35a0:	52                   	push   %edx
    35a1:	50                   	push   %eax
    35a2:	e8 e4 09 00 00       	call   3f8b <read>
    35a7:	83 c4 10             	add    $0x10,%esp
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    35aa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    35ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35b1:	83 f8 09             	cmp    $0x9,%eax
    35b4:	0f 86 64 ff ff ff    	jbe    351e <sbrktest+0x3b1>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    35ba:	83 ec 0c             	sub    $0xc,%esp
    35bd:	68 00 10 00 00       	push   $0x1000
    35c2:	e8 34 0a 00 00       	call   3ffb <sbrk>
    35c7:	83 c4 10             	add    $0x10,%esp
    35ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    35cd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    35d4:	eb 2b                	jmp    3601 <sbrktest+0x494>
    if(pids[i] == -1)
    35d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35d9:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    35dd:	83 f8 ff             	cmp    $0xffffffff,%eax
    35e0:	74 1a                	je     35fc <sbrktest+0x48f>
      continue;
    kill(pids[i]);
    35e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35e5:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    35e9:	83 ec 0c             	sub    $0xc,%esp
    35ec:	50                   	push   %eax
    35ed:	e8 b1 09 00 00       	call   3fa3 <kill>
    35f2:	83 c4 10             	add    $0x10,%esp
    wait();
    35f5:	e8 81 09 00 00       	call   3f7b <wait>
    35fa:	eb 01                	jmp    35fd <sbrktest+0x490>
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
      continue;
    35fc:	90                   	nop
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    35fd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3601:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3604:	83 f8 09             	cmp    $0x9,%eax
    3607:	76 cd                	jbe    35d6 <sbrktest+0x469>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    3609:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    360d:	75 1b                	jne    362a <sbrktest+0x4bd>
    printf(stdout, "failed sbrk leaked memory\n");
    360f:	a1 5c 63 00 00       	mov    0x635c,%eax
    3614:	83 ec 08             	sub    $0x8,%esp
    3617:	68 06 5a 00 00       	push   $0x5a06
    361c:	50                   	push   %eax
    361d:	e8 c8 0a 00 00       	call   40ea <printf>
    3622:	83 c4 10             	add    $0x10,%esp
    exit();
    3625:	e8 49 09 00 00       	call   3f73 <exit>
  }

  if(sbrk(0) > oldbrk)
    362a:	83 ec 0c             	sub    $0xc,%esp
    362d:	6a 00                	push   $0x0
    362f:	e8 c7 09 00 00       	call   3ffb <sbrk>
    3634:	83 c4 10             	add    $0x10,%esp
    3637:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    363a:	76 20                	jbe    365c <sbrktest+0x4ef>
    sbrk(-(sbrk(0) - oldbrk));
    363c:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    363f:	83 ec 0c             	sub    $0xc,%esp
    3642:	6a 00                	push   $0x0
    3644:	e8 b2 09 00 00       	call   3ffb <sbrk>
    3649:	83 c4 10             	add    $0x10,%esp
    364c:	29 c3                	sub    %eax,%ebx
    364e:	89 d8                	mov    %ebx,%eax
    3650:	83 ec 0c             	sub    $0xc,%esp
    3653:	50                   	push   %eax
    3654:	e8 a2 09 00 00       	call   3ffb <sbrk>
    3659:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    365c:	a1 5c 63 00 00       	mov    0x635c,%eax
    3661:	83 ec 08             	sub    $0x8,%esp
    3664:	68 21 5a 00 00       	push   $0x5a21
    3669:	50                   	push   %eax
    366a:	e8 7b 0a 00 00       	call   40ea <printf>
    366f:	83 c4 10             	add    $0x10,%esp
}
    3672:	90                   	nop
    3673:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3676:	c9                   	leave  
    3677:	c3                   	ret    

00003678 <validateint>:

void
validateint(int *p)
{
    3678:	55                   	push   %ebp
    3679:	89 e5                	mov    %esp,%ebp
    367b:	53                   	push   %ebx
    367c:	83 ec 10             	sub    $0x10,%esp
  int res;
  asm("mov %%esp, %%ebx\n\t"
    367f:	b8 0d 00 00 00       	mov    $0xd,%eax
    3684:	8b 55 08             	mov    0x8(%ebp),%edx
    3687:	89 d1                	mov    %edx,%ecx
    3689:	89 e3                	mov    %esp,%ebx
    368b:	89 cc                	mov    %ecx,%esp
    368d:	cd 40                	int    $0x40
    368f:	89 dc                	mov    %ebx,%esp
    3691:	89 45 f8             	mov    %eax,-0x8(%ebp)
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3694:	90                   	nop
    3695:	83 c4 10             	add    $0x10,%esp
    3698:	5b                   	pop    %ebx
    3699:	5d                   	pop    %ebp
    369a:	c3                   	ret    

0000369b <validatetest>:

void
validatetest(void)
{
    369b:	55                   	push   %ebp
    369c:	89 e5                	mov    %esp,%ebp
    369e:	83 ec 18             	sub    $0x18,%esp
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    36a1:	a1 5c 63 00 00       	mov    0x635c,%eax
    36a6:	83 ec 08             	sub    $0x8,%esp
    36a9:	68 2f 5a 00 00       	push   $0x5a2f
    36ae:	50                   	push   %eax
    36af:	e8 36 0a 00 00       	call   40ea <printf>
    36b4:	83 c4 10             	add    $0x10,%esp
  hi = 1100*1024;
    36b7:	c7 45 f0 00 30 11 00 	movl   $0x113000,-0x10(%ebp)

  for(p = 0; p <= (uint)hi; p += 4096){
    36be:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    36c5:	e9 92 00 00 00       	jmp    375c <validatetest+0xc1>
    if((pid = fork(0)) == 0){
    36ca:	83 ec 0c             	sub    $0xc,%esp
    36cd:	6a 00                	push   $0x0
    36cf:	e8 97 08 00 00       	call   3f6b <fork>
    36d4:	83 c4 10             	add    $0x10,%esp
    36d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    36da:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    36de:	75 14                	jne    36f4 <validatetest+0x59>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    36e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36e3:	83 ec 0c             	sub    $0xc,%esp
    36e6:	50                   	push   %eax
    36e7:	e8 8c ff ff ff       	call   3678 <validateint>
    36ec:	83 c4 10             	add    $0x10,%esp
      exit();
    36ef:	e8 7f 08 00 00       	call   3f73 <exit>
    }
    sleep(0);
    36f4:	83 ec 0c             	sub    $0xc,%esp
    36f7:	6a 00                	push   $0x0
    36f9:	e8 05 09 00 00       	call   4003 <sleep>
    36fe:	83 c4 10             	add    $0x10,%esp
    sleep(0);
    3701:	83 ec 0c             	sub    $0xc,%esp
    3704:	6a 00                	push   $0x0
    3706:	e8 f8 08 00 00       	call   4003 <sleep>
    370b:	83 c4 10             	add    $0x10,%esp
    kill(pid);
    370e:	83 ec 0c             	sub    $0xc,%esp
    3711:	ff 75 ec             	pushl  -0x14(%ebp)
    3714:	e8 8a 08 00 00       	call   3fa3 <kill>
    3719:	83 c4 10             	add    $0x10,%esp
    wait();
    371c:	e8 5a 08 00 00       	call   3f7b <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    3721:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3724:	83 ec 08             	sub    $0x8,%esp
    3727:	50                   	push   %eax
    3728:	68 3e 5a 00 00       	push   $0x5a3e
    372d:	e8 a1 08 00 00       	call   3fd3 <link>
    3732:	83 c4 10             	add    $0x10,%esp
    3735:	83 f8 ff             	cmp    $0xffffffff,%eax
    3738:	74 1b                	je     3755 <validatetest+0xba>
      printf(stdout, "link should not succeed\n");
    373a:	a1 5c 63 00 00       	mov    0x635c,%eax
    373f:	83 ec 08             	sub    $0x8,%esp
    3742:	68 49 5a 00 00       	push   $0x5a49
    3747:	50                   	push   %eax
    3748:	e8 9d 09 00 00       	call   40ea <printf>
    374d:	83 c4 10             	add    $0x10,%esp
      exit();
    3750:	e8 1e 08 00 00       	call   3f73 <exit>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3755:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    375c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    375f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    3762:	0f 86 62 ff ff ff    	jbe    36ca <validatetest+0x2f>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    3768:	a1 5c 63 00 00       	mov    0x635c,%eax
    376d:	83 ec 08             	sub    $0x8,%esp
    3770:	68 62 5a 00 00       	push   $0x5a62
    3775:	50                   	push   %eax
    3776:	e8 6f 09 00 00       	call   40ea <printf>
    377b:	83 c4 10             	add    $0x10,%esp
}
    377e:	90                   	nop
    377f:	c9                   	leave  
    3780:	c3                   	ret    

00003781 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3781:	55                   	push   %ebp
    3782:	89 e5                	mov    %esp,%ebp
    3784:	83 ec 18             	sub    $0x18,%esp
  int i;

  printf(stdout, "bss test\n");
    3787:	a1 5c 63 00 00       	mov    0x635c,%eax
    378c:	83 ec 08             	sub    $0x8,%esp
    378f:	68 6f 5a 00 00       	push   $0x5a6f
    3794:	50                   	push   %eax
    3795:	e8 50 09 00 00       	call   40ea <printf>
    379a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(uninit); i++){
    379d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    37a4:	eb 2e                	jmp    37d4 <bsstest+0x53>
    if(uninit[i] != '\0'){
    37a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37a9:	05 20 64 00 00       	add    $0x6420,%eax
    37ae:	0f b6 00             	movzbl (%eax),%eax
    37b1:	84 c0                	test   %al,%al
    37b3:	74 1b                	je     37d0 <bsstest+0x4f>
      printf(stdout, "bss test failed\n");
    37b5:	a1 5c 63 00 00       	mov    0x635c,%eax
    37ba:	83 ec 08             	sub    $0x8,%esp
    37bd:	68 79 5a 00 00       	push   $0x5a79
    37c2:	50                   	push   %eax
    37c3:	e8 22 09 00 00       	call   40ea <printf>
    37c8:	83 c4 10             	add    $0x10,%esp
      exit();
    37cb:	e8 a3 07 00 00       	call   3f73 <exit>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    37d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    37d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37d7:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    37dc:	76 c8                	jbe    37a6 <bsstest+0x25>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    37de:	a1 5c 63 00 00       	mov    0x635c,%eax
    37e3:	83 ec 08             	sub    $0x8,%esp
    37e6:	68 8a 5a 00 00       	push   $0x5a8a
    37eb:	50                   	push   %eax
    37ec:	e8 f9 08 00 00       	call   40ea <printf>
    37f1:	83 c4 10             	add    $0x10,%esp
}
    37f4:	90                   	nop
    37f5:	c9                   	leave  
    37f6:	c3                   	ret    

000037f7 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    37f7:	55                   	push   %ebp
    37f8:	89 e5                	mov    %esp,%ebp
    37fa:	83 ec 18             	sub    $0x18,%esp
  int pid, fd;

  unlink("bigarg-ok");
    37fd:	83 ec 0c             	sub    $0xc,%esp
    3800:	68 97 5a 00 00       	push   $0x5a97
    3805:	e8 b9 07 00 00       	call   3fc3 <unlink>
    380a:	83 c4 10             	add    $0x10,%esp
  pid = fork(0);
    380d:	83 ec 0c             	sub    $0xc,%esp
    3810:	6a 00                	push   $0x0
    3812:	e8 54 07 00 00       	call   3f6b <fork>
    3817:	83 c4 10             	add    $0x10,%esp
    381a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid == 0){
    381d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3821:	0f 85 97 00 00 00    	jne    38be <bigargtest+0xc7>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    3827:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    382e:	eb 12                	jmp    3842 <bigargtest+0x4b>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3830:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3833:	c7 04 85 80 63 00 00 	movl   $0x5aa4,0x6380(,%eax,4)
    383a:	a4 5a 00 00 
  unlink("bigarg-ok");
  pid = fork(0);
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    383e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3842:	83 7d f4 1e          	cmpl   $0x1e,-0xc(%ebp)
    3846:	7e e8                	jle    3830 <bigargtest+0x39>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    3848:	c7 05 fc 63 00 00 00 	movl   $0x0,0x63fc
    384f:	00 00 00 
    printf(stdout, "bigarg test\n");
    3852:	a1 5c 63 00 00       	mov    0x635c,%eax
    3857:	83 ec 08             	sub    $0x8,%esp
    385a:	68 81 5b 00 00       	push   $0x5b81
    385f:	50                   	push   %eax
    3860:	e8 85 08 00 00       	call   40ea <printf>
    3865:	83 c4 10             	add    $0x10,%esp
    exec("echo", args);
    3868:	83 ec 08             	sub    $0x8,%esp
    386b:	68 80 63 00 00       	push   $0x6380
    3870:	68 a0 44 00 00       	push   $0x44a0
    3875:	e8 31 07 00 00       	call   3fab <exec>
    387a:	83 c4 10             	add    $0x10,%esp
    printf(stdout, "bigarg test ok\n");
    387d:	a1 5c 63 00 00       	mov    0x635c,%eax
    3882:	83 ec 08             	sub    $0x8,%esp
    3885:	68 8e 5b 00 00       	push   $0x5b8e
    388a:	50                   	push   %eax
    388b:	e8 5a 08 00 00       	call   40ea <printf>
    3890:	83 c4 10             	add    $0x10,%esp
    fd = open("bigarg-ok", O_CREATE);
    3893:	83 ec 08             	sub    $0x8,%esp
    3896:	68 00 02 00 00       	push   $0x200
    389b:	68 97 5a 00 00       	push   $0x5a97
    38a0:	e8 0e 07 00 00       	call   3fb3 <open>
    38a5:	83 c4 10             	add    $0x10,%esp
    38a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(fd);
    38ab:	83 ec 0c             	sub    $0xc,%esp
    38ae:	ff 75 ec             	pushl  -0x14(%ebp)
    38b1:	e8 e5 06 00 00       	call   3f9b <close>
    38b6:	83 c4 10             	add    $0x10,%esp
    exit();
    38b9:	e8 b5 06 00 00       	call   3f73 <exit>
  } else if(pid < 0){
    38be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    38c2:	79 1b                	jns    38df <bigargtest+0xe8>
    printf(stdout, "bigargtest: fork failed\n");
    38c4:	a1 5c 63 00 00       	mov    0x635c,%eax
    38c9:	83 ec 08             	sub    $0x8,%esp
    38cc:	68 9e 5b 00 00       	push   $0x5b9e
    38d1:	50                   	push   %eax
    38d2:	e8 13 08 00 00       	call   40ea <printf>
    38d7:	83 c4 10             	add    $0x10,%esp
    exit();
    38da:	e8 94 06 00 00       	call   3f73 <exit>
  }
  wait();
    38df:	e8 97 06 00 00       	call   3f7b <wait>
  fd = open("bigarg-ok", 0);
    38e4:	83 ec 08             	sub    $0x8,%esp
    38e7:	6a 00                	push   $0x0
    38e9:	68 97 5a 00 00       	push   $0x5a97
    38ee:	e8 c0 06 00 00       	call   3fb3 <open>
    38f3:	83 c4 10             	add    $0x10,%esp
    38f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    38f9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    38fd:	79 1b                	jns    391a <bigargtest+0x123>
    printf(stdout, "bigarg test failed!\n");
    38ff:	a1 5c 63 00 00       	mov    0x635c,%eax
    3904:	83 ec 08             	sub    $0x8,%esp
    3907:	68 b7 5b 00 00       	push   $0x5bb7
    390c:	50                   	push   %eax
    390d:	e8 d8 07 00 00       	call   40ea <printf>
    3912:	83 c4 10             	add    $0x10,%esp
    exit();
    3915:	e8 59 06 00 00       	call   3f73 <exit>
  }
  close(fd);
    391a:	83 ec 0c             	sub    $0xc,%esp
    391d:	ff 75 ec             	pushl  -0x14(%ebp)
    3920:	e8 76 06 00 00       	call   3f9b <close>
    3925:	83 c4 10             	add    $0x10,%esp
  unlink("bigarg-ok");
    3928:	83 ec 0c             	sub    $0xc,%esp
    392b:	68 97 5a 00 00       	push   $0x5a97
    3930:	e8 8e 06 00 00       	call   3fc3 <unlink>
    3935:	83 c4 10             	add    $0x10,%esp
}
    3938:	90                   	nop
    3939:	c9                   	leave  
    393a:	c3                   	ret    

0000393b <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    393b:	55                   	push   %ebp
    393c:	89 e5                	mov    %esp,%ebp
    393e:	53                   	push   %ebx
    393f:	83 ec 64             	sub    $0x64,%esp
  int nfiles;
  int fsblocks = 0;
    3942:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

  printf(1, "fsfull test\n");
    3949:	83 ec 08             	sub    $0x8,%esp
    394c:	68 cc 5b 00 00       	push   $0x5bcc
    3951:	6a 01                	push   $0x1
    3953:	e8 92 07 00 00       	call   40ea <printf>
    3958:	83 c4 10             	add    $0x10,%esp

  for(nfiles = 0; ; nfiles++){
    395b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    char name[64];
    name[0] = 'f';
    3962:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3966:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3969:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    396e:	89 c8                	mov    %ecx,%eax
    3970:	f7 ea                	imul   %edx
    3972:	c1 fa 06             	sar    $0x6,%edx
    3975:	89 c8                	mov    %ecx,%eax
    3977:	c1 f8 1f             	sar    $0x1f,%eax
    397a:	29 c2                	sub    %eax,%edx
    397c:	89 d0                	mov    %edx,%eax
    397e:	83 c0 30             	add    $0x30,%eax
    3981:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3984:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3987:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    398c:	89 d8                	mov    %ebx,%eax
    398e:	f7 ea                	imul   %edx
    3990:	c1 fa 06             	sar    $0x6,%edx
    3993:	89 d8                	mov    %ebx,%eax
    3995:	c1 f8 1f             	sar    $0x1f,%eax
    3998:	89 d1                	mov    %edx,%ecx
    399a:	29 c1                	sub    %eax,%ecx
    399c:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    39a2:	29 c3                	sub    %eax,%ebx
    39a4:	89 d9                	mov    %ebx,%ecx
    39a6:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    39ab:	89 c8                	mov    %ecx,%eax
    39ad:	f7 ea                	imul   %edx
    39af:	c1 fa 05             	sar    $0x5,%edx
    39b2:	89 c8                	mov    %ecx,%eax
    39b4:	c1 f8 1f             	sar    $0x1f,%eax
    39b7:	29 c2                	sub    %eax,%edx
    39b9:	89 d0                	mov    %edx,%eax
    39bb:	83 c0 30             	add    $0x30,%eax
    39be:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    39c1:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    39c4:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    39c9:	89 d8                	mov    %ebx,%eax
    39cb:	f7 ea                	imul   %edx
    39cd:	c1 fa 05             	sar    $0x5,%edx
    39d0:	89 d8                	mov    %ebx,%eax
    39d2:	c1 f8 1f             	sar    $0x1f,%eax
    39d5:	89 d1                	mov    %edx,%ecx
    39d7:	29 c1                	sub    %eax,%ecx
    39d9:	6b c1 64             	imul   $0x64,%ecx,%eax
    39dc:	29 c3                	sub    %eax,%ebx
    39de:	89 d9                	mov    %ebx,%ecx
    39e0:	ba 67 66 66 66       	mov    $0x66666667,%edx
    39e5:	89 c8                	mov    %ecx,%eax
    39e7:	f7 ea                	imul   %edx
    39e9:	c1 fa 02             	sar    $0x2,%edx
    39ec:	89 c8                	mov    %ecx,%eax
    39ee:	c1 f8 1f             	sar    $0x1f,%eax
    39f1:	29 c2                	sub    %eax,%edx
    39f3:	89 d0                	mov    %edx,%eax
    39f5:	83 c0 30             	add    $0x30,%eax
    39f8:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    39fb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    39fe:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3a03:	89 c8                	mov    %ecx,%eax
    3a05:	f7 ea                	imul   %edx
    3a07:	c1 fa 02             	sar    $0x2,%edx
    3a0a:	89 c8                	mov    %ecx,%eax
    3a0c:	c1 f8 1f             	sar    $0x1f,%eax
    3a0f:	29 c2                	sub    %eax,%edx
    3a11:	89 d0                	mov    %edx,%eax
    3a13:	c1 e0 02             	shl    $0x2,%eax
    3a16:	01 d0                	add    %edx,%eax
    3a18:	01 c0                	add    %eax,%eax
    3a1a:	29 c1                	sub    %eax,%ecx
    3a1c:	89 ca                	mov    %ecx,%edx
    3a1e:	89 d0                	mov    %edx,%eax
    3a20:	83 c0 30             	add    $0x30,%eax
    3a23:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3a26:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    printf(1, "writing %s\n", name);
    3a2a:	83 ec 04             	sub    $0x4,%esp
    3a2d:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3a30:	50                   	push   %eax
    3a31:	68 d9 5b 00 00       	push   $0x5bd9
    3a36:	6a 01                	push   $0x1
    3a38:	e8 ad 06 00 00       	call   40ea <printf>
    3a3d:	83 c4 10             	add    $0x10,%esp
    int fd = open(name, O_CREATE|O_RDWR);
    3a40:	83 ec 08             	sub    $0x8,%esp
    3a43:	68 02 02 00 00       	push   $0x202
    3a48:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3a4b:	50                   	push   %eax
    3a4c:	e8 62 05 00 00       	call   3fb3 <open>
    3a51:	83 c4 10             	add    $0x10,%esp
    3a54:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fd < 0){
    3a57:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3a5b:	79 18                	jns    3a75 <fsfull+0x13a>
      printf(1, "open %s failed\n", name);
    3a5d:	83 ec 04             	sub    $0x4,%esp
    3a60:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3a63:	50                   	push   %eax
    3a64:	68 e5 5b 00 00       	push   $0x5be5
    3a69:	6a 01                	push   $0x1
    3a6b:	e8 7a 06 00 00       	call   40ea <printf>
    3a70:	83 c4 10             	add    $0x10,%esp
      break;
    3a73:	eb 6b                	jmp    3ae0 <fsfull+0x1a5>
    }
    int total = 0;
    3a75:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while(1){
      int cc = write(fd, buf, 512);
    3a7c:	83 ec 04             	sub    $0x4,%esp
    3a7f:	68 00 02 00 00       	push   $0x200
    3a84:	68 40 8b 00 00       	push   $0x8b40
    3a89:	ff 75 e8             	pushl  -0x18(%ebp)
    3a8c:	e8 02 05 00 00       	call   3f93 <write>
    3a91:	83 c4 10             	add    $0x10,%esp
    3a94:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if(cc < 512)
    3a97:	81 7d e4 ff 01 00 00 	cmpl   $0x1ff,-0x1c(%ebp)
    3a9e:	7e 0c                	jle    3aac <fsfull+0x171>
        break;
      total += cc;
    3aa0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3aa3:	01 45 ec             	add    %eax,-0x14(%ebp)
      fsblocks++;
    3aa6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    }
    3aaa:	eb d0                	jmp    3a7c <fsfull+0x141>
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
    3aac:	90                   	nop
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3aad:	83 ec 04             	sub    $0x4,%esp
    3ab0:	ff 75 ec             	pushl  -0x14(%ebp)
    3ab3:	68 f5 5b 00 00       	push   $0x5bf5
    3ab8:	6a 01                	push   $0x1
    3aba:	e8 2b 06 00 00       	call   40ea <printf>
    3abf:	83 c4 10             	add    $0x10,%esp
    close(fd);
    3ac2:	83 ec 0c             	sub    $0xc,%esp
    3ac5:	ff 75 e8             	pushl  -0x18(%ebp)
    3ac8:	e8 ce 04 00 00       	call   3f9b <close>
    3acd:	83 c4 10             	add    $0x10,%esp
    if(total == 0)
    3ad0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3ad4:	74 09                	je     3adf <fsfull+0x1a4>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3ad6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3ada:	e9 83 fe ff ff       	jmp    3962 <fsfull+0x27>
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
    3adf:	90                   	nop
  }

  while(nfiles >= 0){
    3ae0:	e9 db 00 00 00       	jmp    3bc0 <fsfull+0x285>
    char name[64];
    name[0] = 'f';
    3ae5:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3ae9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3aec:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3af1:	89 c8                	mov    %ecx,%eax
    3af3:	f7 ea                	imul   %edx
    3af5:	c1 fa 06             	sar    $0x6,%edx
    3af8:	89 c8                	mov    %ecx,%eax
    3afa:	c1 f8 1f             	sar    $0x1f,%eax
    3afd:	29 c2                	sub    %eax,%edx
    3aff:	89 d0                	mov    %edx,%eax
    3b01:	83 c0 30             	add    $0x30,%eax
    3b04:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3b07:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3b0a:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3b0f:	89 d8                	mov    %ebx,%eax
    3b11:	f7 ea                	imul   %edx
    3b13:	c1 fa 06             	sar    $0x6,%edx
    3b16:	89 d8                	mov    %ebx,%eax
    3b18:	c1 f8 1f             	sar    $0x1f,%eax
    3b1b:	89 d1                	mov    %edx,%ecx
    3b1d:	29 c1                	sub    %eax,%ecx
    3b1f:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    3b25:	29 c3                	sub    %eax,%ebx
    3b27:	89 d9                	mov    %ebx,%ecx
    3b29:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3b2e:	89 c8                	mov    %ecx,%eax
    3b30:	f7 ea                	imul   %edx
    3b32:	c1 fa 05             	sar    $0x5,%edx
    3b35:	89 c8                	mov    %ecx,%eax
    3b37:	c1 f8 1f             	sar    $0x1f,%eax
    3b3a:	29 c2                	sub    %eax,%edx
    3b3c:	89 d0                	mov    %edx,%eax
    3b3e:	83 c0 30             	add    $0x30,%eax
    3b41:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3b44:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3b47:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3b4c:	89 d8                	mov    %ebx,%eax
    3b4e:	f7 ea                	imul   %edx
    3b50:	c1 fa 05             	sar    $0x5,%edx
    3b53:	89 d8                	mov    %ebx,%eax
    3b55:	c1 f8 1f             	sar    $0x1f,%eax
    3b58:	89 d1                	mov    %edx,%ecx
    3b5a:	29 c1                	sub    %eax,%ecx
    3b5c:	6b c1 64             	imul   $0x64,%ecx,%eax
    3b5f:	29 c3                	sub    %eax,%ebx
    3b61:	89 d9                	mov    %ebx,%ecx
    3b63:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3b68:	89 c8                	mov    %ecx,%eax
    3b6a:	f7 ea                	imul   %edx
    3b6c:	c1 fa 02             	sar    $0x2,%edx
    3b6f:	89 c8                	mov    %ecx,%eax
    3b71:	c1 f8 1f             	sar    $0x1f,%eax
    3b74:	29 c2                	sub    %eax,%edx
    3b76:	89 d0                	mov    %edx,%eax
    3b78:	83 c0 30             	add    $0x30,%eax
    3b7b:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    3b7e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3b81:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3b86:	89 c8                	mov    %ecx,%eax
    3b88:	f7 ea                	imul   %edx
    3b8a:	c1 fa 02             	sar    $0x2,%edx
    3b8d:	89 c8                	mov    %ecx,%eax
    3b8f:	c1 f8 1f             	sar    $0x1f,%eax
    3b92:	29 c2                	sub    %eax,%edx
    3b94:	89 d0                	mov    %edx,%eax
    3b96:	c1 e0 02             	shl    $0x2,%eax
    3b99:	01 d0                	add    %edx,%eax
    3b9b:	01 c0                	add    %eax,%eax
    3b9d:	29 c1                	sub    %eax,%ecx
    3b9f:	89 ca                	mov    %ecx,%edx
    3ba1:	89 d0                	mov    %edx,%eax
    3ba3:	83 c0 30             	add    $0x30,%eax
    3ba6:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3ba9:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    unlink(name);
    3bad:	83 ec 0c             	sub    $0xc,%esp
    3bb0:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3bb3:	50                   	push   %eax
    3bb4:	e8 0a 04 00 00       	call   3fc3 <unlink>
    3bb9:	83 c4 10             	add    $0x10,%esp
    nfiles--;
    3bbc:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3bc0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3bc4:	0f 89 1b ff ff ff    	jns    3ae5 <fsfull+0x1aa>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3bca:	83 ec 08             	sub    $0x8,%esp
    3bcd:	68 05 5c 00 00       	push   $0x5c05
    3bd2:	6a 01                	push   $0x1
    3bd4:	e8 11 05 00 00       	call   40ea <printf>
    3bd9:	83 c4 10             	add    $0x10,%esp
}
    3bdc:	90                   	nop
    3bdd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3be0:	c9                   	leave  
    3be1:	c3                   	ret    

00003be2 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    3be2:	55                   	push   %ebp
    3be3:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
    3be5:	a1 60 63 00 00       	mov    0x6360,%eax
    3bea:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    3bf0:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3bf5:	a3 60 63 00 00       	mov    %eax,0x6360
  return randstate;
    3bfa:	a1 60 63 00 00       	mov    0x6360,%eax
}
    3bff:	5d                   	pop    %ebp
    3c00:	c3                   	ret    

00003c01 <main>:

int
main(int argc, char *argv[])
{
    3c01:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    3c05:	83 e4 f0             	and    $0xfffffff0,%esp
    3c08:	ff 71 fc             	pushl  -0x4(%ecx)
    3c0b:	55                   	push   %ebp
    3c0c:	89 e5                	mov    %esp,%ebp
    3c0e:	51                   	push   %ecx
    3c0f:	83 ec 04             	sub    $0x4,%esp
  printf(1, "usertests starting\n");
    3c12:	83 ec 08             	sub    $0x8,%esp
    3c15:	68 1b 5c 00 00       	push   $0x5c1b
    3c1a:	6a 01                	push   $0x1
    3c1c:	e8 c9 04 00 00       	call   40ea <printf>
    3c21:	83 c4 10             	add    $0x10,%esp

  if(open("usertests.ran", 0) >= 0){
    3c24:	83 ec 08             	sub    $0x8,%esp
    3c27:	6a 00                	push   $0x0
    3c29:	68 2f 5c 00 00       	push   $0x5c2f
    3c2e:	e8 80 03 00 00       	call   3fb3 <open>
    3c33:	83 c4 10             	add    $0x10,%esp
    3c36:	85 c0                	test   %eax,%eax
    3c38:	78 17                	js     3c51 <main+0x50>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    3c3a:	83 ec 08             	sub    $0x8,%esp
    3c3d:	68 40 5c 00 00       	push   $0x5c40
    3c42:	6a 01                	push   $0x1
    3c44:	e8 a1 04 00 00       	call   40ea <printf>
    3c49:	83 c4 10             	add    $0x10,%esp
    exit();
    3c4c:	e8 22 03 00 00       	call   3f73 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    3c51:	83 ec 08             	sub    $0x8,%esp
    3c54:	68 00 02 00 00       	push   $0x200
    3c59:	68 2f 5c 00 00       	push   $0x5c2f
    3c5e:	e8 50 03 00 00       	call   3fb3 <open>
    3c63:	83 c4 10             	add    $0x10,%esp
    3c66:	83 ec 0c             	sub    $0xc,%esp
    3c69:	50                   	push   %eax
    3c6a:	e8 2c 03 00 00       	call   3f9b <close>
    3c6f:	83 c4 10             	add    $0x10,%esp

  createdelete();
    3c72:	e8 83 d6 ff ff       	call   12fa <createdelete>
  linkunlink();
    3c77:	e8 bc e0 ff ff       	call   1d38 <linkunlink>
  concreate();
    3c7c:	e8 f7 dc ff ff       	call   1978 <concreate>
  fourfiles();
    3c81:	e8 1b d4 ff ff       	call   10a1 <fourfiles>
  sharedfd();
    3c86:	e8 2b d2 ff ff       	call   eb6 <sharedfd>

  bigargtest();
    3c8b:	e8 67 fb ff ff       	call   37f7 <bigargtest>
  bigwrite();
    3c90:	e8 9d ea ff ff       	call   2732 <bigwrite>
  bigargtest();
    3c95:	e8 5d fb ff ff       	call   37f7 <bigargtest>
  bsstest();
    3c9a:	e8 e2 fa ff ff       	call   3781 <bsstest>
  sbrktest();
    3c9f:	e8 c9 f4 ff ff       	call   316d <sbrktest>
  validatetest();
    3ca4:	e8 f2 f9 ff ff       	call   369b <validatetest>

  opentest();
    3ca9:	e8 61 c6 ff ff       	call   30f <opentest>
  writetest();
    3cae:	e8 0b c7 ff ff       	call   3be <writetest>
  writetest1();
    3cb3:	e8 16 c9 ff ff       	call   5ce <writetest1>
  createtest();
    3cb8:	e8 0d cb ff ff       	call   7ca <createtest>

  openiputtest();
    3cbd:	e8 36 c5 ff ff       	call   1f8 <openiputtest>
  exitiputtest();
    3cc2:	e8 2a c4 ff ff       	call   f1 <exitiputtest>
  iputtest();
    3cc7:	e8 34 c3 ff ff       	call   0 <iputtest>

  mem();
    3ccc:	e8 ec d0 ff ff       	call   dbd <mem>
  pipe1();
    3cd1:	e8 fb cc ff ff       	call   9d1 <pipe1>
  preempt();
    3cd6:	e8 e7 ce ff ff       	call   bc2 <preempt>
  exitwait();
    3cdb:	e8 5d d0 ff ff       	call   d3d <exitwait>

  rmdot();
    3ce0:	e8 bf ee ff ff       	call   2ba4 <rmdot>
  fourteen();
    3ce5:	e8 5e ed ff ff       	call   2a48 <fourteen>
  bigfile();
    3cea:	e8 41 eb ff ff       	call   2830 <bigfile>
  subdir();
    3cef:	e8 fa e2 ff ff       	call   1fee <subdir>
  linktest();
    3cf4:	e8 3d da ff ff       	call   1736 <linktest>
  unlinkread();
    3cf9:	e8 76 d8 ff ff       	call   1574 <unlinkread>
  dirfile();
    3cfe:	e8 26 f0 ff ff       	call   2d29 <dirfile>
  iref();
    3d03:	e8 59 f2 ff ff       	call   2f61 <iref>
  forktest();
    3d08:	e8 8e f3 ff ff       	call   309b <forktest>
  bigdir(); // slow
    3d0d:	e8 67 e1 ff ff       	call   1e79 <bigdir>
  exectest();
    3d12:	e8 67 cc ff ff       	call   97e <exectest>

  exit();
    3d17:	e8 57 02 00 00       	call   3f73 <exit>

00003d1c <stosb>:
    3d1c:	55                   	push   %ebp
    3d1d:	89 e5                	mov    %esp,%ebp
    3d1f:	57                   	push   %edi
    3d20:	53                   	push   %ebx
    3d21:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3d24:	8b 55 10             	mov    0x10(%ebp),%edx
    3d27:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d2a:	89 cb                	mov    %ecx,%ebx
    3d2c:	89 df                	mov    %ebx,%edi
    3d2e:	89 d1                	mov    %edx,%ecx
    3d30:	fc                   	cld    
    3d31:	f3 aa                	rep stos %al,%es:(%edi)
    3d33:	89 ca                	mov    %ecx,%edx
    3d35:	89 fb                	mov    %edi,%ebx
    3d37:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3d3a:	89 55 10             	mov    %edx,0x10(%ebp)
    3d3d:	90                   	nop
    3d3e:	5b                   	pop    %ebx
    3d3f:	5f                   	pop    %edi
    3d40:	5d                   	pop    %ebp
    3d41:	c3                   	ret    

00003d42 <strcpy>:
    3d42:	55                   	push   %ebp
    3d43:	89 e5                	mov    %esp,%ebp
    3d45:	83 ec 10             	sub    $0x10,%esp
    3d48:	8b 45 08             	mov    0x8(%ebp),%eax
    3d4b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3d4e:	90                   	nop
    3d4f:	8b 45 08             	mov    0x8(%ebp),%eax
    3d52:	8d 50 01             	lea    0x1(%eax),%edx
    3d55:	89 55 08             	mov    %edx,0x8(%ebp)
    3d58:	8b 55 0c             	mov    0xc(%ebp),%edx
    3d5b:	8d 4a 01             	lea    0x1(%edx),%ecx
    3d5e:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    3d61:	0f b6 12             	movzbl (%edx),%edx
    3d64:	88 10                	mov    %dl,(%eax)
    3d66:	0f b6 00             	movzbl (%eax),%eax
    3d69:	84 c0                	test   %al,%al
    3d6b:	75 e2                	jne    3d4f <strcpy+0xd>
    3d6d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d70:	c9                   	leave  
    3d71:	c3                   	ret    

00003d72 <strcmp>:
    3d72:	55                   	push   %ebp
    3d73:	89 e5                	mov    %esp,%ebp
    3d75:	eb 08                	jmp    3d7f <strcmp+0xd>
    3d77:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3d7b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    3d7f:	8b 45 08             	mov    0x8(%ebp),%eax
    3d82:	0f b6 00             	movzbl (%eax),%eax
    3d85:	84 c0                	test   %al,%al
    3d87:	74 10                	je     3d99 <strcmp+0x27>
    3d89:	8b 45 08             	mov    0x8(%ebp),%eax
    3d8c:	0f b6 10             	movzbl (%eax),%edx
    3d8f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d92:	0f b6 00             	movzbl (%eax),%eax
    3d95:	38 c2                	cmp    %al,%dl
    3d97:	74 de                	je     3d77 <strcmp+0x5>
    3d99:	8b 45 08             	mov    0x8(%ebp),%eax
    3d9c:	0f b6 00             	movzbl (%eax),%eax
    3d9f:	0f b6 d0             	movzbl %al,%edx
    3da2:	8b 45 0c             	mov    0xc(%ebp),%eax
    3da5:	0f b6 00             	movzbl (%eax),%eax
    3da8:	0f b6 c0             	movzbl %al,%eax
    3dab:	29 c2                	sub    %eax,%edx
    3dad:	89 d0                	mov    %edx,%eax
    3daf:	5d                   	pop    %ebp
    3db0:	c3                   	ret    

00003db1 <strlen>:
    3db1:	55                   	push   %ebp
    3db2:	89 e5                	mov    %esp,%ebp
    3db4:	83 ec 10             	sub    $0x10,%esp
    3db7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3dbe:	eb 04                	jmp    3dc4 <strlen+0x13>
    3dc0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3dc4:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3dc7:	8b 45 08             	mov    0x8(%ebp),%eax
    3dca:	01 d0                	add    %edx,%eax
    3dcc:	0f b6 00             	movzbl (%eax),%eax
    3dcf:	84 c0                	test   %al,%al
    3dd1:	75 ed                	jne    3dc0 <strlen+0xf>
    3dd3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3dd6:	c9                   	leave  
    3dd7:	c3                   	ret    

00003dd8 <memset>:
    3dd8:	55                   	push   %ebp
    3dd9:	89 e5                	mov    %esp,%ebp
    3ddb:	8b 45 10             	mov    0x10(%ebp),%eax
    3dde:	50                   	push   %eax
    3ddf:	ff 75 0c             	pushl  0xc(%ebp)
    3de2:	ff 75 08             	pushl  0x8(%ebp)
    3de5:	e8 32 ff ff ff       	call   3d1c <stosb>
    3dea:	83 c4 0c             	add    $0xc,%esp
    3ded:	8b 45 08             	mov    0x8(%ebp),%eax
    3df0:	c9                   	leave  
    3df1:	c3                   	ret    

00003df2 <strchr>:
    3df2:	55                   	push   %ebp
    3df3:	89 e5                	mov    %esp,%ebp
    3df5:	83 ec 04             	sub    $0x4,%esp
    3df8:	8b 45 0c             	mov    0xc(%ebp),%eax
    3dfb:	88 45 fc             	mov    %al,-0x4(%ebp)
    3dfe:	eb 14                	jmp    3e14 <strchr+0x22>
    3e00:	8b 45 08             	mov    0x8(%ebp),%eax
    3e03:	0f b6 00             	movzbl (%eax),%eax
    3e06:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3e09:	75 05                	jne    3e10 <strchr+0x1e>
    3e0b:	8b 45 08             	mov    0x8(%ebp),%eax
    3e0e:	eb 13                	jmp    3e23 <strchr+0x31>
    3e10:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3e14:	8b 45 08             	mov    0x8(%ebp),%eax
    3e17:	0f b6 00             	movzbl (%eax),%eax
    3e1a:	84 c0                	test   %al,%al
    3e1c:	75 e2                	jne    3e00 <strchr+0xe>
    3e1e:	b8 00 00 00 00       	mov    $0x0,%eax
    3e23:	c9                   	leave  
    3e24:	c3                   	ret    

00003e25 <gets>:
    3e25:	55                   	push   %ebp
    3e26:	89 e5                	mov    %esp,%ebp
    3e28:	83 ec 18             	sub    $0x18,%esp
    3e2b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3e32:	eb 42                	jmp    3e76 <gets+0x51>
    3e34:	83 ec 04             	sub    $0x4,%esp
    3e37:	6a 01                	push   $0x1
    3e39:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3e3c:	50                   	push   %eax
    3e3d:	6a 00                	push   $0x0
    3e3f:	e8 47 01 00 00       	call   3f8b <read>
    3e44:	83 c4 10             	add    $0x10,%esp
    3e47:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3e4a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3e4e:	7e 33                	jle    3e83 <gets+0x5e>
    3e50:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e53:	8d 50 01             	lea    0x1(%eax),%edx
    3e56:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3e59:	89 c2                	mov    %eax,%edx
    3e5b:	8b 45 08             	mov    0x8(%ebp),%eax
    3e5e:	01 c2                	add    %eax,%edx
    3e60:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3e64:	88 02                	mov    %al,(%edx)
    3e66:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3e6a:	3c 0a                	cmp    $0xa,%al
    3e6c:	74 16                	je     3e84 <gets+0x5f>
    3e6e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3e72:	3c 0d                	cmp    $0xd,%al
    3e74:	74 0e                	je     3e84 <gets+0x5f>
    3e76:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e79:	83 c0 01             	add    $0x1,%eax
    3e7c:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3e7f:	7c b3                	jl     3e34 <gets+0xf>
    3e81:	eb 01                	jmp    3e84 <gets+0x5f>
    3e83:	90                   	nop
    3e84:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3e87:	8b 45 08             	mov    0x8(%ebp),%eax
    3e8a:	01 d0                	add    %edx,%eax
    3e8c:	c6 00 00             	movb   $0x0,(%eax)
    3e8f:	8b 45 08             	mov    0x8(%ebp),%eax
    3e92:	c9                   	leave  
    3e93:	c3                   	ret    

00003e94 <stat>:
    3e94:	55                   	push   %ebp
    3e95:	89 e5                	mov    %esp,%ebp
    3e97:	83 ec 18             	sub    $0x18,%esp
    3e9a:	83 ec 08             	sub    $0x8,%esp
    3e9d:	6a 00                	push   $0x0
    3e9f:	ff 75 08             	pushl  0x8(%ebp)
    3ea2:	e8 0c 01 00 00       	call   3fb3 <open>
    3ea7:	83 c4 10             	add    $0x10,%esp
    3eaa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3ead:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3eb1:	79 07                	jns    3eba <stat+0x26>
    3eb3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3eb8:	eb 25                	jmp    3edf <stat+0x4b>
    3eba:	83 ec 08             	sub    $0x8,%esp
    3ebd:	ff 75 0c             	pushl  0xc(%ebp)
    3ec0:	ff 75 f4             	pushl  -0xc(%ebp)
    3ec3:	e8 03 01 00 00       	call   3fcb <fstat>
    3ec8:	83 c4 10             	add    $0x10,%esp
    3ecb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3ece:	83 ec 0c             	sub    $0xc,%esp
    3ed1:	ff 75 f4             	pushl  -0xc(%ebp)
    3ed4:	e8 c2 00 00 00       	call   3f9b <close>
    3ed9:	83 c4 10             	add    $0x10,%esp
    3edc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3edf:	c9                   	leave  
    3ee0:	c3                   	ret    

00003ee1 <atoi>:
    3ee1:	55                   	push   %ebp
    3ee2:	89 e5                	mov    %esp,%ebp
    3ee4:	83 ec 10             	sub    $0x10,%esp
    3ee7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3eee:	eb 25                	jmp    3f15 <atoi+0x34>
    3ef0:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3ef3:	89 d0                	mov    %edx,%eax
    3ef5:	c1 e0 02             	shl    $0x2,%eax
    3ef8:	01 d0                	add    %edx,%eax
    3efa:	01 c0                	add    %eax,%eax
    3efc:	89 c1                	mov    %eax,%ecx
    3efe:	8b 45 08             	mov    0x8(%ebp),%eax
    3f01:	8d 50 01             	lea    0x1(%eax),%edx
    3f04:	89 55 08             	mov    %edx,0x8(%ebp)
    3f07:	0f b6 00             	movzbl (%eax),%eax
    3f0a:	0f be c0             	movsbl %al,%eax
    3f0d:	01 c8                	add    %ecx,%eax
    3f0f:	83 e8 30             	sub    $0x30,%eax
    3f12:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3f15:	8b 45 08             	mov    0x8(%ebp),%eax
    3f18:	0f b6 00             	movzbl (%eax),%eax
    3f1b:	3c 2f                	cmp    $0x2f,%al
    3f1d:	7e 0a                	jle    3f29 <atoi+0x48>
    3f1f:	8b 45 08             	mov    0x8(%ebp),%eax
    3f22:	0f b6 00             	movzbl (%eax),%eax
    3f25:	3c 39                	cmp    $0x39,%al
    3f27:	7e c7                	jle    3ef0 <atoi+0xf>
    3f29:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f2c:	c9                   	leave  
    3f2d:	c3                   	ret    

00003f2e <memmove>:
    3f2e:	55                   	push   %ebp
    3f2f:	89 e5                	mov    %esp,%ebp
    3f31:	83 ec 10             	sub    $0x10,%esp
    3f34:	8b 45 08             	mov    0x8(%ebp),%eax
    3f37:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3f3a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f3d:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3f40:	eb 17                	jmp    3f59 <memmove+0x2b>
    3f42:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f45:	8d 50 01             	lea    0x1(%eax),%edx
    3f48:	89 55 fc             	mov    %edx,-0x4(%ebp)
    3f4b:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3f4e:	8d 4a 01             	lea    0x1(%edx),%ecx
    3f51:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    3f54:	0f b6 12             	movzbl (%edx),%edx
    3f57:	88 10                	mov    %dl,(%eax)
    3f59:	8b 45 10             	mov    0x10(%ebp),%eax
    3f5c:	8d 50 ff             	lea    -0x1(%eax),%edx
    3f5f:	89 55 10             	mov    %edx,0x10(%ebp)
    3f62:	85 c0                	test   %eax,%eax
    3f64:	7f dc                	jg     3f42 <memmove+0x14>
    3f66:	8b 45 08             	mov    0x8(%ebp),%eax
    3f69:	c9                   	leave  
    3f6a:	c3                   	ret    

00003f6b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3f6b:	b8 01 00 00 00       	mov    $0x1,%eax
    3f70:	cd 40                	int    $0x40
    3f72:	c3                   	ret    

00003f73 <exit>:
SYSCALL(exit)
    3f73:	b8 02 00 00 00       	mov    $0x2,%eax
    3f78:	cd 40                	int    $0x40
    3f7a:	c3                   	ret    

00003f7b <wait>:
SYSCALL(wait)
    3f7b:	b8 03 00 00 00       	mov    $0x3,%eax
    3f80:	cd 40                	int    $0x40
    3f82:	c3                   	ret    

00003f83 <pipe>:
SYSCALL(pipe)
    3f83:	b8 04 00 00 00       	mov    $0x4,%eax
    3f88:	cd 40                	int    $0x40
    3f8a:	c3                   	ret    

00003f8b <read>:
SYSCALL(read)
    3f8b:	b8 05 00 00 00       	mov    $0x5,%eax
    3f90:	cd 40                	int    $0x40
    3f92:	c3                   	ret    

00003f93 <write>:
SYSCALL(write)
    3f93:	b8 10 00 00 00       	mov    $0x10,%eax
    3f98:	cd 40                	int    $0x40
    3f9a:	c3                   	ret    

00003f9b <close>:
SYSCALL(close)
    3f9b:	b8 15 00 00 00       	mov    $0x15,%eax
    3fa0:	cd 40                	int    $0x40
    3fa2:	c3                   	ret    

00003fa3 <kill>:
SYSCALL(kill)
    3fa3:	b8 06 00 00 00       	mov    $0x6,%eax
    3fa8:	cd 40                	int    $0x40
    3faa:	c3                   	ret    

00003fab <exec>:
SYSCALL(exec)
    3fab:	b8 07 00 00 00       	mov    $0x7,%eax
    3fb0:	cd 40                	int    $0x40
    3fb2:	c3                   	ret    

00003fb3 <open>:
SYSCALL(open)
    3fb3:	b8 0f 00 00 00       	mov    $0xf,%eax
    3fb8:	cd 40                	int    $0x40
    3fba:	c3                   	ret    

00003fbb <mknod>:
SYSCALL(mknod)
    3fbb:	b8 11 00 00 00       	mov    $0x11,%eax
    3fc0:	cd 40                	int    $0x40
    3fc2:	c3                   	ret    

00003fc3 <unlink>:
SYSCALL(unlink)
    3fc3:	b8 12 00 00 00       	mov    $0x12,%eax
    3fc8:	cd 40                	int    $0x40
    3fca:	c3                   	ret    

00003fcb <fstat>:
SYSCALL(fstat)
    3fcb:	b8 08 00 00 00       	mov    $0x8,%eax
    3fd0:	cd 40                	int    $0x40
    3fd2:	c3                   	ret    

00003fd3 <link>:
SYSCALL(link)
    3fd3:	b8 13 00 00 00       	mov    $0x13,%eax
    3fd8:	cd 40                	int    $0x40
    3fda:	c3                   	ret    

00003fdb <mkdir>:
SYSCALL(mkdir)
    3fdb:	b8 14 00 00 00       	mov    $0x14,%eax
    3fe0:	cd 40                	int    $0x40
    3fe2:	c3                   	ret    

00003fe3 <chdir>:
SYSCALL(chdir)
    3fe3:	b8 09 00 00 00       	mov    $0x9,%eax
    3fe8:	cd 40                	int    $0x40
    3fea:	c3                   	ret    

00003feb <dup>:
SYSCALL(dup)
    3feb:	b8 0a 00 00 00       	mov    $0xa,%eax
    3ff0:	cd 40                	int    $0x40
    3ff2:	c3                   	ret    

00003ff3 <getpid>:
SYSCALL(getpid)
    3ff3:	b8 0b 00 00 00       	mov    $0xb,%eax
    3ff8:	cd 40                	int    $0x40
    3ffa:	c3                   	ret    

00003ffb <sbrk>:
SYSCALL(sbrk)
    3ffb:	b8 0c 00 00 00       	mov    $0xc,%eax
    4000:	cd 40                	int    $0x40
    4002:	c3                   	ret    

00004003 <sleep>:
SYSCALL(sleep)
    4003:	b8 0d 00 00 00       	mov    $0xd,%eax
    4008:	cd 40                	int    $0x40
    400a:	c3                   	ret    

0000400b <uptime>:
SYSCALL(uptime)
    400b:	b8 0e 00 00 00       	mov    $0xe,%eax
    4010:	cd 40                	int    $0x40
    4012:	c3                   	ret    

00004013 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    4013:	55                   	push   %ebp
    4014:	89 e5                	mov    %esp,%ebp
    4016:	83 ec 18             	sub    $0x18,%esp
    4019:	8b 45 0c             	mov    0xc(%ebp),%eax
    401c:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    401f:	83 ec 04             	sub    $0x4,%esp
    4022:	6a 01                	push   $0x1
    4024:	8d 45 f4             	lea    -0xc(%ebp),%eax
    4027:	50                   	push   %eax
    4028:	ff 75 08             	pushl  0x8(%ebp)
    402b:	e8 63 ff ff ff       	call   3f93 <write>
    4030:	83 c4 10             	add    $0x10,%esp
}
    4033:	90                   	nop
    4034:	c9                   	leave  
    4035:	c3                   	ret    

00004036 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    4036:	55                   	push   %ebp
    4037:	89 e5                	mov    %esp,%ebp
    4039:	53                   	push   %ebx
    403a:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    403d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    4044:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    4048:	74 17                	je     4061 <printint+0x2b>
    404a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    404e:	79 11                	jns    4061 <printint+0x2b>
    neg = 1;
    4050:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    4057:	8b 45 0c             	mov    0xc(%ebp),%eax
    405a:	f7 d8                	neg    %eax
    405c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    405f:	eb 06                	jmp    4067 <printint+0x31>
  } else {
    x = xx;
    4061:	8b 45 0c             	mov    0xc(%ebp),%eax
    4064:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    4067:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    406e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    4071:	8d 41 01             	lea    0x1(%ecx),%eax
    4074:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4077:	8b 5d 10             	mov    0x10(%ebp),%ebx
    407a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    407d:	ba 00 00 00 00       	mov    $0x0,%edx
    4082:	f7 f3                	div    %ebx
    4084:	89 d0                	mov    %edx,%eax
    4086:	0f b6 80 64 63 00 00 	movzbl 0x6364(%eax),%eax
    408d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    4091:	8b 5d 10             	mov    0x10(%ebp),%ebx
    4094:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4097:	ba 00 00 00 00       	mov    $0x0,%edx
    409c:	f7 f3                	div    %ebx
    409e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    40a1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    40a5:	75 c7                	jne    406e <printint+0x38>
  if(neg)
    40a7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    40ab:	74 2d                	je     40da <printint+0xa4>
    buf[i++] = '-';
    40ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40b0:	8d 50 01             	lea    0x1(%eax),%edx
    40b3:	89 55 f4             	mov    %edx,-0xc(%ebp)
    40b6:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    40bb:	eb 1d                	jmp    40da <printint+0xa4>
    putc(fd, buf[i]);
    40bd:	8d 55 dc             	lea    -0x24(%ebp),%edx
    40c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40c3:	01 d0                	add    %edx,%eax
    40c5:	0f b6 00             	movzbl (%eax),%eax
    40c8:	0f be c0             	movsbl %al,%eax
    40cb:	83 ec 08             	sub    $0x8,%esp
    40ce:	50                   	push   %eax
    40cf:	ff 75 08             	pushl  0x8(%ebp)
    40d2:	e8 3c ff ff ff       	call   4013 <putc>
    40d7:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    40da:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    40de:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    40e2:	79 d9                	jns    40bd <printint+0x87>
    putc(fd, buf[i]);
}
    40e4:	90                   	nop
    40e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    40e8:	c9                   	leave  
    40e9:	c3                   	ret    

000040ea <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    40ea:	55                   	push   %ebp
    40eb:	89 e5                	mov    %esp,%ebp
    40ed:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    40f0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    40f7:	8d 45 0c             	lea    0xc(%ebp),%eax
    40fa:	83 c0 04             	add    $0x4,%eax
    40fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    4100:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4107:	e9 59 01 00 00       	jmp    4265 <printf+0x17b>
    c = fmt[i] & 0xff;
    410c:	8b 55 0c             	mov    0xc(%ebp),%edx
    410f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4112:	01 d0                	add    %edx,%eax
    4114:	0f b6 00             	movzbl (%eax),%eax
    4117:	0f be c0             	movsbl %al,%eax
    411a:	25 ff 00 00 00       	and    $0xff,%eax
    411f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    4122:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4126:	75 2c                	jne    4154 <printf+0x6a>
      if(c == '%'){
    4128:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    412c:	75 0c                	jne    413a <printf+0x50>
        state = '%';
    412e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    4135:	e9 27 01 00 00       	jmp    4261 <printf+0x177>
      } else {
        putc(fd, c);
    413a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    413d:	0f be c0             	movsbl %al,%eax
    4140:	83 ec 08             	sub    $0x8,%esp
    4143:	50                   	push   %eax
    4144:	ff 75 08             	pushl  0x8(%ebp)
    4147:	e8 c7 fe ff ff       	call   4013 <putc>
    414c:	83 c4 10             	add    $0x10,%esp
    414f:	e9 0d 01 00 00       	jmp    4261 <printf+0x177>
      }
    } else if(state == '%'){
    4154:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    4158:	0f 85 03 01 00 00    	jne    4261 <printf+0x177>
      if(c == 'd'){
    415e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    4162:	75 1e                	jne    4182 <printf+0x98>
        printint(fd, *ap, 10, 1);
    4164:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4167:	8b 00                	mov    (%eax),%eax
    4169:	6a 01                	push   $0x1
    416b:	6a 0a                	push   $0xa
    416d:	50                   	push   %eax
    416e:	ff 75 08             	pushl  0x8(%ebp)
    4171:	e8 c0 fe ff ff       	call   4036 <printint>
    4176:	83 c4 10             	add    $0x10,%esp
        ap++;
    4179:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    417d:	e9 d8 00 00 00       	jmp    425a <printf+0x170>
      } else if(c == 'x' || c == 'p'){
    4182:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    4186:	74 06                	je     418e <printf+0xa4>
    4188:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    418c:	75 1e                	jne    41ac <printf+0xc2>
        printint(fd, *ap, 16, 0);
    418e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4191:	8b 00                	mov    (%eax),%eax
    4193:	6a 00                	push   $0x0
    4195:	6a 10                	push   $0x10
    4197:	50                   	push   %eax
    4198:	ff 75 08             	pushl  0x8(%ebp)
    419b:	e8 96 fe ff ff       	call   4036 <printint>
    41a0:	83 c4 10             	add    $0x10,%esp
        ap++;
    41a3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    41a7:	e9 ae 00 00 00       	jmp    425a <printf+0x170>
      } else if(c == 's'){
    41ac:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    41b0:	75 43                	jne    41f5 <printf+0x10b>
        s = (char*)*ap;
    41b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    41b5:	8b 00                	mov    (%eax),%eax
    41b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    41ba:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    41be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    41c2:	75 25                	jne    41e9 <printf+0xff>
          s = "(null)";
    41c4:	c7 45 f4 6a 5c 00 00 	movl   $0x5c6a,-0xc(%ebp)
        while(*s != 0){
    41cb:	eb 1c                	jmp    41e9 <printf+0xff>
          putc(fd, *s);
    41cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41d0:	0f b6 00             	movzbl (%eax),%eax
    41d3:	0f be c0             	movsbl %al,%eax
    41d6:	83 ec 08             	sub    $0x8,%esp
    41d9:	50                   	push   %eax
    41da:	ff 75 08             	pushl  0x8(%ebp)
    41dd:	e8 31 fe ff ff       	call   4013 <putc>
    41e2:	83 c4 10             	add    $0x10,%esp
          s++;
    41e5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    41e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41ec:	0f b6 00             	movzbl (%eax),%eax
    41ef:	84 c0                	test   %al,%al
    41f1:	75 da                	jne    41cd <printf+0xe3>
    41f3:	eb 65                	jmp    425a <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    41f5:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    41f9:	75 1d                	jne    4218 <printf+0x12e>
        putc(fd, *ap);
    41fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    41fe:	8b 00                	mov    (%eax),%eax
    4200:	0f be c0             	movsbl %al,%eax
    4203:	83 ec 08             	sub    $0x8,%esp
    4206:	50                   	push   %eax
    4207:	ff 75 08             	pushl  0x8(%ebp)
    420a:	e8 04 fe ff ff       	call   4013 <putc>
    420f:	83 c4 10             	add    $0x10,%esp
        ap++;
    4212:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4216:	eb 42                	jmp    425a <printf+0x170>
      } else if(c == '%'){
    4218:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    421c:	75 17                	jne    4235 <printf+0x14b>
        putc(fd, c);
    421e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4221:	0f be c0             	movsbl %al,%eax
    4224:	83 ec 08             	sub    $0x8,%esp
    4227:	50                   	push   %eax
    4228:	ff 75 08             	pushl  0x8(%ebp)
    422b:	e8 e3 fd ff ff       	call   4013 <putc>
    4230:	83 c4 10             	add    $0x10,%esp
    4233:	eb 25                	jmp    425a <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    4235:	83 ec 08             	sub    $0x8,%esp
    4238:	6a 25                	push   $0x25
    423a:	ff 75 08             	pushl  0x8(%ebp)
    423d:	e8 d1 fd ff ff       	call   4013 <putc>
    4242:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    4245:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4248:	0f be c0             	movsbl %al,%eax
    424b:	83 ec 08             	sub    $0x8,%esp
    424e:	50                   	push   %eax
    424f:	ff 75 08             	pushl  0x8(%ebp)
    4252:	e8 bc fd ff ff       	call   4013 <putc>
    4257:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    425a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4261:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4265:	8b 55 0c             	mov    0xc(%ebp),%edx
    4268:	8b 45 f0             	mov    -0x10(%ebp),%eax
    426b:	01 d0                	add    %edx,%eax
    426d:	0f b6 00             	movzbl (%eax),%eax
    4270:	84 c0                	test   %al,%al
    4272:	0f 85 94 fe ff ff    	jne    410c <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    4278:	90                   	nop
    4279:	c9                   	leave  
    427a:	c3                   	ret    

0000427b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    427b:	55                   	push   %ebp
    427c:	89 e5                	mov    %esp,%ebp
    427e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4281:	8b 45 08             	mov    0x8(%ebp),%eax
    4284:	83 e8 08             	sub    $0x8,%eax
    4287:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    428a:	a1 08 64 00 00       	mov    0x6408,%eax
    428f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4292:	eb 24                	jmp    42b8 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4294:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4297:	8b 00                	mov    (%eax),%eax
    4299:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    429c:	77 12                	ja     42b0 <free+0x35>
    429e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42a1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    42a4:	77 24                	ja     42ca <free+0x4f>
    42a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42a9:	8b 00                	mov    (%eax),%eax
    42ab:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    42ae:	77 1a                	ja     42ca <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    42b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42b3:	8b 00                	mov    (%eax),%eax
    42b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
    42b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42bb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    42be:	76 d4                	jbe    4294 <free+0x19>
    42c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42c3:	8b 00                	mov    (%eax),%eax
    42c5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    42c8:	76 ca                	jbe    4294 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    42ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42cd:	8b 40 04             	mov    0x4(%eax),%eax
    42d0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    42d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42da:	01 c2                	add    %eax,%edx
    42dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42df:	8b 00                	mov    (%eax),%eax
    42e1:	39 c2                	cmp    %eax,%edx
    42e3:	75 24                	jne    4309 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    42e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42e8:	8b 50 04             	mov    0x4(%eax),%edx
    42eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42ee:	8b 00                	mov    (%eax),%eax
    42f0:	8b 40 04             	mov    0x4(%eax),%eax
    42f3:	01 c2                	add    %eax,%edx
    42f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42f8:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    42fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42fe:	8b 00                	mov    (%eax),%eax
    4300:	8b 10                	mov    (%eax),%edx
    4302:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4305:	89 10                	mov    %edx,(%eax)
    4307:	eb 0a                	jmp    4313 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    4309:	8b 45 fc             	mov    -0x4(%ebp),%eax
    430c:	8b 10                	mov    (%eax),%edx
    430e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4311:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    4313:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4316:	8b 40 04             	mov    0x4(%eax),%eax
    4319:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4320:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4323:	01 d0                	add    %edx,%eax
    4325:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4328:	75 20                	jne    434a <free+0xcf>
    p->s.size += bp->s.size;
    432a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    432d:	8b 50 04             	mov    0x4(%eax),%edx
    4330:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4333:	8b 40 04             	mov    0x4(%eax),%eax
    4336:	01 c2                	add    %eax,%edx
    4338:	8b 45 fc             	mov    -0x4(%ebp),%eax
    433b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    433e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4341:	8b 10                	mov    (%eax),%edx
    4343:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4346:	89 10                	mov    %edx,(%eax)
    4348:	eb 08                	jmp    4352 <free+0xd7>
  } else
    p->s.ptr = bp;
    434a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    434d:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4350:	89 10                	mov    %edx,(%eax)
  freep = p;
    4352:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4355:	a3 08 64 00 00       	mov    %eax,0x6408
}
    435a:	90                   	nop
    435b:	c9                   	leave  
    435c:	c3                   	ret    

0000435d <morecore>:

static Header*
morecore(uint nu)
{
    435d:	55                   	push   %ebp
    435e:	89 e5                	mov    %esp,%ebp
    4360:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    4363:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    436a:	77 07                	ja     4373 <morecore+0x16>
    nu = 4096;
    436c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    4373:	8b 45 08             	mov    0x8(%ebp),%eax
    4376:	c1 e0 03             	shl    $0x3,%eax
    4379:	83 ec 0c             	sub    $0xc,%esp
    437c:	50                   	push   %eax
    437d:	e8 79 fc ff ff       	call   3ffb <sbrk>
    4382:	83 c4 10             	add    $0x10,%esp
    4385:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    4388:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    438c:	75 07                	jne    4395 <morecore+0x38>
    return 0;
    438e:	b8 00 00 00 00       	mov    $0x0,%eax
    4393:	eb 26                	jmp    43bb <morecore+0x5e>
  hp = (Header*)p;
    4395:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4398:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    439b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    439e:	8b 55 08             	mov    0x8(%ebp),%edx
    43a1:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    43a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    43a7:	83 c0 08             	add    $0x8,%eax
    43aa:	83 ec 0c             	sub    $0xc,%esp
    43ad:	50                   	push   %eax
    43ae:	e8 c8 fe ff ff       	call   427b <free>
    43b3:	83 c4 10             	add    $0x10,%esp
  return freep;
    43b6:	a1 08 64 00 00       	mov    0x6408,%eax
}
    43bb:	c9                   	leave  
    43bc:	c3                   	ret    

000043bd <malloc>:

void*
malloc(uint nbytes)
{
    43bd:	55                   	push   %ebp
    43be:	89 e5                	mov    %esp,%ebp
    43c0:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    43c3:	8b 45 08             	mov    0x8(%ebp),%eax
    43c6:	83 c0 07             	add    $0x7,%eax
    43c9:	c1 e8 03             	shr    $0x3,%eax
    43cc:	83 c0 01             	add    $0x1,%eax
    43cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    43d2:	a1 08 64 00 00       	mov    0x6408,%eax
    43d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    43da:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    43de:	75 23                	jne    4403 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    43e0:	c7 45 f0 00 64 00 00 	movl   $0x6400,-0x10(%ebp)
    43e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    43ea:	a3 08 64 00 00       	mov    %eax,0x6408
    43ef:	a1 08 64 00 00       	mov    0x6408,%eax
    43f4:	a3 00 64 00 00       	mov    %eax,0x6400
    base.s.size = 0;
    43f9:	c7 05 04 64 00 00 00 	movl   $0x0,0x6404
    4400:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4403:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4406:	8b 00                	mov    (%eax),%eax
    4408:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    440b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    440e:	8b 40 04             	mov    0x4(%eax),%eax
    4411:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4414:	72 4d                	jb     4463 <malloc+0xa6>
      if(p->s.size == nunits)
    4416:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4419:	8b 40 04             	mov    0x4(%eax),%eax
    441c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    441f:	75 0c                	jne    442d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    4421:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4424:	8b 10                	mov    (%eax),%edx
    4426:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4429:	89 10                	mov    %edx,(%eax)
    442b:	eb 26                	jmp    4453 <malloc+0x96>
      else {
        p->s.size -= nunits;
    442d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4430:	8b 40 04             	mov    0x4(%eax),%eax
    4433:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4436:	89 c2                	mov    %eax,%edx
    4438:	8b 45 f4             	mov    -0xc(%ebp),%eax
    443b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    443e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4441:	8b 40 04             	mov    0x4(%eax),%eax
    4444:	c1 e0 03             	shl    $0x3,%eax
    4447:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    444a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    444d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4450:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    4453:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4456:	a3 08 64 00 00       	mov    %eax,0x6408
      return (void*)(p + 1);
    445b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    445e:	83 c0 08             	add    $0x8,%eax
    4461:	eb 3b                	jmp    449e <malloc+0xe1>
    }
    if(p == freep)
    4463:	a1 08 64 00 00       	mov    0x6408,%eax
    4468:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    446b:	75 1e                	jne    448b <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    446d:	83 ec 0c             	sub    $0xc,%esp
    4470:	ff 75 ec             	pushl  -0x14(%ebp)
    4473:	e8 e5 fe ff ff       	call   435d <morecore>
    4478:	83 c4 10             	add    $0x10,%esp
    447b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    447e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4482:	75 07                	jne    448b <malloc+0xce>
        return 0;
    4484:	b8 00 00 00 00       	mov    $0x0,%eax
    4489:	eb 13                	jmp    449e <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    448b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    448e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4491:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4494:	8b 00                	mov    (%eax),%eax
    4496:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    4499:	e9 6d ff ff ff       	jmp    440b <malloc+0x4e>
}
    449e:	c9                   	leave  
    449f:	c3                   	ret    
