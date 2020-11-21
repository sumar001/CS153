
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
   6:	e8 35 00 00 00       	call   40 <forktest>
  exit();
   b:	e8 42 03 00 00       	call   352 <exit>

00000010 <printf>:
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	53                   	push   %ebx
  14:	83 ec 14             	sub    $0x14,%esp
  17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  1a:	89 1c 24             	mov    %ebx,(%esp)
  1d:	e8 8e 01 00 00       	call   1b0 <strlen>
  22:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  26:	89 44 24 08          	mov    %eax,0x8(%esp)
  2a:	8b 45 08             	mov    0x8(%ebp),%eax
  2d:	89 04 24             	mov    %eax,(%esp)
  30:	e8 3d 03 00 00       	call   372 <write>
}
  35:	83 c4 14             	add    $0x14,%esp
  38:	5b                   	pop    %ebx
  39:	5d                   	pop    %ebp
  3a:	c3                   	ret    
  3b:	90                   	nop
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000040 <forktest>:
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	53                   	push   %ebx
  for(n=0; n<N; n++){
  44:	31 db                	xor    %ebx,%ebx
{
  46:	83 ec 14             	sub    $0x14,%esp
  printf(1, "fork test\n");
  49:	c7 44 24 04 14 04 00 	movl   $0x414,0x4(%esp)
  50:	00 
  51:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  58:	e8 b3 ff ff ff       	call   10 <printf>
  5d:	eb 13                	jmp    72 <forktest+0x32>
  5f:	90                   	nop
    if(pid == 0)
  60:	0f 84 9f 00 00 00    	je     105 <forktest+0xc5>
  for(n=0; n<N; n++){
  66:	83 c3 01             	add    $0x1,%ebx
  69:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  6f:	90                   	nop
  70:	74 56                	je     c8 <forktest+0x88>
    pid = fork();
  72:	e8 d3 02 00 00       	call   34a <fork>
    if(pid < 0)
  77:	85 c0                	test   %eax,%eax
  79:	79 e5                	jns    60 <forktest+0x20>
  for(; n > 0; n--){
  7b:	85 db                	test   %ebx,%ebx
  7d:	8d 76 00             	lea    0x0(%esi),%esi
  80:	74 1b                	je     9d <forktest+0x5d>
  82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait(0) < 0){
  88:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  8f:	e8 c6 02 00 00       	call   35a <wait>
  94:	85 c0                	test   %eax,%eax
  96:	78 59                	js     f1 <forktest+0xb1>
  for(; n > 0; n--){
  98:	83 eb 01             	sub    $0x1,%ebx
  9b:	75 eb                	jne    88 <forktest+0x48>
  if(wait(0) != -1){
  9d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a4:	e8 b1 02 00 00       	call   35a <wait>
  a9:	83 f8 ff             	cmp    $0xffffffff,%eax
  ac:	75 5c                	jne    10a <forktest+0xca>
  printf(1, "fork test OK\n");
  ae:	c7 44 24 04 46 04 00 	movl   $0x446,0x4(%esp)
  b5:	00 
  b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bd:	e8 4e ff ff ff       	call   10 <printf>
}
  c2:	83 c4 14             	add    $0x14,%esp
  c5:	5b                   	pop    %ebx
  c6:	5d                   	pop    %ebp
  c7:	c3                   	ret    
  write(fd, s, strlen(s));
  c8:	c7 04 24 54 04 00 00 	movl   $0x454,(%esp)
  cf:	e8 dc 00 00 00       	call   1b0 <strlen>
  d4:	c7 44 24 04 54 04 00 	movl   $0x454,0x4(%esp)
  db:	00 
  dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e3:	89 44 24 08          	mov    %eax,0x8(%esp)
  e7:	e8 86 02 00 00       	call   372 <write>
    exit();
  ec:	e8 61 02 00 00       	call   352 <exit>
      printf(1, "wait stopped early\n");
  f1:	c7 44 24 04 1f 04 00 	movl   $0x41f,0x4(%esp)
  f8:	00 
  f9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 100:	e8 0b ff ff ff       	call   10 <printf>
      exit();
 105:	e8 48 02 00 00       	call   352 <exit>
    printf(1, "wait got too many\n");
 10a:	c7 44 24 04 33 04 00 	movl   $0x433,0x4(%esp)
 111:	00 
 112:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 119:	e8 f2 fe ff ff       	call   10 <printf>
    exit();
 11e:	e8 2f 02 00 00       	call   352 <exit>
 123:	66 90                	xchg   %ax,%ax
 125:	66 90                	xchg   %ax,%ax
 127:	66 90                	xchg   %ax,%ax
 129:	66 90                	xchg   %ax,%ax
 12b:	66 90                	xchg   %ax,%ax
 12d:	66 90                	xchg   %ax,%ax
 12f:	90                   	nop

00000130 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 139:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 13a:	89 c2                	mov    %eax,%edx
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 140:	83 c1 01             	add    $0x1,%ecx
 143:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 147:	83 c2 01             	add    $0x1,%edx
 14a:	84 db                	test   %bl,%bl
 14c:	88 5a ff             	mov    %bl,-0x1(%edx)
 14f:	75 ef                	jne    140 <strcpy+0x10>
    ;
  return os;
}
 151:	5b                   	pop    %ebx
 152:	5d                   	pop    %ebp
 153:	c3                   	ret    
 154:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 15a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000160 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 55 08             	mov    0x8(%ebp),%edx
 166:	53                   	push   %ebx
 167:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 16a:	0f b6 02             	movzbl (%edx),%eax
 16d:	84 c0                	test   %al,%al
 16f:	74 2d                	je     19e <strcmp+0x3e>
 171:	0f b6 19             	movzbl (%ecx),%ebx
 174:	38 d8                	cmp    %bl,%al
 176:	74 0e                	je     186 <strcmp+0x26>
 178:	eb 2b                	jmp    1a5 <strcmp+0x45>
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 180:	38 c8                	cmp    %cl,%al
 182:	75 15                	jne    199 <strcmp+0x39>
    p++, q++;
 184:	89 d9                	mov    %ebx,%ecx
 186:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 189:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 18c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 18f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 193:	84 c0                	test   %al,%al
 195:	75 e9                	jne    180 <strcmp+0x20>
 197:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 199:	29 c8                	sub    %ecx,%eax
}
 19b:	5b                   	pop    %ebx
 19c:	5d                   	pop    %ebp
 19d:	c3                   	ret    
 19e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 1a1:	31 c0                	xor    %eax,%eax
 1a3:	eb f4                	jmp    199 <strcmp+0x39>
 1a5:	0f b6 cb             	movzbl %bl,%ecx
 1a8:	eb ef                	jmp    199 <strcmp+0x39>
 1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001b0 <strlen>:

uint
strlen(const char *s)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1b6:	80 39 00             	cmpb   $0x0,(%ecx)
 1b9:	74 12                	je     1cd <strlen+0x1d>
 1bb:	31 d2                	xor    %edx,%edx
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	83 c2 01             	add    $0x1,%edx
 1c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1c7:	89 d0                	mov    %edx,%eax
 1c9:	75 f5                	jne    1c0 <strlen+0x10>
    ;
  return n;
}
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
  for(n = 0; s[n]; n++)
 1cd:	31 c0                	xor    %eax,%eax
}
 1cf:	5d                   	pop    %ebp
 1d0:	c3                   	ret    
 1d1:	eb 0d                	jmp    1e0 <memset>
 1d3:	90                   	nop
 1d4:	90                   	nop
 1d5:	90                   	nop
 1d6:	90                   	nop
 1d7:	90                   	nop
 1d8:	90                   	nop
 1d9:	90                   	nop
 1da:	90                   	nop
 1db:	90                   	nop
 1dc:	90                   	nop
 1dd:	90                   	nop
 1de:	90                   	nop
 1df:	90                   	nop

000001e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 55 08             	mov    0x8(%ebp),%edx
 1e6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ed:	89 d7                	mov    %edx,%edi
 1ef:	fc                   	cld    
 1f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f2:	89 d0                	mov    %edx,%eax
 1f4:	5f                   	pop    %edi
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <strchr>:

char*
strchr(const char *s, char c)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	53                   	push   %ebx
 207:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 20a:	0f b6 18             	movzbl (%eax),%ebx
 20d:	84 db                	test   %bl,%bl
 20f:	74 1d                	je     22e <strchr+0x2e>
    if(*s == c)
 211:	38 d3                	cmp    %dl,%bl
 213:	89 d1                	mov    %edx,%ecx
 215:	75 0d                	jne    224 <strchr+0x24>
 217:	eb 17                	jmp    230 <strchr+0x30>
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 220:	38 ca                	cmp    %cl,%dl
 222:	74 0c                	je     230 <strchr+0x30>
  for(; *s; s++)
 224:	83 c0 01             	add    $0x1,%eax
 227:	0f b6 10             	movzbl (%eax),%edx
 22a:	84 d2                	test   %dl,%dl
 22c:	75 f2                	jne    220 <strchr+0x20>
      return (char*)s;
  return 0;
 22e:	31 c0                	xor    %eax,%eax
}
 230:	5b                   	pop    %ebx
 231:	5d                   	pop    %ebp
 232:	c3                   	ret    
 233:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <gets>:

char*
gets(char *buf, int max)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 245:	31 f6                	xor    %esi,%esi
{
 247:	53                   	push   %ebx
 248:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 24b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 24e:	eb 31                	jmp    281 <gets+0x41>
    cc = read(0, &c, 1);
 250:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 257:	00 
 258:	89 7c 24 04          	mov    %edi,0x4(%esp)
 25c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 263:	e8 02 01 00 00       	call   36a <read>
    if(cc < 1)
 268:	85 c0                	test   %eax,%eax
 26a:	7e 1d                	jle    289 <gets+0x49>
      break;
    buf[i++] = c;
 26c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 270:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 272:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 275:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 277:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 27b:	74 0c                	je     289 <gets+0x49>
 27d:	3c 0a                	cmp    $0xa,%al
 27f:	74 08                	je     289 <gets+0x49>
  for(i=0; i+1 < max; ){
 281:	8d 5e 01             	lea    0x1(%esi),%ebx
 284:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 287:	7c c7                	jl     250 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 289:	8b 45 08             	mov    0x8(%ebp),%eax
 28c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 290:	83 c4 2c             	add    $0x2c,%esp
 293:	5b                   	pop    %ebx
 294:	5e                   	pop    %esi
 295:	5f                   	pop    %edi
 296:	5d                   	pop    %ebp
 297:	c3                   	ret    
 298:	90                   	nop
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
 2a5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2b2:	00 
 2b3:	89 04 24             	mov    %eax,(%esp)
 2b6:	e8 d7 00 00 00       	call   392 <open>
  if(fd < 0)
 2bb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 2bd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2bf:	78 27                	js     2e8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c4:	89 1c 24             	mov    %ebx,(%esp)
 2c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2cb:	e8 da 00 00 00       	call   3aa <fstat>
  close(fd);
 2d0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2d3:	89 c6                	mov    %eax,%esi
  close(fd);
 2d5:	e8 a0 00 00 00       	call   37a <close>
  return r;
 2da:	89 f0                	mov    %esi,%eax
}
 2dc:	83 c4 10             	add    $0x10,%esp
 2df:	5b                   	pop    %ebx
 2e0:	5e                   	pop    %esi
 2e1:	5d                   	pop    %ebp
 2e2:	c3                   	ret    
 2e3:	90                   	nop
 2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ed:	eb ed                	jmp    2dc <stat+0x3c>
 2ef:	90                   	nop

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f7:	0f be 11             	movsbl (%ecx),%edx
 2fa:	8d 42 d0             	lea    -0x30(%edx),%eax
 2fd:	3c 09                	cmp    $0x9,%al
  n = 0;
 2ff:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 304:	77 17                	ja     31d <atoi+0x2d>
 306:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 308:	83 c1 01             	add    $0x1,%ecx
 30b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 30e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 312:	0f be 11             	movsbl (%ecx),%edx
 315:	8d 5a d0             	lea    -0x30(%edx),%ebx
 318:	80 fb 09             	cmp    $0x9,%bl
 31b:	76 eb                	jbe    308 <atoi+0x18>
  return n;
}
 31d:	5b                   	pop    %ebx
 31e:	5d                   	pop    %ebp
 31f:	c3                   	ret    

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 321:	31 d2                	xor    %edx,%edx
{
 323:	89 e5                	mov    %esp,%ebp
 325:	56                   	push   %esi
 326:	8b 45 08             	mov    0x8(%ebp),%eax
 329:	53                   	push   %ebx
 32a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 32d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 330:	85 db                	test   %ebx,%ebx
 332:	7e 12                	jle    346 <memmove+0x26>
 334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 338:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 33c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 33f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 342:	39 da                	cmp    %ebx,%edx
 344:	75 f2                	jne    338 <memmove+0x18>
  return vdst;
}
 346:	5b                   	pop    %ebx
 347:	5e                   	pop    %esi
 348:	5d                   	pop    %ebp
 349:	c3                   	ret    

0000034a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 34a:	b8 01 00 00 00       	mov    $0x1,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <exit>:
SYSCALL(exit)
 352:	b8 02 00 00 00       	mov    $0x2,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <wait>:
SYSCALL(wait)
 35a:	b8 03 00 00 00       	mov    $0x3,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <pipe>:
SYSCALL(pipe)
 362:	b8 04 00 00 00       	mov    $0x4,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <read>:
SYSCALL(read)
 36a:	b8 05 00 00 00       	mov    $0x5,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <write>:
SYSCALL(write)
 372:	b8 10 00 00 00       	mov    $0x10,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <close>:
SYSCALL(close)
 37a:	b8 15 00 00 00       	mov    $0x15,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <kill>:
SYSCALL(kill)
 382:	b8 06 00 00 00       	mov    $0x6,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <exec>:
SYSCALL(exec)
 38a:	b8 07 00 00 00       	mov    $0x7,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <open>:
SYSCALL(open)
 392:	b8 0f 00 00 00       	mov    $0xf,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <mknod>:
SYSCALL(mknod)
 39a:	b8 11 00 00 00       	mov    $0x11,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <unlink>:
SYSCALL(unlink)
 3a2:	b8 12 00 00 00       	mov    $0x12,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <fstat>:
SYSCALL(fstat)
 3aa:	b8 08 00 00 00       	mov    $0x8,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <link>:
SYSCALL(link)
 3b2:	b8 13 00 00 00       	mov    $0x13,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <mkdir>:
SYSCALL(mkdir)
 3ba:	b8 14 00 00 00       	mov    $0x14,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <chdir>:
SYSCALL(chdir)
 3c2:	b8 09 00 00 00       	mov    $0x9,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <dup>:
SYSCALL(dup)
 3ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <getpid>:
SYSCALL(getpid)
 3d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <sbrk>:
SYSCALL(sbrk)
 3da:	b8 0c 00 00 00       	mov    $0xc,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <sleep>:
SYSCALL(sleep)
 3e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <uptime>:
SYSCALL(uptime)
 3ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <exitUDef>:
SYSCALL(exitUDef)
 3f2:	b8 16 00 00 00       	mov    $0x16,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <waitpid>:
SYSCALL(waitpid)
 3fa:	b8 17 00 00 00       	mov    $0x17,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <setPriority>:
SYSCALL(setPriority)
 402:	b8 18 00 00 00       	mov    $0x18,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <getPriority>:
SYSCALL(getPriority)
 40a:	b8 19 00 00 00       	mov    $0x19,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    
