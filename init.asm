
_init: formato do arquivo elf32-i386


Desmontagem da seção .text:

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
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  11:	83 ec 08             	sub    $0x8,%esp
  14:	6a 02                	push   $0x2
  16:	68 90 08 00 00       	push   $0x890
  1b:	e8 80 03 00 00       	call   3a0 <open>
  20:	83 c4 10             	add    $0x10,%esp
  23:	85 c0                	test   %eax,%eax
  25:	79 26                	jns    4d <main+0x4d>
    mknod("console", 1, 1);
  27:	83 ec 04             	sub    $0x4,%esp
  2a:	6a 01                	push   $0x1
  2c:	6a 01                	push   $0x1
  2e:	68 90 08 00 00       	push   $0x890
  33:	e8 70 03 00 00       	call   3a8 <mknod>
  38:	83 c4 10             	add    $0x10,%esp
    open("console", O_RDWR);
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	6a 02                	push   $0x2
  40:	68 90 08 00 00       	push   $0x890
  45:	e8 56 03 00 00       	call   3a0 <open>
  4a:	83 c4 10             	add    $0x10,%esp
  }
  dup(0);  // stdout
  4d:	83 ec 0c             	sub    $0xc,%esp
  50:	6a 00                	push   $0x0
  52:	e8 81 03 00 00       	call   3d8 <dup>
  57:	83 c4 10             	add    $0x10,%esp
  dup(0);  // stderr
  5a:	83 ec 0c             	sub    $0xc,%esp
  5d:	6a 00                	push   $0x0
  5f:	e8 74 03 00 00       	call   3d8 <dup>
  64:	83 c4 10             	add    $0x10,%esp

  for(;;){
    printf(1, "init: starting sh\n");
  67:	83 ec 08             	sub    $0x8,%esp
  6a:	68 98 08 00 00       	push   $0x898
  6f:	6a 01                	push   $0x1
  71:	e8 61 04 00 00       	call   4d7 <printf>
  76:	83 c4 10             	add    $0x10,%esp
    pid = fork(0);
  79:	83 ec 0c             	sub    $0xc,%esp
  7c:	6a 00                	push   $0x0
  7e:	e8 d5 02 00 00       	call   358 <fork>
  83:	83 c4 10             	add    $0x10,%esp
  86:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(pid < 0){
  89:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  8d:	79 17                	jns    a6 <main+0xa6>
      printf(1, "init: fork failed\n");
  8f:	83 ec 08             	sub    $0x8,%esp
  92:	68 ab 08 00 00       	push   $0x8ab
  97:	6a 01                	push   $0x1
  99:	e8 39 04 00 00       	call   4d7 <printf>
  9e:	83 c4 10             	add    $0x10,%esp
      exit();
  a1:	e8 ba 02 00 00       	call   360 <exit>
    }
    if(pid == 0){
  a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  aa:	75 3e                	jne    ea <main+0xea>
      exec("sh", argv);
  ac:	83 ec 08             	sub    $0x8,%esp
  af:	68 2c 0b 00 00       	push   $0xb2c
  b4:	68 8d 08 00 00       	push   $0x88d
  b9:	e8 da 02 00 00       	call   398 <exec>
  be:	83 c4 10             	add    $0x10,%esp
      printf(1, "init: exec sh failed\n");
  c1:	83 ec 08             	sub    $0x8,%esp
  c4:	68 be 08 00 00       	push   $0x8be
  c9:	6a 01                	push   $0x1
  cb:	e8 07 04 00 00       	call   4d7 <printf>
  d0:	83 c4 10             	add    $0x10,%esp
      exit();
  d3:	e8 88 02 00 00       	call   360 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  d8:	83 ec 08             	sub    $0x8,%esp
  db:	68 d4 08 00 00       	push   $0x8d4
  e0:	6a 01                	push   $0x1
  e2:	e8 f0 03 00 00       	call   4d7 <printf>
  e7:	83 c4 10             	add    $0x10,%esp
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  ea:	e8 79 02 00 00       	call   368 <wait>
  ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
  f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  f6:	0f 88 6b ff ff ff    	js     67 <main+0x67>
  fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  ff:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 102:	75 d4                	jne    d8 <main+0xd8>
      printf(1, "zombie!\n");
  }
 104:	e9 5e ff ff ff       	jmp    67 <main+0x67>

00000109 <stosb>:
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	57                   	push   %edi
 10d:	53                   	push   %ebx
 10e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 111:	8b 55 10             	mov    0x10(%ebp),%edx
 114:	8b 45 0c             	mov    0xc(%ebp),%eax
 117:	89 cb                	mov    %ecx,%ebx
 119:	89 df                	mov    %ebx,%edi
 11b:	89 d1                	mov    %edx,%ecx
 11d:	fc                   	cld    
 11e:	f3 aa                	rep stos %al,%es:(%edi)
 120:	89 ca                	mov    %ecx,%edx
 122:	89 fb                	mov    %edi,%ebx
 124:	89 5d 08             	mov    %ebx,0x8(%ebp)
 127:	89 55 10             	mov    %edx,0x10(%ebp)
 12a:	90                   	nop
 12b:	5b                   	pop    %ebx
 12c:	5f                   	pop    %edi
 12d:	5d                   	pop    %ebp
 12e:	c3                   	ret    

0000012f <strcpy>:
 12f:	55                   	push   %ebp
 130:	89 e5                	mov    %esp,%ebp
 132:	83 ec 10             	sub    $0x10,%esp
 135:	8b 45 08             	mov    0x8(%ebp),%eax
 138:	89 45 fc             	mov    %eax,-0x4(%ebp)
 13b:	90                   	nop
 13c:	8b 45 08             	mov    0x8(%ebp),%eax
 13f:	8d 50 01             	lea    0x1(%eax),%edx
 142:	89 55 08             	mov    %edx,0x8(%ebp)
 145:	8b 55 0c             	mov    0xc(%ebp),%edx
 148:	8d 4a 01             	lea    0x1(%edx),%ecx
 14b:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 14e:	0f b6 12             	movzbl (%edx),%edx
 151:	88 10                	mov    %dl,(%eax)
 153:	0f b6 00             	movzbl (%eax),%eax
 156:	84 c0                	test   %al,%al
 158:	75 e2                	jne    13c <strcpy+0xd>
 15a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 15d:	c9                   	leave  
 15e:	c3                   	ret    

0000015f <strcmp>:
 15f:	55                   	push   %ebp
 160:	89 e5                	mov    %esp,%ebp
 162:	eb 08                	jmp    16c <strcmp+0xd>
 164:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 168:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	0f b6 00             	movzbl (%eax),%eax
 172:	84 c0                	test   %al,%al
 174:	74 10                	je     186 <strcmp+0x27>
 176:	8b 45 08             	mov    0x8(%ebp),%eax
 179:	0f b6 10             	movzbl (%eax),%edx
 17c:	8b 45 0c             	mov    0xc(%ebp),%eax
 17f:	0f b6 00             	movzbl (%eax),%eax
 182:	38 c2                	cmp    %al,%dl
 184:	74 de                	je     164 <strcmp+0x5>
 186:	8b 45 08             	mov    0x8(%ebp),%eax
 189:	0f b6 00             	movzbl (%eax),%eax
 18c:	0f b6 d0             	movzbl %al,%edx
 18f:	8b 45 0c             	mov    0xc(%ebp),%eax
 192:	0f b6 00             	movzbl (%eax),%eax
 195:	0f b6 c0             	movzbl %al,%eax
 198:	29 c2                	sub    %eax,%edx
 19a:	89 d0                	mov    %edx,%eax
 19c:	5d                   	pop    %ebp
 19d:	c3                   	ret    

0000019e <strlen>:
 19e:	55                   	push   %ebp
 19f:	89 e5                	mov    %esp,%ebp
 1a1:	83 ec 10             	sub    $0x10,%esp
 1a4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1ab:	eb 04                	jmp    1b1 <strlen+0x13>
 1ad:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1b4:	8b 45 08             	mov    0x8(%ebp),%eax
 1b7:	01 d0                	add    %edx,%eax
 1b9:	0f b6 00             	movzbl (%eax),%eax
 1bc:	84 c0                	test   %al,%al
 1be:	75 ed                	jne    1ad <strlen+0xf>
 1c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 1c3:	c9                   	leave  
 1c4:	c3                   	ret    

000001c5 <memset>:
 1c5:	55                   	push   %ebp
 1c6:	89 e5                	mov    %esp,%ebp
 1c8:	8b 45 10             	mov    0x10(%ebp),%eax
 1cb:	50                   	push   %eax
 1cc:	ff 75 0c             	pushl  0xc(%ebp)
 1cf:	ff 75 08             	pushl  0x8(%ebp)
 1d2:	e8 32 ff ff ff       	call   109 <stosb>
 1d7:	83 c4 0c             	add    $0xc,%esp
 1da:	8b 45 08             	mov    0x8(%ebp),%eax
 1dd:	c9                   	leave  
 1de:	c3                   	ret    

000001df <strchr>:
 1df:	55                   	push   %ebp
 1e0:	89 e5                	mov    %esp,%ebp
 1e2:	83 ec 04             	sub    $0x4,%esp
 1e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e8:	88 45 fc             	mov    %al,-0x4(%ebp)
 1eb:	eb 14                	jmp    201 <strchr+0x22>
 1ed:	8b 45 08             	mov    0x8(%ebp),%eax
 1f0:	0f b6 00             	movzbl (%eax),%eax
 1f3:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1f6:	75 05                	jne    1fd <strchr+0x1e>
 1f8:	8b 45 08             	mov    0x8(%ebp),%eax
 1fb:	eb 13                	jmp    210 <strchr+0x31>
 1fd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 201:	8b 45 08             	mov    0x8(%ebp),%eax
 204:	0f b6 00             	movzbl (%eax),%eax
 207:	84 c0                	test   %al,%al
 209:	75 e2                	jne    1ed <strchr+0xe>
 20b:	b8 00 00 00 00       	mov    $0x0,%eax
 210:	c9                   	leave  
 211:	c3                   	ret    

00000212 <gets>:
 212:	55                   	push   %ebp
 213:	89 e5                	mov    %esp,%ebp
 215:	83 ec 18             	sub    $0x18,%esp
 218:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 21f:	eb 42                	jmp    263 <gets+0x51>
 221:	83 ec 04             	sub    $0x4,%esp
 224:	6a 01                	push   $0x1
 226:	8d 45 ef             	lea    -0x11(%ebp),%eax
 229:	50                   	push   %eax
 22a:	6a 00                	push   $0x0
 22c:	e8 47 01 00 00       	call   378 <read>
 231:	83 c4 10             	add    $0x10,%esp
 234:	89 45 f0             	mov    %eax,-0x10(%ebp)
 237:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 23b:	7e 33                	jle    270 <gets+0x5e>
 23d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 240:	8d 50 01             	lea    0x1(%eax),%edx
 243:	89 55 f4             	mov    %edx,-0xc(%ebp)
 246:	89 c2                	mov    %eax,%edx
 248:	8b 45 08             	mov    0x8(%ebp),%eax
 24b:	01 c2                	add    %eax,%edx
 24d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 251:	88 02                	mov    %al,(%edx)
 253:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 257:	3c 0a                	cmp    $0xa,%al
 259:	74 16                	je     271 <gets+0x5f>
 25b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 25f:	3c 0d                	cmp    $0xd,%al
 261:	74 0e                	je     271 <gets+0x5f>
 263:	8b 45 f4             	mov    -0xc(%ebp),%eax
 266:	83 c0 01             	add    $0x1,%eax
 269:	3b 45 0c             	cmp    0xc(%ebp),%eax
 26c:	7c b3                	jl     221 <gets+0xf>
 26e:	eb 01                	jmp    271 <gets+0x5f>
 270:	90                   	nop
 271:	8b 55 f4             	mov    -0xc(%ebp),%edx
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	01 d0                	add    %edx,%eax
 279:	c6 00 00             	movb   $0x0,(%eax)
 27c:	8b 45 08             	mov    0x8(%ebp),%eax
 27f:	c9                   	leave  
 280:	c3                   	ret    

00000281 <stat>:
 281:	55                   	push   %ebp
 282:	89 e5                	mov    %esp,%ebp
 284:	83 ec 18             	sub    $0x18,%esp
 287:	83 ec 08             	sub    $0x8,%esp
 28a:	6a 00                	push   $0x0
 28c:	ff 75 08             	pushl  0x8(%ebp)
 28f:	e8 0c 01 00 00       	call   3a0 <open>
 294:	83 c4 10             	add    $0x10,%esp
 297:	89 45 f4             	mov    %eax,-0xc(%ebp)
 29a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 29e:	79 07                	jns    2a7 <stat+0x26>
 2a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2a5:	eb 25                	jmp    2cc <stat+0x4b>
 2a7:	83 ec 08             	sub    $0x8,%esp
 2aa:	ff 75 0c             	pushl  0xc(%ebp)
 2ad:	ff 75 f4             	pushl  -0xc(%ebp)
 2b0:	e8 03 01 00 00       	call   3b8 <fstat>
 2b5:	83 c4 10             	add    $0x10,%esp
 2b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 2bb:	83 ec 0c             	sub    $0xc,%esp
 2be:	ff 75 f4             	pushl  -0xc(%ebp)
 2c1:	e8 c2 00 00 00       	call   388 <close>
 2c6:	83 c4 10             	add    $0x10,%esp
 2c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2cc:	c9                   	leave  
 2cd:	c3                   	ret    

000002ce <atoi>:
 2ce:	55                   	push   %ebp
 2cf:	89 e5                	mov    %esp,%ebp
 2d1:	83 ec 10             	sub    $0x10,%esp
 2d4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2db:	eb 25                	jmp    302 <atoi+0x34>
 2dd:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2e0:	89 d0                	mov    %edx,%eax
 2e2:	c1 e0 02             	shl    $0x2,%eax
 2e5:	01 d0                	add    %edx,%eax
 2e7:	01 c0                	add    %eax,%eax
 2e9:	89 c1                	mov    %eax,%ecx
 2eb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ee:	8d 50 01             	lea    0x1(%eax),%edx
 2f1:	89 55 08             	mov    %edx,0x8(%ebp)
 2f4:	0f b6 00             	movzbl (%eax),%eax
 2f7:	0f be c0             	movsbl %al,%eax
 2fa:	01 c8                	add    %ecx,%eax
 2fc:	83 e8 30             	sub    $0x30,%eax
 2ff:	89 45 fc             	mov    %eax,-0x4(%ebp)
 302:	8b 45 08             	mov    0x8(%ebp),%eax
 305:	0f b6 00             	movzbl (%eax),%eax
 308:	3c 2f                	cmp    $0x2f,%al
 30a:	7e 0a                	jle    316 <atoi+0x48>
 30c:	8b 45 08             	mov    0x8(%ebp),%eax
 30f:	0f b6 00             	movzbl (%eax),%eax
 312:	3c 39                	cmp    $0x39,%al
 314:	7e c7                	jle    2dd <atoi+0xf>
 316:	8b 45 fc             	mov    -0x4(%ebp),%eax
 319:	c9                   	leave  
 31a:	c3                   	ret    

0000031b <memmove>:
 31b:	55                   	push   %ebp
 31c:	89 e5                	mov    %esp,%ebp
 31e:	83 ec 10             	sub    $0x10,%esp
 321:	8b 45 08             	mov    0x8(%ebp),%eax
 324:	89 45 fc             	mov    %eax,-0x4(%ebp)
 327:	8b 45 0c             	mov    0xc(%ebp),%eax
 32a:	89 45 f8             	mov    %eax,-0x8(%ebp)
 32d:	eb 17                	jmp    346 <memmove+0x2b>
 32f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 332:	8d 50 01             	lea    0x1(%eax),%edx
 335:	89 55 fc             	mov    %edx,-0x4(%ebp)
 338:	8b 55 f8             	mov    -0x8(%ebp),%edx
 33b:	8d 4a 01             	lea    0x1(%edx),%ecx
 33e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 341:	0f b6 12             	movzbl (%edx),%edx
 344:	88 10                	mov    %dl,(%eax)
 346:	8b 45 10             	mov    0x10(%ebp),%eax
 349:	8d 50 ff             	lea    -0x1(%eax),%edx
 34c:	89 55 10             	mov    %edx,0x10(%ebp)
 34f:	85 c0                	test   %eax,%eax
 351:	7f dc                	jg     32f <memmove+0x14>
 353:	8b 45 08             	mov    0x8(%ebp),%eax
 356:	c9                   	leave  
 357:	c3                   	ret    

00000358 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 358:	b8 01 00 00 00       	mov    $0x1,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <exit>:
SYSCALL(exit)
 360:	b8 02 00 00 00       	mov    $0x2,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <wait>:
SYSCALL(wait)
 368:	b8 03 00 00 00       	mov    $0x3,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <pipe>:
SYSCALL(pipe)
 370:	b8 04 00 00 00       	mov    $0x4,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <read>:
SYSCALL(read)
 378:	b8 05 00 00 00       	mov    $0x5,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <write>:
SYSCALL(write)
 380:	b8 10 00 00 00       	mov    $0x10,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <close>:
SYSCALL(close)
 388:	b8 15 00 00 00       	mov    $0x15,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <kill>:
SYSCALL(kill)
 390:	b8 06 00 00 00       	mov    $0x6,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <exec>:
SYSCALL(exec)
 398:	b8 07 00 00 00       	mov    $0x7,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <open>:
SYSCALL(open)
 3a0:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <mknod>:
SYSCALL(mknod)
 3a8:	b8 11 00 00 00       	mov    $0x11,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <unlink>:
SYSCALL(unlink)
 3b0:	b8 12 00 00 00       	mov    $0x12,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <fstat>:
SYSCALL(fstat)
 3b8:	b8 08 00 00 00       	mov    $0x8,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <link>:
SYSCALL(link)
 3c0:	b8 13 00 00 00       	mov    $0x13,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <mkdir>:
SYSCALL(mkdir)
 3c8:	b8 14 00 00 00       	mov    $0x14,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <chdir>:
SYSCALL(chdir)
 3d0:	b8 09 00 00 00       	mov    $0x9,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <dup>:
SYSCALL(dup)
 3d8:	b8 0a 00 00 00       	mov    $0xa,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <getpid>:
SYSCALL(getpid)
 3e0:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <sbrk>:
SYSCALL(sbrk)
 3e8:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <sleep>:
SYSCALL(sleep)
 3f0:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <uptime>:
SYSCALL(uptime)
 3f8:	b8 0e 00 00 00       	mov    $0xe,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	83 ec 18             	sub    $0x18,%esp
 406:	8b 45 0c             	mov    0xc(%ebp),%eax
 409:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 40c:	83 ec 04             	sub    $0x4,%esp
 40f:	6a 01                	push   $0x1
 411:	8d 45 f4             	lea    -0xc(%ebp),%eax
 414:	50                   	push   %eax
 415:	ff 75 08             	pushl  0x8(%ebp)
 418:	e8 63 ff ff ff       	call   380 <write>
 41d:	83 c4 10             	add    $0x10,%esp
}
 420:	90                   	nop
 421:	c9                   	leave  
 422:	c3                   	ret    

00000423 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 423:	55                   	push   %ebp
 424:	89 e5                	mov    %esp,%ebp
 426:	53                   	push   %ebx
 427:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 42a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 431:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 435:	74 17                	je     44e <printint+0x2b>
 437:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 43b:	79 11                	jns    44e <printint+0x2b>
    neg = 1;
 43d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 444:	8b 45 0c             	mov    0xc(%ebp),%eax
 447:	f7 d8                	neg    %eax
 449:	89 45 ec             	mov    %eax,-0x14(%ebp)
 44c:	eb 06                	jmp    454 <printint+0x31>
  } else {
    x = xx;
 44e:	8b 45 0c             	mov    0xc(%ebp),%eax
 451:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 454:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 45b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 45e:	8d 41 01             	lea    0x1(%ecx),%eax
 461:	89 45 f4             	mov    %eax,-0xc(%ebp)
 464:	8b 5d 10             	mov    0x10(%ebp),%ebx
 467:	8b 45 ec             	mov    -0x14(%ebp),%eax
 46a:	ba 00 00 00 00       	mov    $0x0,%edx
 46f:	f7 f3                	div    %ebx
 471:	89 d0                	mov    %edx,%eax
 473:	0f b6 80 34 0b 00 00 	movzbl 0xb34(%eax),%eax
 47a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 47e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 481:	8b 45 ec             	mov    -0x14(%ebp),%eax
 484:	ba 00 00 00 00       	mov    $0x0,%edx
 489:	f7 f3                	div    %ebx
 48b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 48e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 492:	75 c7                	jne    45b <printint+0x38>
  if(neg)
 494:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 498:	74 2d                	je     4c7 <printint+0xa4>
    buf[i++] = '-';
 49a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 49d:	8d 50 01             	lea    0x1(%eax),%edx
 4a0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4a3:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4a8:	eb 1d                	jmp    4c7 <printint+0xa4>
    putc(fd, buf[i]);
 4aa:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b0:	01 d0                	add    %edx,%eax
 4b2:	0f b6 00             	movzbl (%eax),%eax
 4b5:	0f be c0             	movsbl %al,%eax
 4b8:	83 ec 08             	sub    $0x8,%esp
 4bb:	50                   	push   %eax
 4bc:	ff 75 08             	pushl  0x8(%ebp)
 4bf:	e8 3c ff ff ff       	call   400 <putc>
 4c4:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4c7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4cf:	79 d9                	jns    4aa <printint+0x87>
    putc(fd, buf[i]);
}
 4d1:	90                   	nop
 4d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d5:	c9                   	leave  
 4d6:	c3                   	ret    

000004d7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4d7:	55                   	push   %ebp
 4d8:	89 e5                	mov    %esp,%ebp
 4da:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4dd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4e4:	8d 45 0c             	lea    0xc(%ebp),%eax
 4e7:	83 c0 04             	add    $0x4,%eax
 4ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4ed:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4f4:	e9 59 01 00 00       	jmp    652 <printf+0x17b>
    c = fmt[i] & 0xff;
 4f9:	8b 55 0c             	mov    0xc(%ebp),%edx
 4fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4ff:	01 d0                	add    %edx,%eax
 501:	0f b6 00             	movzbl (%eax),%eax
 504:	0f be c0             	movsbl %al,%eax
 507:	25 ff 00 00 00       	and    $0xff,%eax
 50c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 50f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 513:	75 2c                	jne    541 <printf+0x6a>
      if(c == '%'){
 515:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 519:	75 0c                	jne    527 <printf+0x50>
        state = '%';
 51b:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 522:	e9 27 01 00 00       	jmp    64e <printf+0x177>
      } else {
        putc(fd, c);
 527:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 52a:	0f be c0             	movsbl %al,%eax
 52d:	83 ec 08             	sub    $0x8,%esp
 530:	50                   	push   %eax
 531:	ff 75 08             	pushl  0x8(%ebp)
 534:	e8 c7 fe ff ff       	call   400 <putc>
 539:	83 c4 10             	add    $0x10,%esp
 53c:	e9 0d 01 00 00       	jmp    64e <printf+0x177>
      }
    } else if(state == '%'){
 541:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 545:	0f 85 03 01 00 00    	jne    64e <printf+0x177>
      if(c == 'd'){
 54b:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 54f:	75 1e                	jne    56f <printf+0x98>
        printint(fd, *ap, 10, 1);
 551:	8b 45 e8             	mov    -0x18(%ebp),%eax
 554:	8b 00                	mov    (%eax),%eax
 556:	6a 01                	push   $0x1
 558:	6a 0a                	push   $0xa
 55a:	50                   	push   %eax
 55b:	ff 75 08             	pushl  0x8(%ebp)
 55e:	e8 c0 fe ff ff       	call   423 <printint>
 563:	83 c4 10             	add    $0x10,%esp
        ap++;
 566:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 56a:	e9 d8 00 00 00       	jmp    647 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 56f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 573:	74 06                	je     57b <printf+0xa4>
 575:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 579:	75 1e                	jne    599 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 57b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 57e:	8b 00                	mov    (%eax),%eax
 580:	6a 00                	push   $0x0
 582:	6a 10                	push   $0x10
 584:	50                   	push   %eax
 585:	ff 75 08             	pushl  0x8(%ebp)
 588:	e8 96 fe ff ff       	call   423 <printint>
 58d:	83 c4 10             	add    $0x10,%esp
        ap++;
 590:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 594:	e9 ae 00 00 00       	jmp    647 <printf+0x170>
      } else if(c == 's'){
 599:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 59d:	75 43                	jne    5e2 <printf+0x10b>
        s = (char*)*ap;
 59f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a2:	8b 00                	mov    (%eax),%eax
 5a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5a7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5ab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5af:	75 25                	jne    5d6 <printf+0xff>
          s = "(null)";
 5b1:	c7 45 f4 dd 08 00 00 	movl   $0x8dd,-0xc(%ebp)
        while(*s != 0){
 5b8:	eb 1c                	jmp    5d6 <printf+0xff>
          putc(fd, *s);
 5ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5bd:	0f b6 00             	movzbl (%eax),%eax
 5c0:	0f be c0             	movsbl %al,%eax
 5c3:	83 ec 08             	sub    $0x8,%esp
 5c6:	50                   	push   %eax
 5c7:	ff 75 08             	pushl  0x8(%ebp)
 5ca:	e8 31 fe ff ff       	call   400 <putc>
 5cf:	83 c4 10             	add    $0x10,%esp
          s++;
 5d2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d9:	0f b6 00             	movzbl (%eax),%eax
 5dc:	84 c0                	test   %al,%al
 5de:	75 da                	jne    5ba <printf+0xe3>
 5e0:	eb 65                	jmp    647 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5e2:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5e6:	75 1d                	jne    605 <printf+0x12e>
        putc(fd, *ap);
 5e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5eb:	8b 00                	mov    (%eax),%eax
 5ed:	0f be c0             	movsbl %al,%eax
 5f0:	83 ec 08             	sub    $0x8,%esp
 5f3:	50                   	push   %eax
 5f4:	ff 75 08             	pushl  0x8(%ebp)
 5f7:	e8 04 fe ff ff       	call   400 <putc>
 5fc:	83 c4 10             	add    $0x10,%esp
        ap++;
 5ff:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 603:	eb 42                	jmp    647 <printf+0x170>
      } else if(c == '%'){
 605:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 609:	75 17                	jne    622 <printf+0x14b>
        putc(fd, c);
 60b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 60e:	0f be c0             	movsbl %al,%eax
 611:	83 ec 08             	sub    $0x8,%esp
 614:	50                   	push   %eax
 615:	ff 75 08             	pushl  0x8(%ebp)
 618:	e8 e3 fd ff ff       	call   400 <putc>
 61d:	83 c4 10             	add    $0x10,%esp
 620:	eb 25                	jmp    647 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 622:	83 ec 08             	sub    $0x8,%esp
 625:	6a 25                	push   $0x25
 627:	ff 75 08             	pushl  0x8(%ebp)
 62a:	e8 d1 fd ff ff       	call   400 <putc>
 62f:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 632:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 635:	0f be c0             	movsbl %al,%eax
 638:	83 ec 08             	sub    $0x8,%esp
 63b:	50                   	push   %eax
 63c:	ff 75 08             	pushl  0x8(%ebp)
 63f:	e8 bc fd ff ff       	call   400 <putc>
 644:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 647:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 64e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 652:	8b 55 0c             	mov    0xc(%ebp),%edx
 655:	8b 45 f0             	mov    -0x10(%ebp),%eax
 658:	01 d0                	add    %edx,%eax
 65a:	0f b6 00             	movzbl (%eax),%eax
 65d:	84 c0                	test   %al,%al
 65f:	0f 85 94 fe ff ff    	jne    4f9 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 665:	90                   	nop
 666:	c9                   	leave  
 667:	c3                   	ret    

00000668 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 668:	55                   	push   %ebp
 669:	89 e5                	mov    %esp,%ebp
 66b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 66e:	8b 45 08             	mov    0x8(%ebp),%eax
 671:	83 e8 08             	sub    $0x8,%eax
 674:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 677:	a1 50 0b 00 00       	mov    0xb50,%eax
 67c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 67f:	eb 24                	jmp    6a5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 681:	8b 45 fc             	mov    -0x4(%ebp),%eax
 684:	8b 00                	mov    (%eax),%eax
 686:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 689:	77 12                	ja     69d <free+0x35>
 68b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 691:	77 24                	ja     6b7 <free+0x4f>
 693:	8b 45 fc             	mov    -0x4(%ebp),%eax
 696:	8b 00                	mov    (%eax),%eax
 698:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 69b:	77 1a                	ja     6b7 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 69d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a0:	8b 00                	mov    (%eax),%eax
 6a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ab:	76 d4                	jbe    681 <free+0x19>
 6ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b0:	8b 00                	mov    (%eax),%eax
 6b2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6b5:	76 ca                	jbe    681 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ba:	8b 40 04             	mov    0x4(%eax),%eax
 6bd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6c4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c7:	01 c2                	add    %eax,%edx
 6c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cc:	8b 00                	mov    (%eax),%eax
 6ce:	39 c2                	cmp    %eax,%edx
 6d0:	75 24                	jne    6f6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6d2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d5:	8b 50 04             	mov    0x4(%eax),%edx
 6d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6db:	8b 00                	mov    (%eax),%eax
 6dd:	8b 40 04             	mov    0x4(%eax),%eax
 6e0:	01 c2                	add    %eax,%edx
 6e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6eb:	8b 00                	mov    (%eax),%eax
 6ed:	8b 10                	mov    (%eax),%edx
 6ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f2:	89 10                	mov    %edx,(%eax)
 6f4:	eb 0a                	jmp    700 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f9:	8b 10                	mov    (%eax),%edx
 6fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fe:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 700:	8b 45 fc             	mov    -0x4(%ebp),%eax
 703:	8b 40 04             	mov    0x4(%eax),%eax
 706:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 70d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 710:	01 d0                	add    %edx,%eax
 712:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 715:	75 20                	jne    737 <free+0xcf>
    p->s.size += bp->s.size;
 717:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71a:	8b 50 04             	mov    0x4(%eax),%edx
 71d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 720:	8b 40 04             	mov    0x4(%eax),%eax
 723:	01 c2                	add    %eax,%edx
 725:	8b 45 fc             	mov    -0x4(%ebp),%eax
 728:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 72b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72e:	8b 10                	mov    (%eax),%edx
 730:	8b 45 fc             	mov    -0x4(%ebp),%eax
 733:	89 10                	mov    %edx,(%eax)
 735:	eb 08                	jmp    73f <free+0xd7>
  } else
    p->s.ptr = bp;
 737:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 73d:	89 10                	mov    %edx,(%eax)
  freep = p;
 73f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 742:	a3 50 0b 00 00       	mov    %eax,0xb50
}
 747:	90                   	nop
 748:	c9                   	leave  
 749:	c3                   	ret    

0000074a <morecore>:

static Header*
morecore(uint nu)
{
 74a:	55                   	push   %ebp
 74b:	89 e5                	mov    %esp,%ebp
 74d:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 750:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 757:	77 07                	ja     760 <morecore+0x16>
    nu = 4096;
 759:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 760:	8b 45 08             	mov    0x8(%ebp),%eax
 763:	c1 e0 03             	shl    $0x3,%eax
 766:	83 ec 0c             	sub    $0xc,%esp
 769:	50                   	push   %eax
 76a:	e8 79 fc ff ff       	call   3e8 <sbrk>
 76f:	83 c4 10             	add    $0x10,%esp
 772:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 775:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 779:	75 07                	jne    782 <morecore+0x38>
    return 0;
 77b:	b8 00 00 00 00       	mov    $0x0,%eax
 780:	eb 26                	jmp    7a8 <morecore+0x5e>
  hp = (Header*)p;
 782:	8b 45 f4             	mov    -0xc(%ebp),%eax
 785:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 788:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78b:	8b 55 08             	mov    0x8(%ebp),%edx
 78e:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 791:	8b 45 f0             	mov    -0x10(%ebp),%eax
 794:	83 c0 08             	add    $0x8,%eax
 797:	83 ec 0c             	sub    $0xc,%esp
 79a:	50                   	push   %eax
 79b:	e8 c8 fe ff ff       	call   668 <free>
 7a0:	83 c4 10             	add    $0x10,%esp
  return freep;
 7a3:	a1 50 0b 00 00       	mov    0xb50,%eax
}
 7a8:	c9                   	leave  
 7a9:	c3                   	ret    

000007aa <malloc>:

void*
malloc(uint nbytes)
{
 7aa:	55                   	push   %ebp
 7ab:	89 e5                	mov    %esp,%ebp
 7ad:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b0:	8b 45 08             	mov    0x8(%ebp),%eax
 7b3:	83 c0 07             	add    $0x7,%eax
 7b6:	c1 e8 03             	shr    $0x3,%eax
 7b9:	83 c0 01             	add    $0x1,%eax
 7bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7bf:	a1 50 0b 00 00       	mov    0xb50,%eax
 7c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7c7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7cb:	75 23                	jne    7f0 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7cd:	c7 45 f0 48 0b 00 00 	movl   $0xb48,-0x10(%ebp)
 7d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d7:	a3 50 0b 00 00       	mov    %eax,0xb50
 7dc:	a1 50 0b 00 00       	mov    0xb50,%eax
 7e1:	a3 48 0b 00 00       	mov    %eax,0xb48
    base.s.size = 0;
 7e6:	c7 05 4c 0b 00 00 00 	movl   $0x0,0xb4c
 7ed:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f3:	8b 00                	mov    (%eax),%eax
 7f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fb:	8b 40 04             	mov    0x4(%eax),%eax
 7fe:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 801:	72 4d                	jb     850 <malloc+0xa6>
      if(p->s.size == nunits)
 803:	8b 45 f4             	mov    -0xc(%ebp),%eax
 806:	8b 40 04             	mov    0x4(%eax),%eax
 809:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 80c:	75 0c                	jne    81a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 80e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 811:	8b 10                	mov    (%eax),%edx
 813:	8b 45 f0             	mov    -0x10(%ebp),%eax
 816:	89 10                	mov    %edx,(%eax)
 818:	eb 26                	jmp    840 <malloc+0x96>
      else {
        p->s.size -= nunits;
 81a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81d:	8b 40 04             	mov    0x4(%eax),%eax
 820:	2b 45 ec             	sub    -0x14(%ebp),%eax
 823:	89 c2                	mov    %eax,%edx
 825:	8b 45 f4             	mov    -0xc(%ebp),%eax
 828:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 82b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82e:	8b 40 04             	mov    0x4(%eax),%eax
 831:	c1 e0 03             	shl    $0x3,%eax
 834:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 837:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 83d:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 840:	8b 45 f0             	mov    -0x10(%ebp),%eax
 843:	a3 50 0b 00 00       	mov    %eax,0xb50
      return (void*)(p + 1);
 848:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84b:	83 c0 08             	add    $0x8,%eax
 84e:	eb 3b                	jmp    88b <malloc+0xe1>
    }
    if(p == freep)
 850:	a1 50 0b 00 00       	mov    0xb50,%eax
 855:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 858:	75 1e                	jne    878 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 85a:	83 ec 0c             	sub    $0xc,%esp
 85d:	ff 75 ec             	pushl  -0x14(%ebp)
 860:	e8 e5 fe ff ff       	call   74a <morecore>
 865:	83 c4 10             	add    $0x10,%esp
 868:	89 45 f4             	mov    %eax,-0xc(%ebp)
 86b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 86f:	75 07                	jne    878 <malloc+0xce>
        return 0;
 871:	b8 00 00 00 00       	mov    $0x0,%eax
 876:	eb 13                	jmp    88b <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 878:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 87e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 881:	8b 00                	mov    (%eax),%eax
 883:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 886:	e9 6d ff ff ff       	jmp    7f8 <malloc+0x4e>
}
 88b:	c9                   	leave  
 88c:	c3                   	ret    
