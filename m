Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E36D96C44A9
	for <lists+samba-technical@lfdr.de>; Wed, 22 Mar 2023 09:11:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kwr1Qzfpyt34kTdD9v0mjzy6XgJiOT+cKc+xkm1EUxQ=; b=gvyl25AXccDXhv9G6H/NUCvlvD
	VjVYnStnMQQSnuqDO/8ug00OuVyeg5ppLGBHdVQysoNIojuQgVLPyughL+TF2AghnPD8DMakgFvIA
	h9Nm/jQw386WwCJJAY56VhjSQFD5Nl1VQLuIdcSkqEdqmPN9EOhMBiOUnf9KgCSyRpnS2Ea/1ay5O
	AttAdpmF5ybtVAK6IyZGH/MH8VIsbwj5PSuoa/R6SgZ5d8ABrEVUae96waGdiTMvvdwhsRzsbd0iO
	Uo46vqJBvDllbjoQGoBSdxJe7zAFHi/wJMZFrvCiRy8wEDAdtIXnfNTnSZ4JwMWaDwFbnn2F/pjCw
	aBRg5ojQ==;
Received: from ip6-localhost ([::1]:35728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1petZ5-003s09-Cj; Wed, 22 Mar 2023 08:11:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13402) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1petZ0-003rzz-PE; Wed, 22 Mar 2023 08:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=kwr1Qzfpyt34kTdD9v0mjzy6XgJiOT+cKc+xkm1EUxQ=; b=2tlVt88j0MvJ0wEVX97kMMirM1
 a80xjmTDrAOpMcGsptsS+KidQRwI5i/5Fdq8gzR3hnIjrFz5QgIO7pRkAdJp59+N7+Vww5s7cHDfS
 Q2xPGLFtyWSOqIdVve6/5CSz+b6LcASld0leI81iwD+lWCT2nshn7JKyqaX/CK9HaPHz8+SLgQuYS
 nxl1Fti3xMVTKdVB53YO3MnK4MrUnuQppUI0g9LQyQAbfa1UNO1epZoz7LGNxqJp+SGh/uGWxdj98
 U4f3EAAv5HsqcWfxwURDEgbX/vHiQTKRAWJCl18Qs3Ev01A2/Y0h+YUD/Jm+vfLSlbiYCT8efOy5N
 Q8Qx8DE/ixRsyfUgi9xALzfjms5wuoorLkE4ZJZWhoWeMm+IO1mPrHltaqgCbF2O4m6MENGUbCPqV
 z5Y0EDUQ6BtTrJAo/dqS5FSnbt4LaTzaHMhFi++hanxfZCxIPKJ/s6MgA25Wa+VGlL89lZSYGKXBP
 /b5CYjSkCn2xuQt+DAsG6hGF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1petZ0-004p4V-2X; Wed, 22 Mar 2023 08:11:18 +0000
Date: Wed, 22 Mar 2023 10:11:16 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: mit-krb5 and heimdal binaries
Message-ID: <ZBq4JFXFExL6ipPD@pinega.vda.li>
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <9b05bc0bbd74c3d8cb02bf2a59713bd5fb0b677d.camel@samba.org>
 <ZBgbvnB76vjgkq/B@pinega.vda.li>
 <b9e0eed101e224500c3e665e8505052fc07b6501.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9e0eed101e224500c3e665e8505052fc07b6501.camel@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba@lists.samba.org, samba-technical <samba-technical@lists.samba.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 22 maalis 2023, Andrew Bartlett wrote:
> On Mon, 2023-03-20 at 10:39 +0200, Alexander Bokovoy wrote:
> > Indeed. For the record, current set of tests not supported by
> > 
> > --with-system-mitkrb5 build:
> > 
> > 
> > 
> > ----------------------------------------
> > 
> > $ cat selftest/skip_mit_kdc
> > 
> > # We do not support RODC yet
> > 
> > .*rodc
> > 
> > .*RODC
> > 
> > ^samba4.ntvfs.cifs.ntlm.base.unlink
> > 
> > ^samba4.ntvfs.cifs.krb5.base.unlink
> > 
> > 
> > 
> > $ cat selftest/knownfail_mit_kdc_1_20 
> 
> ...
> 
> The bulk of the failing tests are in the 'common'
> selftest/knownfail_mit_kdc file, the file you mention above is only for
> tests that are different between 1.20 and prior versions.
> 
> $ wc -l selftest/knownfail_mit_kdc
> 2207 selftest/knownfail_mit_kdc
> 
> It isn't as bad as it seems, and most of the differences simply won't
> matter, which is why I felt confident to make the statement I did
> earlier, but it isn't nearly done either. 
> 
> Thankfully most of the work is to write such a testsuite, and I'm very
> grateful to Metze for starting that work and to Joseph for greatly
> extending it, and in particular to those who funded the time spent. 

+100. The fact that we now have a comprehensive test suite that covers
many aspects of the Kerberos behavior, indepedently of Microsoft's test
suite, is a huge benefit to everyone. Thank to all participants!


-- 
/ Alexander Bokovoy

