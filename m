Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5F24EF9D1
	for <lists+samba-technical@lfdr.de>; Fri,  1 Apr 2022 20:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3eoLDr32av87uMtHzwL/+CL2J5s5Fa4iibJlg3KfJhc=; b=P63BK2GF+bWQvRZ8lsQkxv53fw
	t4VCtdvNEyR4/rtbrMLY4C140Xpn/frqcOkmdJJwx37FLL+JtLHFyXGf/WFObwSDzF7fv6nr8CSb0
	Tl0sdZVggOlDqrmEEn/5nHDz+Ut9bkA0eC83fP/XnYxJR8Bv7D+TzmKJI4kNF3tvmOngbEY4vipsB
	GYhaaOHEPk+iGl/xjqlAQI/NJShsKrD7MFKAlzX4F9TQju5KPh0yRzeAuf1PANGdQbuom3lCI2nyL
	tQDD+/fgutloK8WcwonhQ9xf17zrVMbvfJf1Spo+W2fgCXRx98TJ4DLugvRVMqu7l6djr9wysusB+
	+pKQZB2w==;
Received: from ip6-localhost ([::1]:40174 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1naLyD-009Kpo-7u; Fri, 01 Apr 2022 18:26:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38088) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1naLy7-009Kpf-UI
 for samba-technical@lists.samba.org; Fri, 01 Apr 2022 18:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=3eoLDr32av87uMtHzwL/+CL2J5s5Fa4iibJlg3KfJhc=; b=zD37yw5N0XxhbMcKwqRdaihtqD
 AW6QoZTvBWyzjqH7UCG34eOzQvoy8OPYAOidX0MtiSzyiIFrkSlDHtXppCjlz15AZmaI2ECq/FAC+
 tEpwIuwd19qMr/nOaNRxvRRQ1ALo3WUp1qkmjPiBASqGoWoClXPf4bGxMNhcOqTzx9FUtlY8Dnvkv
 Y79vCe6lB8BMEjUBoz6A4LrC2ClyBpeaW242MesW2skrqcbaAhOF18IvGRtLNFY+rEwMitK0UJfxN
 0eT4gPpWSm3jqSQiRvF3csxh7BnxwJx/HTF4f6r9hUvJyWRVyh3wvSBGkvWADGHHBQwIv3UAo8eu0
 Y4PcXhv9JnyyuqSnTwLIdcpSPOX3xrwmP2NTo5wg7t02z1LJpDr8TLGDd9u7W+ESh+TRYgtypA0WJ
 2ltAv0zZMDO+0+sXroLoUsk+CUhZNcAbS2hw5/JPXtpsN4fLiN4yOrqGcXRiq1X8w42y7ap79Afv6
 A/4Z07duqAUTF9dbk8e5aNcS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1naLy6-004pLO-MK; Fri, 01 Apr 2022 18:25:55 +0000
Date: Fri, 1 Apr 2022 11:25:52 -0700
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: submitting a fix/patch
Message-ID: <YkdDsIWwJ2NUbRWD@jeremy-acer>
References: <93ff600b-e2e5-1bb1-7f7d-e32ed4cda438@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <93ff600b-e2e5-1bb1-7f7d-e32ed4cda438@msgid.tls.msk.ru>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Apr 01, 2022 at 09:23:28PM +0300, Michael Tokarev via samba-technical wrote:
>Hi.
>
>Samba wiki describes how to submit a patch to samba,
>and it shows gitlab way of doing things. Is it the
>only way? I mean, for small things like spelling
>fixes, one-liners, is it really necessary to create
>a gitlab account?
>
>I created a bug, https://bugzilla.samba.org/show_bug.cgi?id=15039 ,
>with a patch in it, - should I create a gitlab account
>instead and send an MR as outlined in the wiki?

Yes please.

>I really hate creating accounts everywhere just for
>some small things. I already have 3 accounts on
>samba (wiki, bugzilla and mailman), - thought it
>will be enough, - but it was before I read the
>"contributing" page...

Sorry, I apologise. But gitlab is our preferred
patch evaluation environment. People work from
the merge queue there, so it really helps to
have everything available on one site.

Thanks so much for contribuiting, it is much
appreciated !

