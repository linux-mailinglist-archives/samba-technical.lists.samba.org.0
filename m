Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5FC4CDC4D
	for <lists+samba-technical@lfdr.de>; Fri,  4 Mar 2022 19:22:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ch+EpvvtTveD+FqOMTZ0r7sBRlm81Vgg1c+M+jNG3ZU=; b=lxsQbV/6Lw7/n1fSIjNNRC9L9R
	H2c8M8l2plnzzI1LmZHJ5+VchtHVv9IGlAYdruugvJmW1Sh76TRnbk1ztDNtjkZPMHobyeXtmLB1n
	C6kBB/URxTdNKYqHbwRigkm6OOTV8xKzXhqi3sPCiavsJEo6OH+5YAFMPgpswzc+tF6fLQaEcI3ku
	5z/qa+55kU0ZBpZwSu3MWJe7ccCVe0oxLKt0kmAtvDjEInbEQr+V1SWmba0jgTGFaOTirQlZIebY/
	gHV3C3V1MNw843nYSmA9IUlPxAH+T6bIvfvKLXRGSO48SSY6NhHzVrgCg/R6ib9L4vQxQHRHrWNSs
	KuWIdydg==;
Received: from ip6-localhost ([::1]:36326 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nQCYp-00FrgZ-Il; Fri, 04 Mar 2022 18:21:51 +0000
Received: from ext140.multitalents.net ([173.164.249.140]:55975
 helo=server01.int.multitalents.net) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nQCYk-00FrgN-2D
 for samba-technical@lists.samba.org; Fri, 04 Mar 2022 18:21:49 +0000
Received: from server01.int.multitalents.net (localhost [127.0.0.1])
 by server01.int.multitalents.net (8.15.2/8.13.8) with ESMTP id 224I4s3W022789
 for <samba-technical@lists.samba.org>; Fri, 4 Mar 2022 10:04:54 -0800 (PST)
Received: from localhost (tim@localhost)
 by server01.int.multitalents.net (8.15.2/8.13.8/Submit) with ESMTP id
 224I4sDb022786
 for <samba-technical@lists.samba.org>; Fri, 4 Mar 2022 10:04:54 -0800 (PST)
X-Authentication-Warning: server01.int.multitalents.net: tim owned process
 doing -bs
Date: Fri, 4 Mar 2022 10:04:53 -0800 (PST)
X-X-Sender: tim@server01.int.multitalents.net
To: samba-technical@lists.samba.org
Subject: issues with 4.10.16 UnixWare port
Message-ID: <alpine.UW2.2.11.2203040933550.4550@server01.int.multitalents.net>
User-Agent: Alpine 2.11 (UW2 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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
Reply-To: Tim Rice <tim@multitalents.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


I am attempting to do some initial tests on my UnixWare port
of samba-4.10.16. (4.15.3 required symlinkat, readlinkat, etc. UW
does not have)

While running "samba-tool domain provision --use-rfc2307 --interactive"
I see
.....
INFO 2022-03-04 11:49:05,728 pid:28273 /opt/lib/python3.9/site-packages/samba/provision/__init__.py #1571: Setting up self join
Security context active token stack underflow!
PANIC (pid 28273): Security context active token stack underflow!
unable to produce a stack trace on this platform
Can not dump core: corepath not set up
root@timaddc1 #
.....

Looking at the truss output I see
.....
2013:   open("/var/opt/samba/locks/sysvol", 02000000, 0644) = 14
[snip]
2013:   fchown(14, 0, 3000000)                          Err#22 EINVAL
2013:   write(2, 0xBF6F2380, 47)                        = 47
2013:      S e c u r i t y   c o n t e x t   a c t i v e   t o k e n   s t
2013:      a c k   u n d e r f l o w !\n
.....

Since MAXUID is 60002 in this platform, it is no wonder 3000000
produced an EINVAL.

What I have not been able to track down yet is, where in the source
is the 3000000 comming from?

Any ideas?

Thanks for your consideration.

-- 
Tim Rice				Multitalents
tim@multitalents.net



