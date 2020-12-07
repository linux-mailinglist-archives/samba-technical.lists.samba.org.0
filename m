Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7683A2D1D8E
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 23:43:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=SpTOAVmMYaU/dBsmIbLOPa+PG0oG2pv8Iie/fxmRSBo=; b=eSDrg1haWFpE8WNyTthHPNqrcM
	HGunKB6S8S2qcAj6t3Dww3kLvDTZtToMLOkebMBTZfSm5Ep5qrbxDnleYsDGTC06H7tHEgvOXXnE+
	BUgPtKmfiwtqwyw62alPkY37sWqYix4L7TiS9wIDHvEJPxsuhp6hvbsFPSN5iL60z54iaDx2arj5u
	QEyI7fGb6/oj2t5AljQnANSuZbyVK5+tjgFfAJngAI7uMbQYbGLjvnJt1uP1rKm6hx6A4iQ6G2bEX
	71w9ugb/JN0KdaiJN2Ounpk2XfroBdlpzI/DChJO+nWsJK+gXg/IGLspxFyQclZZrn8h1SmB5dYYC
	QNvKRiVw==;
Received: from ip6-localhost ([::1]:58960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmPDH-00083F-Ms; Mon, 07 Dec 2020 22:42:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55248) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmPDB-000838-GO
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 22:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=SpTOAVmMYaU/dBsmIbLOPa+PG0oG2pv8Iie/fxmRSBo=; b=mEE+sHc4Rdf34Ld44PJ4kKkmnP
 eZdVNjJ7+KvApnnjHXgX5sGi9XoFwgQ+J/hanYhr+R0GlcHmrlmd7cHet+0ykiLft82TLZE2wivL1
 av2auPN5KEEuaWqxjYLon1cYz14gJrNBJRsG/i+72OhVfWkBn2WvV9Mnv82iNR0Dbjm86qyzMbzqY
 ho6bbIav3MbHZv8Ut3DUevySY1JdOYYufc3p1EeGIUvte6sGaAxeEv0t1qYzxbhIRZgTHPrLcBEBK
 LpzXml/o1i/Yz8K2Dmgqg1MFg0cDzdVdp3+s2biicQPJV9ojoGc10hlKnq9NpWLJhuabfswgxR76C
 IFt3/ytC6ExEjnWKe6JzkfCN6BrLDGymH1HsEW7u5Q+ESF87uJD12HlUhQGewahddpAlXS43RPtXR
 9PetL8+A1yksTsNTgZfKf4SVEEV3Iit15wHTOYQrQkRZr1AnFpPa54ZJfzMdK3R4Gt9j+bRReW2jI
 7uIw+/Sijmilk9D8sAwYhqUs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmPD6-00026g-GU; Mon, 07 Dec 2020 22:42:24 +0000
Date: Mon, 7 Dec 2020 14:42:22 -0800
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: 20 years doing Samba
Message-ID: <20201207224222.GA1856514@jeremy-acer>
References: <334b390ea3c64631b9da07c10a6f636aa3079f54.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <334b390ea3c64631b9da07c10a6f636aa3079f54.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Dec 07, 2020 at 12:06:14PM +1300, Andrew Bartlett via samba-technical wrote:
>2020 has been a strange year for many, but one additional thing that
>has crept up on me is that I've now been around the Samba project for
>more than 20 years!
>
>I wrote some thoughts here:
>
>https://www.catalyst.net.nz/blog/andrew-bartlett-20-years-samba
>
>The earliest patch I could find on the list is this one:
>https://lists.samba.org/archive/samba-technical/2000-September/009729.html
>
>It certainly has been an amazing journey!
>
>Thanks!

Thanks for that Andrew ! Brings back many memories :-).

I hope the next 20+ years of Samba are just as productive
and fun !

Jeremy.

