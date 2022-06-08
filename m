Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DC5542FA5
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jun 2022 14:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5xD2cSgA1rjY1vdvQWTMuJGMWZ5GKC0PU7q6S/P7xbg=; b=pbhn26w1nsaOMqnd09ZLnlPmHA
	g6Q6v7mWGuDafePvp06DwtplhR3vBz2DOmuTD67ELHFD+QXfDMhiEZctDhfPdKhH5EGGB3uKfPYDG
	Z1xOHcx0tCbU3r/lgzwTZvzD8R5muj8Q37OOO6l9fJBJGjziOyBydQDA8QWBgBGKKrmzKsxNHeBEH
	NJj+hniX4KJaLdpBwlM0/6qmJAjB/Kzs84A+Q3akHSeSr/3map+g2rUlLfx6bYMb08bQ5dP+S0DnS
	2inOfY71AXGXyLnpjWLiA9GwNTwtQBulfo+weks16pgMPQB8g1ZKdIe0pHxr73vntKxBpwk62mMwM
	yECZt2sg==;
Received: from ip6-localhost ([::1]:52424 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nyuPs-008K1Z-RY; Wed, 08 Jun 2022 12:04:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62148) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nyuPo-008K1Q-2Z
 for samba-technical@lists.samba.org; Wed, 08 Jun 2022 12:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=5xD2cSgA1rjY1vdvQWTMuJGMWZ5GKC0PU7q6S/P7xbg=; b=ykedo70Et8EZCHN8f0xmWZjYVM
 FXhkEKGpYzlO2chrupuM5uvVT5aTwnMqKHGoZDdyPZQMqHUdgQpn/N77zqSeR3cjGwzesbPiEa+Se
 hPq3YjnGVDDSFMeK7stHO48tG1pgJ2jnL1Ho6tCvSssxcSsuq+zWV0kd1byqnR8wbEqBlELSJg94G
 O3qLOK+YYrxn4vOJVHjxVLW4DOGgLDGmSQwCTFz5tifVXBLXK7vCDGhcMy5pH4CkW4X9bLqR5UhVr
 aiyMMcN+4u9N6V8MPr8+y04JL9BIPIQxunQB8PkfXCxpOfU65p1SzjNcN/5xDnVdc73GfRZ+ABBmD
 DBM178krV4W7wUCUTutml1xS9sbhAkU5LFlhtuy+WpkqhHWbtrabbUzE+6P2GcYJ7U0+319QaxoV/
 Qya3F+Eh+KeDGxEcfiHzY3Eded0cXGisupKzhcjD1XW0YpVfuhAeoH7o5aFrW9m7yVThfILEbrev2
 IhzwOrykAeTJiuZCGolCiMpT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nyuPb-004Zd2-DY; Wed, 08 Jun 2022 12:03:47 +0000
To: Uri Simchoni <uri@samba.org>, samba-technical@lists.samba.org
Subject: Re: More Podman work needed
Date: Wed, 08 Jun 2022 14:03:46 +0200
Message-ID: <1737413.VLH7GnMWUR@magrathea>
In-Reply-To: <55008d104d4efc5c286e790836e1a6d4a01ea525.camel@samba.org>
References: <55008d104d4efc5c286e790836e1a6d4a01ea525.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, June 8, 2022 5:23:09 AM CEST Andrew Bartlett via samba-technical 
wrote:
> Kia Ora Uri,
> 
> Thanks so much for the podman work, this was awesome!
> 
> We have had a couple of niggles on the CI recently, and one was
> that quay.io/podman/stable is following Fedora images fairly closely,
> and 'diff' got dropped from fedora 36 by default.  Ouch!

I would suggest to use CentOS 9 Stream

https://quay.io/repository/centos/centos?tab=tags <<< stream9

instead.


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



