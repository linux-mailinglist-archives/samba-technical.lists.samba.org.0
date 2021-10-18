Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B2C4323F1
	for <lists+samba-technical@lfdr.de>; Mon, 18 Oct 2021 18:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Y5TgCt24O/OLENsdlq7MutjaRY8Up9wHd4nTNw24Mp4=; b=BJN1hEzQ9vEe4XSGObJZSakznd
	zQIA0JLXm87wG+KhQuVB0ifUS9r/eDJ21sdJKCeKxeJfxYwgpKWWZyoq3HkEGlGGa1PunBg3M2948
	y4Q3Duvnhu8E/McoGT1ZWDJZFrGeH2axuytaQ6lUcbWljN586gX7dFBU5V6B1Wl9N6KuIFwbqqU2J
	kg4WHdxNnufN6RTBxcyg0dOKe4iEhwG6j08mq5pYnmGapvHXxuAKLXFsqmvkGm8tFtP5NvqjUwTk1
	KI6GNGARBOwPKBRq196MnN+qqZlBu9Gcu2LQdB9IR/Y+eRBPQaJBBKx9Es98EstZQtkoCz46G/Xzm
	4fT8Qa5w==;
Received: from ip6-localhost ([::1]:61236 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mcVb1-009zA6-MA; Mon, 18 Oct 2021 16:34:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56486) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mcVav-009z9x-1s
 for samba-technical@lists.samba.org; Mon, 18 Oct 2021 16:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Y5TgCt24O/OLENsdlq7MutjaRY8Up9wHd4nTNw24Mp4=; b=wQX+YQUC2fOkjEz3GBbW7q6xBA
 meeHzs426eS66AfWtVBcGZG8STSZylaURaRwZLzBKc19zH568Hv/ri+FKgSPrZ6++ib7OjCkY5ea6
 jBTZWXz7l2QaisDSK+bTseflKiUhuSQxVvEEipP+0t39q7uTO+dzbD0kIG2122JwfXBsBJf6/LkXW
 tlZ27liwyFFw+dTGm9DYIS5aYrSSZ+TAnWJNhxDHv//VA4Ylb2JTvDGZia5/RSGS+u+iJPcnCbKzA
 ouAYwkxDT1BZgPJ/CDSiDT9QyZQy8ki22shYemUec/ToFbMg+Gxkj2JA6+MgA7cfuVVePwQbFTF8R
 cksW9mVGbvKHn/HwduHu9ttf0dPvtZxGVHC+kodUfwqmsrNjskagnbOgEJ4rm49BCERlP1TZz/Be5
 7iSPGcIcS/uEYJq0WkxU7PgQ+exIFJS3E603/nnSNWdzi3pO3y+ke+ilvJ9wvR6QW+cKC4Y4Oywcr
 O55wYXmKfbd4eVnpwWW9vVXo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mcVat-0021VU-DW; Mon, 18 Oct 2021 16:34:36 +0000
Message-ID: <af377b50e8e388acf2b5de35f6d547c1bc6af5a7.camel@samba.org>
Subject: magic gitlab pipeline variables (was: Re: [SCM] Samba Shared
 Repository - branch master updated)
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Tue, 19 Oct 2021 05:34:31 +1300
In-Reply-To: <2303277.XuAQHBpyqA@magrathea>
References: <E1macwQ-003K2q-0I@hrx0.samba.org> <7009830.Vje2UjyrXt@magrathea>
 <646fa34b-9a2a-84e2-b948-1c960049b4c7@samba.org>
 <2303277.XuAQHBpyqA@magrathea>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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

On Mon, 2021-10-18 at 12:03 +0200, Andreas Schneider via samba-
technical wrote:
> On Wednesday, October 13, 2021 6:25:58 PM CEST Ralph Boehme via
> samba-
> technical wrote:
> > Am 13.10.21 um 18:04 schrieb Andreas Schneider via samba-technical:
> > 
> > > On Wednesday, October 13, 2021 2:01:02 PM CEST Andrew Bartlett
> > > wrote:
> > > 
> > > > commit 7857e1249b72be8c8841b99cb0820c9c563178f9
> > > > Author: Andrew Bartlett <abartlet@samba.org>
> > > > Date:   Tue Oct 12 07:55:54 2021 +1300
> > > > 
> > > >      .gitlab-ci.yml: Honour AUTOBUILD_SKIP_SAMBA_O3 in GitLab
> > > > CI
> > > > 
> > > 
> > > Please documented it in bootstrap/README.md
> > 
> > is that really the right place? I would think something like the
> > wiki 
> > where we already have a ton of related documentation would be a
> > better 
> > place.
> 
> This will work too :-)


https://wiki.samba.org/index.php/Samba_on_GitLab#Special_cases_and_tricks


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


