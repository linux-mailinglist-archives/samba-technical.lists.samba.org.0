Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F74CDD0A
	for <lists+samba-technical@lfdr.de>; Fri,  4 Mar 2022 19:57:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=vsO/EilcSYmiwyUQTxjCvYeL2vyLE0zGeT0JGmDrl3I=; b=byCTRtNttFZIucDl8Hj5EHrZaR
	5czP2vvsuitCBeI5rH+8udPfuMUs/wiF/vYEDYjekyg1yP+aKuVEWWZD4xV4ZEz6s3cf+1cbVoiOM
	B4ubYWDHjbN0q2/Snt16H4TscY394paXX5LmuD9X6rU1QaOSxqJdWH5LGY1RkIVIyUKEbuxvi3Hrf
	Qg6/21nWz09tOuls0igvo+qm9rjvXAML5VP1yktcsfKda2Z2+NuMetdZgp/XuhSyb/48+Ek1kml84
	MwM9khPcoY0qjpu1scw4nCNJ0BF/yUT3W/0Z0Q8oQhGD0S+EI64DQ3OD0UtyXm51mEV8d0hE+9W8R
	c+WZl65g==;
Received: from ip6-localhost ([::1]:41420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nQD6S-00FtuZ-Ha; Fri, 04 Mar 2022 18:56:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49424) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nQD6N-00FtuP-HR
 for samba-technical@lists.samba.org; Fri, 04 Mar 2022 18:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=vsO/EilcSYmiwyUQTxjCvYeL2vyLE0zGeT0JGmDrl3I=; b=SFnqz0bn3OA5tbmt2aDY5D7BD/
 QOohbMZWlAvnKAK89+cQMeCBHlgp1OtQl+pd6V78y45DNX9e2dqcipudbeN4Heci4nOgfOU1gT2ui
 WIdEOC8uyztadkKYmcOgodiBjFwj43kusIyE8VQLvXTUR1SiV/pPTFyvAnAqV5spCdrowr2GX+FEQ
 m+rkObLTvfGC6WZgNrsntPvDWttialjBVzo0hZaF+cU+or+MuhxKVCFeeCbebKHhDs4DfD0Fxkq3x
 o3GJfTU1t6Y/op8TxA35qH3NuWN9vbSHIGIcVgOVKoNW/Gqx2yjEl16eOMTVoo+HOr9JEdEBO/PUA
 cqAq0NIYQywGoalN2XAtZONzrV1v8pSP1tioLUfv+WXLkKv/riiFPSf/6gVsftzz4uA7DsfAtsMjH
 0bEnU4cUhbl9oThiEk2/JHVKrvedaffo+GEUmjVPDlSp4FvyvzkCZmXYHeu7b48T0v74iS6MnWwyE
 SZCDKYfk/7JYQkUl36t9iVvo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nQD6M-006jLc-0P; Fri, 04 Mar 2022 18:56:30 +0000
Message-ID: <3d52d8c4423ac247d09600c34ea499670b2c6a4a.camel@samba.org>
Subject: Re: issues with 4.10.16 UnixWare port
To: Tim Rice <tim@multitalents.net>, samba-technical@lists.samba.org
Date: Sat, 05 Mar 2022 07:56:26 +1300
In-Reply-To: <alpine.UW2.2.11.2203040933550.4550@server01.int.multitalents.net>
References: <alpine.UW2.2.11.2203040933550.4550@server01.int.multitalents.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This comes from the default idmap.ldb database values.  You could
adjust the template.

However as you have noticed the AD DC is totally untested on UnixWare
and you will hit more problems soon.

You need xattrs and posix ACLs in particular.

Andrew Bartlett

On Fri, 2022-03-04 at 10:04 -0800, Tim Rice via samba-technical wrote:
> I am attempting to do some initial tests on my UnixWare port
> of samba-4.10.16. (4.15.3 required symlinkat, readlinkat, etc. UW
> does not have)
> 
> While running "samba-tool domain provision --use-rfc2307 --
> interactive"
> I see
> .....
> INFO 2022-03-04 11:49:05,728 pid:28273 /opt/lib/python3.9/site-
> packages/samba/provision/__init__.py #1571: Setting up self join
> Security context active token stack underflow!
> PANIC (pid 28273): Security context active token stack underflow!
> unable to produce a stack trace on this platform
> Can not dump core: corepath not set up
> root@timaddc1 #
> .....
> 
> Looking at the truss output I see
> .....
> 2013:   open("/var/opt/samba/locks/sysvol", 02000000, 0644) = 14
> [snip]
> 2013:   fchown(14, 0, 3000000)                          Err#22 EINVAL
> 2013:   write(2, 0xBF6F2380, 47)                        = 47
> 2013:      S e c u r i t y   c o n t e x t   a c t i v e   t o k e
> n   s t
> 2013:      a c k   u n d e r f l o w !\n
> .....
> 
> Since MAXUID is 60002 in this platform, it is no wonder 3000000
> produced an EINVAL.
> 
> What I have not been able to track down yet is, where in the source
> is the 3000000 comming from?
> 
> Any ideas?
> 
> Thanks for your consideration.
> 
> -- 
> Tim Rice				Multitalents
> tim@multitalents.net
> 
> 
> 

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


