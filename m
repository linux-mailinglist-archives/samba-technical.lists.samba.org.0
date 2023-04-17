Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 921B66E4555
	for <lists+samba-technical@lfdr.de>; Mon, 17 Apr 2023 12:35:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=hriI3Fie5j6D8h5rfoxnYApC3DRFFQIIQm24EDlEgaY=; b=DQBxM0qKsy9OKu9wKaXA0XPxOC
	qo8u1MTzuYjcYtSZJKtJ/ipoTt5rvaC8D2p6K0+2LYYTtrBCU48bGWhETY4aci0eyRtb5MWXYL6il
	yh76WMq3FwxPWUhQzEETrpYtEjrB79mOTLoic+pR7s9YdXTx3SaSoRg4SeVhwcnJYJHf2fMO6Usp4
	DZDuT9yKHboZFmM2HwCGOKXvLUUDHjGSGaO4w45jcP5GvcJjObE2AAgVjqfY4H2Ua4xP8zdu/W5Dp
	moRhqPMfrAWuNAnoECVWUd7CDMgb2110GsO2WlLhQOg/7/QYGyHGohZHt4PqZ2JTDG06uW2mc3fb5
	zScEUHjg==;
Received: from ip6-localhost ([::1]:32200 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1poMCH-002G1o-04; Mon, 17 Apr 2023 10:34:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10578) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1poMCA-002G1f-3S
 for samba-technical@lists.samba.org; Mon, 17 Apr 2023 10:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=hriI3Fie5j6D8h5rfoxnYApC3DRFFQIIQm24EDlEgaY=; b=ZDlkshmr8maDrCK8nxHN7BR1NS
 8mcoTIkfzuVq+i7MWjLIT7ojMVKRUYlVEeN8YfNhuTlEbgptn9dXqQsZQpjqgccrbdW1FjX2F7b2r
 iZwP4iDleOlQqYKXbdJmNvrZvONCj+M+7Ih8xpEDkdjn2GlO1cRSvtOw3MtBCgpvq74Vg7Ls0lw43
 vmtpEj0+NJaoUsDVAQpZVKNYKpHqdhi81lY2S9Dt+W2/R3bn3HddQ06Yn9H2fMPvz6fR51T+9JhB0
 5xUjItNh5Tg8NL7FnxelkoATK74w0gpZUcDUcmTtBE2tmOytHDFPtMXHRIlklCIKFCZIRciPQtd3r
 sOmZjZfLebEWYqUlHkjIKNMoi+8wl7QelEICRMp7wx5Z9PIVGmkJxHH2n2PWDqCvHrzn2fcARxNsf
 xwVGt5XrWVYRajcdCe10s9ygpT8/jDM8zXHkP3BGcPXL3FR+TaN5lvHBUFn8u6gJKIt7ldFCDBfLq
 w9yUykQ/FrcL8ghAkv8dUwvm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1poMC9-001cMN-20; Mon, 17 Apr 2023 10:34:49 +0000
To: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>,
 Florian Weimer <fweimer@redhat.com>
Subject: Re: talloc vs malloc speed
Date: Mon, 17 Apr 2023 12:34:47 +0200
Message-ID: <4829322.31r3eYUQgx@magrathea>
In-Reply-To: <873552p47g.fsf@oldenburg.str.redhat.com>
References: <3161922.5fSG56mABF@magrathea>
 <873552p47g.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 14 April 2023 23:02:43 CEST Florian Weimer wrote:
> * Andreas Schneider via samba-technical:
> > I wonder if it would be possible to give the optimizer more hints. Maybe
> > Florian has some ideas :-)
> 
> You need to check that with optimization, the compiler does not elide
> malloc/free calls completely.  That might give malloc an unfair
> advantage.  GCC knows that malloc/free have no observable side effect,
> so if it can see the whole program, it sometimes can turn heap
> allocations into stack allocations.  GCC also knows that memory returned
> by malloc cannot alias anything, and that writes to the object before
> free can be eliminated.  The latter might be meaningful for
> microbenchmarks.
> 
> Some of these behaviors can be enabled through function attributes,
> however I'm not sure how much of that would be correct for talloc.  If I
> recall correctly, it has destructor callbacks, which means that
> arbitrary code can run on free, and that rules out dead store
> elimination.

Yes, we have support for destructor callbacks. Can you point me to the 
attributes which might help talloc?

> If talloc is layered on top of system malloc, using its own allocator
> geared to its particular metadata requirements could reduce memory
> overhead and make certain things go faster, but it's also a lot of work.

talloc is basically a bunch of pointer arithmetic around malloc()/free() call.

It has desctructors and also keeps track of the hierarchy. So you can free a 
an allocated pointer with all its children.

Interesting that those few pointer calculations make it so much slower.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



