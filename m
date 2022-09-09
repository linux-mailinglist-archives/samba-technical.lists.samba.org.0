Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D70B05B4070
	for <lists+samba-technical@lfdr.de>; Fri,  9 Sep 2022 22:21:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=OtBPRjntq1jI6sJWNQboNhBtZIE5YHKfwy/g5VqEudk=; b=gYJvz0dXu/5YqWITybTE+X+kWV
	WZeltPIAVIbIYmpb4oWwz/YQt02YAPltxPL+qHjMden24EfyGr32bhNsBGttoqagrZ0XsRyDXU6yK
	ie7TSTN+Zy7cZSWGxU2y29LeVFFDDqy/Sx9oSKfGHLxi2xr0J4GiPqInzMmCdGl9agIPQA9bkhrNe
	BAXabIIP4RMFZglIBIJE3ScrXGccG+VEEiP9VDP2aPU4nDmyxduE2YqbGoMs0U4zDJAAqkuzZw9cW
	OYdX8XLxGC2inbnorDjeeFPnxBVHa5gG+EgA+QNeC8sohRj53Iv7Tgge0mPUlMZ3TVbnpdD+rJOX/
	CfJRkk8A==;
Received: from ip6-localhost ([::1]:19152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oWkUu-000Id0-M2; Fri, 09 Sep 2022 20:21:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41136) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oWkUn-000IWU-Sv
 for samba-technical@lists.samba.org; Fri, 09 Sep 2022 20:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=nZ6vYA53fnqrNPrLu/GG+KAE19HS6oxsxxmdgIORw6g=; b=w92ZyN0kMLeNhRYrmm0nk+7Bxs
 mK7cN2hamO99WGtmH6sTbyegBn/tRrabXvRgqbdZoUIdC3voLnu6SvEhNE0Vw42FxCzbgtrH7lWRo
 qyUH8Rl3hgJn6JUNuP46zZp5NW7Krx3vKNaz5Dfs8l73R8A90F/98vQVjrAuyZoXw0yggUUnamEnZ
 rl1Py92CYxQmANewPWdy4LxbTAVt1bDpSkAPiOhtZnRRcyZgmQaa08/wqZcaCrFaXY/pNgouKHMs5
 99wq16fM5nybpd7a8ioeDJQr0FEckmSQS5F/4x34oBTZK4LYNlDwLRZSdUTn9+Jniwk5MG45Sx0cw
 XX0EukO8TjfncyfQdGztdYPONiL4buUPwbPgIfthCWz/hUsfJAS9+rA3kA0vjAN+x3FXEp+7NIMNs
 uvpq/kkfGudCQbk/LtBGRyUbml4MLFAOnRf6pf+GI94ovLOsC4MILhtIxcyixDkHju78sqrtXoZBE
 EX8swUGc1fJDzf/W3n9DOBHG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oWkUf-0009LT-SH; Fri, 09 Sep 2022 20:20:54 +0000
Message-ID: <7e33db4d2504d4458ddc67aa5fac47a22592dce5.camel@samba.org>
Subject: Re: ldb ABI versions in 4.17: should it include 2.5.1 & 2.5.2
 versions too?
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sat, 10 Sep 2022 08:20:50 +1200
In-Reply-To: <cc05692a-2a75-a9d8-6f33-88ffb91a9588@msgid.tls.msk.ru>
References: <cc05692a-2a75-a9d8-6f33-88ffb91a9588@msgid.tls.msk.ru>
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2022-09-09 at 14:19 +0300, Michael Tokarev via samba-technical
wrote:
> I'm not sure if this matter or not (since ldb is tied with samba), but ld=
b in 4.17.0rc5
> lacks versions 2.5.1 and 2.5.2 released within samba 4.16.x series, while=
 previous minor
> ldb releases are listed there.
>=20

No, we don't normally include the branched history of ldb there.

Andrew Bartlett

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

