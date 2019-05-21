Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (unknown [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA24A2486B
	for <lists+samba-technical@lfdr.de>; Tue, 21 May 2019 08:51:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=gG5yVBOC2bG1kJH51sIi9NCK+jr1aMQWHtzGgvU/P84=; b=GUEhFTGLizpJYXL+m11vu02Ghc
	Iq8FqThX6xRETzfTybS8WITS84lN81Q+oiH/2IoFmwXYk064HofN/wrS1Ycq/ltNvtlVFhZgKVTIV
	UfvTDZeB4stLB5F7xzKAjtB4ges2hu5rZyJvGr3rkgkngiuFsDo4f+N1NfCxyEIaA0ez623hyrpe/
	UsKSSba/xGUNtJOtVeh7WDHTuR1U18rGyCrvvK1uO5v82rAF3MCTXUVcXNxi4D5QCiFCAYK6qq87D
	lKBbEz3sVF1IpMuxrQERLY7CHA8DBNrCkqPIFwCKd065oK2SS4uq34iXcGEH5Y+gBQ9dI/BJdULB7
	uxNTlrrQ==;
Received: from localhost ([::1]:32340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSyc3-000ucJ-67; Tue, 21 May 2019 06:51:03 +0000
Received: from [2a01:4f8:192:486::147:1] (port=23720 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSybx-000ucC-A5
 for samba-technical@lists.samba.org; Tue, 21 May 2019 06:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=gG5yVBOC2bG1kJH51sIi9NCK+jr1aMQWHtzGgvU/P84=; b=l0QjjCbhU0iE+SgMbBgwNQp9uD
 C3gaqJxdCGXHNc75xA0H5F/QKnCvZzkNyt9AHDcKRSmvEhe7M8pzc5uIAU7EHGl/tB4ZkG1KtDlkS
 M4Y5be/mNyzcRB4Upzgi2LWiob4XR25xfeoyvRgKRLsNDxB9PKOliRc9DiOcGBUMjzRs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hSybr-0000Ja-Jt; Tue, 21 May 2019 06:50:51 +0000
To: Martin Schwenke <martin@meltin.net>
Subject: Re: New csbuild run
Date: Tue, 21 May 2019 08:50:51 +0200
Message-ID: <1837370.ydoI62cGuG@magrathea.fritz.box>
In-Reply-To: <20190521162924.4444f055@martins.ozlabs.org>
References: <1902926.C4UlyRiazf@magrathea.fritz.box>
 <4043444.PDZQgdqHAT@magrathea.fritz.box>
 <20190521162924.4444f055@martins.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, May 21, 2019 8:29:24 AM CEST Martin Schwenke wrote:
> Hi Andreas,

Hi Martin,

> I run Debian, so is csbuild available from some other place than as a
> package in Fedora?  I know that I could find a Fedora RPM
> and unpack it, but I figure there must be a web site somewhere that I
> can download it from.   Unfortunately, searching the internet for
> "csbuild" finds too many other things.  :-(

I only know Fedora which packages it. It is split into several projects:

https://github.com/kdudka/cscppc
https://github.com/kdudka/csmock
https://github.com/kdudka/cswrap
https://github.com/kdudka/csdiff


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



