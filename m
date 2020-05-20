Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5018A1DC19B
	for <lists+samba-technical@lfdr.de>; Wed, 20 May 2020 23:51:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=uwf1wnDMZz77yP39zRvKwQhCK4hpoG4fmbfv3j5ZFJ4=; b=FNfW9AGUnvIU70GB52yXLvsqEC
	f0PleOOOORnIGIiyjuZGY4iQEepwzdE6+HspFJkFt8VkjDZSBQdMeQoz51KlvIuPMD7Qs5Zf+2h0G
	ETdCQK1g9LVZNHfp9Q6Lggw5F9bIGF5HjqRqTWSizdGFBKwgwsyVspu5OetCIjf2TNPLWZwESPQ2P
	rSwh5VnWapp03jJn6XoDYDjURtWqznUBEENk6QT3I7FxzLMg/FwnKgweTiOvdgrfWXQP43ONUBd+O
	R9uP5pTcAm3q/OsgEbOyve2u9EhUWJe+Zi3GaExQw+nNQom5PBVkZSopwcD9dQljqfm2d1E5kBmV7
	V4IO4i9w==;
Received: from localhost ([::1]:59530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbWc7-005IuD-Vi; Wed, 20 May 2020 21:51:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45564) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbWc3-005Iu6-06
 for samba-technical@lists.samba.org; Wed, 20 May 2020 21:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=uwf1wnDMZz77yP39zRvKwQhCK4hpoG4fmbfv3j5ZFJ4=; b=bDM5R7eOGscT4DDgHI7MnHvtvu
 S6gannwPmgv6Yen/p9DOrAwdt0XTjdPx4FzSs+jVw5GfWcI0OBj/3/nWUbXk78B0h/KQ3U2wggG5F
 8Fqcu77RZJVcjsHGM7vpatC/xXQ9kCT5xexTZe0lwKAVg8xEzkdrGV8Z/5Jti9AFTCQwlfomF+kXT
 uyq84hJ/HDvItq9o5Nf+WyGQY1n3f/zhMKZ6c7p3vWk4CcVz/FkLdnkN6ysZIotT2SegoZJtLxUfy
 nAWkNml2Osi6+yA9U4ytziZY0vhbW9Df4A4XV/C/RkcyEtJxgc4UYSKzO1oyIGfwAqGE+CzXQVcZy
 OwGu/s10weQBgkPh1i2tLNBvl1P4C3V9NVDOFw0xmBbzOFkT0OtUHlkZ7SxYW5N4b53Kcec35/Cx6
 LIHYVWzyXa5MG2XXCp7FW5FH6tK146v4jc91OddaDvxS7GWOJlGv2bPwIcpSrQWrSeqIiujHCoh3i
 qH/0SMWLqnvb6XfbyUIq1NOe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbWc1-0005F1-9T; Wed, 20 May 2020 21:50:54 +0000
Message-ID: <320a6df48c890e5549f6cd427bfe33102a611a15.camel@samba.org>
Subject: Re: Why use TDB and LMDB?
To: Jeremy Allison <jra@samba.org>, hezekiah maina
 <hezekiahmaina3@gmail.com>,  samba-technical@lists.samba.org
Date: Thu, 21 May 2020 09:50:48 +1200
In-Reply-To: <20200520193958.GF27061@jeremy-acer>
References: <CAH72RCX1ATg=SOwihfT0D6vDvaJPLUC0pWpaUT6RFx81RWcYaw@mail.gmail.com>
 <20200520193237.GD27061@jeremy-acer> <20200520193958.GF27061@jeremy-acer>
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

On Wed, 2020-05-20 at 12:39 -0700, Jeremy Allison via samba-technical
wrote:
> On Wed, May 20, 2020 at 12:32:37PM -0700, Jeremy Allison via samba-
> technical wrote:
> > On Wed, May 20, 2020 at 09:46:02PM +0300, hezekiah maina via samba-
> > technical wrote:
> > > Hi everyone,
> > > 
> > > I'm still learning Samba and one of the question I haven't
> > > figured out yet
> > > is why
> > > Samba uses TDB or LMDB instead of RDBMS like Postgres or MySQL?
> > 
> > RDBMS like Postgres or MySQL are more heavyweight than tdb and
> > lmdb. i.e. we think they'll be slower. A lot slower.
> 
> Just to follow up, tdb was custom-created along with
> Samba to satify *exactly* what we needed, and no more.

Thanks Hezekiah for asking - it is great to ponder some of the
assumptions under Samba, your GSoC project will be easier once you have
that mental model of how Samba works, what the stack is etc.

Yeah, we could say we were NoSQL before NoSQL was cool!  

But more seriously, an RDMS could then be built on top of TDB or LMDB,
a bit like we build an LDAP-like store on top (that being LDB).  

Most things Samba needs (particularly as a file server), as Jeremy
mentions, fit the key-value model best, and the rest (essentially the
AD DC) is why we have LDB.  

You could build LDB or an LDAP server on top of an RDBMS (others have
done that for OpenLDAP, but we have enough complexity in our lives as
it is :-).

I hope this helps!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




