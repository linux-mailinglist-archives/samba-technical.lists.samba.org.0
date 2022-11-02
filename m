Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B2261615D41
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 09:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=wINdas7Cb8XSSgsxX+Dt/pLiYQ8uRsx974PPp3E5krA=; b=5bafFZGF5DmnhNJP43ngAVh1R4
	AEU17Ib4FWf6M5UsSE6zyYph4riMBmKtKLaH/lGduiOeiyOYuTFSDYHp6A93L9qYiXaRoLZmnlgB8
	q7zSZIdhGI8yLREgzEDDkzJL9RvY40Qz5KreOec1WmO4CLwM/tWGnkn8AdU+baT0KyZqac/tkR/SW
	HSm7CSLZ4tHj1qRuv1z7m4Aoqnvg96BtdbDSE/Cwo6ipIk9791Aht4YGt3DxHqX6ouYAySqYw6znc
	AeYuc0679kT+AMWNetEexDDVHFQzpgXwpHoRkCDKkqi23fEYXcZFXx4FfeqeCK3SnKYakvQqLpQbY
	iWrU4/3A==;
Received: from ip6-localhost ([::1]:42112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oq8ey-00A1Tx-WD; Wed, 02 Nov 2022 07:59:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55740) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oq8eq-00A1To-U8
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 07:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=wINdas7Cb8XSSgsxX+Dt/pLiYQ8uRsx974PPp3E5krA=; b=xB+W06ZAx5bjYLWi7Dn4KTYevu
 1MzxylUeH/faNE5Lt3hmBR53MmY8PCP/seuoLwmNAAV524pwbPioAFMRA5+IcNIYo/Bbtby8rPYlS
 fZqMXHl2njqSzKVYvwXUWWOr2R7EP2yI2ITzKRAXST5+Ds9B1fE6+b7w923KNcdeKkLzpy5o5aVCQ
 01OO49KkFaoY7Y1chrT0QrS1BWirgLCcKvSpur7FfpbRNXuYPkTx3vVB7s7loUNbcYY6aimEQEXrE
 IK7tOd0w7I8AJ6KBYY15ImJokdigRf091JhPR0uSaQWTpJ7O5nwHGwSApbfaW+XTycIgDJnPyYRJ0
 cm3q54gq/9ir53bFkJ9GYAR4LbYRD7lRRysEMx/ELyLFZfxg8mn5sRPsa35n+M8LhCWbVUxkyZ1LI
 DZrKOo5CgClk4W5a06GkF571/+eLDbK3aD4LshDRKmqlIkzFOQBD8TSCYMXwQFRbjEV0o+s3A+YdY
 inltZH5+wpm2/vj3rh+K7Ugh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oq8ep-006qTz-4H; Wed, 02 Nov 2022 07:59:31 +0000
To: Ralph Boehme <slow@samba.org>, Michael Stone <mstone@debian.org>,
 1013259@bugs.debian.org, Andrew Bartlett <abartlet@samba.org>,
 Pavel =?ISO-8859-1?Q?Filipensk=FD?= <pfilipen@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: samba-libs: Possible policy violation (now with unnecessary
 soname bump libndr.so.2 => libndr.so.3)
Date: Wed, 02 Nov 2022 08:59:30 +0100
Message-ID: <4783468.31r3eYUQgx@magrathea>
In-Reply-To: <29df69a5-e95a-1235-ded8-c0ed56bcf635@msgid.tls.msk.ru>
References: <165571437894.409869.15645128981524194043.reportbug@dhcp-1.rz.nm-ict.de>
 <a7bc19e7-ba95-8d9f-3d0e-69efeabb4b9f@samba.org>
 <29df69a5-e95a-1235-ded8-c0ed56bcf635@msgid.tls.msk.ru>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 1 November 2022 11:21:55 CET Michael Tokarev wrote:
> 01.11.2022 13:14, Ralph Boehme wrote:
> > On 11/1/22 09:15, Michael Tokarev via samba-technical wrote:
> >> Control: tag -1 + upstream
> >> 
> >> Original context was at http://bugs.debian.org/1013259 , but whole
> >> thing *now* has is about completely unnecessary soname bump of libndr
> >> in 4.17 due to debugging refinements.
> > 
> > to me this looks like a packaging bug.
> 
> It indeed is, I fixed it already.
> 
> The question remains though: why the .3 bump happened in the first
> place, due to a change just in a debug helper routine, which was
> trivial to avoid (like I've shown in the patches just posted to
> the list).

libndr is not a stable API it can change any time!

The only stable APIs in Samba are:

libtalloc
libtevent
libtdb
libsmbclient
libwbclient
libnetapi



	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



