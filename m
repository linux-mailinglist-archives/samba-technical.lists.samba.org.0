Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8686930526D
	for <lists+samba-technical@lfdr.de>; Wed, 27 Jan 2021 06:50:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=vyKU5Mb18yujrdG3LY7WSPHrcoa9LMBcsL28aNssGEQ=; b=fPPtB0mk68RcMVNz9zHgPshcRp
	qRSvvCJubeX7bcPSh4m8vgLTBJ++iDvIM90krFSFtKZjSKSiLYi/W4HRcMSRMIEP2dux1YLE3mDM5
	iXuRyAdzhkUEglodeXElUf7lyXEwcnGFojS3Nlvdwc7QrLtxvTIVYdwkjlOqp/5BOszQU14ZR+mPn
	7/XoHk++rTFfHWJ+bSX2L0lNM9YLX0n8JGlPq4O7nvbGkvJRy5dVpQHdDHS11gawhpJNYA6dz029t
	iwoXP0ulU9HYQm3cCYY6uv+hvZ7i/ONqWS3KBlqPr1FSbENE+bZSzhEUH70sgxqaxM2GU/IcbhCVp
	Qo3Z9/Qw==;
Received: from ip6-localhost ([::1]:64462 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4div-007Kvw-Aj; Wed, 27 Jan 2021 05:50:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64618) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4diq-007Kvo-85
 for samba-technical@lists.samba.org; Wed, 27 Jan 2021 05:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=vyKU5Mb18yujrdG3LY7WSPHrcoa9LMBcsL28aNssGEQ=; b=kRDBNHlv7hlWukZ5HqfkPLMvg2
 9L/2PjNu0EucaZrMutn4m8CLM0XKmeSHUUP8XmlgEYENjb8bD9vOnP6e/Su4nHxe2LrI9kkYsytoR
 9zqnwI0zuvDBKFdXnz7NSYopxzSM9uuHfVzWnU69b5zU+IA4uEImC3W7IbzHsGbM7twDXY5dp3/5e
 gZuFoYjUc2Tm2zl4NhKMcdv4Yu01BNB4Yx0dKQkmzSq2RDrLFbpNqaJvqm3EUX4r9C0TnlzafhhMN
 rBF/9a8UvO088Aq0q36x0HhBwNJwdPbPjEO/c/ySESiirj+xmfU0nmOlyGPyORg+o5G31tHPpYjct
 w8HWZKW6ywFI3qrqcRlzoRpdBmSOAtgELzPGPvtxh4MFPmYlxchJ7Htb7jSznhxi86nlp7Hws24gQ
 s6Txxa7VM7353oaIynH8aRkfeiMLtBjHlqmUcNl/gsEg5/5O/oJs7xDsfSzt1HUMLA6yLSCSY8wZJ
 depS/qLKsRimdrfUBOLOy0/F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4din-0001fc-CZ; Wed, 27 Jan 2021 05:50:29 +0000
Date: Tue, 26 Jan 2021 21:50:26 -0800
To: Martin Schwenke <martin@meltin.net>
Subject: Re: Not sure how this slipped through
Message-ID: <20210127055026.GA1131992@jeremy-acer>
References: <B93A6FFE-2D85-4503-BB15-D2AFC270028C@ibm.com>
 <20210126195556.2def02cb@samba.org>
 <02fae49b32bc297873eeb81426845343772f6b90.camel@samba.org>
 <20210127163850.327cd600@martins.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210127163850.327cd600@martins.ozlabs.org>
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
Cc: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>,
 Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>, Jim McDonough <jmcd@samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 27, 2021 at 04:38:50PM +1100, Martin Schwenke via samba-technical wrote:
>
>We could ask those with a stake in the relevant platforms if they could
>sponsor or do the relevant work.  Perhaps Jeremy knows someone with a
>stake in FreeBSD who might like to contribute?

Even FreeNAS is moving to Linux these days.

