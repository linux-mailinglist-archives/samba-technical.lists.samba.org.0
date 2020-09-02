Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC2525A2E9
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 04:12:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=l9wWNe5k0K/MHDCNy0zHVKJKP8IFx9rv3LbiLqNssIk=; b=CHkQMFq80SyeNRGdJvWGC6j117
	V9owpQ/FlxsqEcPA8Xx+xKL8VxaNFWXt4zbR5XbOOibfEhl48usMWQmhkn+/wJ3eKj1jxH9Ubmwsc
	D244Id9pISAO6kHJUCyrUC68tC9BGKnG1bT7TQTFqwPfS+J7YY+cNT69Q33sx8IrwlaUAhUeK3KWs
	A3wmr9fsCHmmMaZj8YBt1wTyvRv021jxJgTs7OjkpK9xgYpaTpYjYh6/m+uCH76rD+1mckdnU9FL/
	tvY68lRgmLksPRcooMUaEQf19Myu7BU84e75He8FkNFzyGlAEQbPVqOeyWeDgs9Li1uQsCWfoUzu7
	jXtmxnag==;
Received: from localhost ([::1]:31612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDIFC-003S9s-QU; Wed, 02 Sep 2020 02:11:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57322) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDIF5-003S9E-Og
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 02:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=ws58BqsH7xTZVXk7GxfBhV1W5A4mp8h5g/xcaFHArjY=; b=kINgplFDM/wDeaEhVrXSo/M0UT
 7lP0syxTQj5xOGDZAxC2fp7gY+AVoXCDAENoCJYNSZG4Y7tLTeaf5WfB+ti0idXpkyElWaZZZINBM
 qqgXq2tVxQmZlMfVEF8RdZs46QIR9u6ILpCHlIpN3NLN6socffl9FPReaJjmsiyr/Jnnpg2dQpXZq
 8h5HXREaHqToHO4YEKPaDwCPl6ejFbv5mUtrh/KtjyOJ3sVQo0+wGEFeUZNRsncHOb7VYQIBE4fjc
 FR9l7qufa24bPnTVEsVb9cHURff1rS17Ycw22i6pHQjunO1j10p8x6RbLNG4eRGLONufAzKL8sph7
 JS6RQEYv6arVxRtaY6GKzWz93tE0bLgvYvWH39wi8M0BUbI0CpaxVNm643vamo9zWyE3tXo3JGO/g
 1d2L1dS+KgKoEiT4WyiUY57r8PiFvqR3MODVHy563+99Vx/rgC2tO6g1qngJP07SvzV3/ZzoSGh8J
 dmPWmkpiDQ6+GAxeqKO5dMXW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDIF5-0005FI-Ds
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 02:11:19 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kDIF0-00DMCW-7y
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 02:11:14 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: Significant point about veto files.
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-142@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-142@samba.org>
Date: Wed, 02 Sep 2020 02:11:14 +0000
Message-Id: <E1kDIF0-00DMCW-7y@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhlcmUncyBhIGNsb3NlZCBwdWxsIHJlcXVlc3Qgb24gdGhlIFNhbWJhIFNhbWJhIEdpdGh1YiBy
ZXBvc2l0b3J5CgpTaWduaWZpY2FudCBwb2ludCBhYm91dCB2ZXRvIGZpbGVzLgpodHRwczovL2dp
dGh1Yi5jb20vc2FtYmEtdGVhbS9zYW1iYS9wdWxsLzE0MgpEZXNjcmlwdGlvbjogSXQgbWlnaHQg
YmUgZXhwZWN0ZWQgdGhhdCB0aGlzIHBhcmFtZXRlciBpbmhlcml0cyBvbiBhIGRpcmVjdG9yeSwg
b3IgcHJldmVudHMgdHJhdmVyc2FsLiBJdCBvbmx5IHByZXZlbnRzIHRoZSB2aWV3aW5nIG9yIGFj
Y2VzcyBvZiBhIGxpc3RlZCBkaXJlY3RvcnksIG5vdCBpdHMgY29udGVudHMuIFdvcnRoIGEgbWVu
dGlvbi4K
