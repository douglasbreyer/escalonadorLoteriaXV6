
_teste: formato do arquivo elf32-i386


Desmontagem da seção .text:

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
  41:	90                   	nop
  42:	c9                   	leave  
  43:	c3                   	ret    

00000044 <random>:

int randstate=3;
int random(){
  44:	55                   	push   %ebp
  45:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  47:	a1 14 0b 00 00       	mov    0xb14,%eax
  4c:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
  52:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
  57:	a3 14 0b 00 00       	mov    %eax,0xb14
  if(randstate<0){
  5c:	a1 14 0b 00 00       	mov    0xb14,%eax
  61:	85 c0                	test   %eax,%eax
  63:	79 09                	jns    6e <random+0x2a>
    return (randstate*-1);
  65:	a1 14 0b 00 00       	mov    0xb14,%eax
  6a:	f7 d8                	neg    %eax
  6c:	eb 05                	jmp    73 <random+0x2f>
  }
  return randstate;
  6e:	a1 14 0b 00 00       	mov    0xb14,%eax
}
  73:	5d                   	pop    %ebp
  74:	c3                   	ret    

00000075 <main>:

int main(){
  75:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  79:	83 e4 f0             	and    $0xfffffff0,%esp
  7c:	ff 71 fc             	pushl  -0x4(%ecx)
  7f:	55                   	push   %ebp
  80:	89 e5                	mov    %esp,%ebp
  82:	51                   	push   %ecx
  83:	83 ec 14             	sub    $0x14,%esp
    int pid;
    int i, raffled;
    for (i=0;i<N;i++){
  86:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  8d:	eb 54                	jmp    e3 <main+0x6e>
            raffled=random()%2000; 
  8f:	e8 b0 ff ff ff       	call   44 <random>
  94:	89 c1                	mov    %eax,%ecx
  96:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
  9b:	89 c8                	mov    %ecx,%eax
  9d:	f7 ea                	imul   %edx
  9f:	c1 fa 07             	sar    $0x7,%edx
  a2:	89 c8                	mov    %ecx,%eax
  a4:	c1 f8 1f             	sar    $0x1f,%eax
  a7:	29 c2                	sub    %eax,%edx
  a9:	89 d0                	mov    %edx,%eax
  ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  b1:	69 c0 d0 07 00 00    	imul   $0x7d0,%eax,%eax
  b7:	29 c1                	sub    %eax,%ecx
  b9:	89 c8                	mov    %ecx,%eax
  bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
            pid=fork(raffled);
  be:	83 ec 0c             	sub    $0xc,%esp
  c1:	ff 75 f0             	pushl  -0x10(%ebp)
  c4:	e8 85 02 00 00       	call   34e <fork>
  c9:	83 c4 10             	add    $0x10,%esp
  cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
            
            if(pid==0){
  cf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  d3:	75 0a                	jne    df <main+0x6a>
                loop();
  d5:	e8 26 ff ff ff       	call   0 <loop>
                exit();
  da:	e8 77 02 00 00       	call   356 <exit>
}

int main(){
    int pid;
    int i, raffled;
    for (i=0;i<N;i++){
  df:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  e3:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
  e7:	7e a6                	jle    8f <main+0x1a>
            }
    }
    //while (wait() != -1);
   
   while(1){
        pid=wait();
  e9:	e8 70 02 00 00       	call   35e <wait>
  ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
        if(pid<0)break;
  f1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  f5:	78 02                	js     f9 <main+0x84>
    } 
  f7:	eb f0                	jmp    e9 <main+0x74>
    }
    //while (wait() != -1);
   
   while(1){
        pid=wait();
        if(pid<0)break;
  f9:	90                   	nop
    } 
    
    
    
    exit();
  fa:	e8 57 02 00 00       	call   356 <exit>

000000ff <stosb>:
  ff:	55                   	push   %ebp
 100:	89 e5                	mov    %esp,%ebp
 102:	57                   	push   %edi
 103:	53                   	push   %ebx
 104:	8b 4d 08             	mov    0x8(%ebp),%ecx
 107:	8b 55 10             	mov    0x10(%ebp),%edx
 10a:	8b 45 0c             	mov    0xc(%ebp),%eax
 10d:	89 cb                	mov    %ecx,%ebx
 10f:	89 df                	mov    %ebx,%edi
 111:	89 d1                	mov    %edx,%ecx
 113:	fc                   	cld    
 114:	f3 aa                	rep stos %al,%es:(%edi)
 116:	89 ca                	mov    %ecx,%edx
 118:	89 fb                	mov    %edi,%ebx
 11a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 11d:	89 55 10             	mov    %edx,0x10(%ebp)
 120:	90                   	nop
 121:	5b                   	pop    %ebx
 122:	5f                   	pop    %edi
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <strcpy>:
 125:	55                   	push   %ebp
 126:	89 e5                	mov    %esp,%ebp
 128:	83 ec 10             	sub    $0x10,%esp
 12b:	8b 45 08             	mov    0x8(%ebp),%eax
 12e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 131:	90                   	nop
 132:	8b 45 08             	mov    0x8(%ebp),%eax
 135:	8d 50 01             	lea    0x1(%eax),%edx
 138:	89 55 08             	mov    %edx,0x8(%ebp)
 13b:	8b 55 0c             	mov    0xc(%ebp),%edx
 13e:	8d 4a 01             	lea    0x1(%edx),%ecx
 141:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 144:	0f b6 12             	movzbl (%edx),%edx
 147:	88 10                	mov    %dl,(%eax)
 149:	0f b6 00             	movzbl (%eax),%eax
 14c:	84 c0                	test   %al,%al
 14e:	75 e2                	jne    132 <strcpy+0xd>
 150:	8b 45 fc             	mov    -0x4(%ebp),%eax
 153:	c9                   	leave  
 154:	c3                   	ret    

00000155 <strcmp>:
 155:	55                   	push   %ebp
 156:	89 e5                	mov    %esp,%ebp
 158:	eb 08                	jmp    162 <strcmp+0xd>
 15a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 15e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	0f b6 00             	movzbl (%eax),%eax
 168:	84 c0                	test   %al,%al
 16a:	74 10                	je     17c <strcmp+0x27>
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	0f b6 10             	movzbl (%eax),%edx
 172:	8b 45 0c             	mov    0xc(%ebp),%eax
 175:	0f b6 00             	movzbl (%eax),%eax
 178:	38 c2                	cmp    %al,%dl
 17a:	74 de                	je     15a <strcmp+0x5>
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 00             	movzbl (%eax),%eax
 182:	0f b6 d0             	movzbl %al,%edx
 185:	8b 45 0c             	mov    0xc(%ebp),%eax
 188:	0f b6 00             	movzbl (%eax),%eax
 18b:	0f b6 c0             	movzbl %al,%eax
 18e:	29 c2                	sub    %eax,%edx
 190:	89 d0                	mov    %edx,%eax
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    

00000194 <strlen>:
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	83 ec 10             	sub    $0x10,%esp
 19a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1a1:	eb 04                	jmp    1a7 <strlen+0x13>
 1a3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1a7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1aa:	8b 45 08             	mov    0x8(%ebp),%eax
 1ad:	01 d0                	add    %edx,%eax
 1af:	0f b6 00             	movzbl (%eax),%eax
 1b2:	84 c0                	test   %al,%al
 1b4:	75 ed                	jne    1a3 <strlen+0xf>
 1b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 1b9:	c9                   	leave  
 1ba:	c3                   	ret    

000001bb <memset>:
 1bb:	55                   	push   %ebp
 1bc:	89 e5                	mov    %esp,%ebp
 1be:	8b 45 10             	mov    0x10(%ebp),%eax
 1c1:	50                   	push   %eax
 1c2:	ff 75 0c             	pushl  0xc(%ebp)
 1c5:	ff 75 08             	pushl  0x8(%ebp)
 1c8:	e8 32 ff ff ff       	call   ff <stosb>
 1cd:	83 c4 0c             	add    $0xc,%esp
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	c9                   	leave  
 1d4:	c3                   	ret    

000001d5 <strchr>:
 1d5:	55                   	push   %ebp
 1d6:	89 e5                	mov    %esp,%ebp
 1d8:	83 ec 04             	sub    $0x4,%esp
 1db:	8b 45 0c             	mov    0xc(%ebp),%eax
 1de:	88 45 fc             	mov    %al,-0x4(%ebp)
 1e1:	eb 14                	jmp    1f7 <strchr+0x22>
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	0f b6 00             	movzbl (%eax),%eax
 1e9:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1ec:	75 05                	jne    1f3 <strchr+0x1e>
 1ee:	8b 45 08             	mov    0x8(%ebp),%eax
 1f1:	eb 13                	jmp    206 <strchr+0x31>
 1f3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1f7:	8b 45 08             	mov    0x8(%ebp),%eax
 1fa:	0f b6 00             	movzbl (%eax),%eax
 1fd:	84 c0                	test   %al,%al
 1ff:	75 e2                	jne    1e3 <strchr+0xe>
 201:	b8 00 00 00 00       	mov    $0x0,%eax
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <gets>:
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
 20b:	83 ec 18             	sub    $0x18,%esp
 20e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 215:	eb 42                	jmp    259 <gets+0x51>
 217:	83 ec 04             	sub    $0x4,%esp
 21a:	6a 01                	push   $0x1
 21c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 21f:	50                   	push   %eax
 220:	6a 00                	push   $0x0
 222:	e8 47 01 00 00       	call   36e <read>
 227:	83 c4 10             	add    $0x10,%esp
 22a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 22d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 231:	7e 33                	jle    266 <gets+0x5e>
 233:	8b 45 f4             	mov    -0xc(%ebp),%eax
 236:	8d 50 01             	lea    0x1(%eax),%edx
 239:	89 55 f4             	mov    %edx,-0xc(%ebp)
 23c:	89 c2                	mov    %eax,%edx
 23e:	8b 45 08             	mov    0x8(%ebp),%eax
 241:	01 c2                	add    %eax,%edx
 243:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 247:	88 02                	mov    %al,(%edx)
 249:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 24d:	3c 0a                	cmp    $0xa,%al
 24f:	74 16                	je     267 <gets+0x5f>
 251:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 255:	3c 0d                	cmp    $0xd,%al
 257:	74 0e                	je     267 <gets+0x5f>
 259:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25c:	83 c0 01             	add    $0x1,%eax
 25f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 262:	7c b3                	jl     217 <gets+0xf>
 264:	eb 01                	jmp    267 <gets+0x5f>
 266:	90                   	nop
 267:	8b 55 f4             	mov    -0xc(%ebp),%edx
 26a:	8b 45 08             	mov    0x8(%ebp),%eax
 26d:	01 d0                	add    %edx,%eax
 26f:	c6 00 00             	movb   $0x0,(%eax)
 272:	8b 45 08             	mov    0x8(%ebp),%eax
 275:	c9                   	leave  
 276:	c3                   	ret    

00000277 <stat>:
 277:	55                   	push   %ebp
 278:	89 e5                	mov    %esp,%ebp
 27a:	83 ec 18             	sub    $0x18,%esp
 27d:	83 ec 08             	sub    $0x8,%esp
 280:	6a 00                	push   $0x0
 282:	ff 75 08             	pushl  0x8(%ebp)
 285:	e8 0c 01 00 00       	call   396 <open>
 28a:	83 c4 10             	add    $0x10,%esp
 28d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 290:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 294:	79 07                	jns    29d <stat+0x26>
 296:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 29b:	eb 25                	jmp    2c2 <stat+0x4b>
 29d:	83 ec 08             	sub    $0x8,%esp
 2a0:	ff 75 0c             	pushl  0xc(%ebp)
 2a3:	ff 75 f4             	pushl  -0xc(%ebp)
 2a6:	e8 03 01 00 00       	call   3ae <fstat>
 2ab:	83 c4 10             	add    $0x10,%esp
 2ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
 2b1:	83 ec 0c             	sub    $0xc,%esp
 2b4:	ff 75 f4             	pushl  -0xc(%ebp)
 2b7:	e8 c2 00 00 00       	call   37e <close>
 2bc:	83 c4 10             	add    $0x10,%esp
 2bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2c2:	c9                   	leave  
 2c3:	c3                   	ret    

000002c4 <atoi>:
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	83 ec 10             	sub    $0x10,%esp
 2ca:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2d1:	eb 25                	jmp    2f8 <atoi+0x34>
 2d3:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2d6:	89 d0                	mov    %edx,%eax
 2d8:	c1 e0 02             	shl    $0x2,%eax
 2db:	01 d0                	add    %edx,%eax
 2dd:	01 c0                	add    %eax,%eax
 2df:	89 c1                	mov    %eax,%ecx
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	8d 50 01             	lea    0x1(%eax),%edx
 2e7:	89 55 08             	mov    %edx,0x8(%ebp)
 2ea:	0f b6 00             	movzbl (%eax),%eax
 2ed:	0f be c0             	movsbl %al,%eax
 2f0:	01 c8                	add    %ecx,%eax
 2f2:	83 e8 30             	sub    $0x30,%eax
 2f5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 2f8:	8b 45 08             	mov    0x8(%ebp),%eax
 2fb:	0f b6 00             	movzbl (%eax),%eax
 2fe:	3c 2f                	cmp    $0x2f,%al
 300:	7e 0a                	jle    30c <atoi+0x48>
 302:	8b 45 08             	mov    0x8(%ebp),%eax
 305:	0f b6 00             	movzbl (%eax),%eax
 308:	3c 39                	cmp    $0x39,%al
 30a:	7e c7                	jle    2d3 <atoi+0xf>
 30c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 30f:	c9                   	leave  
 310:	c3                   	ret    

00000311 <memmove>:
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	83 ec 10             	sub    $0x10,%esp
 317:	8b 45 08             	mov    0x8(%ebp),%eax
 31a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 31d:	8b 45 0c             	mov    0xc(%ebp),%eax
 320:	89 45 f8             	mov    %eax,-0x8(%ebp)
 323:	eb 17                	jmp    33c <memmove+0x2b>
 325:	8b 45 fc             	mov    -0x4(%ebp),%eax
 328:	8d 50 01             	lea    0x1(%eax),%edx
 32b:	89 55 fc             	mov    %edx,-0x4(%ebp)
 32e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 331:	8d 4a 01             	lea    0x1(%edx),%ecx
 334:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 337:	0f b6 12             	movzbl (%edx),%edx
 33a:	88 10                	mov    %dl,(%eax)
 33c:	8b 45 10             	mov    0x10(%ebp),%eax
 33f:	8d 50 ff             	lea    -0x1(%eax),%edx
 342:	89 55 10             	mov    %edx,0x10(%ebp)
 345:	85 c0                	test   %eax,%eax
 347:	7f dc                	jg     325 <memmove+0x14>
 349:	8b 45 08             	mov    0x8(%ebp),%eax
 34c:	c9                   	leave  
 34d:	c3                   	ret    

0000034e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 34e:	b8 01 00 00 00       	mov    $0x1,%eax
 353:	cd 40                	int    $0x40
 355:	c3                   	ret    

00000356 <exit>:
SYSCALL(exit)
 356:	b8 02 00 00 00       	mov    $0x2,%eax
 35b:	cd 40                	int    $0x40
 35d:	c3                   	ret    

0000035e <wait>:
SYSCALL(wait)
 35e:	b8 03 00 00 00       	mov    $0x3,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret    

00000366 <pipe>:
SYSCALL(pipe)
 366:	b8 04 00 00 00       	mov    $0x4,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret    

0000036e <read>:
SYSCALL(read)
 36e:	b8 05 00 00 00       	mov    $0x5,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret    

00000376 <write>:
SYSCALL(write)
 376:	b8 10 00 00 00       	mov    $0x10,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <close>:
SYSCALL(close)
 37e:	b8 15 00 00 00       	mov    $0x15,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <kill>:
SYSCALL(kill)
 386:	b8 06 00 00 00       	mov    $0x6,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <exec>:
SYSCALL(exec)
 38e:	b8 07 00 00 00       	mov    $0x7,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <open>:
SYSCALL(open)
 396:	b8 0f 00 00 00       	mov    $0xf,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <mknod>:
SYSCALL(mknod)
 39e:	b8 11 00 00 00       	mov    $0x11,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <unlink>:
SYSCALL(unlink)
 3a6:	b8 12 00 00 00       	mov    $0x12,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <fstat>:
SYSCALL(fstat)
 3ae:	b8 08 00 00 00       	mov    $0x8,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <link>:
SYSCALL(link)
 3b6:	b8 13 00 00 00       	mov    $0x13,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <mkdir>:
SYSCALL(mkdir)
 3be:	b8 14 00 00 00       	mov    $0x14,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <chdir>:
SYSCALL(chdir)
 3c6:	b8 09 00 00 00       	mov    $0x9,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <dup>:
SYSCALL(dup)
 3ce:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <getpid>:
SYSCALL(getpid)
 3d6:	b8 0b 00 00 00       	mov    $0xb,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <sbrk>:
SYSCALL(sbrk)
 3de:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <sleep>:
SYSCALL(sleep)
 3e6:	b8 0d 00 00 00       	mov    $0xd,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <uptime>:
SYSCALL(uptime)
 3ee:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3f6:	55                   	push   %ebp
 3f7:	89 e5                	mov    %esp,%ebp
 3f9:	83 ec 18             	sub    $0x18,%esp
 3fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ff:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 402:	83 ec 04             	sub    $0x4,%esp
 405:	6a 01                	push   $0x1
 407:	8d 45 f4             	lea    -0xc(%ebp),%eax
 40a:	50                   	push   %eax
 40b:	ff 75 08             	pushl  0x8(%ebp)
 40e:	e8 63 ff ff ff       	call   376 <write>
 413:	83 c4 10             	add    $0x10,%esp
}
 416:	90                   	nop
 417:	c9                   	leave  
 418:	c3                   	ret    

00000419 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 419:	55                   	push   %ebp
 41a:	89 e5                	mov    %esp,%ebp
 41c:	53                   	push   %ebx
 41d:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 420:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 427:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 42b:	74 17                	je     444 <printint+0x2b>
 42d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 431:	79 11                	jns    444 <printint+0x2b>
    neg = 1;
 433:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 43a:	8b 45 0c             	mov    0xc(%ebp),%eax
 43d:	f7 d8                	neg    %eax
 43f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 442:	eb 06                	jmp    44a <printint+0x31>
  } else {
    x = xx;
 444:	8b 45 0c             	mov    0xc(%ebp),%eax
 447:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 44a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 451:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 454:	8d 41 01             	lea    0x1(%ecx),%eax
 457:	89 45 f4             	mov    %eax,-0xc(%ebp)
 45a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 45d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 460:	ba 00 00 00 00       	mov    $0x0,%edx
 465:	f7 f3                	div    %ebx
 467:	89 d0                	mov    %edx,%eax
 469:	0f b6 80 18 0b 00 00 	movzbl 0xb18(%eax),%eax
 470:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 474:	8b 5d 10             	mov    0x10(%ebp),%ebx
 477:	8b 45 ec             	mov    -0x14(%ebp),%eax
 47a:	ba 00 00 00 00       	mov    $0x0,%edx
 47f:	f7 f3                	div    %ebx
 481:	89 45 ec             	mov    %eax,-0x14(%ebp)
 484:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 488:	75 c7                	jne    451 <printint+0x38>
  if(neg)
 48a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 48e:	74 2d                	je     4bd <printint+0xa4>
    buf[i++] = '-';
 490:	8b 45 f4             	mov    -0xc(%ebp),%eax
 493:	8d 50 01             	lea    0x1(%eax),%edx
 496:	89 55 f4             	mov    %edx,-0xc(%ebp)
 499:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 49e:	eb 1d                	jmp    4bd <printint+0xa4>
    putc(fd, buf[i]);
 4a0:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a6:	01 d0                	add    %edx,%eax
 4a8:	0f b6 00             	movzbl (%eax),%eax
 4ab:	0f be c0             	movsbl %al,%eax
 4ae:	83 ec 08             	sub    $0x8,%esp
 4b1:	50                   	push   %eax
 4b2:	ff 75 08             	pushl  0x8(%ebp)
 4b5:	e8 3c ff ff ff       	call   3f6 <putc>
 4ba:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4bd:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4c5:	79 d9                	jns    4a0 <printint+0x87>
    putc(fd, buf[i]);
}
 4c7:	90                   	nop
 4c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4cb:	c9                   	leave  
 4cc:	c3                   	ret    

000004cd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4cd:	55                   	push   %ebp
 4ce:	89 e5                	mov    %esp,%ebp
 4d0:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4d3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4da:	8d 45 0c             	lea    0xc(%ebp),%eax
 4dd:	83 c0 04             	add    $0x4,%eax
 4e0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4e3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4ea:	e9 59 01 00 00       	jmp    648 <printf+0x17b>
    c = fmt[i] & 0xff;
 4ef:	8b 55 0c             	mov    0xc(%ebp),%edx
 4f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4f5:	01 d0                	add    %edx,%eax
 4f7:	0f b6 00             	movzbl (%eax),%eax
 4fa:	0f be c0             	movsbl %al,%eax
 4fd:	25 ff 00 00 00       	and    $0xff,%eax
 502:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 505:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 509:	75 2c                	jne    537 <printf+0x6a>
      if(c == '%'){
 50b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 50f:	75 0c                	jne    51d <printf+0x50>
        state = '%';
 511:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 518:	e9 27 01 00 00       	jmp    644 <printf+0x177>
      } else {
        putc(fd, c);
 51d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 520:	0f be c0             	movsbl %al,%eax
 523:	83 ec 08             	sub    $0x8,%esp
 526:	50                   	push   %eax
 527:	ff 75 08             	pushl  0x8(%ebp)
 52a:	e8 c7 fe ff ff       	call   3f6 <putc>
 52f:	83 c4 10             	add    $0x10,%esp
 532:	e9 0d 01 00 00       	jmp    644 <printf+0x177>
      }
    } else if(state == '%'){
 537:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 53b:	0f 85 03 01 00 00    	jne    644 <printf+0x177>
      if(c == 'd'){
 541:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 545:	75 1e                	jne    565 <printf+0x98>
        printint(fd, *ap, 10, 1);
 547:	8b 45 e8             	mov    -0x18(%ebp),%eax
 54a:	8b 00                	mov    (%eax),%eax
 54c:	6a 01                	push   $0x1
 54e:	6a 0a                	push   $0xa
 550:	50                   	push   %eax
 551:	ff 75 08             	pushl  0x8(%ebp)
 554:	e8 c0 fe ff ff       	call   419 <printint>
 559:	83 c4 10             	add    $0x10,%esp
        ap++;
 55c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 560:	e9 d8 00 00 00       	jmp    63d <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 565:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 569:	74 06                	je     571 <printf+0xa4>
 56b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 56f:	75 1e                	jne    58f <printf+0xc2>
        printint(fd, *ap, 16, 0);
 571:	8b 45 e8             	mov    -0x18(%ebp),%eax
 574:	8b 00                	mov    (%eax),%eax
 576:	6a 00                	push   $0x0
 578:	6a 10                	push   $0x10
 57a:	50                   	push   %eax
 57b:	ff 75 08             	pushl  0x8(%ebp)
 57e:	e8 96 fe ff ff       	call   419 <printint>
 583:	83 c4 10             	add    $0x10,%esp
        ap++;
 586:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 58a:	e9 ae 00 00 00       	jmp    63d <printf+0x170>
      } else if(c == 's'){
 58f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 593:	75 43                	jne    5d8 <printf+0x10b>
        s = (char*)*ap;
 595:	8b 45 e8             	mov    -0x18(%ebp),%eax
 598:	8b 00                	mov    (%eax),%eax
 59a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 59d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5a5:	75 25                	jne    5cc <printf+0xff>
          s = "(null)";
 5a7:	c7 45 f4 83 08 00 00 	movl   $0x883,-0xc(%ebp)
        while(*s != 0){
 5ae:	eb 1c                	jmp    5cc <printf+0xff>
          putc(fd, *s);
 5b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5b3:	0f b6 00             	movzbl (%eax),%eax
 5b6:	0f be c0             	movsbl %al,%eax
 5b9:	83 ec 08             	sub    $0x8,%esp
 5bc:	50                   	push   %eax
 5bd:	ff 75 08             	pushl  0x8(%ebp)
 5c0:	e8 31 fe ff ff       	call   3f6 <putc>
 5c5:	83 c4 10             	add    $0x10,%esp
          s++;
 5c8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5cf:	0f b6 00             	movzbl (%eax),%eax
 5d2:	84 c0                	test   %al,%al
 5d4:	75 da                	jne    5b0 <printf+0xe3>
 5d6:	eb 65                	jmp    63d <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5d8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5dc:	75 1d                	jne    5fb <printf+0x12e>
        putc(fd, *ap);
 5de:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e1:	8b 00                	mov    (%eax),%eax
 5e3:	0f be c0             	movsbl %al,%eax
 5e6:	83 ec 08             	sub    $0x8,%esp
 5e9:	50                   	push   %eax
 5ea:	ff 75 08             	pushl  0x8(%ebp)
 5ed:	e8 04 fe ff ff       	call   3f6 <putc>
 5f2:	83 c4 10             	add    $0x10,%esp
        ap++;
 5f5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5f9:	eb 42                	jmp    63d <printf+0x170>
      } else if(c == '%'){
 5fb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ff:	75 17                	jne    618 <printf+0x14b>
        putc(fd, c);
 601:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 604:	0f be c0             	movsbl %al,%eax
 607:	83 ec 08             	sub    $0x8,%esp
 60a:	50                   	push   %eax
 60b:	ff 75 08             	pushl  0x8(%ebp)
 60e:	e8 e3 fd ff ff       	call   3f6 <putc>
 613:	83 c4 10             	add    $0x10,%esp
 616:	eb 25                	jmp    63d <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 618:	83 ec 08             	sub    $0x8,%esp
 61b:	6a 25                	push   $0x25
 61d:	ff 75 08             	pushl  0x8(%ebp)
 620:	e8 d1 fd ff ff       	call   3f6 <putc>
 625:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 628:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 62b:	0f be c0             	movsbl %al,%eax
 62e:	83 ec 08             	sub    $0x8,%esp
 631:	50                   	push   %eax
 632:	ff 75 08             	pushl  0x8(%ebp)
 635:	e8 bc fd ff ff       	call   3f6 <putc>
 63a:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 63d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 644:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 648:	8b 55 0c             	mov    0xc(%ebp),%edx
 64b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 64e:	01 d0                	add    %edx,%eax
 650:	0f b6 00             	movzbl (%eax),%eax
 653:	84 c0                	test   %al,%al
 655:	0f 85 94 fe ff ff    	jne    4ef <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 65b:	90                   	nop
 65c:	c9                   	leave  
 65d:	c3                   	ret    

0000065e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 65e:	55                   	push   %ebp
 65f:	89 e5                	mov    %esp,%ebp
 661:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 664:	8b 45 08             	mov    0x8(%ebp),%eax
 667:	83 e8 08             	sub    $0x8,%eax
 66a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 66d:	a1 34 0b 00 00       	mov    0xb34,%eax
 672:	89 45 fc             	mov    %eax,-0x4(%ebp)
 675:	eb 24                	jmp    69b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 677:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67a:	8b 00                	mov    (%eax),%eax
 67c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 67f:	77 12                	ja     693 <free+0x35>
 681:	8b 45 f8             	mov    -0x8(%ebp),%eax
 684:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 687:	77 24                	ja     6ad <free+0x4f>
 689:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68c:	8b 00                	mov    (%eax),%eax
 68e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 691:	77 1a                	ja     6ad <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 693:	8b 45 fc             	mov    -0x4(%ebp),%eax
 696:	8b 00                	mov    (%eax),%eax
 698:	89 45 fc             	mov    %eax,-0x4(%ebp)
 69b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6a1:	76 d4                	jbe    677 <free+0x19>
 6a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a6:	8b 00                	mov    (%eax),%eax
 6a8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ab:	76 ca                	jbe    677 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b0:	8b 40 04             	mov    0x4(%eax),%eax
 6b3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6bd:	01 c2                	add    %eax,%edx
 6bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c2:	8b 00                	mov    (%eax),%eax
 6c4:	39 c2                	cmp    %eax,%edx
 6c6:	75 24                	jne    6ec <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6cb:	8b 50 04             	mov    0x4(%eax),%edx
 6ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d1:	8b 00                	mov    (%eax),%eax
 6d3:	8b 40 04             	mov    0x4(%eax),%eax
 6d6:	01 c2                	add    %eax,%edx
 6d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6db:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e1:	8b 00                	mov    (%eax),%eax
 6e3:	8b 10                	mov    (%eax),%edx
 6e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e8:	89 10                	mov    %edx,(%eax)
 6ea:	eb 0a                	jmp    6f6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ef:	8b 10                	mov    (%eax),%edx
 6f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f9:	8b 40 04             	mov    0x4(%eax),%eax
 6fc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 703:	8b 45 fc             	mov    -0x4(%ebp),%eax
 706:	01 d0                	add    %edx,%eax
 708:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 70b:	75 20                	jne    72d <free+0xcf>
    p->s.size += bp->s.size;
 70d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 710:	8b 50 04             	mov    0x4(%eax),%edx
 713:	8b 45 f8             	mov    -0x8(%ebp),%eax
 716:	8b 40 04             	mov    0x4(%eax),%eax
 719:	01 c2                	add    %eax,%edx
 71b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 721:	8b 45 f8             	mov    -0x8(%ebp),%eax
 724:	8b 10                	mov    (%eax),%edx
 726:	8b 45 fc             	mov    -0x4(%ebp),%eax
 729:	89 10                	mov    %edx,(%eax)
 72b:	eb 08                	jmp    735 <free+0xd7>
  } else
    p->s.ptr = bp;
 72d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 730:	8b 55 f8             	mov    -0x8(%ebp),%edx
 733:	89 10                	mov    %edx,(%eax)
  freep = p;
 735:	8b 45 fc             	mov    -0x4(%ebp),%eax
 738:	a3 34 0b 00 00       	mov    %eax,0xb34
}
 73d:	90                   	nop
 73e:	c9                   	leave  
 73f:	c3                   	ret    

00000740 <morecore>:

static Header*
morecore(uint nu)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 746:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 74d:	77 07                	ja     756 <morecore+0x16>
    nu = 4096;
 74f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 756:	8b 45 08             	mov    0x8(%ebp),%eax
 759:	c1 e0 03             	shl    $0x3,%eax
 75c:	83 ec 0c             	sub    $0xc,%esp
 75f:	50                   	push   %eax
 760:	e8 79 fc ff ff       	call   3de <sbrk>
 765:	83 c4 10             	add    $0x10,%esp
 768:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 76b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 76f:	75 07                	jne    778 <morecore+0x38>
    return 0;
 771:	b8 00 00 00 00       	mov    $0x0,%eax
 776:	eb 26                	jmp    79e <morecore+0x5e>
  hp = (Header*)p;
 778:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 77e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 781:	8b 55 08             	mov    0x8(%ebp),%edx
 784:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 787:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78a:	83 c0 08             	add    $0x8,%eax
 78d:	83 ec 0c             	sub    $0xc,%esp
 790:	50                   	push   %eax
 791:	e8 c8 fe ff ff       	call   65e <free>
 796:	83 c4 10             	add    $0x10,%esp
  return freep;
 799:	a1 34 0b 00 00       	mov    0xb34,%eax
}
 79e:	c9                   	leave  
 79f:	c3                   	ret    

000007a0 <malloc>:

void*
malloc(uint nbytes)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a6:	8b 45 08             	mov    0x8(%ebp),%eax
 7a9:	83 c0 07             	add    $0x7,%eax
 7ac:	c1 e8 03             	shr    $0x3,%eax
 7af:	83 c0 01             	add    $0x1,%eax
 7b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7b5:	a1 34 0b 00 00       	mov    0xb34,%eax
 7ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7bd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7c1:	75 23                	jne    7e6 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7c3:	c7 45 f0 2c 0b 00 00 	movl   $0xb2c,-0x10(%ebp)
 7ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cd:	a3 34 0b 00 00       	mov    %eax,0xb34
 7d2:	a1 34 0b 00 00       	mov    0xb34,%eax
 7d7:	a3 2c 0b 00 00       	mov    %eax,0xb2c
    base.s.size = 0;
 7dc:	c7 05 30 0b 00 00 00 	movl   $0x0,0xb30
 7e3:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e9:	8b 00                	mov    (%eax),%eax
 7eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f1:	8b 40 04             	mov    0x4(%eax),%eax
 7f4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7f7:	72 4d                	jb     846 <malloc+0xa6>
      if(p->s.size == nunits)
 7f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fc:	8b 40 04             	mov    0x4(%eax),%eax
 7ff:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 802:	75 0c                	jne    810 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 804:	8b 45 f4             	mov    -0xc(%ebp),%eax
 807:	8b 10                	mov    (%eax),%edx
 809:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80c:	89 10                	mov    %edx,(%eax)
 80e:	eb 26                	jmp    836 <malloc+0x96>
      else {
        p->s.size -= nunits;
 810:	8b 45 f4             	mov    -0xc(%ebp),%eax
 813:	8b 40 04             	mov    0x4(%eax),%eax
 816:	2b 45 ec             	sub    -0x14(%ebp),%eax
 819:	89 c2                	mov    %eax,%edx
 81b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 821:	8b 45 f4             	mov    -0xc(%ebp),%eax
 824:	8b 40 04             	mov    0x4(%eax),%eax
 827:	c1 e0 03             	shl    $0x3,%eax
 82a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 82d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 830:	8b 55 ec             	mov    -0x14(%ebp),%edx
 833:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 836:	8b 45 f0             	mov    -0x10(%ebp),%eax
 839:	a3 34 0b 00 00       	mov    %eax,0xb34
      return (void*)(p + 1);
 83e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 841:	83 c0 08             	add    $0x8,%eax
 844:	eb 3b                	jmp    881 <malloc+0xe1>
    }
    if(p == freep)
 846:	a1 34 0b 00 00       	mov    0xb34,%eax
 84b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 84e:	75 1e                	jne    86e <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 850:	83 ec 0c             	sub    $0xc,%esp
 853:	ff 75 ec             	pushl  -0x14(%ebp)
 856:	e8 e5 fe ff ff       	call   740 <morecore>
 85b:	83 c4 10             	add    $0x10,%esp
 85e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 861:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 865:	75 07                	jne    86e <malloc+0xce>
        return 0;
 867:	b8 00 00 00 00       	mov    $0x0,%eax
 86c:	eb 13                	jmp    881 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 871:	89 45 f0             	mov    %eax,-0x10(%ebp)
 874:	8b 45 f4             	mov    -0xc(%ebp),%eax
 877:	8b 00                	mov    (%eax),%eax
 879:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 87c:	e9 6d ff ff ff       	jmp    7ee <malloc+0x4e>
}
 881:	c9                   	leave  
 882:	c3                   	ret    
