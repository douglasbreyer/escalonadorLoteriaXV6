
_stressfs: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  14:	c7 45 e6 73 74 72 65 	movl   $0x65727473,-0x1a(%ebp)
  1b:	c7 45 ea 73 73 66 73 	movl   $0x73667373,-0x16(%ebp)
  22:	66 c7 45 ee 30 00    	movw   $0x30,-0x12(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 de 08 00 00       	push   $0x8de
  30:	6a 01                	push   $0x1
  32:	e8 f1 04 00 00       	call   528 <printf>
  37:	83 c4 10             	add    $0x10,%esp
  memset(data, 'a', sizeof(data));
  3a:	83 ec 04             	sub    $0x4,%esp
  3d:	68 00 02 00 00       	push   $0x200
  42:	6a 61                	push   $0x61
  44:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
  4a:	50                   	push   %eax
  4b:	e8 c6 01 00 00       	call   216 <memset>
  50:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 4; i++)
  53:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  5a:	eb 15                	jmp    71 <main+0x71>
    if(fork(0) > 0)
  5c:	83 ec 0c             	sub    $0xc,%esp
  5f:	6a 00                	push   $0x0
  61:	e8 43 03 00 00       	call   3a9 <fork>
  66:	83 c4 10             	add    $0x10,%esp
  69:	85 c0                	test   %eax,%eax
  6b:	7f 0c                	jg     79 <main+0x79>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  6d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  71:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  75:	7e e5                	jle    5c <main+0x5c>
  77:	eb 01                	jmp    7a <main+0x7a>
    if(fork(0) > 0)
      break;
  79:	90                   	nop

  printf(1, "write %d\n", i);
  7a:	83 ec 04             	sub    $0x4,%esp
  7d:	ff 75 f4             	pushl  -0xc(%ebp)
  80:	68 f1 08 00 00       	push   $0x8f1
  85:	6a 01                	push   $0x1
  87:	e8 9c 04 00 00       	call   528 <printf>
  8c:	83 c4 10             	add    $0x10,%esp

  path[8] += i;
  8f:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
  93:	89 c2                	mov    %eax,%edx
  95:	8b 45 f4             	mov    -0xc(%ebp),%eax
  98:	01 d0                	add    %edx,%eax
  9a:	88 45 ee             	mov    %al,-0x12(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  9d:	83 ec 08             	sub    $0x8,%esp
  a0:	68 02 02 00 00       	push   $0x202
  a5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
  a8:	50                   	push   %eax
  a9:	e8 43 03 00 00       	call   3f1 <open>
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 20; i++)
  b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  bb:	eb 1e                	jmp    db <main+0xdb>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  bd:	83 ec 04             	sub    $0x4,%esp
  c0:	68 00 02 00 00       	push   $0x200
  c5:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
  cb:	50                   	push   %eax
  cc:	ff 75 f0             	pushl  -0x10(%ebp)
  cf:	e8 fd 02 00 00       	call   3d1 <write>
  d4:	83 c4 10             	add    $0x10,%esp

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
  d7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  db:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
  df:	7e dc                	jle    bd <main+0xbd>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  e1:	83 ec 0c             	sub    $0xc,%esp
  e4:	ff 75 f0             	pushl  -0x10(%ebp)
  e7:	e8 ed 02 00 00       	call   3d9 <close>
  ec:	83 c4 10             	add    $0x10,%esp

  printf(1, "read\n");
  ef:	83 ec 08             	sub    $0x8,%esp
  f2:	68 fb 08 00 00       	push   $0x8fb
  f7:	6a 01                	push   $0x1
  f9:	e8 2a 04 00 00       	call   528 <printf>
  fe:	83 c4 10             	add    $0x10,%esp

  fd = open(path, O_RDONLY);
 101:	83 ec 08             	sub    $0x8,%esp
 104:	6a 00                	push   $0x0
 106:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 109:	50                   	push   %eax
 10a:	e8 e2 02 00 00       	call   3f1 <open>
 10f:	83 c4 10             	add    $0x10,%esp
 112:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for (i = 0; i < 20; i++)
 115:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 11c:	eb 1e                	jmp    13c <main+0x13c>
    read(fd, data, sizeof(data));
 11e:	83 ec 04             	sub    $0x4,%esp
 121:	68 00 02 00 00       	push   $0x200
 126:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
 12c:	50                   	push   %eax
 12d:	ff 75 f0             	pushl  -0x10(%ebp)
 130:	e8 94 02 00 00       	call   3c9 <read>
 135:	83 c4 10             	add    $0x10,%esp
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 138:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 13c:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
 140:	7e dc                	jle    11e <main+0x11e>
    read(fd, data, sizeof(data));
  close(fd);
 142:	83 ec 0c             	sub    $0xc,%esp
 145:	ff 75 f0             	pushl  -0x10(%ebp)
 148:	e8 8c 02 00 00       	call   3d9 <close>
 14d:	83 c4 10             	add    $0x10,%esp

  wait();
 150:	e8 64 02 00 00       	call   3b9 <wait>
  
  exit();
 155:	e8 57 02 00 00       	call   3b1 <exit>

0000015a <stosb>:
 15a:	55                   	push   %ebp
 15b:	89 e5                	mov    %esp,%ebp
 15d:	57                   	push   %edi
 15e:	53                   	push   %ebx
 15f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 162:	8b 55 10             	mov    0x10(%ebp),%edx
 165:	8b 45 0c             	mov    0xc(%ebp),%eax
 168:	89 cb                	mov    %ecx,%ebx
 16a:	89 df                	mov    %ebx,%edi
 16c:	89 d1                	mov    %edx,%ecx
 16e:	fc                   	cld    
 16f:	f3 aa                	rep stos %al,%es:(%edi)
 171:	89 ca                	mov    %ecx,%edx
 173:	89 fb                	mov    %edi,%ebx
 175:	89 5d 08             	mov    %ebx,0x8(%ebp)
 178:	89 55 10             	mov    %edx,0x10(%ebp)
 17b:	90                   	nop
 17c:	5b                   	pop    %ebx
 17d:	5f                   	pop    %edi
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    

00000180 <strcpy>:
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	83 ec 10             	sub    $0x10,%esp
 186:	8b 45 08             	mov    0x8(%ebp),%eax
 189:	89 45 fc             	mov    %eax,-0x4(%ebp)
 18c:	90                   	nop
 18d:	8b 45 08             	mov    0x8(%ebp),%eax
 190:	8d 50 01             	lea    0x1(%eax),%edx
 193:	89 55 08             	mov    %edx,0x8(%ebp)
 196:	8b 55 0c             	mov    0xc(%ebp),%edx
 199:	8d 4a 01             	lea    0x1(%edx),%ecx
 19c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 19f:	0f b6 12             	movzbl (%edx),%edx
 1a2:	88 10                	mov    %dl,(%eax)
 1a4:	0f b6 00             	movzbl (%eax),%eax
 1a7:	84 c0                	test   %al,%al
 1a9:	75 e2                	jne    18d <strcpy+0xd>
 1ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 1ae:	c9                   	leave  
 1af:	c3                   	ret    

000001b0 <strcmp>:
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	eb 08                	jmp    1bd <strcmp+0xd>
 1b5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1b9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
 1c0:	0f b6 00             	movzbl (%eax),%eax
 1c3:	84 c0                	test   %al,%al
 1c5:	74 10                	je     1d7 <strcmp+0x27>
 1c7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ca:	0f b6 10             	movzbl (%eax),%edx
 1cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d0:	0f b6 00             	movzbl (%eax),%eax
 1d3:	38 c2                	cmp    %al,%dl
 1d5:	74 de                	je     1b5 <strcmp+0x5>
 1d7:	8b 45 08             	mov    0x8(%ebp),%eax
 1da:	0f b6 00             	movzbl (%eax),%eax
 1dd:	0f b6 d0             	movzbl %al,%edx
 1e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e3:	0f b6 00             	movzbl (%eax),%eax
 1e6:	0f b6 c0             	movzbl %al,%eax
 1e9:	29 c2                	sub    %eax,%edx
 1eb:	89 d0                	mov    %edx,%eax
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    

000001ef <strlen>:
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	83 ec 10             	sub    $0x10,%esp
 1f5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1fc:	eb 04                	jmp    202 <strlen+0x13>
 1fe:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 202:	8b 55 fc             	mov    -0x4(%ebp),%edx
 205:	8b 45 08             	mov    0x8(%ebp),%eax
 208:	01 d0                	add    %edx,%eax
 20a:	0f b6 00             	movzbl (%eax),%eax
 20d:	84 c0                	test   %al,%al
 20f:	75 ed                	jne    1fe <strlen+0xf>
 211:	8b 45 fc             	mov    -0x4(%ebp),%eax
 214:	c9                   	leave  
 215:	c3                   	ret    

00000216 <memset>:
 216:	55                   	push   %ebp
 217:	89 e5                	mov    %esp,%ebp
 219:	8b 45 10             	mov    0x10(%ebp),%eax
 21c:	50                   	push   %eax
 21d:	ff 75 0c             	pushl  0xc(%ebp)
 220:	ff 75 08             	pushl  0x8(%ebp)
 223:	e8 32 ff ff ff       	call   15a <stosb>
 228:	83 c4 0c             	add    $0xc,%esp
 22b:	8b 45 08             	mov    0x8(%ebp),%eax
 22e:	c9                   	leave  
 22f:	c3                   	ret    

00000230 <strchr>:
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	83 ec 04             	sub    $0x4,%esp
 236:	8b 45 0c             	mov    0xc(%ebp),%eax
 239:	88 45 fc             	mov    %al,-0x4(%ebp)
 23c:	eb 14                	jmp    252 <strchr+0x22>
 23e:	8b 45 08             	mov    0x8(%ebp),%eax
 241:	0f b6 00             	movzbl (%eax),%eax
 244:	3a 45 fc             	cmp    -0x4(%ebp),%al
 247:	75 05                	jne    24e <strchr+0x1e>
 249:	8b 45 08             	mov    0x8(%ebp),%eax
 24c:	eb 13                	jmp    261 <strchr+0x31>
 24e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 252:	8b 45 08             	mov    0x8(%ebp),%eax
 255:	0f b6 00             	movzbl (%eax),%eax
 258:	84 c0                	test   %al,%al
 25a:	75 e2                	jne    23e <strchr+0xe>
 25c:	b8 00 00 00 00       	mov    $0x0,%eax
 261:	c9                   	leave  
 262:	c3                   	ret    

00000263 <gets>:
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	83 ec 18             	sub    $0x18,%esp
 269:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 270:	eb 42                	jmp    2b4 <gets+0x51>
 272:	83 ec 04             	sub    $0x4,%esp
 275:	6a 01                	push   $0x1
 277:	8d 45 ef             	lea    -0x11(%ebp),%eax
 27a:	50                   	push   %eax
 27b:	6a 00                	push   $0x0
 27d:	e8 47 01 00 00       	call   3c9 <read>
 282:	83 c4 10             	add    $0x10,%esp
 285:	89 45 f0             	mov    %eax,-0x10(%ebp)
 288:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 28c:	7e 33                	jle    2c1 <gets+0x5e>
 28e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 291:	8d 50 01             	lea    0x1(%eax),%edx
 294:	89 55 f4             	mov    %edx,-0xc(%ebp)
 297:	89 c2                	mov    %eax,%edx
 299:	8b 45 08             	mov    0x8(%ebp),%eax
 29c:	01 c2                	add    %eax,%edx
 29e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a2:	88 02                	mov    %al,(%edx)
 2a4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a8:	3c 0a                	cmp    $0xa,%al
 2aa:	74 16                	je     2c2 <gets+0x5f>
 2ac:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2b0:	3c 0d                	cmp    $0xd,%al
 2b2:	74 0e                	je     2c2 <gets+0x5f>
 2b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b7:	83 c0 01             	add    $0x1,%eax
 2ba:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2bd:	7c b3                	jl     272 <gets+0xf>
 2bf:	eb 01                	jmp    2c2 <gets+0x5f>
 2c1:	90                   	nop
 2c2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
 2c8:	01 d0                	add    %edx,%eax
 2ca:	c6 00 00             	movb   $0x0,(%eax)
 2cd:	8b 45 08             	mov    0x8(%ebp),%eax
 2d0:	c9                   	leave  
 2d1:	c3                   	ret    

000002d2 <stat>:
 2d2:	55                   	push   %ebp
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	83 ec 18             	sub    $0x18,%esp
 2d8:	83 ec 08             	sub    $0x8,%esp
 2db:	6a 00                	push   $0x0
 2dd:	ff 75 08             	pushl  0x8(%ebp)
 2e0:	e8 0c 01 00 00       	call   3f1 <open>
 2e5:	83 c4 10             	add    $0x10,%esp
 2e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 2eb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2ef:	79 07                	jns    2f8 <stat+0x26>
 2f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2f6:	eb 25                	jmp    31d <stat+0x4b>
 2f8:	83 ec 08             	sub    $0x8,%esp
 2fb:	ff 75 0c             	pushl  0xc(%ebp)
 2fe:	ff 75 f4             	pushl  -0xc(%ebp)
 301:	e8 03 01 00 00       	call   409 <fstat>
 306:	83 c4 10             	add    $0x10,%esp
 309:	89 45 f0             	mov    %eax,-0x10(%ebp)
 30c:	83 ec 0c             	sub    $0xc,%esp
 30f:	ff 75 f4             	pushl  -0xc(%ebp)
 312:	e8 c2 00 00 00       	call   3d9 <close>
 317:	83 c4 10             	add    $0x10,%esp
 31a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 31d:	c9                   	leave  
 31e:	c3                   	ret    

0000031f <atoi>:
 31f:	55                   	push   %ebp
 320:	89 e5                	mov    %esp,%ebp
 322:	83 ec 10             	sub    $0x10,%esp
 325:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 32c:	eb 25                	jmp    353 <atoi+0x34>
 32e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 331:	89 d0                	mov    %edx,%eax
 333:	c1 e0 02             	shl    $0x2,%eax
 336:	01 d0                	add    %edx,%eax
 338:	01 c0                	add    %eax,%eax
 33a:	89 c1                	mov    %eax,%ecx
 33c:	8b 45 08             	mov    0x8(%ebp),%eax
 33f:	8d 50 01             	lea    0x1(%eax),%edx
 342:	89 55 08             	mov    %edx,0x8(%ebp)
 345:	0f b6 00             	movzbl (%eax),%eax
 348:	0f be c0             	movsbl %al,%eax
 34b:	01 c8                	add    %ecx,%eax
 34d:	83 e8 30             	sub    $0x30,%eax
 350:	89 45 fc             	mov    %eax,-0x4(%ebp)
 353:	8b 45 08             	mov    0x8(%ebp),%eax
 356:	0f b6 00             	movzbl (%eax),%eax
 359:	3c 2f                	cmp    $0x2f,%al
 35b:	7e 0a                	jle    367 <atoi+0x48>
 35d:	8b 45 08             	mov    0x8(%ebp),%eax
 360:	0f b6 00             	movzbl (%eax),%eax
 363:	3c 39                	cmp    $0x39,%al
 365:	7e c7                	jle    32e <atoi+0xf>
 367:	8b 45 fc             	mov    -0x4(%ebp),%eax
 36a:	c9                   	leave  
 36b:	c3                   	ret    

0000036c <memmove>:
 36c:	55                   	push   %ebp
 36d:	89 e5                	mov    %esp,%ebp
 36f:	83 ec 10             	sub    $0x10,%esp
 372:	8b 45 08             	mov    0x8(%ebp),%eax
 375:	89 45 fc             	mov    %eax,-0x4(%ebp)
 378:	8b 45 0c             	mov    0xc(%ebp),%eax
 37b:	89 45 f8             	mov    %eax,-0x8(%ebp)
 37e:	eb 17                	jmp    397 <memmove+0x2b>
 380:	8b 45 fc             	mov    -0x4(%ebp),%eax
 383:	8d 50 01             	lea    0x1(%eax),%edx
 386:	89 55 fc             	mov    %edx,-0x4(%ebp)
 389:	8b 55 f8             	mov    -0x8(%ebp),%edx
 38c:	8d 4a 01             	lea    0x1(%edx),%ecx
 38f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 392:	0f b6 12             	movzbl (%edx),%edx
 395:	88 10                	mov    %dl,(%eax)
 397:	8b 45 10             	mov    0x10(%ebp),%eax
 39a:	8d 50 ff             	lea    -0x1(%eax),%edx
 39d:	89 55 10             	mov    %edx,0x10(%ebp)
 3a0:	85 c0                	test   %eax,%eax
 3a2:	7f dc                	jg     380 <memmove+0x14>
 3a4:	8b 45 08             	mov    0x8(%ebp),%eax
 3a7:	c9                   	leave  
 3a8:	c3                   	ret    

000003a9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3a9:	b8 01 00 00 00       	mov    $0x1,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <exit>:
SYSCALL(exit)
 3b1:	b8 02 00 00 00       	mov    $0x2,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <wait>:
SYSCALL(wait)
 3b9:	b8 03 00 00 00       	mov    $0x3,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <pipe>:
SYSCALL(pipe)
 3c1:	b8 04 00 00 00       	mov    $0x4,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <read>:
SYSCALL(read)
 3c9:	b8 05 00 00 00       	mov    $0x5,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <write>:
SYSCALL(write)
 3d1:	b8 10 00 00 00       	mov    $0x10,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <close>:
SYSCALL(close)
 3d9:	b8 15 00 00 00       	mov    $0x15,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <kill>:
SYSCALL(kill)
 3e1:	b8 06 00 00 00       	mov    $0x6,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <exec>:
SYSCALL(exec)
 3e9:	b8 07 00 00 00       	mov    $0x7,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <open>:
SYSCALL(open)
 3f1:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <mknod>:
SYSCALL(mknod)
 3f9:	b8 11 00 00 00       	mov    $0x11,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <unlink>:
SYSCALL(unlink)
 401:	b8 12 00 00 00       	mov    $0x12,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <fstat>:
SYSCALL(fstat)
 409:	b8 08 00 00 00       	mov    $0x8,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <link>:
SYSCALL(link)
 411:	b8 13 00 00 00       	mov    $0x13,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <mkdir>:
SYSCALL(mkdir)
 419:	b8 14 00 00 00       	mov    $0x14,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <chdir>:
SYSCALL(chdir)
 421:	b8 09 00 00 00       	mov    $0x9,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <dup>:
SYSCALL(dup)
 429:	b8 0a 00 00 00       	mov    $0xa,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <getpid>:
SYSCALL(getpid)
 431:	b8 0b 00 00 00       	mov    $0xb,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <sbrk>:
SYSCALL(sbrk)
 439:	b8 0c 00 00 00       	mov    $0xc,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <sleep>:
SYSCALL(sleep)
 441:	b8 0d 00 00 00       	mov    $0xd,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <uptime>:
SYSCALL(uptime)
 449:	b8 0e 00 00 00       	mov    $0xe,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 451:	55                   	push   %ebp
 452:	89 e5                	mov    %esp,%ebp
 454:	83 ec 18             	sub    $0x18,%esp
 457:	8b 45 0c             	mov    0xc(%ebp),%eax
 45a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 45d:	83 ec 04             	sub    $0x4,%esp
 460:	6a 01                	push   $0x1
 462:	8d 45 f4             	lea    -0xc(%ebp),%eax
 465:	50                   	push   %eax
 466:	ff 75 08             	pushl  0x8(%ebp)
 469:	e8 63 ff ff ff       	call   3d1 <write>
 46e:	83 c4 10             	add    $0x10,%esp
}
 471:	90                   	nop
 472:	c9                   	leave  
 473:	c3                   	ret    

00000474 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	53                   	push   %ebx
 478:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 47b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 482:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 486:	74 17                	je     49f <printint+0x2b>
 488:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 48c:	79 11                	jns    49f <printint+0x2b>
    neg = 1;
 48e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 495:	8b 45 0c             	mov    0xc(%ebp),%eax
 498:	f7 d8                	neg    %eax
 49a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 49d:	eb 06                	jmp    4a5 <printint+0x31>
  } else {
    x = xx;
 49f:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4ac:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4af:	8d 41 01             	lea    0x1(%ecx),%eax
 4b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4bb:	ba 00 00 00 00       	mov    $0x0,%edx
 4c0:	f7 f3                	div    %ebx
 4c2:	89 d0                	mov    %edx,%eax
 4c4:	0f b6 80 50 0b 00 00 	movzbl 0xb50(%eax),%eax
 4cb:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4cf:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4d5:	ba 00 00 00 00       	mov    $0x0,%edx
 4da:	f7 f3                	div    %ebx
 4dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4df:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4e3:	75 c7                	jne    4ac <printint+0x38>
  if(neg)
 4e5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4e9:	74 2d                	je     518 <printint+0xa4>
    buf[i++] = '-';
 4eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ee:	8d 50 01             	lea    0x1(%eax),%edx
 4f1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4f4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4f9:	eb 1d                	jmp    518 <printint+0xa4>
    putc(fd, buf[i]);
 4fb:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 501:	01 d0                	add    %edx,%eax
 503:	0f b6 00             	movzbl (%eax),%eax
 506:	0f be c0             	movsbl %al,%eax
 509:	83 ec 08             	sub    $0x8,%esp
 50c:	50                   	push   %eax
 50d:	ff 75 08             	pushl  0x8(%ebp)
 510:	e8 3c ff ff ff       	call   451 <putc>
 515:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 518:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 51c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 520:	79 d9                	jns    4fb <printint+0x87>
    putc(fd, buf[i]);
}
 522:	90                   	nop
 523:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 526:	c9                   	leave  
 527:	c3                   	ret    

00000528 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 528:	55                   	push   %ebp
 529:	89 e5                	mov    %esp,%ebp
 52b:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 52e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 535:	8d 45 0c             	lea    0xc(%ebp),%eax
 538:	83 c0 04             	add    $0x4,%eax
 53b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 53e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 545:	e9 59 01 00 00       	jmp    6a3 <printf+0x17b>
    c = fmt[i] & 0xff;
 54a:	8b 55 0c             	mov    0xc(%ebp),%edx
 54d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 550:	01 d0                	add    %edx,%eax
 552:	0f b6 00             	movzbl (%eax),%eax
 555:	0f be c0             	movsbl %al,%eax
 558:	25 ff 00 00 00       	and    $0xff,%eax
 55d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 560:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 564:	75 2c                	jne    592 <printf+0x6a>
      if(c == '%'){
 566:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 56a:	75 0c                	jne    578 <printf+0x50>
        state = '%';
 56c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 573:	e9 27 01 00 00       	jmp    69f <printf+0x177>
      } else {
        putc(fd, c);
 578:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 57b:	0f be c0             	movsbl %al,%eax
 57e:	83 ec 08             	sub    $0x8,%esp
 581:	50                   	push   %eax
 582:	ff 75 08             	pushl  0x8(%ebp)
 585:	e8 c7 fe ff ff       	call   451 <putc>
 58a:	83 c4 10             	add    $0x10,%esp
 58d:	e9 0d 01 00 00       	jmp    69f <printf+0x177>
      }
    } else if(state == '%'){
 592:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 596:	0f 85 03 01 00 00    	jne    69f <printf+0x177>
      if(c == 'd'){
 59c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5a0:	75 1e                	jne    5c0 <printf+0x98>
        printint(fd, *ap, 10, 1);
 5a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a5:	8b 00                	mov    (%eax),%eax
 5a7:	6a 01                	push   $0x1
 5a9:	6a 0a                	push   $0xa
 5ab:	50                   	push   %eax
 5ac:	ff 75 08             	pushl  0x8(%ebp)
 5af:	e8 c0 fe ff ff       	call   474 <printint>
 5b4:	83 c4 10             	add    $0x10,%esp
        ap++;
 5b7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5bb:	e9 d8 00 00 00       	jmp    698 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 5c0:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5c4:	74 06                	je     5cc <printf+0xa4>
 5c6:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5ca:	75 1e                	jne    5ea <printf+0xc2>
        printint(fd, *ap, 16, 0);
 5cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5cf:	8b 00                	mov    (%eax),%eax
 5d1:	6a 00                	push   $0x0
 5d3:	6a 10                	push   $0x10
 5d5:	50                   	push   %eax
 5d6:	ff 75 08             	pushl  0x8(%ebp)
 5d9:	e8 96 fe ff ff       	call   474 <printint>
 5de:	83 c4 10             	add    $0x10,%esp
        ap++;
 5e1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5e5:	e9 ae 00 00 00       	jmp    698 <printf+0x170>
      } else if(c == 's'){
 5ea:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5ee:	75 43                	jne    633 <printf+0x10b>
        s = (char*)*ap;
 5f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f3:	8b 00                	mov    (%eax),%eax
 5f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5f8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5fc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 600:	75 25                	jne    627 <printf+0xff>
          s = "(null)";
 602:	c7 45 f4 01 09 00 00 	movl   $0x901,-0xc(%ebp)
        while(*s != 0){
 609:	eb 1c                	jmp    627 <printf+0xff>
          putc(fd, *s);
 60b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 60e:	0f b6 00             	movzbl (%eax),%eax
 611:	0f be c0             	movsbl %al,%eax
 614:	83 ec 08             	sub    $0x8,%esp
 617:	50                   	push   %eax
 618:	ff 75 08             	pushl  0x8(%ebp)
 61b:	e8 31 fe ff ff       	call   451 <putc>
 620:	83 c4 10             	add    $0x10,%esp
          s++;
 623:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 627:	8b 45 f4             	mov    -0xc(%ebp),%eax
 62a:	0f b6 00             	movzbl (%eax),%eax
 62d:	84 c0                	test   %al,%al
 62f:	75 da                	jne    60b <printf+0xe3>
 631:	eb 65                	jmp    698 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 633:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 637:	75 1d                	jne    656 <printf+0x12e>
        putc(fd, *ap);
 639:	8b 45 e8             	mov    -0x18(%ebp),%eax
 63c:	8b 00                	mov    (%eax),%eax
 63e:	0f be c0             	movsbl %al,%eax
 641:	83 ec 08             	sub    $0x8,%esp
 644:	50                   	push   %eax
 645:	ff 75 08             	pushl  0x8(%ebp)
 648:	e8 04 fe ff ff       	call   451 <putc>
 64d:	83 c4 10             	add    $0x10,%esp
        ap++;
 650:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 654:	eb 42                	jmp    698 <printf+0x170>
      } else if(c == '%'){
 656:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 65a:	75 17                	jne    673 <printf+0x14b>
        putc(fd, c);
 65c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 65f:	0f be c0             	movsbl %al,%eax
 662:	83 ec 08             	sub    $0x8,%esp
 665:	50                   	push   %eax
 666:	ff 75 08             	pushl  0x8(%ebp)
 669:	e8 e3 fd ff ff       	call   451 <putc>
 66e:	83 c4 10             	add    $0x10,%esp
 671:	eb 25                	jmp    698 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 673:	83 ec 08             	sub    $0x8,%esp
 676:	6a 25                	push   $0x25
 678:	ff 75 08             	pushl  0x8(%ebp)
 67b:	e8 d1 fd ff ff       	call   451 <putc>
 680:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 683:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 686:	0f be c0             	movsbl %al,%eax
 689:	83 ec 08             	sub    $0x8,%esp
 68c:	50                   	push   %eax
 68d:	ff 75 08             	pushl  0x8(%ebp)
 690:	e8 bc fd ff ff       	call   451 <putc>
 695:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 698:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 69f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6a3:	8b 55 0c             	mov    0xc(%ebp),%edx
 6a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6a9:	01 d0                	add    %edx,%eax
 6ab:	0f b6 00             	movzbl (%eax),%eax
 6ae:	84 c0                	test   %al,%al
 6b0:	0f 85 94 fe ff ff    	jne    54a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6b6:	90                   	nop
 6b7:	c9                   	leave  
 6b8:	c3                   	ret    

000006b9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b9:	55                   	push   %ebp
 6ba:	89 e5                	mov    %esp,%ebp
 6bc:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6bf:	8b 45 08             	mov    0x8(%ebp),%eax
 6c2:	83 e8 08             	sub    $0x8,%eax
 6c5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c8:	a1 6c 0b 00 00       	mov    0xb6c,%eax
 6cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6d0:	eb 24                	jmp    6f6 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d5:	8b 00                	mov    (%eax),%eax
 6d7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6da:	77 12                	ja     6ee <free+0x35>
 6dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6df:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e2:	77 24                	ja     708 <free+0x4f>
 6e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e7:	8b 00                	mov    (%eax),%eax
 6e9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ec:	77 1a                	ja     708 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f1:	8b 00                	mov    (%eax),%eax
 6f3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6fc:	76 d4                	jbe    6d2 <free+0x19>
 6fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 701:	8b 00                	mov    (%eax),%eax
 703:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 706:	76 ca                	jbe    6d2 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 708:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70b:	8b 40 04             	mov    0x4(%eax),%eax
 70e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 715:	8b 45 f8             	mov    -0x8(%ebp),%eax
 718:	01 c2                	add    %eax,%edx
 71a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71d:	8b 00                	mov    (%eax),%eax
 71f:	39 c2                	cmp    %eax,%edx
 721:	75 24                	jne    747 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 723:	8b 45 f8             	mov    -0x8(%ebp),%eax
 726:	8b 50 04             	mov    0x4(%eax),%edx
 729:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72c:	8b 00                	mov    (%eax),%eax
 72e:	8b 40 04             	mov    0x4(%eax),%eax
 731:	01 c2                	add    %eax,%edx
 733:	8b 45 f8             	mov    -0x8(%ebp),%eax
 736:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 739:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73c:	8b 00                	mov    (%eax),%eax
 73e:	8b 10                	mov    (%eax),%edx
 740:	8b 45 f8             	mov    -0x8(%ebp),%eax
 743:	89 10                	mov    %edx,(%eax)
 745:	eb 0a                	jmp    751 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 747:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74a:	8b 10                	mov    (%eax),%edx
 74c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74f:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 751:	8b 45 fc             	mov    -0x4(%ebp),%eax
 754:	8b 40 04             	mov    0x4(%eax),%eax
 757:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 75e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 761:	01 d0                	add    %edx,%eax
 763:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 766:	75 20                	jne    788 <free+0xcf>
    p->s.size += bp->s.size;
 768:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76b:	8b 50 04             	mov    0x4(%eax),%edx
 76e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 771:	8b 40 04             	mov    0x4(%eax),%eax
 774:	01 c2                	add    %eax,%edx
 776:	8b 45 fc             	mov    -0x4(%ebp),%eax
 779:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 77c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77f:	8b 10                	mov    (%eax),%edx
 781:	8b 45 fc             	mov    -0x4(%ebp),%eax
 784:	89 10                	mov    %edx,(%eax)
 786:	eb 08                	jmp    790 <free+0xd7>
  } else
    p->s.ptr = bp;
 788:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 78e:	89 10                	mov    %edx,(%eax)
  freep = p;
 790:	8b 45 fc             	mov    -0x4(%ebp),%eax
 793:	a3 6c 0b 00 00       	mov    %eax,0xb6c
}
 798:	90                   	nop
 799:	c9                   	leave  
 79a:	c3                   	ret    

0000079b <morecore>:

static Header*
morecore(uint nu)
{
 79b:	55                   	push   %ebp
 79c:	89 e5                	mov    %esp,%ebp
 79e:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7a1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7a8:	77 07                	ja     7b1 <morecore+0x16>
    nu = 4096;
 7aa:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7b1:	8b 45 08             	mov    0x8(%ebp),%eax
 7b4:	c1 e0 03             	shl    $0x3,%eax
 7b7:	83 ec 0c             	sub    $0xc,%esp
 7ba:	50                   	push   %eax
 7bb:	e8 79 fc ff ff       	call   439 <sbrk>
 7c0:	83 c4 10             	add    $0x10,%esp
 7c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7c6:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7ca:	75 07                	jne    7d3 <morecore+0x38>
    return 0;
 7cc:	b8 00 00 00 00       	mov    $0x0,%eax
 7d1:	eb 26                	jmp    7f9 <morecore+0x5e>
  hp = (Header*)p;
 7d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7dc:	8b 55 08             	mov    0x8(%ebp),%edx
 7df:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e5:	83 c0 08             	add    $0x8,%eax
 7e8:	83 ec 0c             	sub    $0xc,%esp
 7eb:	50                   	push   %eax
 7ec:	e8 c8 fe ff ff       	call   6b9 <free>
 7f1:	83 c4 10             	add    $0x10,%esp
  return freep;
 7f4:	a1 6c 0b 00 00       	mov    0xb6c,%eax
}
 7f9:	c9                   	leave  
 7fa:	c3                   	ret    

000007fb <malloc>:

void*
malloc(uint nbytes)
{
 7fb:	55                   	push   %ebp
 7fc:	89 e5                	mov    %esp,%ebp
 7fe:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 801:	8b 45 08             	mov    0x8(%ebp),%eax
 804:	83 c0 07             	add    $0x7,%eax
 807:	c1 e8 03             	shr    $0x3,%eax
 80a:	83 c0 01             	add    $0x1,%eax
 80d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 810:	a1 6c 0b 00 00       	mov    0xb6c,%eax
 815:	89 45 f0             	mov    %eax,-0x10(%ebp)
 818:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 81c:	75 23                	jne    841 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 81e:	c7 45 f0 64 0b 00 00 	movl   $0xb64,-0x10(%ebp)
 825:	8b 45 f0             	mov    -0x10(%ebp),%eax
 828:	a3 6c 0b 00 00       	mov    %eax,0xb6c
 82d:	a1 6c 0b 00 00       	mov    0xb6c,%eax
 832:	a3 64 0b 00 00       	mov    %eax,0xb64
    base.s.size = 0;
 837:	c7 05 68 0b 00 00 00 	movl   $0x0,0xb68
 83e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 841:	8b 45 f0             	mov    -0x10(%ebp),%eax
 844:	8b 00                	mov    (%eax),%eax
 846:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 849:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84c:	8b 40 04             	mov    0x4(%eax),%eax
 84f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 852:	72 4d                	jb     8a1 <malloc+0xa6>
      if(p->s.size == nunits)
 854:	8b 45 f4             	mov    -0xc(%ebp),%eax
 857:	8b 40 04             	mov    0x4(%eax),%eax
 85a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 85d:	75 0c                	jne    86b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 85f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 862:	8b 10                	mov    (%eax),%edx
 864:	8b 45 f0             	mov    -0x10(%ebp),%eax
 867:	89 10                	mov    %edx,(%eax)
 869:	eb 26                	jmp    891 <malloc+0x96>
      else {
        p->s.size -= nunits;
 86b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86e:	8b 40 04             	mov    0x4(%eax),%eax
 871:	2b 45 ec             	sub    -0x14(%ebp),%eax
 874:	89 c2                	mov    %eax,%edx
 876:	8b 45 f4             	mov    -0xc(%ebp),%eax
 879:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 87c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87f:	8b 40 04             	mov    0x4(%eax),%eax
 882:	c1 e0 03             	shl    $0x3,%eax
 885:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 888:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 88e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 891:	8b 45 f0             	mov    -0x10(%ebp),%eax
 894:	a3 6c 0b 00 00       	mov    %eax,0xb6c
      return (void*)(p + 1);
 899:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89c:	83 c0 08             	add    $0x8,%eax
 89f:	eb 3b                	jmp    8dc <malloc+0xe1>
    }
    if(p == freep)
 8a1:	a1 6c 0b 00 00       	mov    0xb6c,%eax
 8a6:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8a9:	75 1e                	jne    8c9 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 8ab:	83 ec 0c             	sub    $0xc,%esp
 8ae:	ff 75 ec             	pushl  -0x14(%ebp)
 8b1:	e8 e5 fe ff ff       	call   79b <morecore>
 8b6:	83 c4 10             	add    $0x10,%esp
 8b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8c0:	75 07                	jne    8c9 <malloc+0xce>
        return 0;
 8c2:	b8 00 00 00 00       	mov    $0x0,%eax
 8c7:	eb 13                	jmp    8dc <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d2:	8b 00                	mov    (%eax),%eax
 8d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8d7:	e9 6d ff ff ff       	jmp    849 <malloc+0x4e>
}
 8dc:	c9                   	leave  
 8dd:	c3                   	ret    
