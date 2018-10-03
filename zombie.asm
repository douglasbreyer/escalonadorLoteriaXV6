
_zombie: formato do arquivo elf32-i386


Desmontagem da seção .text:

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
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork(0) > 0)
  11:	83 ec 0c             	sub    $0xc,%esp
  14:	6a 00                	push   $0x0
  16:	e8 68 02 00 00       	call   283 <fork>
  1b:	83 c4 10             	add    $0x10,%esp
  1e:	85 c0                	test   %eax,%eax
  20:	7e 0d                	jle    2f <main+0x2f>
    sleep(5);  // Let child exit before parent.
  22:	83 ec 0c             	sub    $0xc,%esp
  25:	6a 05                	push   $0x5
  27:	e8 ef 02 00 00       	call   31b <sleep>
  2c:	83 c4 10             	add    $0x10,%esp
  exit();
  2f:	e8 57 02 00 00       	call   28b <exit>

00000034 <stosb>:
  34:	55                   	push   %ebp
  35:	89 e5                	mov    %esp,%ebp
  37:	57                   	push   %edi
  38:	53                   	push   %ebx
  39:	8b 4d 08             	mov    0x8(%ebp),%ecx
  3c:	8b 55 10             	mov    0x10(%ebp),%edx
  3f:	8b 45 0c             	mov    0xc(%ebp),%eax
  42:	89 cb                	mov    %ecx,%ebx
  44:	89 df                	mov    %ebx,%edi
  46:	89 d1                	mov    %edx,%ecx
  48:	fc                   	cld    
  49:	f3 aa                	rep stos %al,%es:(%edi)
  4b:	89 ca                	mov    %ecx,%edx
  4d:	89 fb                	mov    %edi,%ebx
  4f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  52:	89 55 10             	mov    %edx,0x10(%ebp)
  55:	90                   	nop
  56:	5b                   	pop    %ebx
  57:	5f                   	pop    %edi
  58:	5d                   	pop    %ebp
  59:	c3                   	ret    

0000005a <strcpy>:
  5a:	55                   	push   %ebp
  5b:	89 e5                	mov    %esp,%ebp
  5d:	83 ec 10             	sub    $0x10,%esp
  60:	8b 45 08             	mov    0x8(%ebp),%eax
  63:	89 45 fc             	mov    %eax,-0x4(%ebp)
  66:	90                   	nop
  67:	8b 45 08             	mov    0x8(%ebp),%eax
  6a:	8d 50 01             	lea    0x1(%eax),%edx
  6d:	89 55 08             	mov    %edx,0x8(%ebp)
  70:	8b 55 0c             	mov    0xc(%ebp),%edx
  73:	8d 4a 01             	lea    0x1(%edx),%ecx
  76:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  79:	0f b6 12             	movzbl (%edx),%edx
  7c:	88 10                	mov    %dl,(%eax)
  7e:	0f b6 00             	movzbl (%eax),%eax
  81:	84 c0                	test   %al,%al
  83:	75 e2                	jne    67 <strcpy+0xd>
  85:	8b 45 fc             	mov    -0x4(%ebp),%eax
  88:	c9                   	leave  
  89:	c3                   	ret    

0000008a <strcmp>:
  8a:	55                   	push   %ebp
  8b:	89 e5                	mov    %esp,%ebp
  8d:	eb 08                	jmp    97 <strcmp+0xd>
  8f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  93:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  97:	8b 45 08             	mov    0x8(%ebp),%eax
  9a:	0f b6 00             	movzbl (%eax),%eax
  9d:	84 c0                	test   %al,%al
  9f:	74 10                	je     b1 <strcmp+0x27>
  a1:	8b 45 08             	mov    0x8(%ebp),%eax
  a4:	0f b6 10             	movzbl (%eax),%edx
  a7:	8b 45 0c             	mov    0xc(%ebp),%eax
  aa:	0f b6 00             	movzbl (%eax),%eax
  ad:	38 c2                	cmp    %al,%dl
  af:	74 de                	je     8f <strcmp+0x5>
  b1:	8b 45 08             	mov    0x8(%ebp),%eax
  b4:	0f b6 00             	movzbl (%eax),%eax
  b7:	0f b6 d0             	movzbl %al,%edx
  ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  bd:	0f b6 00             	movzbl (%eax),%eax
  c0:	0f b6 c0             	movzbl %al,%eax
  c3:	29 c2                	sub    %eax,%edx
  c5:	89 d0                	mov    %edx,%eax
  c7:	5d                   	pop    %ebp
  c8:	c3                   	ret    

000000c9 <strlen>:
  c9:	55                   	push   %ebp
  ca:	89 e5                	mov    %esp,%ebp
  cc:	83 ec 10             	sub    $0x10,%esp
  cf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  d6:	eb 04                	jmp    dc <strlen+0x13>
  d8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  dc:	8b 55 fc             	mov    -0x4(%ebp),%edx
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	01 d0                	add    %edx,%eax
  e4:	0f b6 00             	movzbl (%eax),%eax
  e7:	84 c0                	test   %al,%al
  e9:	75 ed                	jne    d8 <strlen+0xf>
  eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  ee:	c9                   	leave  
  ef:	c3                   	ret    

000000f0 <memset>:
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 45 10             	mov    0x10(%ebp),%eax
  f6:	50                   	push   %eax
  f7:	ff 75 0c             	pushl  0xc(%ebp)
  fa:	ff 75 08             	pushl  0x8(%ebp)
  fd:	e8 32 ff ff ff       	call   34 <stosb>
 102:	83 c4 0c             	add    $0xc,%esp
 105:	8b 45 08             	mov    0x8(%ebp),%eax
 108:	c9                   	leave  
 109:	c3                   	ret    

0000010a <strchr>:
 10a:	55                   	push   %ebp
 10b:	89 e5                	mov    %esp,%ebp
 10d:	83 ec 04             	sub    $0x4,%esp
 110:	8b 45 0c             	mov    0xc(%ebp),%eax
 113:	88 45 fc             	mov    %al,-0x4(%ebp)
 116:	eb 14                	jmp    12c <strchr+0x22>
 118:	8b 45 08             	mov    0x8(%ebp),%eax
 11b:	0f b6 00             	movzbl (%eax),%eax
 11e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 121:	75 05                	jne    128 <strchr+0x1e>
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	eb 13                	jmp    13b <strchr+0x31>
 128:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 12c:	8b 45 08             	mov    0x8(%ebp),%eax
 12f:	0f b6 00             	movzbl (%eax),%eax
 132:	84 c0                	test   %al,%al
 134:	75 e2                	jne    118 <strchr+0xe>
 136:	b8 00 00 00 00       	mov    $0x0,%eax
 13b:	c9                   	leave  
 13c:	c3                   	ret    

0000013d <gets>:
 13d:	55                   	push   %ebp
 13e:	89 e5                	mov    %esp,%ebp
 140:	83 ec 18             	sub    $0x18,%esp
 143:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 14a:	eb 42                	jmp    18e <gets+0x51>
 14c:	83 ec 04             	sub    $0x4,%esp
 14f:	6a 01                	push   $0x1
 151:	8d 45 ef             	lea    -0x11(%ebp),%eax
 154:	50                   	push   %eax
 155:	6a 00                	push   $0x0
 157:	e8 47 01 00 00       	call   2a3 <read>
 15c:	83 c4 10             	add    $0x10,%esp
 15f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 162:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 166:	7e 33                	jle    19b <gets+0x5e>
 168:	8b 45 f4             	mov    -0xc(%ebp),%eax
 16b:	8d 50 01             	lea    0x1(%eax),%edx
 16e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 171:	89 c2                	mov    %eax,%edx
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	01 c2                	add    %eax,%edx
 178:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17c:	88 02                	mov    %al,(%edx)
 17e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 182:	3c 0a                	cmp    $0xa,%al
 184:	74 16                	je     19c <gets+0x5f>
 186:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18a:	3c 0d                	cmp    $0xd,%al
 18c:	74 0e                	je     19c <gets+0x5f>
 18e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 191:	83 c0 01             	add    $0x1,%eax
 194:	3b 45 0c             	cmp    0xc(%ebp),%eax
 197:	7c b3                	jl     14c <gets+0xf>
 199:	eb 01                	jmp    19c <gets+0x5f>
 19b:	90                   	nop
 19c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 19f:	8b 45 08             	mov    0x8(%ebp),%eax
 1a2:	01 d0                	add    %edx,%eax
 1a4:	c6 00 00             	movb   $0x0,(%eax)
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	c9                   	leave  
 1ab:	c3                   	ret    

000001ac <stat>:
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	83 ec 18             	sub    $0x18,%esp
 1b2:	83 ec 08             	sub    $0x8,%esp
 1b5:	6a 00                	push   $0x0
 1b7:	ff 75 08             	pushl  0x8(%ebp)
 1ba:	e8 0c 01 00 00       	call   2cb <open>
 1bf:	83 c4 10             	add    $0x10,%esp
 1c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 1c5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1c9:	79 07                	jns    1d2 <stat+0x26>
 1cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d0:	eb 25                	jmp    1f7 <stat+0x4b>
 1d2:	83 ec 08             	sub    $0x8,%esp
 1d5:	ff 75 0c             	pushl  0xc(%ebp)
 1d8:	ff 75 f4             	pushl  -0xc(%ebp)
 1db:	e8 03 01 00 00       	call   2e3 <fstat>
 1e0:	83 c4 10             	add    $0x10,%esp
 1e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 1e6:	83 ec 0c             	sub    $0xc,%esp
 1e9:	ff 75 f4             	pushl  -0xc(%ebp)
 1ec:	e8 c2 00 00 00       	call   2b3 <close>
 1f1:	83 c4 10             	add    $0x10,%esp
 1f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    

000001f9 <atoi>:
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	83 ec 10             	sub    $0x10,%esp
 1ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 206:	eb 25                	jmp    22d <atoi+0x34>
 208:	8b 55 fc             	mov    -0x4(%ebp),%edx
 20b:	89 d0                	mov    %edx,%eax
 20d:	c1 e0 02             	shl    $0x2,%eax
 210:	01 d0                	add    %edx,%eax
 212:	01 c0                	add    %eax,%eax
 214:	89 c1                	mov    %eax,%ecx
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	8d 50 01             	lea    0x1(%eax),%edx
 21c:	89 55 08             	mov    %edx,0x8(%ebp)
 21f:	0f b6 00             	movzbl (%eax),%eax
 222:	0f be c0             	movsbl %al,%eax
 225:	01 c8                	add    %ecx,%eax
 227:	83 e8 30             	sub    $0x30,%eax
 22a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 22d:	8b 45 08             	mov    0x8(%ebp),%eax
 230:	0f b6 00             	movzbl (%eax),%eax
 233:	3c 2f                	cmp    $0x2f,%al
 235:	7e 0a                	jle    241 <atoi+0x48>
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 00             	movzbl (%eax),%eax
 23d:	3c 39                	cmp    $0x39,%al
 23f:	7e c7                	jle    208 <atoi+0xf>
 241:	8b 45 fc             	mov    -0x4(%ebp),%eax
 244:	c9                   	leave  
 245:	c3                   	ret    

00000246 <memmove>:
 246:	55                   	push   %ebp
 247:	89 e5                	mov    %esp,%ebp
 249:	83 ec 10             	sub    $0x10,%esp
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 252:	8b 45 0c             	mov    0xc(%ebp),%eax
 255:	89 45 f8             	mov    %eax,-0x8(%ebp)
 258:	eb 17                	jmp    271 <memmove+0x2b>
 25a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 25d:	8d 50 01             	lea    0x1(%eax),%edx
 260:	89 55 fc             	mov    %edx,-0x4(%ebp)
 263:	8b 55 f8             	mov    -0x8(%ebp),%edx
 266:	8d 4a 01             	lea    0x1(%edx),%ecx
 269:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 26c:	0f b6 12             	movzbl (%edx),%edx
 26f:	88 10                	mov    %dl,(%eax)
 271:	8b 45 10             	mov    0x10(%ebp),%eax
 274:	8d 50 ff             	lea    -0x1(%eax),%edx
 277:	89 55 10             	mov    %edx,0x10(%ebp)
 27a:	85 c0                	test   %eax,%eax
 27c:	7f dc                	jg     25a <memmove+0x14>
 27e:	8b 45 08             	mov    0x8(%ebp),%eax
 281:	c9                   	leave  
 282:	c3                   	ret    

00000283 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 283:	b8 01 00 00 00       	mov    $0x1,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <exit>:
SYSCALL(exit)
 28b:	b8 02 00 00 00       	mov    $0x2,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <wait>:
SYSCALL(wait)
 293:	b8 03 00 00 00       	mov    $0x3,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <pipe>:
SYSCALL(pipe)
 29b:	b8 04 00 00 00       	mov    $0x4,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <read>:
SYSCALL(read)
 2a3:	b8 05 00 00 00       	mov    $0x5,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <write>:
SYSCALL(write)
 2ab:	b8 10 00 00 00       	mov    $0x10,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <close>:
SYSCALL(close)
 2b3:	b8 15 00 00 00       	mov    $0x15,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <kill>:
SYSCALL(kill)
 2bb:	b8 06 00 00 00       	mov    $0x6,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <exec>:
SYSCALL(exec)
 2c3:	b8 07 00 00 00       	mov    $0x7,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <open>:
SYSCALL(open)
 2cb:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <mknod>:
SYSCALL(mknod)
 2d3:	b8 11 00 00 00       	mov    $0x11,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <unlink>:
SYSCALL(unlink)
 2db:	b8 12 00 00 00       	mov    $0x12,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <fstat>:
SYSCALL(fstat)
 2e3:	b8 08 00 00 00       	mov    $0x8,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <link>:
SYSCALL(link)
 2eb:	b8 13 00 00 00       	mov    $0x13,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <mkdir>:
SYSCALL(mkdir)
 2f3:	b8 14 00 00 00       	mov    $0x14,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <chdir>:
SYSCALL(chdir)
 2fb:	b8 09 00 00 00       	mov    $0x9,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <dup>:
SYSCALL(dup)
 303:	b8 0a 00 00 00       	mov    $0xa,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <getpid>:
SYSCALL(getpid)
 30b:	b8 0b 00 00 00       	mov    $0xb,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <sbrk>:
SYSCALL(sbrk)
 313:	b8 0c 00 00 00       	mov    $0xc,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <sleep>:
SYSCALL(sleep)
 31b:	b8 0d 00 00 00       	mov    $0xd,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <uptime>:
SYSCALL(uptime)
 323:	b8 0e 00 00 00       	mov    $0xe,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 32b:	55                   	push   %ebp
 32c:	89 e5                	mov    %esp,%ebp
 32e:	83 ec 18             	sub    $0x18,%esp
 331:	8b 45 0c             	mov    0xc(%ebp),%eax
 334:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 337:	83 ec 04             	sub    $0x4,%esp
 33a:	6a 01                	push   $0x1
 33c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 33f:	50                   	push   %eax
 340:	ff 75 08             	pushl  0x8(%ebp)
 343:	e8 63 ff ff ff       	call   2ab <write>
 348:	83 c4 10             	add    $0x10,%esp
}
 34b:	90                   	nop
 34c:	c9                   	leave  
 34d:	c3                   	ret    

0000034e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 34e:	55                   	push   %ebp
 34f:	89 e5                	mov    %esp,%ebp
 351:	53                   	push   %ebx
 352:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 355:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 35c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 360:	74 17                	je     379 <printint+0x2b>
 362:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 366:	79 11                	jns    379 <printint+0x2b>
    neg = 1;
 368:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 36f:	8b 45 0c             	mov    0xc(%ebp),%eax
 372:	f7 d8                	neg    %eax
 374:	89 45 ec             	mov    %eax,-0x14(%ebp)
 377:	eb 06                	jmp    37f <printint+0x31>
  } else {
    x = xx;
 379:	8b 45 0c             	mov    0xc(%ebp),%eax
 37c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 37f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 386:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 389:	8d 41 01             	lea    0x1(%ecx),%eax
 38c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 38f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 392:	8b 45 ec             	mov    -0x14(%ebp),%eax
 395:	ba 00 00 00 00       	mov    $0x0,%edx
 39a:	f7 f3                	div    %ebx
 39c:	89 d0                	mov    %edx,%eax
 39e:	0f b6 80 08 0a 00 00 	movzbl 0xa08(%eax),%eax
 3a5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3a9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3af:	ba 00 00 00 00       	mov    $0x0,%edx
 3b4:	f7 f3                	div    %ebx
 3b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3b9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3bd:	75 c7                	jne    386 <printint+0x38>
  if(neg)
 3bf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3c3:	74 2d                	je     3f2 <printint+0xa4>
    buf[i++] = '-';
 3c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3c8:	8d 50 01             	lea    0x1(%eax),%edx
 3cb:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3ce:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3d3:	eb 1d                	jmp    3f2 <printint+0xa4>
    putc(fd, buf[i]);
 3d5:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3db:	01 d0                	add    %edx,%eax
 3dd:	0f b6 00             	movzbl (%eax),%eax
 3e0:	0f be c0             	movsbl %al,%eax
 3e3:	83 ec 08             	sub    $0x8,%esp
 3e6:	50                   	push   %eax
 3e7:	ff 75 08             	pushl  0x8(%ebp)
 3ea:	e8 3c ff ff ff       	call   32b <putc>
 3ef:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3f2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 3f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3fa:	79 d9                	jns    3d5 <printint+0x87>
    putc(fd, buf[i]);
}
 3fc:	90                   	nop
 3fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 400:	c9                   	leave  
 401:	c3                   	ret    

00000402 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 402:	55                   	push   %ebp
 403:	89 e5                	mov    %esp,%ebp
 405:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 408:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 40f:	8d 45 0c             	lea    0xc(%ebp),%eax
 412:	83 c0 04             	add    $0x4,%eax
 415:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 418:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 41f:	e9 59 01 00 00       	jmp    57d <printf+0x17b>
    c = fmt[i] & 0xff;
 424:	8b 55 0c             	mov    0xc(%ebp),%edx
 427:	8b 45 f0             	mov    -0x10(%ebp),%eax
 42a:	01 d0                	add    %edx,%eax
 42c:	0f b6 00             	movzbl (%eax),%eax
 42f:	0f be c0             	movsbl %al,%eax
 432:	25 ff 00 00 00       	and    $0xff,%eax
 437:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 43a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 43e:	75 2c                	jne    46c <printf+0x6a>
      if(c == '%'){
 440:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 444:	75 0c                	jne    452 <printf+0x50>
        state = '%';
 446:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 44d:	e9 27 01 00 00       	jmp    579 <printf+0x177>
      } else {
        putc(fd, c);
 452:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 455:	0f be c0             	movsbl %al,%eax
 458:	83 ec 08             	sub    $0x8,%esp
 45b:	50                   	push   %eax
 45c:	ff 75 08             	pushl  0x8(%ebp)
 45f:	e8 c7 fe ff ff       	call   32b <putc>
 464:	83 c4 10             	add    $0x10,%esp
 467:	e9 0d 01 00 00       	jmp    579 <printf+0x177>
      }
    } else if(state == '%'){
 46c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 470:	0f 85 03 01 00 00    	jne    579 <printf+0x177>
      if(c == 'd'){
 476:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 47a:	75 1e                	jne    49a <printf+0x98>
        printint(fd, *ap, 10, 1);
 47c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 47f:	8b 00                	mov    (%eax),%eax
 481:	6a 01                	push   $0x1
 483:	6a 0a                	push   $0xa
 485:	50                   	push   %eax
 486:	ff 75 08             	pushl  0x8(%ebp)
 489:	e8 c0 fe ff ff       	call   34e <printint>
 48e:	83 c4 10             	add    $0x10,%esp
        ap++;
 491:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 495:	e9 d8 00 00 00       	jmp    572 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 49a:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 49e:	74 06                	je     4a6 <printf+0xa4>
 4a0:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4a4:	75 1e                	jne    4c4 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4a9:	8b 00                	mov    (%eax),%eax
 4ab:	6a 00                	push   $0x0
 4ad:	6a 10                	push   $0x10
 4af:	50                   	push   %eax
 4b0:	ff 75 08             	pushl  0x8(%ebp)
 4b3:	e8 96 fe ff ff       	call   34e <printint>
 4b8:	83 c4 10             	add    $0x10,%esp
        ap++;
 4bb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4bf:	e9 ae 00 00 00       	jmp    572 <printf+0x170>
      } else if(c == 's'){
 4c4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4c8:	75 43                	jne    50d <printf+0x10b>
        s = (char*)*ap;
 4ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4cd:	8b 00                	mov    (%eax),%eax
 4cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4d2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 4d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4da:	75 25                	jne    501 <printf+0xff>
          s = "(null)";
 4dc:	c7 45 f4 b8 07 00 00 	movl   $0x7b8,-0xc(%ebp)
        while(*s != 0){
 4e3:	eb 1c                	jmp    501 <printf+0xff>
          putc(fd, *s);
 4e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e8:	0f b6 00             	movzbl (%eax),%eax
 4eb:	0f be c0             	movsbl %al,%eax
 4ee:	83 ec 08             	sub    $0x8,%esp
 4f1:	50                   	push   %eax
 4f2:	ff 75 08             	pushl  0x8(%ebp)
 4f5:	e8 31 fe ff ff       	call   32b <putc>
 4fa:	83 c4 10             	add    $0x10,%esp
          s++;
 4fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 501:	8b 45 f4             	mov    -0xc(%ebp),%eax
 504:	0f b6 00             	movzbl (%eax),%eax
 507:	84 c0                	test   %al,%al
 509:	75 da                	jne    4e5 <printf+0xe3>
 50b:	eb 65                	jmp    572 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 50d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 511:	75 1d                	jne    530 <printf+0x12e>
        putc(fd, *ap);
 513:	8b 45 e8             	mov    -0x18(%ebp),%eax
 516:	8b 00                	mov    (%eax),%eax
 518:	0f be c0             	movsbl %al,%eax
 51b:	83 ec 08             	sub    $0x8,%esp
 51e:	50                   	push   %eax
 51f:	ff 75 08             	pushl  0x8(%ebp)
 522:	e8 04 fe ff ff       	call   32b <putc>
 527:	83 c4 10             	add    $0x10,%esp
        ap++;
 52a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 52e:	eb 42                	jmp    572 <printf+0x170>
      } else if(c == '%'){
 530:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 534:	75 17                	jne    54d <printf+0x14b>
        putc(fd, c);
 536:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 539:	0f be c0             	movsbl %al,%eax
 53c:	83 ec 08             	sub    $0x8,%esp
 53f:	50                   	push   %eax
 540:	ff 75 08             	pushl  0x8(%ebp)
 543:	e8 e3 fd ff ff       	call   32b <putc>
 548:	83 c4 10             	add    $0x10,%esp
 54b:	eb 25                	jmp    572 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 54d:	83 ec 08             	sub    $0x8,%esp
 550:	6a 25                	push   $0x25
 552:	ff 75 08             	pushl  0x8(%ebp)
 555:	e8 d1 fd ff ff       	call   32b <putc>
 55a:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 55d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 560:	0f be c0             	movsbl %al,%eax
 563:	83 ec 08             	sub    $0x8,%esp
 566:	50                   	push   %eax
 567:	ff 75 08             	pushl  0x8(%ebp)
 56a:	e8 bc fd ff ff       	call   32b <putc>
 56f:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 572:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 579:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 57d:	8b 55 0c             	mov    0xc(%ebp),%edx
 580:	8b 45 f0             	mov    -0x10(%ebp),%eax
 583:	01 d0                	add    %edx,%eax
 585:	0f b6 00             	movzbl (%eax),%eax
 588:	84 c0                	test   %al,%al
 58a:	0f 85 94 fe ff ff    	jne    424 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 590:	90                   	nop
 591:	c9                   	leave  
 592:	c3                   	ret    

00000593 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 593:	55                   	push   %ebp
 594:	89 e5                	mov    %esp,%ebp
 596:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 599:	8b 45 08             	mov    0x8(%ebp),%eax
 59c:	83 e8 08             	sub    $0x8,%eax
 59f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5a2:	a1 24 0a 00 00       	mov    0xa24,%eax
 5a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5aa:	eb 24                	jmp    5d0 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5af:	8b 00                	mov    (%eax),%eax
 5b1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5b4:	77 12                	ja     5c8 <free+0x35>
 5b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5b9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5bc:	77 24                	ja     5e2 <free+0x4f>
 5be:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5c1:	8b 00                	mov    (%eax),%eax
 5c3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5c6:	77 1a                	ja     5e2 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5cb:	8b 00                	mov    (%eax),%eax
 5cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5d0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5d3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5d6:	76 d4                	jbe    5ac <free+0x19>
 5d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5db:	8b 00                	mov    (%eax),%eax
 5dd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5e0:	76 ca                	jbe    5ac <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5e5:	8b 40 04             	mov    0x4(%eax),%eax
 5e8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 5ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5f2:	01 c2                	add    %eax,%edx
 5f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f7:	8b 00                	mov    (%eax),%eax
 5f9:	39 c2                	cmp    %eax,%edx
 5fb:	75 24                	jne    621 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 5fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 600:	8b 50 04             	mov    0x4(%eax),%edx
 603:	8b 45 fc             	mov    -0x4(%ebp),%eax
 606:	8b 00                	mov    (%eax),%eax
 608:	8b 40 04             	mov    0x4(%eax),%eax
 60b:	01 c2                	add    %eax,%edx
 60d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 610:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 613:	8b 45 fc             	mov    -0x4(%ebp),%eax
 616:	8b 00                	mov    (%eax),%eax
 618:	8b 10                	mov    (%eax),%edx
 61a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 61d:	89 10                	mov    %edx,(%eax)
 61f:	eb 0a                	jmp    62b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 621:	8b 45 fc             	mov    -0x4(%ebp),%eax
 624:	8b 10                	mov    (%eax),%edx
 626:	8b 45 f8             	mov    -0x8(%ebp),%eax
 629:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 62b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62e:	8b 40 04             	mov    0x4(%eax),%eax
 631:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 638:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63b:	01 d0                	add    %edx,%eax
 63d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 640:	75 20                	jne    662 <free+0xcf>
    p->s.size += bp->s.size;
 642:	8b 45 fc             	mov    -0x4(%ebp),%eax
 645:	8b 50 04             	mov    0x4(%eax),%edx
 648:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64b:	8b 40 04             	mov    0x4(%eax),%eax
 64e:	01 c2                	add    %eax,%edx
 650:	8b 45 fc             	mov    -0x4(%ebp),%eax
 653:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 656:	8b 45 f8             	mov    -0x8(%ebp),%eax
 659:	8b 10                	mov    (%eax),%edx
 65b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65e:	89 10                	mov    %edx,(%eax)
 660:	eb 08                	jmp    66a <free+0xd7>
  } else
    p->s.ptr = bp;
 662:	8b 45 fc             	mov    -0x4(%ebp),%eax
 665:	8b 55 f8             	mov    -0x8(%ebp),%edx
 668:	89 10                	mov    %edx,(%eax)
  freep = p;
 66a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66d:	a3 24 0a 00 00       	mov    %eax,0xa24
}
 672:	90                   	nop
 673:	c9                   	leave  
 674:	c3                   	ret    

00000675 <morecore>:

static Header*
morecore(uint nu)
{
 675:	55                   	push   %ebp
 676:	89 e5                	mov    %esp,%ebp
 678:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 67b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 682:	77 07                	ja     68b <morecore+0x16>
    nu = 4096;
 684:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 68b:	8b 45 08             	mov    0x8(%ebp),%eax
 68e:	c1 e0 03             	shl    $0x3,%eax
 691:	83 ec 0c             	sub    $0xc,%esp
 694:	50                   	push   %eax
 695:	e8 79 fc ff ff       	call   313 <sbrk>
 69a:	83 c4 10             	add    $0x10,%esp
 69d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6a0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6a4:	75 07                	jne    6ad <morecore+0x38>
    return 0;
 6a6:	b8 00 00 00 00       	mov    $0x0,%eax
 6ab:	eb 26                	jmp    6d3 <morecore+0x5e>
  hp = (Header*)p;
 6ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6b6:	8b 55 08             	mov    0x8(%ebp),%edx
 6b9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6bf:	83 c0 08             	add    $0x8,%eax
 6c2:	83 ec 0c             	sub    $0xc,%esp
 6c5:	50                   	push   %eax
 6c6:	e8 c8 fe ff ff       	call   593 <free>
 6cb:	83 c4 10             	add    $0x10,%esp
  return freep;
 6ce:	a1 24 0a 00 00       	mov    0xa24,%eax
}
 6d3:	c9                   	leave  
 6d4:	c3                   	ret    

000006d5 <malloc>:

void*
malloc(uint nbytes)
{
 6d5:	55                   	push   %ebp
 6d6:	89 e5                	mov    %esp,%ebp
 6d8:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6db:	8b 45 08             	mov    0x8(%ebp),%eax
 6de:	83 c0 07             	add    $0x7,%eax
 6e1:	c1 e8 03             	shr    $0x3,%eax
 6e4:	83 c0 01             	add    $0x1,%eax
 6e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 6ea:	a1 24 0a 00 00       	mov    0xa24,%eax
 6ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
 6f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6f6:	75 23                	jne    71b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 6f8:	c7 45 f0 1c 0a 00 00 	movl   $0xa1c,-0x10(%ebp)
 6ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
 702:	a3 24 0a 00 00       	mov    %eax,0xa24
 707:	a1 24 0a 00 00       	mov    0xa24,%eax
 70c:	a3 1c 0a 00 00       	mov    %eax,0xa1c
    base.s.size = 0;
 711:	c7 05 20 0a 00 00 00 	movl   $0x0,0xa20
 718:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 71b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71e:	8b 00                	mov    (%eax),%eax
 720:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 723:	8b 45 f4             	mov    -0xc(%ebp),%eax
 726:	8b 40 04             	mov    0x4(%eax),%eax
 729:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 72c:	72 4d                	jb     77b <malloc+0xa6>
      if(p->s.size == nunits)
 72e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 731:	8b 40 04             	mov    0x4(%eax),%eax
 734:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 737:	75 0c                	jne    745 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 739:	8b 45 f4             	mov    -0xc(%ebp),%eax
 73c:	8b 10                	mov    (%eax),%edx
 73e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 741:	89 10                	mov    %edx,(%eax)
 743:	eb 26                	jmp    76b <malloc+0x96>
      else {
        p->s.size -= nunits;
 745:	8b 45 f4             	mov    -0xc(%ebp),%eax
 748:	8b 40 04             	mov    0x4(%eax),%eax
 74b:	2b 45 ec             	sub    -0x14(%ebp),%eax
 74e:	89 c2                	mov    %eax,%edx
 750:	8b 45 f4             	mov    -0xc(%ebp),%eax
 753:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 756:	8b 45 f4             	mov    -0xc(%ebp),%eax
 759:	8b 40 04             	mov    0x4(%eax),%eax
 75c:	c1 e0 03             	shl    $0x3,%eax
 75f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 762:	8b 45 f4             	mov    -0xc(%ebp),%eax
 765:	8b 55 ec             	mov    -0x14(%ebp),%edx
 768:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 76b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76e:	a3 24 0a 00 00       	mov    %eax,0xa24
      return (void*)(p + 1);
 773:	8b 45 f4             	mov    -0xc(%ebp),%eax
 776:	83 c0 08             	add    $0x8,%eax
 779:	eb 3b                	jmp    7b6 <malloc+0xe1>
    }
    if(p == freep)
 77b:	a1 24 0a 00 00       	mov    0xa24,%eax
 780:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 783:	75 1e                	jne    7a3 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 785:	83 ec 0c             	sub    $0xc,%esp
 788:	ff 75 ec             	pushl  -0x14(%ebp)
 78b:	e8 e5 fe ff ff       	call   675 <morecore>
 790:	83 c4 10             	add    $0x10,%esp
 793:	89 45 f4             	mov    %eax,-0xc(%ebp)
 796:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 79a:	75 07                	jne    7a3 <malloc+0xce>
        return 0;
 79c:	b8 00 00 00 00       	mov    $0x0,%eax
 7a1:	eb 13                	jmp    7b6 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ac:	8b 00                	mov    (%eax),%eax
 7ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7b1:	e9 6d ff ff ff       	jmp    723 <malloc+0x4e>
}
 7b6:	c9                   	leave  
 7b7:	c3                   	ret    
