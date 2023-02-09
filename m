Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ADE690B1A
	for <lists+samba-technical@lfdr.de>; Thu,  9 Feb 2023 14:57:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dKtYu+JDvoYPo88QxjhqydMNl2n2n4GvLT2+LdSLEZE=; b=Dag3XY/jNKvJNTFk/9ZtIxoZfA
	LU+x1uJAEamTgxi8jeFIBU37BmN2jF1daSd1oHg0/b1K53o3eNBEUeii+n5t6sv5FQ0LPy4Q38JEb
	zh5rrQ1uK4+VWA1RusuaUQqjK1w1a49U3xFHNSaW93pEHU4W2ZRwyoxVSZOVuVTkieHTGLDlGTz0P
	fs+8EknBAP1LsQOtTnIeDrK20arQd5DDtenyJ6fKaxS1tpB8Tr7Gom5llLuFOX9ZfE6AxLChXsLMO
	DidUnqasA8x13UqLoKF/XN5vv5oxWambuGUdld+YjYYZdJna8aK8RoJVlBo9xC1gMGkymnQuX7nc5
	I5YsSwJw==;
Received: from ip6-localhost ([::1]:54690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQ7PE-00ANtG-Pd; Thu, 09 Feb 2023 13:56:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34966) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQ7P8-00ANt7-Md
 for samba-technical@lists.samba.org; Thu, 09 Feb 2023 13:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:From:To:Date:Message-ID;
 bh=dKtYu+JDvoYPo88QxjhqydMNl2n2n4GvLT2+LdSLEZE=; b=RSJ/HI3WV2J0cJ04J79ShIlxbS
 CSkr+mcyNOLK0gj3CsBY+ygHhIGc23/ca63ckazjFkBcuXhRxoah8M8UBQdeAmQKKZ+28b/3/+QjJ
 M89tanyKc2WD9Qj9VrF+13gBSfEf2LEFArQlvp9lqajdjBZH70XK8Nyi5rgREufnn4RcEMJ2V1b+9
 rbF630HSORVyZlLfvftWN7+QTaSRNz3Nf0jt9Zgzo5+fPYwpPZZe6JAQB+sendYRYFWqOMoD4md2r
 LesyeMZK81AfOvoo8BnwooncaFxkDqexx+nQ5eaLpzJ1b1sDBEN2mJ+imhWKQEX0rF/jjd8NrHWDG
 pVLSuF2upXe+idrWJbIFHPboVpDYmynYVTgxQiApWGow5oWA/UxiMh5g0CMHzmDGgHDYGnzWn6Ktj
 xHSykF8JENccQsFA87iOB3mdE4sxshmdL9ECTdDvIL0e36k6J3EwCdxiEIUF/ZWMfG7gEs+deKEAe
 IYdtGfEWpFK/pCFg3kfYxGTl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pQ7P7-00Cops-4s; Thu, 09 Feb 2023 13:56:01 +0000
Message-ID: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
Date: Thu, 9 Feb 2023 14:55:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: copy on write for splice() from file to pipe?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Linux API Mailing List <linux-api@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Linus and others,

as written in a private mail before, I'm currently trying to
make use of IORING_OP_SPLICE in order to get zero copy support
in Samba.

The most important use cases are 8 Mbytes reads and writes to
files. where "memcpy" (at the lowest end copy_user_enhanced_fast_string())
is the obvious performance killer.

I have a prototype that offers really great performance
avoiding "memcpy" by using splice() (in order to get async IORING_OP_SPLICE).

So we have two cases:

1. network -> socket -> splice -> pipe -> splice -> file -> storage

2. storage -> file -> splice -> pipe -> splice -> socket -> network

With 1. I guess everything can work reliable, once
the pages are created/filled in the socket receive buffer
they are used exclusively and they won't be shared on
the way to the file. Which means we can be sure that
data arrives unmodified in the file(system).

But with 2. there's a problem, as the pages from the file,
which are spliced into the pipe are still shared without
copy on write with the file(system). It means writes to the file
after the first splice modify the content of the spliced pages!
So the content may change uncontrolled before it reaches the network!
I created a little example that demonstrates the problem (see below),
it gives the following output:

> open(O_TMPFILE) => ffd[3]
> pwrite(count=PIPE_BUF,ofs=PIPE_BUF) 0x1f sret[4096]
> pipe() => ret[0]
> splice(count=PIPE_BUF*2,ofs=0) sret[8192]
> pwrite(count=PIPE_BUF,ofs=0) 0xf0 sret[4096]
> pwrite(count=PIPE_BUF,ofs=PIPE_BUF) 0xf0 sret[4096]
> read(from_pipe, count=PIPE_BUF) sret[4096]
> memcmp() at ofs=0, expecting 0x00 => ret[240]
> memcmp() at ofs=0, checking for 0xf0 => ret[0]
> read(from_pipe, count=PIPE_BUF) sret[4096]
> memcmp() at ofs=PIPE_BUF, expecting 0x1f => ret[209]
> memcmp() at ofs=PIPE_BUF, checking for 0xf0 => ret[0]

After reading from the pipe we get the values we have written to
the file instead of the values we had at the time of splice.

For things like web servers, which mostly serve static content, this
isn't a problem, but it is for Samba, when reads and writes may happen within
microseconds, before the content is pushed to the network.

I'm wondering if there's a possible way out of this, maybe triggered by a new
flag passed to splice.

I looked through the code and noticed the existence of IOMAP_F_SHARED.
Maybe the splice from the page cache to the pipe could set IOMAP_F_SHARED,
while incrementing the refcount and the network driver could remove it again
when the refcount reaches 1 again.

Is there any other way we could archive something like this?

In addition and/or as alternative I was thinking about a flag to
preadv2() (and IORING_OP_READV) to indicate the use of something
like async_memcpy(), instead of doing the copy via the cpu.
That in combination with IORING_OP_SENDMSG_ZC would avoid "memcpy"
on the cpu.

Any hints, remarks and prototype patches are highly welcome.

Thanks!
metze

#define _GNU_SOURCE         /* See feature_test_macros(7) */
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <limits.h>

int main(void)
{
	int ffd;
	int pfds[2];
	char buf [PIPE_BUF] = {0, };
	char buf2 [PIPE_BUF] = {0, };
	ssize_t sret;
	int ret;
	off_t ofs;

	memset(buf, 0x1f, PIPE_BUF);

	ffd = open("/tmp/", O_RDWR | O_TMPFILE, S_IRUSR | S_IWUSR);
	printf("open(O_TMPFILE) => ffd[%d]\n", ffd);

	sret = pwrite(ffd, buf, PIPE_BUF, PIPE_BUF);
	printf("pwrite(count=PIPE_BUF,ofs=PIPE_BUF) 0x1f sret[%zd]\n", sret);

	ret = pipe(pfds);
	printf("pipe() => ret[%d]\n", ret);

	ofs = 0;
	sret = splice(ffd, &ofs, pfds[1], NULL, PIPE_BUF*2, 0);
	printf("splice(count=PIPE_BUF*2,ofs=0) sret[%zd]\n", sret);

	memset(buf, 0xf0, PIPE_BUF);

	sret = pwrite(ffd, buf, PIPE_BUF, 0);
	printf("pwrite(count=PIPE_BUF,ofs=0) 0xf0 sret[%zd]\n", sret);
	sret = pwrite(ffd, buf, PIPE_BUF, PIPE_BUF);
	printf("pwrite(count=PIPE_BUF,ofs=PIPE_BUF) 0xf0 sret[%zd]\n", sret);

	sret = read(pfds[0], buf, PIPE_BUF);
	printf("read(from_pipe, count=PIPE_BUF) sret[%zd]\n", sret);

	memset(buf2, 0x00, PIPE_BUF);
	ret = memcmp(buf, buf2, PIPE_BUF);
	printf("memcmp() at ofs=0, expecting 0x00 => ret[%d]\n", ret);
	memset(buf2, 0xf0, PIPE_BUF);
	ret = memcmp(buf, buf2, PIPE_BUF);
	printf("memcmp() at ofs=0, checking for 0xf0 => ret[%d]\n", ret);

	sret = read(pfds[0], buf, PIPE_BUF);
	printf("read(from_pipe, count=PIPE_BUF) sret[%zd]\n", sret);

	memset(buf2, 0x1f, PIPE_BUF);
	ret = memcmp(buf, buf2, PIPE_BUF);
	printf("memcmp() at ofs=PIPE_BUF, expecting 0x1f => ret[%d]\n", ret);
	memset(buf2, 0xf0, PIPE_BUF);
	ret = memcmp(buf, buf2, PIPE_BUF);
	printf("memcmp() at ofs=PIPE_BUF, checking for 0xf0 => ret[%d]\n", ret);
	return 0;
}

