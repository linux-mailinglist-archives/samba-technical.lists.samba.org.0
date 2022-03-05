Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 679984CE237
	for <lists+samba-technical@lfdr.de>; Sat,  5 Mar 2022 03:23:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=y1k7u6Lj2dK3jAhddacFma0qo1m0EXCqcj6Wyf5Ql2M=; b=X1MtvcXRju5PPBhd1FdLx0Ahm3
	Y1t3cR8fVTfrQUX3VhM8xJoTR3HVkKwhMWwZKippCYnxiRC4ovm3VhFYUvOIocYuqX0lRxee+dtQb
	vv2TJd7JRd0qC6IE/1z86MmEUQfr8v04J7imKmq1KjdM000ayel1LvJ7uJddilMPE881AeSfE5/1r
	jM5z69d1bWeyk6PsJt6/PqfrGDgdLdI6cnW5/hlc/2kGN9TfiBvk2o2nnvPfNWbyplUfMkbmwejp5
	TFtMkAJ1PWcv4UbY+14kjLwtuxjhEieBMiq0SGooy+vArqI4CYkNqqfXHzbX5oiC2JbAFQgnSmr26
	GJ4ZFyow==;
Received: from ip6-localhost ([::1]:65444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nQK3j-00G5FH-10; Sat, 05 Mar 2022 02:22:15 +0000
Received: from ext140.multitalents.net ([173.164.249.140]:56952
 helo=server01.int.multitalents.net) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nQK3d-00G5F7-4a
 for samba-technical@lists.samba.org; Sat, 05 Mar 2022 02:22:12 +0000
Received: from server01.int.multitalents.net (localhost [127.0.0.1])
 by server01.int.multitalents.net (8.15.2/8.13.8) with ESMTP id 2252M308023091
 for <samba-technical@lists.samba.org>; Fri, 4 Mar 2022 18:22:03 -0800 (PST)
Received: from localhost (tim@localhost)
 by server01.int.multitalents.net (8.15.2/8.13.8/Submit) with ESMTP id
 2252M2lY023088
 for <samba-technical@lists.samba.org>; Fri, 4 Mar 2022 18:22:03 -0800 (PST)
X-Authentication-Warning: server01.int.multitalents.net: tim owned process
 doing -bs
Date: Fri, 4 Mar 2022 18:22:02 -0800 (PST)
X-X-Sender: tim@server01.int.multitalents.net
To: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Subject: Re: issues with 4.10.16 UnixWare port
In-Reply-To: <3d52d8c4423ac247d09600c34ea499670b2c6a4a.camel@samba.org>
Message-ID: <alpine.UW2.2.11.2203041738580.17423@server01.int.multitalents.net>
References: <alpine.UW2.2.11.2203040933550.4550@server01.int.multitalents.net>
 <3d52d8c4423ac247d09600c34ea499670b2c6a4a.camel@samba.org>
User-Agent: Alpine 2.11 (UW2 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-ID: <alpine.UW2.2.11.2203041805221.17423@server01.int.multitalents.net>
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
From: Tim Rice via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical <samba-technical@lists.samba.org>
Cc: Tim Rice <tim@multitalents.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Hi Andrew,

On Sat, 5 Mar 2022, Andrew Bartlett via samba-technical wrote:

> This comes from the default idmap.ldb database values.  You could
> adjust the template.

If only I could find the template. I must be blind.
Before asking here I thought it might be source4/setup/idmap_init.ldif
but dropping some zeros and rebuilding did not change anything. The truss
output still showed
fchown(15, 0, 3000000)                          Err#22 EINVAL

> However as you have noticed the AD DC is totally untested on UnixWare
> and you will hit more problems soon.

I expected problems and wanted to see how far I could get.

> You need xattrs and posix ACLs in particular.

UnixWare like Solaris has ACLs, the #defines for the ACL operations
have different names. Although having been implemented long ago
they my not be up to current standards. I'll have to track down the
specs and research that.

Right, UW does not have xattrs. As near as I can tell, neither does
Solaris or FreeBSD. Is AD DC a Linux only thing?

Fortunately for this port I only need stand-alone capability
or to join an AD domain.

Jeremy, thanks for your feedback also. The UW engineers know
XXXXat() syscalls are needed. Just not here today.

> 
> Andrew Bartlett
> 
> On Fri, 2022-03-04 at 10:04 -0800, Tim Rice via samba-technical wrote:
[snip]
> > .....
> > 2013: open("/var/opt/samba/locks/sysvol", 02000000, 0644) = 14
> > [snip]
> > 2013: fchown(14, 0, 3000000)        Err#22 EINVAL
[snip]

-- 
Tim Rice				Multitalents	(707) 456-1146
tim@multitalents.net


