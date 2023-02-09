Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 346BD690BBF
	for <lists+samba-technical@lfdr.de>; Thu,  9 Feb 2023 15:30:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3gvgtgLgSW3u20gNVHqhv6UVsa84fGHu0R5hZms47Ng=; b=yHX0/mczbR0UQ+fyvm8pB3/Gma
	3pIZOmI11YeNDbQ25eSW6nfs5Nj1oPQDcpzeBbKa+ze2z5zNPUtdW/NqRBmGQb8xX1kbKJqlVgni6
	MD2P0+nzhYGvg8onblObyfYPeVSnYNnaXTZoDjlvXPlMQxw2hkvcflc2dqnHMaDk8cAAXh6ZxbzpI
	nCoj04JeYxDzau7UB/HSLyFDdKHs2HqC+Kij/TSVfEvl2p0GnYcY7aXeac5MhjFunkBE6BGChMved
	oa0M5m7F1pS+FvyGXEebusWK7Z97OnkT7lj3Fp0YQzooIhU6QyEY0lrTujxfxQQ9M3c2rfmK46lB0
	gNXfTLDg==;
Received: from ip6-localhost ([::1]:42160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQ7vR-00AOXO-N4; Thu, 09 Feb 2023 14:29:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17250) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQ7vN-00AOXF-Mv
 for samba-technical@lists.samba.org; Thu, 09 Feb 2023 14:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=3gvgtgLgSW3u20gNVHqhv6UVsa84fGHu0R5hZms47Ng=; b=vt61NckReEUeqnTpd0R9KxOLEI
 x96E4ZkczjYB62LIb2qijmoleFW85rS+f/TyFBP9IuDVmEsOJ6Wzs6I/LHjM1JAdP/VAwbAfmukSZ
 lM7jsILULSIb/mSCibXUvb+gYzr6jI1dpOVCCh2HR/bcbsqN72/kQi9eGjmSvgpaWAysHCarFnh0A
 8KLbX+MaegIjPKT/hHUIUEJQWsoz551S8hSN3UrHjJ10L+O3XE0QZQOD9DRQMZkOfqAQqAnYoatrG
 c3Sq8TT/f6koGta7FSjJTCllE3Ve3B00WnaUhP+g9O2mv1caY7u4X8Y9vzxcrmYVBbs7x7MRu3Ju0
 ZJS1lIcYUPQRA0koYly5gfaZfB4fWqQZEBPUepvNUYB38lUvML9KPeT4t8bmhMP1hrFIfLaj4faUx
 TMS8vgaMYOQgu6oZ92Xl24R9q+D6PhYKv628UvzYhZmOmGCFZfRfmgtepoqp9lsXZY1NkmjxbWiso
 3FPnDhPXaIkuClZRWKcpnE/m;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pQ7vM-00Cp9C-H8; Thu, 09 Feb 2023 14:29:20 +0000
Message-ID: <8476eee4-6227-213f-c6ab-86768d0b58c8@samba.org>
Date: Thu, 9 Feb 2023 15:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <Y+T/GE77AKzsPte9@casper.infradead.org>
In-Reply-To: <Y+T/GE77AKzsPte9@casper.infradead.org>
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 09.02.23 um 15:11 schrieb Matthew Wilcox:
> On Thu, Feb 09, 2023 at 02:55:59PM +0100, Stefan Metzmacher wrote:
>> Hi Linus and others,
>>
>> as written in a private mail before, I'm currently trying to
>> make use of IORING_OP_SPLICE in order to get zero copy support
>> in Samba.
> 
> I have to ask why.  In a modern network, isn't all data encrypted?

No people use plain connections for performance sensitive
workloads and have client and server in isolated vlans.

> So you have to encrypt into a different buffer, and then you checksum
> that buffer.  So it doesn't matter if writes can change the page cache
> after you called splice(), you just need to have the data be consistent
> so the checksum doesn't change.

SMB offers checksuming (signing) only as well as authenticated
encryption.

For signing only I experimented with splice() in combination with
tee(), so that I can checksum the data after reading from tee,
while I can still splice() into the socket.

For encryption the async_memcpy flag to preadv2 could be usefull
if we keep using userspace encryption using gnutls.
If using the kernel crypto socket, we could also use splice to
add the file data into the crypto functions and the same problem
can happen, because some algorithms may encrypt and sign the data
in separate steps and it doesn't expect the data to be changed.

metze


