Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA556458E40
	for <lists+samba-technical@lfdr.de>; Mon, 22 Nov 2021 13:27:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zShOTYXDVghO7svNggS98r5YqW045cHbJyM+8nr0GK0=; b=auGm92HLfq4YuH/Xu55d1BwEhu
	wfwwarAjy9/EKW5HaRRa5Fs0RH7rWEKyy5kH5mV4MZnKV8Z2Yns+AmUCTQFwgMctPm6/f6/GBObQe
	X17PCfJ6Gur6mFXJW+ZMJcKjm9UKV9aVMw6ZZgbQVCKxlJV8XvFCcJmPWs4WVpn+BRGPHJWCbApCW
	5agLntpq2iiLOcSRk9ZzeMk1rdlduWA1pDsDcI07S9157M0PgU4sK7lG0UcREoqDNSYgXErMJbImF
	R3B/Pd3fAEj2l3rlfMEP+9YKzuZVrVdznouX3viDtYrooKa5xezv+WV5vJRArMQK3k/BOWrQMJGOC
	U05gnwew==;
Received: from ip6-localhost ([::1]:29528 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mp8Ou-003iB4-J2; Mon, 22 Nov 2021 12:26:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58448) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mp8Oo-003iAu-9Q
 for samba-technical@lists.samba.org; Mon, 22 Nov 2021 12:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=zShOTYXDVghO7svNggS98r5YqW045cHbJyM+8nr0GK0=; b=vyVA5FA8nibUST/QWvcO6/lQme
 PH0Fejkm/8g3ZpNnV1pmI0cFTxW7Nsz8deK0vsnsp+bnvr9aO4kShKoW/AXQXDz5KInYDCyJm8WiV
 YqfkioU0jmlOxf7w3IiaI9XCGL52hzOIz/e6Oxrhhr9OCEKkCFZDAEIxJwAdE4yywZdLAcJghLhM1
 wFa5M3cKUYLW01svP3Yhoe6KGIzH5IFi3wZ46Ey4Tmdw/1n4NhaBYMbAlmgT8Tj407N0wYn+De+2R
 IojpUwUzJRogPnETbkxuE/ODh+xFCrH9ciCmHEjCc7UJeV7XjJLgOuen7v2hL84BtmJ62uH+gBHND
 a7O55LoppMmN90KZp7UPZ6puILjiVrtbcSd4h+2T9nanQqDTeahfbEANxCe34Acw3juWapMdOEMmL
 BpWKdvNUGEsL0wE8JCGwE7SUTk3JTnrUkB7eqll8gwwkIiKSNr3E5yruJ2dfwtRu2DWlzI5j8pcrp
 zGYy8Yzdh4f6rPiRIi7nENdN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mp8Ol-008NH7-EB; Mon, 22 Nov 2021 12:26:15 +0000
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: Heimdal working around gcc strcmp issue, can someone check Samba
Date: Mon, 22 Nov 2021 13:26:14 +0100
Message-ID: <2007614.JLXpmcCzLj@magrathea>
In-Reply-To: <bdf93a25-4e11-8c2f-3fc8-bd4392dce0f3@catalyst.net.nz>
References: <9480d292b7a87f26988fe5ab8d43819615e3e329.camel@samba.org>
 <bdf93a25-4e11-8c2f-3fc8-bd4392dce0f3@catalyst.net.nz>
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
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, November 17, 2021 5:45:45 AM CET Douglas Bagnall via samba-
technical wrote:
> On 16/11/21 7:01 pm, Andrew Bartlett via samba-technical wrote:
> > I just got notified of this PR for Heimdal:
> > https://github.com/heimdal/heimdal/pull/855
> > 
> > Can someone work out how much this bites Samba (and can we just ban the
> > buggy compilers?)
> 
> Although
> 
>      if (strcmp(a, b)) {
> 
> is contrary to our target style, my reading of the bug is that it does
> not affect strcmp, AND it does not affect the
> 
>      if (memcmp(a, b, len)) {
> 
> case, because of the implicit `!= 0` there. See
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95189#c17

Isn't this clear about the problem:

--quote--
After looking at the GCC patch that fixes this, we believe that this bug only 
occurs when
  * at least one of the compared byte arrays is constant and has a zero byte 
in position 0, 1, 2, or 3, *and*
  * the result of the memcmp isn't immediately used in a "== 0" or "!= 0" test 
(or equivalently "if(memcmp(...))" or "if(!memcmp(...))").
--quote--

So what actually needs fixing in heimdal and samba's heimdal code is RC4:

https://github.com/heimdal/heimdal/blob/
7ae2dfd853c87f9cbecb6f399de4dad09bad4606/lib/gssapi/krb5/arcfour.c#L390, 
https://github.com/heimdal/heimdal/blob/
7ae2dfd853c87f9cbecb6f399de4dad09bad4606/lib/gssapi/krb5/arcfour.c#L661, 
https://github.com/heimdal/heimdal/blob/
7ae2dfd853c87f9cbecb6f399de4dad09bad4606/lib/gssapi/krb5/arcfour.c#L1279

Looking at Samba code I found:

source4/heimdal/lib/gssapi/krb5/unwrap.c
source4/heimdal/lib/gssapi/krb5/verify_mic.c


`rg memcmp | rg zero` looks fine for me.




	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



