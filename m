Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB5E5B4631
	for <lists+samba-technical@lfdr.de>; Sat, 10 Sep 2022 14:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=eX803WXszZm4rdx8ixBHMCVlELvizxUdDiKomSl1yqI=; b=zUXUM9s83poJHLxvaMFrkgv6ZZ
	H0t4Z/+21c/ICg9NokZoer8/stDNth7QB+Ie/+rCHCkV1nkdlk9zPgUG5EKPUaxdMeYwWLGmKVFtx
	rpBpQxXruE0wl5m27CJnB0MAX4G7WgnGuwMs/y76fhiEAXO4b2R0tSaf6VP8aHoVh8NOcHckl6c/C
	D2MTFIK/8Bz5r97PDNCg9e73bxFIb6q4nizD4vUs9oPHoVEOaYDQFlhxiAU4hZmSNibdjKAMg8CBq
	sWLFk5GRrk3T8PZSOacYVcFaL/r7hq0CKIs8v8Fn2e5CbC2qxQ+fXVpjttH3FR/b/qcMUBc0R0H0O
	JilyeWrA==;
Received: from ip6-localhost ([::1]:21928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oWzc7-000YSx-6j; Sat, 10 Sep 2022 12:29:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47918) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oWzc1-000YSo-Mm
 for samba-technical@lists.samba.org; Sat, 10 Sep 2022 12:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=eX803WXszZm4rdx8ixBHMCVlELvizxUdDiKomSl1yqI=; b=qrM9kE2nIBgkeRk+H8omY6msDA
 qTUinicoHPPv3beUwuV48NsZosoo/WcOKpuiMlQys3Y29uMa3XNgTWAh3B8/iHcm988NMIGZHvpWg
 z7xyZR3c2anHPV53AKtFVTKaG+QnZo5SE+UjSphlKgIv+48QlqYAXRsUh4uOHuj2we34GfGgMvApM
 5hx6DLLwaUbBql18SDTTgEqCSk4tj3NQ7ipnaSLEGiHPCloVXyTYgYCA/DKCqQNlXJpJAShjb+g0U
 RFd0cvd2LAzG/338iqf84jX+D+LB9UVTnoeoD1UpS2Fqgryt/zubVefKrhv9y+u9sofc/ibywvbyh
 OQGhUI9Qn0pvsbFRRc6L4JzRWhnwuYp6n1hjdvC9BO6Ucu5OcRrDWUTwtwus8ux70dJAzJhW3V+ke
 aenHAVmHbbbMwVECSUEl6AcMpxU/ZFQn0H0WLqKfq28G9EoPwql78+E1Qg1t22yc3UETaSL2mPHZX
 vOU1d5dzd/Gm7IxeeWxv1nCn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oWzc0-000Eew-9M; Sat, 10 Sep 2022 12:29:28 +0000
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: ldb ABI versions in 4.17: should it include 2.5.1 & 2.5.2
 versions too?
Date: Sat, 10 Sep 2022 14:29:25 +0200
Message-ID: <4428715.LvFx2qVVIh@magrathea>
In-Reply-To: <84f22458-d5cc-f74c-9a35-596e22929f59@msgid.tls.msk.ru>
References: <cc05692a-2a75-a9d8-6f33-88ffb91a9588@msgid.tls.msk.ru>
 <7e33db4d2504d4458ddc67aa5fac47a22592dce5.camel@samba.org>
 <84f22458-d5cc-f74c-9a35-596e22929f59@msgid.tls.msk.ru>
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
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Saturday, 10 September 2022 12:20:06 CEST Michael Tokarev via samba-
technical wrote:
> 09.09.2022 23:20, Andrew Bartlett via samba-technical wrote:
> > On Fri, 2022-09-09 at 14:19 +0300, Michael Tokarev via samba-technical
> > 
> > wrote:
> >> I'm not sure if this matter or not (since ldb is tied with samba), but
> >> ldb in 4.17.0rc5 lacks versions 2.5.1 and 2.5.2 released within samba
> >> 4.16.x series, while previous minor ldb releases are listed there.
> > 
> > No, we don't normally include the branched history of ldb there.
> 
> Maybe this is something which can be reviewed?
> 
> The thing is.  Giving this ldb-2.5.2 version as an example.
> 
> Let's imagine there's a program using ldb (linking with ldb).  And it
> has been compiled with ldb-2.5.2.  And it uses, say,
> ldb_msg_add_string_flags symbol.  When compiled/linked against ldb-2.5.2,
> the executable is marked with NEEDS: ldb_msg_add_string_flags@LDB_2.5.2,
> and generally needs LDB_2.5.2 version in libldb.
> 
> Now we upgrade libldb from 2.5.2 to 2.6.1. But there, the same
> ldb_msg_add_string_flags is versioned as LDB_2.6.1. But it is the
> same symbol, doing exactly the same thing.
> 
> So this program which were linked with ldb-2.5.2, will not run after
> upgrade. - runtime linker will complain it can't find LDB_2.5.2 version
> (and this symbol) in just-upgraded ldb-2.6.1.  So we'll have to
> recompile the program just to fix the ldb versioning references.
> 
> Maybe for ldb this is more theoretical, since main its user is samba,
> and as far as I can tell, samba should use exactly the same version of
> ldb at runtime as it were compiled with.  In debian we do have this
> requirement now, - maybe someday it can be lifted, I dunno.  But for
> other libraries this might be more interesting.

I argued with this many times, but libldb is simply not a stable API and it 
should have never been released as a public library.

The problem is that as it has been released and others started to use it (e.g. 
sssd). So whenever you update ldb you always have to recompile all projects 
depending on it.

In RHEL we have marked libldb as ACG level 4
https://access.redhat.com/articles/rhel8-abi-compatibility


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



