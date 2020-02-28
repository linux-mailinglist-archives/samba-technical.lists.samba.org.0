Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B155173F34
	for <lists+samba-technical@lfdr.de>; Fri, 28 Feb 2020 19:10:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=GUMkek8vym52sPlLiJKF95vRs4XtDjOJUOyLoj5RIGI=; b=rB87ve4hRz7InaskjMpTds2COR
	HN0wuBQPavD68fUjbX5U9lqMF2P5+mpxAX/eGiHw0HN44clnShnWtW6tGBhKQhcL6XAD2x+SPl3Nr
	Xv6n/bBQwypVi/uB99493m4qMElki/2Ygt5YRmMqSsNY5vuGWU4we38A+OXRt8gaaTrUl3HAO2c/w
	x0C5l4O/L/FCUzJxxMwXv4z488VopjTHrn7TKpLhEOEp7HDEAt6gYbWfE/cAmwwDfMBJP9ebSp6ae
	2+UHDy8+/5rwtML5urGSWErFfRX1qXyo+ujc+QV1Dz9CbXkFABtn7rfLKNngVDgI3qX5vm7YQOKtQ
	SI2VtnoQ==;
Received: from localhost ([::1]:61004 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j7k5N-00CNk0-1k; Fri, 28 Feb 2020 18:10:05 +0000
Received: from [80.20.169.36] (port=44085 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1j7k5H-00CNjt-PT
 for samba-technical@lists.samba.org; Fri, 28 Feb 2020 18:10:01 +0000
Received: (qmail 1432 invoked by uid 121); 28 Feb 2020 19:09:56 +0100
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25735. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.188554 secs); 28 Feb 2020 18:09:56 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 28 Feb 2020 19:09:56 +0100
Message-ID: <33fafd6a8ff5f53a6e70f752fa879a903b0b0065.camel@solinos.it>
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
Date: Fri, 28 Feb 2020 19:09:55 +0100
In-Reply-To: <d804f548-50d1-f188-959c-57cd828174e8@samba.org>
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <5b43a40c-9d80-a6d1-cb63-046cef3bbf77@samba.org>
 <88708706a3ddaf37a6ea43ecd86289c0ada99b69.camel@solinos.it>
 <d804f548-50d1-f188-959c-57cd828174e8@samba.org>
Organization: Solinos
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Dario Lesca via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Il giorno dom, 23/02/2020 alle 14.41 +0000, Rowland penny via samba-
technical ha scritto:
> Yes, stop using the script, you only really need it if you have Unix
> clients.

Today I have try what you suggested: stop using script.
Then I have remove from dhcpd.conf the "on {commit,release,expiry}"
sessions, restart dhcpd, remove with samba-tool from DNS the A and PTR
record added by the script, and power on win10a.
Into DC log I have get this message:
feb 28 18:54:18 addc1.fedora.loc named[718]: samba_dlz: starting
transaction on zone fedora.locfeb 28 18:54:18 addc1.fedora.loc
named[718]: client @0x7f128c3e5eb0 192.168.122.103#51072: update
'fedora.loc/IN' deniedfeb 28 18:54:18 addc1.fedora.loc named[718]:
samba_dlz: cancelling transaction on zone fedora.loc
Also if I run on win10a the command "ipconfig /registerdns" I get these
messages
I must unjoind and rejoin win10a to domain?
Thanks

-- 
Dario Lesca
(inviato dal mio Linux Fedora 31 Workstation)
