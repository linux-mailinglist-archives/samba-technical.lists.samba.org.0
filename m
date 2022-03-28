Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A3E4E9009
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 10:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=T27BZoifqM/Y14LpRZsk1B+nISev4WNKBFX5FddjZHA=; b=UlfU202xBs8iWcmt76xaDveogD
	deneuE90h5jDwos5AXJZgP7IBGTGxMZUsPjXLau/e0VqfYGlyyS4yKPg65iWIX3ATG0s81jub6U1/
	/eycgOQnLwv1DqUH3eF8eK+nLEda0tA7SfSw2Jr0JVVU8U+WQIbst0B6HdOKfcIR7Q2dp6HP8h9qY
	vjHxmqxo67v8oXHDY4xr7lwpNLMGgrHsIx3qRIBVfbPjP4IoZtKgnjp+7oI7cG+wxTO1zXqBQymLH
	auEUHWPcIhokdjSx+TUjJwQm2JwOIENDACtAQo1VIZJRgAKNg827SDs9mYDioqHulQWNdNijD7Hx/
	26rekxFw==;
Received: from ip6-localhost ([::1]:38662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYkcr-005uDM-Iw; Mon, 28 Mar 2022 08:21:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37936) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYkcm-005uD8-Oz
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 08:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=T27BZoifqM/Y14LpRZsk1B+nISev4WNKBFX5FddjZHA=; b=y8sd5n5sybfqiL5Q+plUga4QvU
 SE+mgduOwjpZoNze2UNWOUDGCUDGsVUzNWyXwYw5DJ7HAgfvZMkxd3aIXo0LbB1zrgrIqB3qJ/0wh
 MnrmkFs6Mp1HWwD/Xf38K+tsvvoODOyYSgMj5wgTza9uw1s3CmVMezfz7B4aLGQRsSAbR/IUIKBs2
 wANvp1qED1Zo8FCT9eqYdtVcQ51w2S6KaD9i4mbHN78UM4H6JKJV/Rxf0xIqDQnboZbUowRlFdDjl
 XveY0muJ1YzrL7BkDY6qFBO0wzQhox220+/7+fUEGquLJApGMEG79217VKeW5ebqda7bX2s2SPFWp
 v3EHfGI/ltQvywoDBCD8UEX+HYgThIsjBpp1cSzKaC6wfjy66XkWElR4+xJejdH+PeOt0FFsicGEN
 JkdFXgTa/R/MTLZpYd7Xrkmk05gOMf+5Zw7Y9tTCPS2yGstiq1TbOu3BYfEOhQJMD/4awBZuJDI9L
 k5AVyGuvzV1UGO7TjuIukKko;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nYkck-003xLD-UK; Mon, 28 Mar 2022 08:21:15 +0000
Message-ID: <4fe2488cc85607e4fa9de85f7ab644b75ce00a84.camel@samba.org>
Subject: Re: heimdal headers ordering (gssapi/gssapi.h, crypto-headers.h)
To: Michael Tokarev <mjt@tls.msk.ru>, Stefan Metzmacher <metze@samba.org>, 
 samba-technical <samba-technical@lists.samba.org>
Date: Mon, 28 Mar 2022 21:21:10 +1300
In-Reply-To: <9d28aabc-dd1c-d2c9-fb7d-db05ab40a6f1@msgid.tls.msk.ru>
References: <412176a7-bbb3-1937-357d-5325ec4f5d2d@msgid.tls.msk.ru>
 <bffcbec6-8e6c-e076-ff0a-2ce00047fe04@samba.org>
 <9d28aabc-dd1c-d2c9-fb7d-db05ab40a6f1@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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

On Mon, 2022-03-28 at 11:13 +0300, Michael Tokarev via samba-technical
wrote:
> 28.03.2022 11:04, Stefan Metzmacher via samba-technical wrote:
> > Hi,
> > 
> > are your using 'waf build' directly? This that I saw the same
> > problem in the past. Please use 'make' and 'make install',
> > the difference is that it passes PYTHONHASHSEED=1, without that
> > the order is random.
> 
> Oh ma!.. Heh.
> 
> I was using ./debian/rules build (et al), - this is what I have
> inherited, which was used in Debian for a long time.

Indeed, it is quite old.  I did much of the merged package work,
building in turn on the work of Jelmer Vernooĳ in particular for the
first 'samba4' packages in Debian.

Being some of the earliest packaging it has references to some of the
earlier ideas (like invoking waf, not the 'compatibility wrappers')
that didn't take hold in Samba. 

> Yes indeed, d/rules invokes waf directly without using the
> Makefile wrapper and without setting PYTHONHASHSEED.
> 
> This should fix my issue.

:-)

I'm glad this turned out to be (fairly) easy.

> Thank you!
> 
> It'd be very nice to have this fixed inside waf too :)

Just so you know how that works, like the other 'third_party'
components, to do that we would need to work it with upstream, then
import a new version.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


