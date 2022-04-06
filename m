Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97E4F5A8B
	for <lists+samba-technical@lfdr.de>; Wed,  6 Apr 2022 12:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5y6X+pnTU/U5V9O5GncfN1oKmKjUM3T7AtxKaqcB1/0=; b=fuyzv/IpTuvmZD3Jkhjo2398Uu
	2j7BsUJZuvWEIp+LuyGDdDkiCNIVQizmPYz29+ylbiGD+P7xG0EpEwqwIDMuB4It3DMSZ9iNckn6B
	7FTDhXHmFcNYmmbklwuMIKuWnHWPGprG5njiM4YwGmmwwo4itJOC+4cQHwu1VXmOVyHB595irXm5f
	0lgEOFeczCs18egrIKvPvqwwBZXPw80ryX7dXlNplxgfMQSVrgbYfUg49IXpWGk55hshHDXzfnlcb
	bYye1HkCa4ULUcxSeWbLtG11kpboP3FqdkFozr9PKnXLu2o2G9kZ8PyqtW69Q4qhHNhVd5W7OrjoG
	/mOySm8Q==;
Received: from ip6-localhost ([::1]:53018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nc2o6-00ALKM-50; Wed, 06 Apr 2022 10:22:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38196) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nc2o0-00ALKC-JQ
 for samba-technical@lists.samba.org; Wed, 06 Apr 2022 10:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=5y6X+pnTU/U5V9O5GncfN1oKmKjUM3T7AtxKaqcB1/0=; b=jepf4mhl/QdmGGLicUeOmDHh++
 DXUTDL7s2c7eteP7oVavm2rqUvqUFDbXJ9Zz/bkDJRQD1k6MFvDdNGcODjSrFV33Hn9hI2mznnj8i
 aL8Nhcq6ZZofTF1f0nNWyyshc9iAS40OR/eOfQqPkRY7rF5D1QUTGuKBhCFpmGmyL0NnnVwwDUiK5
 QCBEw/PMo3yHSFq2DxxNrUyAVvPqczjCK+2T1SLqa5K1zFxr3vVqVC6rJ0B8A85eBhaRTo/o0vzYH
 6nxvlzngD9BEn623B+dQY2AjqjcQRsBcc3O3lIIYppjOjYQ+dIv1aRA8Js69tUN+CTQSPezOBbBjf
 EvH+kMkqqWjImXlFxECQsj1QqrriFuo0QYs4by1xd6iqfEEDpL+TAAe7epQefzOBNSuIBmgW9TVrD
 iSvKRVaPXukZSN2lIzcz2rahu8CXHjIZiaBGt1rY4YHE3YmTLv12UO+7Gf2xX+T2mQBTparxedYiP
 aK7bhpTiMiZUi1Llkw43/2dc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nc2ny-005d5E-Kf; Wed, 06 Apr 2022 10:22:26 +0000
To: samba-technical@lists.samba.org
Subject: Re: doing a test build of samba
Date: Wed, 06 Apr 2022 12:22:25 +0200
Message-ID: <5417159.ZASKD2KPVS@krikkit>
In-Reply-To: <1b3f5415-f263-8b56-c66d-77049719b018@msgid.tls.msk.ru>
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <0a7f7fb7724efaa78937a1020ffb110eb5e6b75f.camel@samba.org>
 <1b3f5415-f263-8b56-c66d-77049719b018@msgid.tls.msk.ru>
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

On Tuesday, 5 April 2022 21:57:16 CEST Michael Tokarev via samba-technical 
wrote:
> 05.04.2022 22:42, Rowland Penny via samba-technical wrote:
> []
> 
> > I am definitely no expert here, but why are you running the tests ?
> > The idea (as far as I am aware) for the tests is when the code is
> > changed, the change can be tested. When the code is released e.g.
> > 4.16.0 , it doesn't require testing.
> 
> Take a look at any package for any linux distribution - most likely
> you'll find quite some amount of patches for various things.
> Most of the important packages do include selftests too.  Note these
> are run on different architectures and with different system
> components.
> 
> Current samba package in debian contains more than 300 patches.
> And the tests are disabled entirely.
> 
> Before uploading such a monster I'd love to know if it at least
> quacks still, instead of relying on my users to report problems.

You're aware that the testsuite runs for 4-5 hours?




