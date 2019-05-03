Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31E1291C
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 09:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=iq6MhDtl7DfU8yA5UaJHLsiFPLJRQZYgwUc13OjBtD0=; b=SF86ZSKSuyzE3M/v9++Mq8iJIg
	mzi/exE/Jxudl6A0sU/zj6fjPm6FIwL/sLwxPIFtP1OFyUEgtfYPgHIpaGwhkzrJ1K2mfY90UDl21
	z52C1cpMUczMYtxE6r2S81xEp3LM4q33BbtERXcZluhSf3knFpKqu003Tl5dn7szNYoCXVLXbBH/O
	cHPNfCkiByrMvT+TNyxFUt2y+c8DTdzA3jA43vUTVkjCIUrTgytsJNhZ79AjTzndfaplitxfOM3uQ
	dt2C0RJcBfUsuiKHw/4cMJDMI1xzW4H/176VPxq9ZFJhx532doVSXDgFSt0SYXEc7L88xy//ETAoA
	PNipyQkw==;
Received: from localhost ([::1]:32842 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMSz7-002CgQ-Tf; Fri, 03 May 2019 07:51:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:48408) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMSz4-002CgJ-GL
 for samba-technical@lists.samba.org; Fri, 03 May 2019 07:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=iq6MhDtl7DfU8yA5UaJHLsiFPLJRQZYgwUc13OjBtD0=; b=dPzBnXG2y1VKLaSM4YubtHM9nC
 8ZwHTlJq+OB+p272ppv77mQTFitsuhQv8bKbkUvlFmqSFOfPeuP2y57UoCmuNqxk4ZcWIifN07uyw
 rFwPLDoZqAaJX/9oLRswYGHWd68zuLw6h+61qx2DMu1IRnwz49kfzMuyZgJ+77DBEw80=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hMSz3-000850-Uj; Fri, 03 May 2019 07:51:54 +0000
Date: Fri, 3 May 2019 10:51:52 +0300
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [PROPOSAL] Evict zlib
Message-ID: <20190503075152.GC5460@onega.vda.li>
References: <1556868232.2951.47.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1556868232.2951.47.camel@samba.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On pe, 03 touko 2019, Andrew Bartlett via samba-technical wrote:
> It was recently pointed out that unused cryptography can be a pain for
> users of our tarball.  I also recently did some work[1] where we
> documented the location of cryptography in Samba.
> 
> With GnuTLS being a requirement now, I think zlib is also a reasonable
> requirement and removing it would also remove some bad and un-used
> crypto from the tree.
> 
> What do folks think?
+1

There are four places where zlib is in use in Samba:
 - NDR compression/decompression code in librpc
 - DRSU replication code in libcli uses CRC32
 - CRC32 use in gencache
 - ntlmssp signing code uses CRC32 code

I think this part of zlib is stable enough and available widely.

-- 
/ Alexander Bokovoy

