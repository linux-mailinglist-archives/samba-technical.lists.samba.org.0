Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A40B1DCD6
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 20:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=GgxI6ppqnR3P6BiPEUJHguXrFmA21zrA1fXeD+3wn0A=; b=kwEf6JZo+2dwwy8xD+Ql5RaJcA
	gerl8JHuF+a3n4Y7LWDsTvGMkRZ5rQNgicxX67o2rlpIIe+WNc7EJirL4dDiEzqZuA8lBU1QOE0VC
	GwAX0XEdzs28LYq9TADkh3vZ6xBgYdM4a3zkKWsbYY/J8HF4Yle1aXd2ymu9z4SSuNQMUnLMVaw68
	RaGSOy8rkN2LuYz+hWho5snUw/kAa6P6VHkcPJKaO+L4pczKRggxWH6J/0NNgYqFEYSOsrw7xP1ST
	9tEaR3ZB89hnNi4kxyyLbHU+BrkAU792yqD8931iZpX4Szs9yyK9nPp8E6S7rrxJo6BIGiuBnZHN6
	6UVW0+KQ==;
Received: from ip6-localhost ([::1]:42904 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk4yX-00EbWh-Sp; Thu, 07 Aug 2025 18:04:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49118) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk4yR-00EbW6-TE
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 18:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=GgxI6ppqnR3P6BiPEUJHguXrFmA21zrA1fXeD+3wn0A=; b=NdZbFJob3hXVclRpGg/8bCF+zO
 n6TZw+Q1oDmszWZujOap9V7pyx6GnmM1bl++fS1GClTXAqVknUEeeYa7/FMpT3nr9B+lV/9ZwphQU
 F4IhXPaR+Dt6iC1aDRK2xJnw/G+WvdnQbbRKsq6i3roqOVzrxhzweFRjHDC19/QcedYrUFyJO6dNW
 NG4gT6bnQ7qTIKWshU+5nIM2qk6QB0iqGhzXoubkMtHt3V2eDW1R3IYuKcrSvR3UJIRtlWFabzmLo
 eXT/BGBNIthVfVBdhJiO2xu7L6U+q6VrAbYNJUORo6AYekPt6ksO94But0XhkOCFA/H2C+aV1YWGa
 +AKDqqLjgONKs74b1BPRNip9MTCYZvIBOVqvGoJtOpR8iQrhekeo5EL94D77NUk6M6xLchIwvCVsg
 XvmlnmGVBu45eTSN34/fjgOmJPvyEVzS50aXW/4YkmxiIq4yjddiMn4TdJz8sXKQxakKICD+U4Qje
 oxcUUnXJUIfqS0YDMUk/hiB4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk4yR-001e4S-1G; Thu, 07 Aug 2025 18:04:19 +0000
Date: Thu, 7 Aug 2025 21:08:27 +0300
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: new deps for new ldb module (in 4.23)
Message-ID: <aJTrmyIFPXJ2kqjn@toolbx>
References: <732bd60b-7df6-49bb-84da-cabd30e7ccaf@tls.msk.ru>
 <aJTkachtlSAw1nIW@toolbx>
 <29a0a8de-c7cb-4438-a0a0-106fcb6a336d@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29a0a8de-c7cb-4438-a0a0-106fcb6a336d@tls.msk.ru>
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
Cc: vl@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 07 Aug 2025, Michael Tokarev via samba-technical wrote:
> > I guess we don't have a good test in the selftests that would track this
> > target. On the other hand, SSSD relies on the same base libraries
> > (tevent, etc) that samba does and also links to Samba NDR libraries, it
> > should be ok.
> 
> Well, libndr is actually a part of libldb package in debian :)
> 
> Yes, libldb+libndr uses talloc/tevent/etc, but not all the other
> samba libraries, except of this part:
> 
> > > (*) in 4.22, I had to revert one commit for this to work, -
> > > 542cf01bfe530 "ldb: User hexchars_upper from replace.h".
> > > It would be great if this commit is reverted upstream too, --
> > > if it is somehow desirable to keep libldb usable separately.
> 
> With this commit reverted, libldb can be used without all
> the other bunch of (private) samba libs, and sssd uses it.
> Without, installing libldb pulls up half of the samba - exactly
> in the same way which forced to link pam and nss libs in its
> own unique way.
> 
> This is obviously manageable at the distribution level, as long
> as more code from private samba libs is not used by libldb.

Please open a bug and supply (the revert) patch. Maybe a comment in the
code would also be good?

CC: Volker, please see the note about 542cf01bfe530 above.

Linking to libreplace with 542cf01bfe530 only to get hex chars array
additionally brings a lot of internal samba private libraries that
otherwise aren't needed in ldb when it is used outside of Samba.

-- 
/ Alexander Bokovoy

