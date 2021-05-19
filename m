Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE9938849D
	for <lists+samba-technical@lfdr.de>; Wed, 19 May 2021 03:53:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=sq4dstE2HamNJ1LaWHauMIxzmZFnup56k0TicO2Z+Eg=; b=IeiYMKIiqQRnqEBs8MU9f7g67s
	TsbbVQiaFDeA3V6P0zLbORf9Tqj1L+BsYMGwGFmfkkjgSbspiEiHx5XWRncw7ulnqwy7iIVM9mRvg
	LWXslZr5KyE9GSyAOtutfB7jP32g5xo2Eej11XZhRo6DmOaLNDe1hujROFQ2Bmgeyu2Zfppo+lg2N
	zLslxxxpOhSd0PkOJ3If9+ZrDC88KYclHckadxXt3S+b44aS4UGBcaL5cBFAevLalollx1G+2HVIG
	NzBSo7VyAMkWbCO65T+iorPZJChjJ+dUdXdRawMFCQ9+W863EfA+oqhEI9dwTW8ea8Le1pmWikUYx
	7IJcDY4Q==;
Received: from ip6-localhost ([::1]:55550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljBOE-001ZZV-Bm; Wed, 19 May 2021 01:52:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21166) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljBO8-001ZZM-U6
 for samba-technical@lists.samba.org; Wed, 19 May 2021 01:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=sq4dstE2HamNJ1LaWHauMIxzmZFnup56k0TicO2Z+Eg=; b=V1ZTZEoSo49IJSwRPQ+SX0UKqE
 zr/Fw5HA2GrYq35QfrqPLyPzcqr9SYWUVVgRvZT8pemIc0biBjOoO2pHrzP4cP+iIntSlu+lrycFC
 HEkD1fLCucZGwLUlU6jkoZCOq+EWZeKa7tEjz7rU1hF6FO2N/gD7xD27KM0pgESIYzzudOPqzlsja
 /56uYCRmN0e3POCZQn1i0qOcvJqepuNVWNTweDTkK5gMctXyHy+kKkpIarIGv+uku9RVQl9uC+Mgj
 NbxQV/WO5lWuxCfxajc4nLjaB4j1DLyuk9dtzsh/8Ou7ZepjFJs9/hgdO36Pp6GfiGMLGXKXEjr1O
 99l0tycokFRBaPlMgbKG7DOEuAhlT51Ps2f1r7a2n/xMs7Vd0swf4y7Ec4GXcg1zR0s85GLRawDP5
 k3Nq6paGmCWW2ELn83AaSkACeQKOTCMHWk+qniNXxBFXAszPJSJQ2GrnSVgtZwNzNtQo/LcURIB9J
 Gqa2qX9hKW+Loi94kAofofAZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljBO7-0002gd-4d; Wed, 19 May 2021 01:52:43 +0000
Message-ID: <a7020786d9a620ea18f686fe4ac2c5d6c0a4b800.camel@samba.org>
Subject: Re: Offline logon flapping in autobuild?
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Wed, 19 May 2021 13:52:39 +1200
In-Reply-To: <482fc14dfd6b782ec12643f88d4c65d9f266619c.camel@samba.org>
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
 <2444523.AYHQVFttfo@magrathea>
 <530ded817f79e3cec0561c0bc59868ab193ef1c0.camel@samba.org>
 <4972011.ALVdVshByh@magrathea>
 <482fc14dfd6b782ec12643f88d4c65d9f266619c.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2021-05-19 at 06:52 +1200, Andrew Bartlett wrote:
> On Tue, 2021-05-18 at 18:02 +0200, Andreas Schneider wrote:
> > On Tuesday, 18 May 2021 12:45:43 CEST Andrew Bartlett via samba-
> > technical 
> > wrote:
> > > Thanks.  It happens pretty reliably for me trying to push to
> > > autobuild,
> > > but never if I do a job with --tail --nocleanup to actually look
> > > for
> > > the issue. :-(
> > 
> > This is the error I get:
> > 
> > [977(6379)/2694 at 57m53s]
> > idmap.ad(ad_member_idmap_ad)                                       
> >   
> >                                                                    
> >   
> >                         
> > failed to call wbcGidToSid:
> > WBC_ERR_DOMAIN_NOT_FOUND                                           
> >   
> >                                                                    
> >   
> >                        
> > Could not convert gid 2000002 to
> > sid                                                                
> >   
> >                                                                    
> >   
> >                   
> > wbinfo returned: "", expecting "S-1-5-21-480866085-778340076-
> > 1131398019-
> > 512"                                                               
> >   
> >                                                 
> > UNEXPECTED(failure): idmap.ad.Test gid lookup of Domain 
> > Admins(ad_member_idmap_ad)
> > 
> > The strange thing is that the wbinfo commands before succeeded. I
> > will add 
> > more debug output and extend the test.
> 
> As mentioned, my error is failing to start winbindd.
> 
> I think my username is too long (I've had this before), and your new
> test environment has a longer name, and so we are hitting the maximum
> path length.  This is why jra, bless his short username, gets to push
> all day without issue.
> 
> Just a hunch, no evidence right now, but we have had things like this
> before hitting the maximum length of a path to a unix domain socket.

You might be able to find logs on sn-devel in:

/m/abartlet/aMASTER/b4145403/samba-mit-build

An administrator should be able to remove this once done (I get
permission denied trying to clean thing up on sn-devel, not sure why).

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






