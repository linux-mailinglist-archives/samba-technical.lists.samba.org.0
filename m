Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5E4F1CB1
	for <lists+samba-technical@lfdr.de>; Wed,  6 Nov 2019 18:44:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=tVzhQViMjO+yb/2rvC3PhLetld0QmIMtWOFN5nwM92o=; b=NoKnf4RaJi8p9cMO6zqsdsvMrv
	4w03BVenFb9nI8FyK3EHdffce7x/3+9XmB+WmuZi9VFqZkmrjngDFM7AdJyMnpeKr3ifp4z8D6Sm9
	Gv7yf3HGeujjCip5Ik3c6Z2ey2hg/2fWpqhRkPVp0RfRQftK/+l4cuaxzg/P505RjJuFoMJnqfm75
	2M7+wksJ1/VC5tvk0Gwm4YIYrifqCbf/NUz5W65N18VlPK5WXsPfHx4KiU1n8I+Krh3FQ1vy7pJvK
	VEXhl/8wmriBkJYU7Ki7fWxTsMNZH6/lsciuJrCF56zDv+C4oGliiBGqDbgHqCqrR5Jf2FwWD5oal
	MUzsOlOQ==;
Received: from localhost ([::1]:60942 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iSPLn-00784S-6B; Wed, 06 Nov 2019 17:44:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49328) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iSPLi-00784E-HB
 for samba-technical@lists.samba.org; Wed, 06 Nov 2019 17:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=tVzhQViMjO+yb/2rvC3PhLetld0QmIMtWOFN5nwM92o=; b=Cr2FOPhQCKJ+mYc87mlrnrfvHT
 db6qOMN+O0cWHty2Qqp1icFPI/LTLDNpG7Ok4dNTSSm7ufJfxIA8ARAha6RDUSGf8+0pYzmpK+OQZ
 ZtX4YplIL9cpwIFH60sj2jrUzNHrMv3PM6Unl/JP+oixSmt2eSf3Ft+Zs9rC5FJcAv329Hs8PZuCy
 WxHKf/6gfaXmvK6l644pQ5t4+NSd/mGnHrFVH/2MbJ+CU5LGDquZlUsF/2+ZD8wHAgPp/euDFwb9o
 Xw+5NhWq1OKnVkoVfj1deEeA0uZZvzRpoJODRBPp7F1H8vWtf3wtwH0+JCAGnw+kUSDyfWS1Zqmoa
 j0rJw3CaaCY71qpw8vPVl675EJQzSUMpFr+Lmj8RVxJLfvJAtXUZFFHrGYhu8rfXWCx8GNuQYf1xt
 +D38tQnZKPbizQ6AKqnc9Cfp70T4H0Vjd+mRQIL3KExsD8GxMpj5wUU5/m3FpiqKqY5XQWGv9NEfY
 VgHi4N2brAM8uxhP9S2JL+mU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iSPLh-0008Ly-2P; Wed, 06 Nov 2019 17:44:05 +0000
Message-ID: <c25ed441eedb2a864429c0154859f2afe95f38cb.camel@samba.org>
Subject: Re: Converting SMB1 tests to SMB2
To: Noel Power <NoPower@suse.com>, Ralph Boehme <slow@samba.org>, npower
 <npower@samba.org>
Date: Thu, 07 Nov 2019 06:44:01 +1300
In-Reply-To: <dc95f81c-90ba-a368-9b3e-ccdcf067edaa@suse.com>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
 <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
 <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
 <fa464ebe-cfe7-1d6e-7435-c896e2cc188e@samba.org>
 <f479113c-7a74-8259-823e-4ae1c4a713c6@samba.org>
 <47fef5d6-7fb6-b054-a8c5-7a28b63e97c8@samba.org>
 <9cc9d402-57fb-3568-29e6-12284d6ccd98@samba.org>
 <f5970612-2998-cef1-dcca-40188c7a176f@suse.de>
 <361f5a38-66fb-e18c-7858-c5db6e93424e@samba.org>
 <dc95f81c-90ba-a368-9b3e-ccdcf067edaa@suse.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Cc: David Mulder <david.mulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-11-01 at 18:31 +0000, Noel Power via samba-technical
wrote:
> Hi All
> 
> Just thought I summarize what we (myself & Ralph) discussed, for my own
> benefit and the benefit of others.

Thanks for writing this out.  I see in the rest of the thread that you
have made some progress, but wanted to say that if you get really stuck
again then I can certainly be of assistance. 

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



