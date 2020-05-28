Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B96A1E6D52
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 23:11:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=lpqGSiQJZMG4Xkdos1wbVJk7FqSN43BJOdWvKs44nBY=; b=wqKTxjl00HHbwHiQm4cA/RvMiR
	yNvCYda5vy00dyNWErlmcss1lv+ZrsYz6YRAq1LZfkYBTWdftHcDS7uQ6PkJ62jSeeZ49Ps2rujjY
	0QSVForSby5coszsBMnVhbKqrCybG21LXy3cMiwgaOPpkJn3dCh09XVDY8PwpLTQsgUfndjQ3zSKp
	jPZgnzwThwmBqmHuAdDVDHrnfenvSqAMdEwOYPPo2yZ/b/paezMn6EdpqssdD3t32b7qZDasrBGGc
	ZxbtXChqvoGcU/tAcjQIF9ilD/Gki2wPmKOXADFIZZkIBNiQtKi1cLnQxYB4H8b2XY1DEePiDeRVB
	Uwqa/UWw==;
Received: from localhost ([::1]:39468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jePnp-006GKn-NL; Thu, 28 May 2020 21:11:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12520) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jePng-006GKO-2d; Thu, 28 May 2020 21:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=lpqGSiQJZMG4Xkdos1wbVJk7FqSN43BJOdWvKs44nBY=; b=srBFVAqGm8Y5WTMnRi1B9TON/i
 6L7O9zS3wc8hFKY0gOT7D87Law2YY/wLA/AkLOprkvtOY7VDhltD5j7eo4oL6CpfgfllwxT/UBF6W
 BmDAK3KS7Bdpky4p0xcSAJgwVVd9592hyx4n+jMovdd8sidMf0hwNmVJ5rVNyzEaRala0FT9LT1VD
 cbVJzslx0cSEaEGY/rYKQrEOaggnc+s7KNysEK1bVOINAT1aFqp9mX3i4wPbiSpx2QcJthNBsCOd9
 MDrRj9OMl840o+ZkHYAtt9LUStPE72DNmt7nPPsr24et2IaSeB8Eyoa8XM+Dxd/SdPOUwkSzjBhIt
 AI8eZ40Fm8PLj/EFhTQntGgbfZ09WFM8WPeOF+iN7ShjKxw4ZU2a+KXZ6p32mjIqxPTViQZeiHnV2
 IcQLMtJ/ZjyBqB8JfiN5iH6J8vAQVC7RTSsYmieRByhywqytxnGpbk9fcyx6fM9yG5971F/+dtMBl
 knnC7z3MLCHz9p48+efDnwX2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jePnf-00074f-1D; Thu, 28 May 2020 21:10:51 +0000
Message-ID: <c9b0610935aadf22d4f64f486216ac761b00aa18.camel@samba.org>
Subject: Re: SambaXP just (virtually) wrapped up.
To: Jeremy Allison <jra@samba.org>, samba@lists.samba.org, 
 samba-technical@lists.samba.org
Date: Fri, 29 May 2020 09:10:45 +1200
In-Reply-To: <20200528205810.GA17159@jeremy-acer>
References: <20200528205810.GA17159@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Thu, 2020-05-28 at 13:58 -0700, Jeremy Allison via samba-technical
wrote:
> Just wanted to say a big *THANKS* to
> everyone who attended this years virtual
> SambaXP conference.
> 
> SerNet did an amazing job of changing from
> the usual on-site in Goettingen conference
> to a virtual-only online event.
> 
> The talks were recorded and should be
> available soon (I'm sure they'll let
> us know when) from the SambaXP site.
> 
> I hope everyone enjoyed it, and now
> I have a boatload of work to do to
> catch up :-).

Thanks Jeremy and the SerNet SambaXP Team!

This is the first conference I've done this this virtual style, and I
was pleasantly surprised how well it worked out.

It was overnight for me, but that has actually worked out fairly well.
 
While I really miss the hallway track, the European spring air and just
seeing you all in person I don't miss the 30h flights and I actually
hope some of this becomes part of our 'new normal'.

For me what makes SambaXP is the mix of technical talks (like Douglas
showing off what we actually gained in Python3, showing it was worth
the fight with the changes) with the user stories (hearing from
Profelis about their successful migration to Samba in Turkey).

So often, even when we are so close to those stories we miss the
significance until they are presented like this.

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




