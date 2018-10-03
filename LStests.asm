
_LStests:     file format elf32-i386


Disassembly of section .text:

00000000 <loop>:
#include "user.h"       //functios like printf and syscalls

#define STDOUT 1        //following the standard nomenclature for xv6 output
#define N 20

void loop(){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 10             	sub    $0x10,%esp
    int x, i = 0;
   6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    for(x=0; x<112345678; x++){
   d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  14:	eb 08                	jmp    1e <loop+0x1e>
        i++;
  16:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
#define STDOUT 1        //following the standard nomenclature for xv6 output
#define N 20

void loop(){
    int x, i = 0;
    for(x=0; x<112345678; x++){
  1a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1e:	81 7d fc 4d 42 b2 06 	cmpl   $0x6b2424d,-0x4(%ebp)
  25:	7e ef                	jle    16 <loop+0x16>
        i++;
    }
    for(x=0; x<1123456; x++){
  27:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2e:	eb 08                	jmp    38 <loop+0x38>
        i--;
  30:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
void loop(){
    int x, i = 0;
    for(x=0; x<112345678; x++){
        i++;
    }
    for(x=0; x<1123456; x++){
  34:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  38:	81 7d fc 7f 24 11 00 	cmpl   $0x11247f,-0x4(%ebp)
  3f:	7e ef                	jle    30 <loop+0x30>
        i--;
    }
}
  41:	c9                   	leave  
  42:	c3                   	ret    

00000043 <random>:

int randstate=3;
int random(){
  43:	55                   	push   %ebp
  44:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  46:	a1 40 0b 00 00       	mov    0xb40,%eax
  4b:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
  51:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
  56:	a3 40 0b 00 00       	mov    %eax,0xb40
  if(randstate<0){
  5b:	a1 40 0b 00 00       	mov    0xb40,%eax
  60:	85 c0                	test   %eax,%eax
  62:	79 09                	jns    6d <random+0x2a>
    return (randstate*-1);
  64:	a1 40 0b 00 00       	mov    0xb40,%eax
  69:	f7 d8                	neg    %eax
  6b:	eb 05                	jmp    72 <random+0x2f>
  }
  return randstate;
  6d:	a1 40 0b 00 00       	mov    0xb40,%eax
}
  72:	5d                   	pop    %ebp
  73:	c3                   	ret    

00000074 <main>:

int main(){
  74:	55                   	push   %ebp
  75:	89 e5                	mov    %esp,%ebp
  77:	83 e4 f0             	and    $0xfffffff0,%esp
  7a:	83 ec 20             	sub    $0x20,%esp
    int pid;
    int i, raffled;
    for (i=0;i<N;i++){
  7d:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  84:	00 
  85:	eb 58                	jmp    df <main+0x6b>
            raffled=random()%2000; 
  87:	e8 b7 ff ff ff       	call   43 <random>
  8c:	89 c1                	mov    %eax,%ecx
  8e:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
  93:	89 c8                	mov    %ecx,%eax
  95:	f7 ea                	imul   %edx
  97:	c1 fa 07             	sar    $0x7,%edx
  9a:	89 c8                	mov    %ecx,%eax
  9c:	c1 f8 1f             	sar    $0x1f,%eax
  9f:	29 c2                	sub    %eax,%edx
  a1:	89 d0                	mov    %edx,%eax
  a3:	89 44 24 18          	mov    %eax,0x18(%esp)
  a7:	8b 44 24 18          	mov    0x18(%esp),%eax
  ab:	69 c0 d0 07 00 00    	imul   $0x7d0,%eax,%eax
  b1:	29 c1                	sub    %eax,%ecx
  b3:	89 c8                	mov    %ecx,%eax
  b5:	89 44 24 18          	mov    %eax,0x18(%esp)
            pid=fork(raffled);
  b9:	8b 44 24 18          	mov    0x18(%esp),%eax
  bd:	89 04 24             	mov    %eax,(%esp)
  c0:	e8 99 02 00 00       	call   35e <fork>
  c5:	89 44 24 14          	mov    %eax,0x14(%esp)
            
            if(pid==0){
  c9:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
  ce:	75 0a                	jne    da <main+0x66>
                loop();
  d0:	e8 2b ff ff ff       	call   0 <loop>
                exit();
  d5:	e8 8c 02 00 00       	call   366 <exit>
}

int main(){
    int pid;
    int i, raffled;
    for (i=0;i<N;i++){
  da:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  df:	83 7c 24 1c 13       	cmpl   $0x13,0x1c(%esp)
  e4:	7e a1                	jle    87 <main+0x13>
            }
    }
    //while (wait() != -1);
   
   while(1){
        pid=wait();
  e6:	e8 83 02 00 00       	call   36e <wait>
  eb:	89 44 24 14          	mov    %eax,0x14(%esp)
        if(pid<0)break;
  ef:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
  f4:	79 06                	jns    fc <main+0x88>
  f6:	90                   	nop
    } 
    
    
    
    exit();
  f7:	e8 6a 02 00 00       	call   366 <exit>
    //while (wait() != -1);
   
   while(1){
        pid=wait();
        if(pid<0)break;
    } 
  fc:	eb e8                	jmp    e6 <main+0x72>

000000fe <stosb>:
  fe:	55                   	push   %ebp
  ff:	89 e5                	mov    %esp,%ebp
 101:	57                   	push   %edi
 102:	53                   	push   %ebx
 103:	8b 4d 08             	mov    0x8(%ebp),%ecx
 106:	8b 55 10             	mov    0x10(%ebp),%edx
 109:	8b 45 0c             	mov    0xc(%ebp),%eax
 10c:	89 cb                	mov    %ecx,%ebx
 10e:	89 df                	mov    %ebx,%edi
 110:	89 d1                	mov    %edx,%ecx
 112:	fc                   	cld    
 113:	f3 aa                	rep stos %al,%es:(%edi)
 115:	89 ca                	mov    %ecx,%edx
 117:	89 fb                	mov    %edi,%ebx
 119:	89 5d 08             	mov    %ebx,0x8(%ebp)
 11c:	89 55 10             	mov    %edx,0x10(%ebp)
 11f:	5b                   	pop    %ebx
 120:	5f                   	pop    %edi
 121:	5d                   	pop    %ebp
 122:	c3                   	ret    

00000123 <strcpy>:
 123:	55                   	push   %ebp
 124:	89 e5                	mov    %esp,%ebp
 126:	83 ec 10             	sub    $0x10,%esp
 129:	8b 45 08             	mov    0x8(%ebp),%eax
 12c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 12f:	90                   	nop
 130:	8b 45 08             	mov    0x8(%ebp),%eax
 133:	8d 50 01             	lea    0x1(%eax),%edx
 136:	89 55 08             	mov    %edx,0x8(%ebp)
 139:	8b 55 0c             	mov    0xc(%ebp),%edx
 13c:	8d 4a 01             	lea    0x1(%edx),%ecx
 13f:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 142:	0f b6 12             	movzbl (%edx),%edx
 145:	88 10                	mov    %dl,(%eax)
 147:	0f b6 00             	movzbl (%eax),%eax
 14a:	84 c0                	test   %al,%al
 14c:	75 e2                	jne    130 <strcpy+0xd>
 14e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 151:	c9                   	leave  
 152:	c3                   	ret    

00000153 <strcmp>:
 153:	55                   	push   %ebp
 154:	89 e5                	mov    %esp,%ebp
 156:	eb 08                	jmp    160 <strcmp+0xd>
 158:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 15c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 160:	8b 45 08             	mov    0x8(%ebp),%eax
 163:	0f b6 00             	movzbl (%eax),%eax
 166:	84 c0                	test   %al,%al
 168:	74 10                	je     17a <strcmp+0x27>
 16a:	8b 45 08             	mov    0x8(%ebp),%eax
 16d:	0f b6 10             	movzbl (%eax),%edx
 170:	8b 45 0c             	mov    0xc(%ebp),%eax
 173:	0f b6 00             	movzbl (%eax),%eax
 176:	38 c2                	cmp    %al,%dl
 178:	74 de                	je     158 <strcmp+0x5>
 17a:	8b 45 08             	mov    0x8(%ebp),%eax
 17d:	0f b6 00             	movzbl (%eax),%eax
 180:	0f b6 d0             	movzbl %al,%edx
 183:	8b 45 0c             	mov    0xc(%ebp),%eax
 186:	0f b6 00             	movzbl (%eax),%eax
 189:	0f b6 c0             	movzbl %al,%eax
 18c:	29 c2                	sub    %eax,%edx
 18e:	89 d0                	mov    %edx,%eax
 190:	5d                   	pop    %ebp
 191:	c3                   	ret    

00000192 <strlen>:
 192:	55                   	push   %ebp
 193:	89 e5                	mov    %esp,%ebp
 195:	83 ec 10             	sub    $0x10,%esp
 198:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 19f:	eb 04                	jmp    1a5 <strlen+0x13>
 1a1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1a5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1a8:	8b 45 08             	mov    0x8(%ebp),%eax
 1ab:	01 d0                	add    %edx,%eax
 1ad:	0f b6 00             	movzbl (%eax),%eax
 1b0:	84 c0                	test   %al,%al
 1b2:	75 ed                	jne    1a1 <strlen+0xf>
 1b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 1b7:	c9                   	leave  
 1b8:	c3                   	ret    

000001b9 <memset>:
 1b9:	55                   	push   %ebp
 1ba:	89 e5                	mov    %esp,%ebp
 1bc:	83 ec 0c             	sub    $0xc,%esp
 1bf:	8b 45 10             	mov    0x10(%ebp),%eax
 1c2:	89 44 24 08          	mov    %eax,0x8(%esp)
 1c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 1cd:	8b 45 08             	mov    0x8(%ebp),%eax
 1d0:	89 04 24             	mov    %eax,(%esp)
 1d3:	e8 26 ff ff ff       	call   fe <stosb>
 1d8:	8b 45 08             	mov    0x8(%ebp),%eax
 1db:	c9                   	leave  
 1dc:	c3                   	ret    

000001dd <strchr>:
 1dd:	55                   	push   %ebp
 1de:	89 e5                	mov    %esp,%ebp
 1e0:	83 ec 04             	sub    $0x4,%esp
 1e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e6:	88 45 fc             	mov    %al,-0x4(%ebp)
 1e9:	eb 14                	jmp    1ff <strchr+0x22>
 1eb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ee:	0f b6 00             	movzbl (%eax),%eax
 1f1:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1f4:	75 05                	jne    1fb <strchr+0x1e>
 1f6:	8b 45 08             	mov    0x8(%ebp),%eax
 1f9:	eb 13                	jmp    20e <strchr+0x31>
 1fb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1ff:	8b 45 08             	mov    0x8(%ebp),%eax
 202:	0f b6 00             	movzbl (%eax),%eax
 205:	84 c0                	test   %al,%al
 207:	75 e2                	jne    1eb <strchr+0xe>
 209:	b8 00 00 00 00       	mov    $0x0,%eax
 20e:	c9                   	leave  
 20f:	c3                   	ret    

00000210 <gets>:
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	83 ec 28             	sub    $0x28,%esp
 216:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 21d:	eb 4c                	jmp    26b <gets+0x5b>
 21f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 226:	00 
 227:	8d 45 ef             	lea    -0x11(%ebp),%eax
 22a:	89 44 24 04          	mov    %eax,0x4(%esp)
 22e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 235:	e8 44 01 00 00       	call   37e <read>
 23a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 23d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 241:	7f 02                	jg     245 <gets+0x35>
 243:	eb 31                	jmp    276 <gets+0x66>
 245:	8b 45 f4             	mov    -0xc(%ebp),%eax
 248:	8d 50 01             	lea    0x1(%eax),%edx
 24b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 24e:	89 c2                	mov    %eax,%edx
 250:	8b 45 08             	mov    0x8(%ebp),%eax
 253:	01 c2                	add    %eax,%edx
 255:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 259:	88 02                	mov    %al,(%edx)
 25b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 25f:	3c 0a                	cmp    $0xa,%al
 261:	74 13                	je     276 <gets+0x66>
 263:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 267:	3c 0d                	cmp    $0xd,%al
 269:	74 0b                	je     276 <gets+0x66>
 26b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 26e:	83 c0 01             	add    $0x1,%eax
 271:	3b 45 0c             	cmp    0xc(%ebp),%eax
 274:	7c a9                	jl     21f <gets+0xf>
 276:	8b 55 f4             	mov    -0xc(%ebp),%edx
 279:	8b 45 08             	mov    0x8(%ebp),%eax
 27c:	01 d0                	add    %edx,%eax
 27e:	c6 00 00             	movb   $0x0,(%eax)
 281:	8b 45 08             	mov    0x8(%ebp),%eax
 284:	c9                   	leave  
 285:	c3                   	ret    

00000286 <stat>:
 286:	55                   	push   %ebp
 287:	89 e5                	mov    %esp,%ebp
 289:	83 ec 28             	sub    $0x28,%esp
 28c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 293:	00 
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	89 04 24             	mov    %eax,(%esp)
 29a:	e8 07 01 00 00       	call   3a6 <open>
 29f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 2a2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2a6:	79 07                	jns    2af <stat+0x29>
 2a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ad:	eb 23                	jmp    2d2 <stat+0x4c>
 2af:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 2b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b9:	89 04 24             	mov    %eax,(%esp)
 2bc:	e8 fd 00 00 00       	call   3be <fstat>
 2c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 2c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2c7:	89 04 24             	mov    %eax,(%esp)
 2ca:	e8 bf 00 00 00       	call   38e <close>
 2cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2d2:	c9                   	leave  
 2d3:	c3                   	ret    

000002d4 <atoi>:
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	83 ec 10             	sub    $0x10,%esp
 2da:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2e1:	eb 25                	jmp    308 <atoi+0x34>
 2e3:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2e6:	89 d0                	mov    %edx,%eax
 2e8:	c1 e0 02             	shl    $0x2,%eax
 2eb:	01 d0                	add    %edx,%eax
 2ed:	01 c0                	add    %eax,%eax
 2ef:	89 c1                	mov    %eax,%ecx
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	89 55 08             	mov    %edx,0x8(%ebp)
 2fa:	0f b6 00             	movzbl (%eax),%eax
 2fd:	0f be c0             	movsbl %al,%eax
 300:	01 c8                	add    %ecx,%eax
 302:	83 e8 30             	sub    $0x30,%eax
 305:	89 45 fc             	mov    %eax,-0x4(%ebp)
 308:	8b 45 08             	mov    0x8(%ebp),%eax
 30b:	0f b6 00             	movzbl (%eax),%eax
 30e:	3c 2f                	cmp    $0x2f,%al
 310:	7e 0a                	jle    31c <atoi+0x48>
 312:	8b 45 08             	mov    0x8(%ebp),%eax
 315:	0f b6 00             	movzbl (%eax),%eax
 318:	3c 39                	cmp    $0x39,%al
 31a:	7e c7                	jle    2e3 <atoi+0xf>
 31c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 31f:	c9                   	leave  
 320:	c3                   	ret    

00000321 <memmove>:
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	83 ec 10             	sub    $0x10,%esp
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 32d:	8b 45 0c             	mov    0xc(%ebp),%eax
 330:	89 45 f8             	mov    %eax,-0x8(%ebp)
 333:	eb 17                	jmp    34c <memmove+0x2b>
 335:	8b 45 fc             	mov    -0x4(%ebp),%eax
 338:	8d 50 01             	lea    0x1(%eax),%edx
 33b:	89 55 fc             	mov    %edx,-0x4(%ebp)
 33e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 341:	8d 4a 01             	lea    0x1(%edx),%ecx
 344:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 347:	0f b6 12             	movzbl (%edx),%edx
 34a:	88 10                	mov    %dl,(%eax)
 34c:	8b 45 10             	mov    0x10(%ebp),%eax
 34f:	8d 50 ff             	lea    -0x1(%eax),%edx
 352:	89 55 10             	mov    %edx,0x10(%ebp)
 355:	85 c0                	test   %eax,%eax
 357:	7f dc                	jg     335 <memmove+0x14>
 359:	8b 45 08             	mov    0x8(%ebp),%eax
 35c:	c9                   	leave  
 35d:	c3                   	ret    

0000035e <fork>:
 35e:	b8 01 00 00 00       	mov    $0x1,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret    

00000366 <exit>:
 366:	b8 02 00 00 00       	mov    $0x2,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret    

0000036e <wait>:
 36e:	b8 03 00 00 00       	mov    $0x3,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret    

00000376 <pipe>:
 376:	b8 04 00 00 00       	mov    $0x4,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <read>:
 37e:	b8 05 00 00 00       	mov    $0x5,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <write>:
 386:	b8 10 00 00 00       	mov    $0x10,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <close>:
 38e:	b8 15 00 00 00       	mov    $0x15,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <kill>:
 396:	b8 06 00 00 00       	mov    $0x6,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <exec>:
 39e:	b8 07 00 00 00       	mov    $0x7,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <open>:
 3a6:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <mknod>:
 3ae:	b8 11 00 00 00       	mov    $0x11,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <unlink>:
 3b6:	b8 12 00 00 00       	mov    $0x12,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <fstat>:
 3be:	b8 08 00 00 00       	mov    $0x8,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <link>:
 3c6:	b8 13 00 00 00       	mov    $0x13,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <mkdir>:
 3ce:	b8 14 00 00 00       	mov    $0x14,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <chdir>:
 3d6:	b8 09 00 00 00       	mov    $0x9,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <dup>:
 3de:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <getpid>:
 3e6:	b8 0b 00 00 00       	mov    $0xb,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <sbrk>:
 3ee:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <sleep>:
 3f6:	b8 0d 00 00 00       	mov    $0xd,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <uptime>:
 3fe:	b8 0e 00 00 00       	mov    $0xe,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <putc>:
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	83 ec 18             	sub    $0x18,%esp
 40c:	8b 45 0c             	mov    0xc(%ebp),%eax
 40f:	88 45 f4             	mov    %al,-0xc(%ebp)
 412:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 419:	00 
 41a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 41d:	89 44 24 04          	mov    %eax,0x4(%esp)
 421:	8b 45 08             	mov    0x8(%ebp),%eax
 424:	89 04 24             	mov    %eax,(%esp)
 427:	e8 5a ff ff ff       	call   386 <write>
 42c:	c9                   	leave  
 42d:	c3                   	ret    

0000042e <printint>:
 42e:	55                   	push   %ebp
 42f:	89 e5                	mov    %esp,%ebp
 431:	56                   	push   %esi
 432:	53                   	push   %ebx
 433:	83 ec 30             	sub    $0x30,%esp
 436:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 43d:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 441:	74 17                	je     45a <printint+0x2c>
 443:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 447:	79 11                	jns    45a <printint+0x2c>
 449:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 450:	8b 45 0c             	mov    0xc(%ebp),%eax
 453:	f7 d8                	neg    %eax
 455:	89 45 ec             	mov    %eax,-0x14(%ebp)
 458:	eb 06                	jmp    460 <printint+0x32>
 45a:	8b 45 0c             	mov    0xc(%ebp),%eax
 45d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 460:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 467:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 46a:	8d 41 01             	lea    0x1(%ecx),%eax
 46d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 470:	8b 5d 10             	mov    0x10(%ebp),%ebx
 473:	8b 45 ec             	mov    -0x14(%ebp),%eax
 476:	ba 00 00 00 00       	mov    $0x0,%edx
 47b:	f7 f3                	div    %ebx
 47d:	89 d0                	mov    %edx,%eax
 47f:	0f b6 80 44 0b 00 00 	movzbl 0xb44(%eax),%eax
 486:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 48a:	8b 75 10             	mov    0x10(%ebp),%esi
 48d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 490:	ba 00 00 00 00       	mov    $0x0,%edx
 495:	f7 f6                	div    %esi
 497:	89 45 ec             	mov    %eax,-0x14(%ebp)
 49a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 49e:	75 c7                	jne    467 <printint+0x39>
 4a0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a4:	74 10                	je     4b6 <printint+0x88>
 4a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a9:	8d 50 01             	lea    0x1(%eax),%edx
 4ac:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4af:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4b4:	eb 1f                	jmp    4d5 <printint+0xa7>
 4b6:	eb 1d                	jmp    4d5 <printint+0xa7>
 4b8:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4be:	01 d0                	add    %edx,%eax
 4c0:	0f b6 00             	movzbl (%eax),%eax
 4c3:	0f be c0             	movsbl %al,%eax
 4c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ca:	8b 45 08             	mov    0x8(%ebp),%eax
 4cd:	89 04 24             	mov    %eax,(%esp)
 4d0:	e8 31 ff ff ff       	call   406 <putc>
 4d5:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4d9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4dd:	79 d9                	jns    4b8 <printint+0x8a>
 4df:	83 c4 30             	add    $0x30,%esp
 4e2:	5b                   	pop    %ebx
 4e3:	5e                   	pop    %esi
 4e4:	5d                   	pop    %ebp
 4e5:	c3                   	ret    

000004e6 <printf>:
 4e6:	55                   	push   %ebp
 4e7:	89 e5                	mov    %esp,%ebp
 4e9:	83 ec 38             	sub    $0x38,%esp
 4ec:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 4f3:	8d 45 0c             	lea    0xc(%ebp),%eax
 4f6:	83 c0 04             	add    $0x4,%eax
 4f9:	89 45 e8             	mov    %eax,-0x18(%ebp)
 4fc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 503:	e9 7c 01 00 00       	jmp    684 <printf+0x19e>
 508:	8b 55 0c             	mov    0xc(%ebp),%edx
 50b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 50e:	01 d0                	add    %edx,%eax
 510:	0f b6 00             	movzbl (%eax),%eax
 513:	0f be c0             	movsbl %al,%eax
 516:	25 ff 00 00 00       	and    $0xff,%eax
 51b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 51e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 522:	75 2c                	jne    550 <printf+0x6a>
 524:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 528:	75 0c                	jne    536 <printf+0x50>
 52a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 531:	e9 4a 01 00 00       	jmp    680 <printf+0x19a>
 536:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 539:	0f be c0             	movsbl %al,%eax
 53c:	89 44 24 04          	mov    %eax,0x4(%esp)
 540:	8b 45 08             	mov    0x8(%ebp),%eax
 543:	89 04 24             	mov    %eax,(%esp)
 546:	e8 bb fe ff ff       	call   406 <putc>
 54b:	e9 30 01 00 00       	jmp    680 <printf+0x19a>
 550:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 554:	0f 85 26 01 00 00    	jne    680 <printf+0x19a>
 55a:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 55e:	75 2d                	jne    58d <printf+0xa7>
 560:	8b 45 e8             	mov    -0x18(%ebp),%eax
 563:	8b 00                	mov    (%eax),%eax
 565:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 56c:	00 
 56d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 574:	00 
 575:	89 44 24 04          	mov    %eax,0x4(%esp)
 579:	8b 45 08             	mov    0x8(%ebp),%eax
 57c:	89 04 24             	mov    %eax,(%esp)
 57f:	e8 aa fe ff ff       	call   42e <printint>
 584:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 588:	e9 ec 00 00 00       	jmp    679 <printf+0x193>
 58d:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 591:	74 06                	je     599 <printf+0xb3>
 593:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 597:	75 2d                	jne    5c6 <printf+0xe0>
 599:	8b 45 e8             	mov    -0x18(%ebp),%eax
 59c:	8b 00                	mov    (%eax),%eax
 59e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5a5:	00 
 5a6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5ad:	00 
 5ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b2:	8b 45 08             	mov    0x8(%ebp),%eax
 5b5:	89 04 24             	mov    %eax,(%esp)
 5b8:	e8 71 fe ff ff       	call   42e <printint>
 5bd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c1:	e9 b3 00 00 00       	jmp    679 <printf+0x193>
 5c6:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5ca:	75 45                	jne    611 <printf+0x12b>
 5cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5cf:	8b 00                	mov    (%eax),%eax
 5d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5d4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5dc:	75 09                	jne    5e7 <printf+0x101>
 5de:	c7 45 f4 b2 08 00 00 	movl   $0x8b2,-0xc(%ebp)
 5e5:	eb 1e                	jmp    605 <printf+0x11f>
 5e7:	eb 1c                	jmp    605 <printf+0x11f>
 5e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ec:	0f b6 00             	movzbl (%eax),%eax
 5ef:	0f be c0             	movsbl %al,%eax
 5f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f6:	8b 45 08             	mov    0x8(%ebp),%eax
 5f9:	89 04 24             	mov    %eax,(%esp)
 5fc:	e8 05 fe ff ff       	call   406 <putc>
 601:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 605:	8b 45 f4             	mov    -0xc(%ebp),%eax
 608:	0f b6 00             	movzbl (%eax),%eax
 60b:	84 c0                	test   %al,%al
 60d:	75 da                	jne    5e9 <printf+0x103>
 60f:	eb 68                	jmp    679 <printf+0x193>
 611:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 615:	75 1d                	jne    634 <printf+0x14e>
 617:	8b 45 e8             	mov    -0x18(%ebp),%eax
 61a:	8b 00                	mov    (%eax),%eax
 61c:	0f be c0             	movsbl %al,%eax
 61f:	89 44 24 04          	mov    %eax,0x4(%esp)
 623:	8b 45 08             	mov    0x8(%ebp),%eax
 626:	89 04 24             	mov    %eax,(%esp)
 629:	e8 d8 fd ff ff       	call   406 <putc>
 62e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 632:	eb 45                	jmp    679 <printf+0x193>
 634:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 638:	75 17                	jne    651 <printf+0x16b>
 63a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 63d:	0f be c0             	movsbl %al,%eax
 640:	89 44 24 04          	mov    %eax,0x4(%esp)
 644:	8b 45 08             	mov    0x8(%ebp),%eax
 647:	89 04 24             	mov    %eax,(%esp)
 64a:	e8 b7 fd ff ff       	call   406 <putc>
 64f:	eb 28                	jmp    679 <printf+0x193>
 651:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 658:	00 
 659:	8b 45 08             	mov    0x8(%ebp),%eax
 65c:	89 04 24             	mov    %eax,(%esp)
 65f:	e8 a2 fd ff ff       	call   406 <putc>
 664:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 667:	0f be c0             	movsbl %al,%eax
 66a:	89 44 24 04          	mov    %eax,0x4(%esp)
 66e:	8b 45 08             	mov    0x8(%ebp),%eax
 671:	89 04 24             	mov    %eax,(%esp)
 674:	e8 8d fd ff ff       	call   406 <putc>
 679:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 680:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 684:	8b 55 0c             	mov    0xc(%ebp),%edx
 687:	8b 45 f0             	mov    -0x10(%ebp),%eax
 68a:	01 d0                	add    %edx,%eax
 68c:	0f b6 00             	movzbl (%eax),%eax
 68f:	84 c0                	test   %al,%al
 691:	0f 85 71 fe ff ff    	jne    508 <printf+0x22>
 697:	c9                   	leave  
 698:	c3                   	ret    

00000699 <free>:
 699:	55                   	push   %ebp
 69a:	89 e5                	mov    %esp,%ebp
 69c:	83 ec 10             	sub    $0x10,%esp
 69f:	8b 45 08             	mov    0x8(%ebp),%eax
 6a2:	83 e8 08             	sub    $0x8,%eax
 6a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
 6a8:	a1 60 0b 00 00       	mov    0xb60,%eax
 6ad:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6b0:	eb 24                	jmp    6d6 <free+0x3d>
 6b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b5:	8b 00                	mov    (%eax),%eax
 6b7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ba:	77 12                	ja     6ce <free+0x35>
 6bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6bf:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6c2:	77 24                	ja     6e8 <free+0x4f>
 6c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c7:	8b 00                	mov    (%eax),%eax
 6c9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6cc:	77 1a                	ja     6e8 <free+0x4f>
 6ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d1:	8b 00                	mov    (%eax),%eax
 6d3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6dc:	76 d4                	jbe    6b2 <free+0x19>
 6de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e1:	8b 00                	mov    (%eax),%eax
 6e3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6e6:	76 ca                	jbe    6b2 <free+0x19>
 6e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6eb:	8b 40 04             	mov    0x4(%eax),%eax
 6ee:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f8:	01 c2                	add    %eax,%edx
 6fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fd:	8b 00                	mov    (%eax),%eax
 6ff:	39 c2                	cmp    %eax,%edx
 701:	75 24                	jne    727 <free+0x8e>
 703:	8b 45 f8             	mov    -0x8(%ebp),%eax
 706:	8b 50 04             	mov    0x4(%eax),%edx
 709:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70c:	8b 00                	mov    (%eax),%eax
 70e:	8b 40 04             	mov    0x4(%eax),%eax
 711:	01 c2                	add    %eax,%edx
 713:	8b 45 f8             	mov    -0x8(%ebp),%eax
 716:	89 50 04             	mov    %edx,0x4(%eax)
 719:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71c:	8b 00                	mov    (%eax),%eax
 71e:	8b 10                	mov    (%eax),%edx
 720:	8b 45 f8             	mov    -0x8(%ebp),%eax
 723:	89 10                	mov    %edx,(%eax)
 725:	eb 0a                	jmp    731 <free+0x98>
 727:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72a:	8b 10                	mov    (%eax),%edx
 72c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72f:	89 10                	mov    %edx,(%eax)
 731:	8b 45 fc             	mov    -0x4(%ebp),%eax
 734:	8b 40 04             	mov    0x4(%eax),%eax
 737:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 73e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 741:	01 d0                	add    %edx,%eax
 743:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 746:	75 20                	jne    768 <free+0xcf>
 748:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74b:	8b 50 04             	mov    0x4(%eax),%edx
 74e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 751:	8b 40 04             	mov    0x4(%eax),%eax
 754:	01 c2                	add    %eax,%edx
 756:	8b 45 fc             	mov    -0x4(%ebp),%eax
 759:	89 50 04             	mov    %edx,0x4(%eax)
 75c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75f:	8b 10                	mov    (%eax),%edx
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	89 10                	mov    %edx,(%eax)
 766:	eb 08                	jmp    770 <free+0xd7>
 768:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 76e:	89 10                	mov    %edx,(%eax)
 770:	8b 45 fc             	mov    -0x4(%ebp),%eax
 773:	a3 60 0b 00 00       	mov    %eax,0xb60
 778:	c9                   	leave  
 779:	c3                   	ret    

0000077a <morecore>:
 77a:	55                   	push   %ebp
 77b:	89 e5                	mov    %esp,%ebp
 77d:	83 ec 28             	sub    $0x28,%esp
 780:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 787:	77 07                	ja     790 <morecore+0x16>
 789:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
 790:	8b 45 08             	mov    0x8(%ebp),%eax
 793:	c1 e0 03             	shl    $0x3,%eax
 796:	89 04 24             	mov    %eax,(%esp)
 799:	e8 50 fc ff ff       	call   3ee <sbrk>
 79e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7a1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7a5:	75 07                	jne    7ae <morecore+0x34>
 7a7:	b8 00 00 00 00       	mov    $0x0,%eax
 7ac:	eb 22                	jmp    7d0 <morecore+0x56>
 7ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b7:	8b 55 08             	mov    0x8(%ebp),%edx
 7ba:	89 50 04             	mov    %edx,0x4(%eax)
 7bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c0:	83 c0 08             	add    $0x8,%eax
 7c3:	89 04 24             	mov    %eax,(%esp)
 7c6:	e8 ce fe ff ff       	call   699 <free>
 7cb:	a1 60 0b 00 00       	mov    0xb60,%eax
 7d0:	c9                   	leave  
 7d1:	c3                   	ret    

000007d2 <malloc>:
 7d2:	55                   	push   %ebp
 7d3:	89 e5                	mov    %esp,%ebp
 7d5:	83 ec 28             	sub    $0x28,%esp
 7d8:	8b 45 08             	mov    0x8(%ebp),%eax
 7db:	83 c0 07             	add    $0x7,%eax
 7de:	c1 e8 03             	shr    $0x3,%eax
 7e1:	83 c0 01             	add    $0x1,%eax
 7e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7e7:	a1 60 0b 00 00       	mov    0xb60,%eax
 7ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7ef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7f3:	75 23                	jne    818 <malloc+0x46>
 7f5:	c7 45 f0 58 0b 00 00 	movl   $0xb58,-0x10(%ebp)
 7fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ff:	a3 60 0b 00 00       	mov    %eax,0xb60
 804:	a1 60 0b 00 00       	mov    0xb60,%eax
 809:	a3 58 0b 00 00       	mov    %eax,0xb58
 80e:	c7 05 5c 0b 00 00 00 	movl   $0x0,0xb5c
 815:	00 00 00 
 818:	8b 45 f0             	mov    -0x10(%ebp),%eax
 81b:	8b 00                	mov    (%eax),%eax
 81d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 820:	8b 45 f4             	mov    -0xc(%ebp),%eax
 823:	8b 40 04             	mov    0x4(%eax),%eax
 826:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 829:	72 4d                	jb     878 <malloc+0xa6>
 82b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82e:	8b 40 04             	mov    0x4(%eax),%eax
 831:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 834:	75 0c                	jne    842 <malloc+0x70>
 836:	8b 45 f4             	mov    -0xc(%ebp),%eax
 839:	8b 10                	mov    (%eax),%edx
 83b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83e:	89 10                	mov    %edx,(%eax)
 840:	eb 26                	jmp    868 <malloc+0x96>
 842:	8b 45 f4             	mov    -0xc(%ebp),%eax
 845:	8b 40 04             	mov    0x4(%eax),%eax
 848:	2b 45 ec             	sub    -0x14(%ebp),%eax
 84b:	89 c2                	mov    %eax,%edx
 84d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 850:	89 50 04             	mov    %edx,0x4(%eax)
 853:	8b 45 f4             	mov    -0xc(%ebp),%eax
 856:	8b 40 04             	mov    0x4(%eax),%eax
 859:	c1 e0 03             	shl    $0x3,%eax
 85c:	01 45 f4             	add    %eax,-0xc(%ebp)
 85f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 862:	8b 55 ec             	mov    -0x14(%ebp),%edx
 865:	89 50 04             	mov    %edx,0x4(%eax)
 868:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86b:	a3 60 0b 00 00       	mov    %eax,0xb60
 870:	8b 45 f4             	mov    -0xc(%ebp),%eax
 873:	83 c0 08             	add    $0x8,%eax
 876:	eb 38                	jmp    8b0 <malloc+0xde>
 878:	a1 60 0b 00 00       	mov    0xb60,%eax
 87d:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 880:	75 1b                	jne    89d <malloc+0xcb>
 882:	8b 45 ec             	mov    -0x14(%ebp),%eax
 885:	89 04 24             	mov    %eax,(%esp)
 888:	e8 ed fe ff ff       	call   77a <morecore>
 88d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 890:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 894:	75 07                	jne    89d <malloc+0xcb>
 896:	b8 00 00 00 00       	mov    $0x0,%eax
 89b:	eb 13                	jmp    8b0 <malloc+0xde>
 89d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a6:	8b 00                	mov    (%eax),%eax
 8a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8ab:	e9 70 ff ff ff       	jmp    820 <malloc+0x4e>
 8b0:	c9                   	leave  
 8b1:	c3                   	ret    
