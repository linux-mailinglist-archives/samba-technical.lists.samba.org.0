Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9594CDB18
	for <lists+samba-technical@lfdr.de>; Fri,  4 Mar 2022 18:38:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=NQd1nzLWdNmlS6lhM2MAPdK4D8+lAdul7JWazUsrJKE=; b=xt+TiGLJYiCYWdZsXC70ag4r8A
	x4IFmGmaTGFw7gsfUARyiba0PHh7A0bkLHBPu6UGU1FKU+UbfLiNqjPiAQdLmGQfj+sa/On0WH+f0
	zzS4iFzPbQIBE2OadWIJedGZhNbmT5Ubp63skghFBlrJadmfSbd4rkRAf8au6SeYKUCmmjfkDvWUJ
	IxkTrDhLyhtBaPSnhdhWbDTOISlNeH4LLREqym9rFdR5sGjImzl04YVZ9srl5yziIbK3KNSM/KVpl
	UbfxtRQhphkIwA6qk6vdD67KhqwW+uwd1WPcA+MYKPsJSGaCQP+yIL7yIIVgg6ISFiw6JH1HmA51E
	+eyWjfmQ==;
Received: from ip6-localhost ([::1]:33410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nQBsa-00FqMR-Q6; Fri, 04 Mar 2022 17:38:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49414) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nQBsW-00FqMI-9N
 for samba-technical@lists.samba.org; Fri, 04 Mar 2022 17:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=NQd1nzLWdNmlS6lhM2MAPdK4D8+lAdul7JWazUsrJKE=; b=uJRLxppgvEGM1XWTZIZo02J+S9
 oLTIIBDeGbwUrdFC4GUIe5H6oe8+qHn0RmkI7X8rN6Srm89vQm6umCWNZfWvxzkzipXS392psqtm+
 rgEmX3Xp9s+rGnnXidkoi6UtNGSvko6uJyBSwWFL0YvPgqk/ncEGyaZy1AFHopPNTLQ0iw9/y3DLT
 r/6gJaxidI8U9p0ZXmPrrHq7cNOPrm0bJ85rJzQmcYaPFASihJfoJg6POtByXsaOgBhSNHxLWYkXI
 NIRQEoOIj+Ndh44PQfUma3Mlq37lon+jAK/mYVswIBCiXThUpwQcxa6CTD/StAT2+0sZiomT03oKU
 E4euCu4sYihaY0vdaIYf2qhiiYsRHyKNT6/5MYzDxj7YkqP1ouLoJpuSfmRVUARh6xKjSe9OKTJAK
 kGabAuKM6zOuyYWHCvTgH+ghCQX7abh9W2GXGlBPjbynCWwT1K+ylTRqzCawaPG4fM7ikHwQs9vpI
 4A5BlaAToCn+QnzcVm5vArJP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nQBsU-006ibB-PT; Fri, 04 Mar 2022 17:38:07 +0000
Message-ID: <a9c303b8edab648bc5d3b109f5ccbffaeb577cf7.camel@samba.org>
Subject: Re: Two samba domains in one forest
To: Pavel =?UTF-8?Q?B=C5=99ezina?= <pbrezina@redhat.com>, 
 samba-technical@lists.samba.org
Date: Sat, 05 Mar 2022 06:38:03 +1300
In-Reply-To: <81206267-0468-54eb-8724-4710d22cae89@redhat.com>
References: <81206267-0468-54eb-8724-4710d22cae89@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
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

On Fri, 2022-03-04 at 15:21 +0100, Pavel Březina via samba-technical
wrote:
> Hi samba-technical,
> is it possible to create a domain trust between two domains to achieve a 
> subdomain relationship in a forest? For example child.samba.test <--> 
> samba.test.

Not with Samba as an AD DC.

I started on this a while back but never got it finished.  If you find
any parts of that work please don't assume it works.

You can however make a trust between any two distinct forests. 

Andrew Bartlett

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


