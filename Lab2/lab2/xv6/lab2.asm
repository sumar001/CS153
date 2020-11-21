
_lab2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
	
	int PScheduler(void);

  printf(1, "\n This program tests the correctness of your lab#2\n");
   9:	c7 44 24 04 08 0a 00 	movl   $0xa08,0x4(%esp)
  10:	00 
  11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  18:	e8 d3 04 00 00       	call   4f0 <printf>
  
	PScheduler();
  1d:	e8 0e 00 00 00       	call   30 <PScheduler>
  22:	66 90                	xchg   %ax,%ax
  24:	66 90                	xchg   %ax,%ax
  26:	66 90                	xchg   %ax,%ax
  28:	66 90                	xchg   %ax,%ax
  2a:	66 90                	xchg   %ax,%ax
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax

00000030 <PScheduler>:
	return 0;
 }
  
    
     int PScheduler(void){
  30:	55                   	push   %ebp
  31:	89 e5                	mov    %esp,%ebp
  33:	53                   	push   %ebx
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 31\n");
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 10\n");
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    setPriority(0);
    for (i = 0; i <  3; i++) {
  34:	31 db                	xor    %ebx,%ebx
     int PScheduler(void){
  36:	83 ec 24             	sub    $0x24,%esp
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
  39:	c7 44 24 04 58 08 00 	movl   $0x858,0x4(%esp)
  40:	00 
  41:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  48:	e8 a3 04 00 00       	call   4f0 <printf>
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 31\n");
  4d:	c7 44 24 04 b0 08 00 	movl   $0x8b0,0x4(%esp)
  54:	00 
  55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5c:	e8 8f 04 00 00       	call   4f0 <printf>
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 10\n");
  61:	c7 44 24 04 00 09 00 	movl   $0x900,0x4(%esp)
  68:	00 
  69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  70:	e8 7b 04 00 00       	call   4f0 <printf>
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
  75:	c7 44 24 04 54 09 00 	movl   $0x954,0x4(%esp)
  7c:	00 
  7d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  84:	e8 67 04 00 00       	call   4f0 <printf>
    setPriority(0);
  89:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  90:	e8 9d 03 00 00       	call   432 <setPriority>
	pid = fork();
  95:	e8 e0 02 00 00       	call   37a <fork>
	if (pid > 0 ) {
  9a:	83 f8 00             	cmp    $0x0,%eax
  9d:	7e 49                	jle    e8 <PScheduler+0xb8>
    for (i = 0; i <  3; i++) {
  9f:	83 c3 01             	add    $0x1,%ebx
  a2:	83 fb 03             	cmp    $0x3,%ebx
  a5:	75 ee                	jne    95 <PScheduler+0x65>
			printf(2," \n Error \n");
			
        }
	}

	if(pid > 0) {
  a7:	85 c0                	test   %eax,%eax
  a9:	7e 38                	jle    e3 <PScheduler+0xb3>
		for (i = 0; i <  3; i++) {
			wait(0);
  ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  b2:	e8 d3 02 00 00       	call   38a <wait>
  b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  be:	e8 c7 02 00 00       	call   38a <wait>
  c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  ca:	e8 bb 02 00 00       	call   38a <wait>

		}
                     printf(1,"\n if processes with highest priority finished first then its correct \n");
  cf:	c7 44 24 04 c0 09 00 	movl   $0x9c0,0x4(%esp)
  d6:	00 
  d7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  de:	e8 0d 04 00 00       	call   4f0 <printf>
}
	exit();		
  e3:	e8 9a 02 00 00       	call   382 <exit>
	else if ( pid == 0) {
  e8:	74 1c                	je     106 <PScheduler+0xd6>
			printf(2," \n Error \n");
  ea:	c7 44 24 04 3c 0a 00 	movl   $0xa3c,0x4(%esp)
  f1:	00 
  f2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  fc:	e8 ef 03 00 00       	call   4f0 <printf>
 101:	8b 45 f4             	mov    -0xc(%ebp),%eax
 104:	eb 99                	jmp    9f <PScheduler+0x6f>
		setPriority(30-10*i);	
 106:	6b db f6             	imul   $0xfffffff6,%ebx,%ebx
 109:	83 c3 1e             	add    $0x1e,%ebx
 10c:	89 1c 24             	mov    %ebx,(%esp)
 10f:	e8 1e 03 00 00       	call   432 <setPriority>
 114:	ba 50 c3 00 00       	mov    $0xc350,%edx
 119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for (i = 0; i <  3; i++) {
 120:	b8 e8 03 00 00       	mov    $0x3e8,%eax
 125:	8d 76 00             	lea    0x0(%esi),%esi
				asm("nop"); }}
 128:	90                   	nop
			for(k=0;k<1000;k++) {
 129:	83 e8 01             	sub    $0x1,%eax
 12c:	75 fa                	jne    128 <PScheduler+0xf8>
		for (j=0;j<50000;j++) {
 12e:	83 ea 01             	sub    $0x1,%edx
 131:	75 ed                	jne    120 <PScheduler+0xf0>
		printf(1, "\n child# %d with priority %d has finished! \n",getpid(),30-10*i);		
 133:	e8 ca 02 00 00       	call   402 <getpid>
 138:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 13c:	c7 44 24 04 90 09 00 	movl   $0x990,0x4(%esp)
 143:	00 
 144:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 14b:	89 44 24 08          	mov    %eax,0x8(%esp)
 14f:	e8 9c 03 00 00       	call   4f0 <printf>
		exit();
 154:	e8 29 02 00 00       	call   382 <exit>
 159:	66 90                	xchg   %ax,%ax
 15b:	66 90                	xchg   %ax,%ax
 15d:	66 90                	xchg   %ax,%ax
 15f:	90                   	nop

00000160 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 169:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 16a:	89 c2                	mov    %eax,%edx
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 170:	83 c1 01             	add    $0x1,%ecx
 173:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 177:	83 c2 01             	add    $0x1,%edx
 17a:	84 db                	test   %bl,%bl
 17c:	88 5a ff             	mov    %bl,-0x1(%edx)
 17f:	75 ef                	jne    170 <strcpy+0x10>
    ;
  return os;
}
 181:	5b                   	pop    %ebx
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 18a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 55 08             	mov    0x8(%ebp),%edx
 196:	53                   	push   %ebx
 197:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 19a:	0f b6 02             	movzbl (%edx),%eax
 19d:	84 c0                	test   %al,%al
 19f:	74 2d                	je     1ce <strcmp+0x3e>
 1a1:	0f b6 19             	movzbl (%ecx),%ebx
 1a4:	38 d8                	cmp    %bl,%al
 1a6:	74 0e                	je     1b6 <strcmp+0x26>
 1a8:	eb 2b                	jmp    1d5 <strcmp+0x45>
 1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1b0:	38 c8                	cmp    %cl,%al
 1b2:	75 15                	jne    1c9 <strcmp+0x39>
    p++, q++;
 1b4:	89 d9                	mov    %ebx,%ecx
 1b6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1b9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1bc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1bf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 1c3:	84 c0                	test   %al,%al
 1c5:	75 e9                	jne    1b0 <strcmp+0x20>
 1c7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1c9:	29 c8                	sub    %ecx,%eax
}
 1cb:	5b                   	pop    %ebx
 1cc:	5d                   	pop    %ebp
 1cd:	c3                   	ret    
 1ce:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 1d1:	31 c0                	xor    %eax,%eax
 1d3:	eb f4                	jmp    1c9 <strcmp+0x39>
 1d5:	0f b6 cb             	movzbl %bl,%ecx
 1d8:	eb ef                	jmp    1c9 <strcmp+0x39>
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001e0 <strlen>:

uint
strlen(const char *s)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1e6:	80 39 00             	cmpb   $0x0,(%ecx)
 1e9:	74 12                	je     1fd <strlen+0x1d>
 1eb:	31 d2                	xor    %edx,%edx
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
 1f0:	83 c2 01             	add    $0x1,%edx
 1f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1f7:	89 d0                	mov    %edx,%eax
 1f9:	75 f5                	jne    1f0 <strlen+0x10>
    ;
  return n;
}
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
  for(n = 0; s[n]; n++)
 1fd:	31 c0                	xor    %eax,%eax
}
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	eb 0d                	jmp    210 <memset>
 203:	90                   	nop
 204:	90                   	nop
 205:	90                   	nop
 206:	90                   	nop
 207:	90                   	nop
 208:	90                   	nop
 209:	90                   	nop
 20a:	90                   	nop
 20b:	90                   	nop
 20c:	90                   	nop
 20d:	90                   	nop
 20e:	90                   	nop
 20f:	90                   	nop

00000210 <memset>:

void*
memset(void *dst, int c, uint n)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 55 08             	mov    0x8(%ebp),%edx
 216:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 217:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 21d:	89 d7                	mov    %edx,%edi
 21f:	fc                   	cld    
 220:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 222:	89 d0                	mov    %edx,%eax
 224:	5f                   	pop    %edi
 225:	5d                   	pop    %ebp
 226:	c3                   	ret    
 227:	89 f6                	mov    %esi,%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <strchr>:

char*
strchr(const char *s, char c)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	53                   	push   %ebx
 237:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 23a:	0f b6 18             	movzbl (%eax),%ebx
 23d:	84 db                	test   %bl,%bl
 23f:	74 1d                	je     25e <strchr+0x2e>
    if(*s == c)
 241:	38 d3                	cmp    %dl,%bl
 243:	89 d1                	mov    %edx,%ecx
 245:	75 0d                	jne    254 <strchr+0x24>
 247:	eb 17                	jmp    260 <strchr+0x30>
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 250:	38 ca                	cmp    %cl,%dl
 252:	74 0c                	je     260 <strchr+0x30>
  for(; *s; s++)
 254:	83 c0 01             	add    $0x1,%eax
 257:	0f b6 10             	movzbl (%eax),%edx
 25a:	84 d2                	test   %dl,%dl
 25c:	75 f2                	jne    250 <strchr+0x20>
      return (char*)s;
  return 0;
 25e:	31 c0                	xor    %eax,%eax
}
 260:	5b                   	pop    %ebx
 261:	5d                   	pop    %ebp
 262:	c3                   	ret    
 263:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <gets>:

char*
gets(char *buf, int max)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 275:	31 f6                	xor    %esi,%esi
{
 277:	53                   	push   %ebx
 278:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 27b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 27e:	eb 31                	jmp    2b1 <gets+0x41>
    cc = read(0, &c, 1);
 280:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 287:	00 
 288:	89 7c 24 04          	mov    %edi,0x4(%esp)
 28c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 293:	e8 02 01 00 00       	call   39a <read>
    if(cc < 1)
 298:	85 c0                	test   %eax,%eax
 29a:	7e 1d                	jle    2b9 <gets+0x49>
      break;
    buf[i++] = c;
 29c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 2a0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 2a2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 2a5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 2a7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2ab:	74 0c                	je     2b9 <gets+0x49>
 2ad:	3c 0a                	cmp    $0xa,%al
 2af:	74 08                	je     2b9 <gets+0x49>
  for(i=0; i+1 < max; ){
 2b1:	8d 5e 01             	lea    0x1(%esi),%ebx
 2b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2b7:	7c c7                	jl     280 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2b9:	8b 45 08             	mov    0x8(%ebp),%eax
 2bc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2c0:	83 c4 2c             	add    $0x2c,%esp
 2c3:	5b                   	pop    %ebx
 2c4:	5e                   	pop    %esi
 2c5:	5f                   	pop    %edi
 2c6:	5d                   	pop    %ebp
 2c7:	c3                   	ret    
 2c8:	90                   	nop
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
 2d5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
 2db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2e2:	00 
 2e3:	89 04 24             	mov    %eax,(%esp)
 2e6:	e8 d7 00 00 00       	call   3c2 <open>
  if(fd < 0)
 2eb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 2ed:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2ef:	78 27                	js     318 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f4:	89 1c 24             	mov    %ebx,(%esp)
 2f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2fb:	e8 da 00 00 00       	call   3da <fstat>
  close(fd);
 300:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 303:	89 c6                	mov    %eax,%esi
  close(fd);
 305:	e8 a0 00 00 00       	call   3aa <close>
  return r;
 30a:	89 f0                	mov    %esi,%eax
}
 30c:	83 c4 10             	add    $0x10,%esp
 30f:	5b                   	pop    %ebx
 310:	5e                   	pop    %esi
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    
 313:	90                   	nop
 314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 318:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 31d:	eb ed                	jmp    30c <stat+0x3c>
 31f:	90                   	nop

00000320 <atoi>:

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	8b 4d 08             	mov    0x8(%ebp),%ecx
 326:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	0f be 11             	movsbl (%ecx),%edx
 32a:	8d 42 d0             	lea    -0x30(%edx),%eax
 32d:	3c 09                	cmp    $0x9,%al
  n = 0;
 32f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 334:	77 17                	ja     34d <atoi+0x2d>
 336:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 338:	83 c1 01             	add    $0x1,%ecx
 33b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 33e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 342:	0f be 11             	movsbl (%ecx),%edx
 345:	8d 5a d0             	lea    -0x30(%edx),%ebx
 348:	80 fb 09             	cmp    $0x9,%bl
 34b:	76 eb                	jbe    338 <atoi+0x18>
  return n;
}
 34d:	5b                   	pop    %ebx
 34e:	5d                   	pop    %ebp
 34f:	c3                   	ret    

00000350 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 350:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 351:	31 d2                	xor    %edx,%edx
{
 353:	89 e5                	mov    %esp,%ebp
 355:	56                   	push   %esi
 356:	8b 45 08             	mov    0x8(%ebp),%eax
 359:	53                   	push   %ebx
 35a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 35d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 360:	85 db                	test   %ebx,%ebx
 362:	7e 12                	jle    376 <memmove+0x26>
 364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 368:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 36c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 36f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 372:	39 da                	cmp    %ebx,%edx
 374:	75 f2                	jne    368 <memmove+0x18>
  return vdst;
}
 376:	5b                   	pop    %ebx
 377:	5e                   	pop    %esi
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    

0000037a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37a:	b8 01 00 00 00       	mov    $0x1,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <exit>:
SYSCALL(exit)
 382:	b8 02 00 00 00       	mov    $0x2,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <wait>:
SYSCALL(wait)
 38a:	b8 03 00 00 00       	mov    $0x3,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <pipe>:
SYSCALL(pipe)
 392:	b8 04 00 00 00       	mov    $0x4,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <read>:
SYSCALL(read)
 39a:	b8 05 00 00 00       	mov    $0x5,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <write>:
SYSCALL(write)
 3a2:	b8 10 00 00 00       	mov    $0x10,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <close>:
SYSCALL(close)
 3aa:	b8 15 00 00 00       	mov    $0x15,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <kill>:
SYSCALL(kill)
 3b2:	b8 06 00 00 00       	mov    $0x6,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <exec>:
SYSCALL(exec)
 3ba:	b8 07 00 00 00       	mov    $0x7,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <open>:
SYSCALL(open)
 3c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <mknod>:
SYSCALL(mknod)
 3ca:	b8 11 00 00 00       	mov    $0x11,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <unlink>:
SYSCALL(unlink)
 3d2:	b8 12 00 00 00       	mov    $0x12,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <fstat>:
SYSCALL(fstat)
 3da:	b8 08 00 00 00       	mov    $0x8,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <link>:
SYSCALL(link)
 3e2:	b8 13 00 00 00       	mov    $0x13,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <mkdir>:
SYSCALL(mkdir)
 3ea:	b8 14 00 00 00       	mov    $0x14,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <chdir>:
SYSCALL(chdir)
 3f2:	b8 09 00 00 00       	mov    $0x9,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <dup>:
SYSCALL(dup)
 3fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <getpid>:
SYSCALL(getpid)
 402:	b8 0b 00 00 00       	mov    $0xb,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <sbrk>:
SYSCALL(sbrk)
 40a:	b8 0c 00 00 00       	mov    $0xc,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <sleep>:
SYSCALL(sleep)
 412:	b8 0d 00 00 00       	mov    $0xd,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <uptime>:
SYSCALL(uptime)
 41a:	b8 0e 00 00 00       	mov    $0xe,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <exitUDef>:
SYSCALL(exitUDef)
 422:	b8 16 00 00 00       	mov    $0x16,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <waitpid>:
SYSCALL(waitpid)
 42a:	b8 17 00 00 00       	mov    $0x17,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <setPriority>:
SYSCALL(setPriority)
 432:	b8 18 00 00 00       	mov    $0x18,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <getPriority>:
SYSCALL(getPriority)
 43a:	b8 19 00 00 00       	mov    $0x19,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    
 442:	66 90                	xchg   %ax,%ax
 444:	66 90                	xchg   %ax,%ax
 446:	66 90                	xchg   %ax,%ax
 448:	66 90                	xchg   %ax,%ax
 44a:	66 90                	xchg   %ax,%ax
 44c:	66 90                	xchg   %ax,%ax
 44e:	66 90                	xchg   %ax,%ax

00000450 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	89 c6                	mov    %eax,%esi
 457:	53                   	push   %ebx
 458:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 45b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 45e:	85 db                	test   %ebx,%ebx
 460:	74 09                	je     46b <printint+0x1b>
 462:	89 d0                	mov    %edx,%eax
 464:	c1 e8 1f             	shr    $0x1f,%eax
 467:	84 c0                	test   %al,%al
 469:	75 75                	jne    4e0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 46b:	89 d0                	mov    %edx,%eax
  neg = 0;
 46d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 474:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 477:	31 ff                	xor    %edi,%edi
 479:	89 ce                	mov    %ecx,%esi
 47b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 47e:	eb 02                	jmp    482 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 480:	89 cf                	mov    %ecx,%edi
 482:	31 d2                	xor    %edx,%edx
 484:	f7 f6                	div    %esi
 486:	8d 4f 01             	lea    0x1(%edi),%ecx
 489:	0f b6 92 4e 0a 00 00 	movzbl 0xa4e(%edx),%edx
  }while((x /= base) != 0);
 490:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 492:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 495:	75 e9                	jne    480 <printint+0x30>
  if(neg)
 497:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 49a:	89 c8                	mov    %ecx,%eax
 49c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 49f:	85 d2                	test   %edx,%edx
 4a1:	74 08                	je     4ab <printint+0x5b>
    buf[i++] = '-';
 4a3:	8d 4f 02             	lea    0x2(%edi),%ecx
 4a6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 4ab:	8d 79 ff             	lea    -0x1(%ecx),%edi
 4ae:	66 90                	xchg   %ax,%ax
 4b0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 4b5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 4b8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4bf:	00 
 4c0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 4c4:	89 34 24             	mov    %esi,(%esp)
 4c7:	88 45 d7             	mov    %al,-0x29(%ebp)
 4ca:	e8 d3 fe ff ff       	call   3a2 <write>
  while(--i >= 0)
 4cf:	83 ff ff             	cmp    $0xffffffff,%edi
 4d2:	75 dc                	jne    4b0 <printint+0x60>
    putc(fd, buf[i]);
}
 4d4:	83 c4 4c             	add    $0x4c,%esp
 4d7:	5b                   	pop    %ebx
 4d8:	5e                   	pop    %esi
 4d9:	5f                   	pop    %edi
 4da:	5d                   	pop    %ebp
 4db:	c3                   	ret    
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 4e0:	89 d0                	mov    %edx,%eax
 4e2:	f7 d8                	neg    %eax
    neg = 1;
 4e4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4eb:	eb 87                	jmp    474 <printint+0x24>
 4ed:	8d 76 00             	lea    0x0(%esi),%esi

000004f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4f4:	31 ff                	xor    %edi,%edi
{
 4f6:	56                   	push   %esi
 4f7:	53                   	push   %ebx
 4f8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 4fe:	8d 45 10             	lea    0x10(%ebp),%eax
{
 501:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 504:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 507:	0f b6 13             	movzbl (%ebx),%edx
 50a:	83 c3 01             	add    $0x1,%ebx
 50d:	84 d2                	test   %dl,%dl
 50f:	75 39                	jne    54a <printf+0x5a>
 511:	e9 c2 00 00 00       	jmp    5d8 <printf+0xe8>
 516:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 518:	83 fa 25             	cmp    $0x25,%edx
 51b:	0f 84 bf 00 00 00    	je     5e0 <printf+0xf0>
  write(fd, &c, 1);
 521:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 524:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 52b:	00 
 52c:	89 44 24 04          	mov    %eax,0x4(%esp)
 530:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 533:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
 536:	e8 67 fe ff ff       	call   3a2 <write>
 53b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 53e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 542:	84 d2                	test   %dl,%dl
 544:	0f 84 8e 00 00 00    	je     5d8 <printf+0xe8>
    if(state == 0){
 54a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 54c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 54f:	74 c7                	je     518 <printf+0x28>
      }
    } else if(state == '%'){
 551:	83 ff 25             	cmp    $0x25,%edi
 554:	75 e5                	jne    53b <printf+0x4b>
      if(c == 'd'){
 556:	83 fa 64             	cmp    $0x64,%edx
 559:	0f 84 31 01 00 00    	je     690 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 55f:	25 f7 00 00 00       	and    $0xf7,%eax
 564:	83 f8 70             	cmp    $0x70,%eax
 567:	0f 84 83 00 00 00    	je     5f0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 56d:	83 fa 73             	cmp    $0x73,%edx
 570:	0f 84 a2 00 00 00    	je     618 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 576:	83 fa 63             	cmp    $0x63,%edx
 579:	0f 84 35 01 00 00    	je     6b4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 57f:	83 fa 25             	cmp    $0x25,%edx
 582:	0f 84 e0 00 00 00    	je     668 <printf+0x178>
  write(fd, &c, 1);
 588:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 58b:	83 c3 01             	add    $0x1,%ebx
 58e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 595:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 596:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 598:	89 44 24 04          	mov    %eax,0x4(%esp)
 59c:	89 34 24             	mov    %esi,(%esp)
 59f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 5a2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 5a6:	e8 f7 fd ff ff       	call   3a2 <write>
        putc(fd, c);
 5ab:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 5ae:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5b8:	00 
 5b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bd:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 5c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5c3:	e8 da fd ff ff       	call   3a2 <write>
  for(i = 0; fmt[i]; i++){
 5c8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5cc:	84 d2                	test   %dl,%dl
 5ce:	0f 85 76 ff ff ff    	jne    54a <printf+0x5a>
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
 5d8:	83 c4 3c             	add    $0x3c,%esp
 5db:	5b                   	pop    %ebx
 5dc:	5e                   	pop    %esi
 5dd:	5f                   	pop    %edi
 5de:	5d                   	pop    %ebp
 5df:	c3                   	ret    
        state = '%';
 5e0:	bf 25 00 00 00       	mov    $0x25,%edi
 5e5:	e9 51 ff ff ff       	jmp    53b <printf+0x4b>
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5f3:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
 5f8:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 5fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 601:	8b 10                	mov    (%eax),%edx
 603:	89 f0                	mov    %esi,%eax
 605:	e8 46 fe ff ff       	call   450 <printint>
        ap++;
 60a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 60e:	e9 28 ff ff ff       	jmp    53b <printf+0x4b>
 613:	90                   	nop
 614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 618:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 61b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 61f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 621:	b8 47 0a 00 00       	mov    $0xa47,%eax
 626:	85 ff                	test   %edi,%edi
 628:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 62b:	0f b6 07             	movzbl (%edi),%eax
 62e:	84 c0                	test   %al,%al
 630:	74 2a                	je     65c <printf+0x16c>
 632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 638:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 63b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 63e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 641:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 648:	00 
 649:	89 44 24 04          	mov    %eax,0x4(%esp)
 64d:	89 34 24             	mov    %esi,(%esp)
 650:	e8 4d fd ff ff       	call   3a2 <write>
        while(*s != 0){
 655:	0f b6 07             	movzbl (%edi),%eax
 658:	84 c0                	test   %al,%al
 65a:	75 dc                	jne    638 <printf+0x148>
      state = 0;
 65c:	31 ff                	xor    %edi,%edi
 65e:	e9 d8 fe ff ff       	jmp    53b <printf+0x4b>
 663:	90                   	nop
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 668:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 66b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 66d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 674:	00 
 675:	89 44 24 04          	mov    %eax,0x4(%esp)
 679:	89 34 24             	mov    %esi,(%esp)
 67c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 680:	e8 1d fd ff ff       	call   3a2 <write>
 685:	e9 b1 fe ff ff       	jmp    53b <printf+0x4b>
 68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 690:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 693:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
 698:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 69b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6a2:	8b 10                	mov    (%eax),%edx
 6a4:	89 f0                	mov    %esi,%eax
 6a6:	e8 a5 fd ff ff       	call   450 <printint>
        ap++;
 6ab:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6af:	e9 87 fe ff ff       	jmp    53b <printf+0x4b>
        putc(fd, *ap);
 6b4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 6b7:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 6b9:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6bb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6c2:	00 
 6c3:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 6c6:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 6c9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d0:	e8 cd fc ff ff       	call   3a2 <write>
        ap++;
 6d5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6d9:	e9 5d fe ff ff       	jmp    53b <printf+0x4b>
 6de:	66 90                	xchg   %ax,%ax

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 e0 0c 00 00       	mov    0xce0,%eax
{
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ee:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 6f0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f3:	39 d0                	cmp    %edx,%eax
 6f5:	72 11                	jb     708 <free+0x28>
 6f7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f8:	39 c8                	cmp    %ecx,%eax
 6fa:	72 04                	jb     700 <free+0x20>
 6fc:	39 ca                	cmp    %ecx,%edx
 6fe:	72 10                	jb     710 <free+0x30>
 700:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 702:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 704:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 706:	73 f0                	jae    6f8 <free+0x18>
 708:	39 ca                	cmp    %ecx,%edx
 70a:	72 04                	jb     710 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70c:	39 c8                	cmp    %ecx,%eax
 70e:	72 f0                	jb     700 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 710:	8b 73 fc             	mov    -0x4(%ebx),%esi
 713:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 716:	39 cf                	cmp    %ecx,%edi
 718:	74 1e                	je     738 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 71a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 71d:	8b 48 04             	mov    0x4(%eax),%ecx
 720:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 723:	39 f2                	cmp    %esi,%edx
 725:	74 28                	je     74f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 727:	89 10                	mov    %edx,(%eax)
  freep = p;
 729:	a3 e0 0c 00 00       	mov    %eax,0xce0
}
 72e:	5b                   	pop    %ebx
 72f:	5e                   	pop    %esi
 730:	5f                   	pop    %edi
 731:	5d                   	pop    %ebp
 732:	c3                   	ret    
 733:	90                   	nop
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 738:	03 71 04             	add    0x4(%ecx),%esi
 73b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 73e:	8b 08                	mov    (%eax),%ecx
 740:	8b 09                	mov    (%ecx),%ecx
 742:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 745:	8b 48 04             	mov    0x4(%eax),%ecx
 748:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 74b:	39 f2                	cmp    %esi,%edx
 74d:	75 d8                	jne    727 <free+0x47>
    p->s.size += bp->s.size;
 74f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 752:	a3 e0 0c 00 00       	mov    %eax,0xce0
    p->s.size += bp->s.size;
 757:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 75a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 75d:	89 10                	mov    %edx,(%eax)
}
 75f:	5b                   	pop    %ebx
 760:	5e                   	pop    %esi
 761:	5f                   	pop    %edi
 762:	5d                   	pop    %ebp
 763:	c3                   	ret    
 764:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 76a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 779:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 77c:	8b 1d e0 0c 00 00    	mov    0xce0,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 782:	8d 48 07             	lea    0x7(%eax),%ecx
 785:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 788:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 78a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 78d:	0f 84 9b 00 00 00    	je     82e <malloc+0xbe>
 793:	8b 13                	mov    (%ebx),%edx
 795:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 798:	39 fe                	cmp    %edi,%esi
 79a:	76 64                	jbe    800 <malloc+0x90>
 79c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 7a3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 7a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7ab:	eb 0e                	jmp    7bb <malloc+0x4b>
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7b2:	8b 78 04             	mov    0x4(%eax),%edi
 7b5:	39 fe                	cmp    %edi,%esi
 7b7:	76 4f                	jbe    808 <malloc+0x98>
 7b9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7bb:	3b 15 e0 0c 00 00    	cmp    0xce0,%edx
 7c1:	75 ed                	jne    7b0 <malloc+0x40>
  if(nu < 4096)
 7c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7c6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 7cc:	bf 00 10 00 00       	mov    $0x1000,%edi
 7d1:	0f 43 fe             	cmovae %esi,%edi
 7d4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 7d7:	89 04 24             	mov    %eax,(%esp)
 7da:	e8 2b fc ff ff       	call   40a <sbrk>
  if(p == (char*)-1)
 7df:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e2:	74 18                	je     7fc <malloc+0x8c>
  hp->s.size = nu;
 7e4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 7e7:	83 c0 08             	add    $0x8,%eax
 7ea:	89 04 24             	mov    %eax,(%esp)
 7ed:	e8 ee fe ff ff       	call   6e0 <free>
  return freep;
 7f2:	8b 15 e0 0c 00 00    	mov    0xce0,%edx
      if((p = morecore(nunits)) == 0)
 7f8:	85 d2                	test   %edx,%edx
 7fa:	75 b4                	jne    7b0 <malloc+0x40>
        return 0;
 7fc:	31 c0                	xor    %eax,%eax
 7fe:	eb 20                	jmp    820 <malloc+0xb0>
    if(p->s.size >= nunits){
 800:	89 d0                	mov    %edx,%eax
 802:	89 da                	mov    %ebx,%edx
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 808:	39 fe                	cmp    %edi,%esi
 80a:	74 1c                	je     828 <malloc+0xb8>
        p->s.size -= nunits;
 80c:	29 f7                	sub    %esi,%edi
 80e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 811:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 814:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 817:	89 15 e0 0c 00 00    	mov    %edx,0xce0
      return (void*)(p + 1);
 81d:	83 c0 08             	add    $0x8,%eax
  }
}
 820:	83 c4 1c             	add    $0x1c,%esp
 823:	5b                   	pop    %ebx
 824:	5e                   	pop    %esi
 825:	5f                   	pop    %edi
 826:	5d                   	pop    %ebp
 827:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 828:	8b 08                	mov    (%eax),%ecx
 82a:	89 0a                	mov    %ecx,(%edx)
 82c:	eb e9                	jmp    817 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 82e:	c7 05 e0 0c 00 00 e4 	movl   $0xce4,0xce0
 835:	0c 00 00 
    base.s.size = 0;
 838:	ba e4 0c 00 00       	mov    $0xce4,%edx
    base.s.ptr = freep = prevp = &base;
 83d:	c7 05 e4 0c 00 00 e4 	movl   $0xce4,0xce4
 844:	0c 00 00 
    base.s.size = 0;
 847:	c7 05 e8 0c 00 00 00 	movl   $0x0,0xce8
 84e:	00 00 00 
 851:	e9 46 ff ff ff       	jmp    79c <malloc+0x2c>
