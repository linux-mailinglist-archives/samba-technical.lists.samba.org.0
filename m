Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0B7F5198
	for <lists+samba-technical@lfdr.de>; Wed, 22 Nov 2023 21:26:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=0z0AIoc88UOfQIVQiVwNeMHPcblBW0FCmE+Uz5d2KzQ=; b=Xgv9lm7T6ZPkxCe75aImsxUvlw
	G7/JuWFk6DKAmoMNfvDJj92cYJ9DB/xdq/ztMLW6JDHBtTMMKEKStqV9pKdS44X1zM2CNw93Auq7T
	3xuifRcZr012eFi5DIZY733cfsxcQlp8XUV13BvIwLgnxnW0N6c8X+nz1K6f2j9vjxP116aAgibGZ
	3hJ2feg95hyN5hgdKovKaP8CR+QcOasPL76Vpytnkewi7o+yc+8v3frGFfAHt9uvl2wOQaD+93otf
	sbkybPj/vnOA7GNmSixFfCrnHYZfd+7VrmqRnHwoYndJL+eVaPG+vdpCCZO6oBSxznHAdfPTQ6RFc
	bmbUQSig==;
Received: from ip6-localhost ([::1]:64696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r5tnp-000CLJ-NT; Wed, 22 Nov 2023 20:26:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52334) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r5tne-000CL9-Se
 for samba-technical@lists.samba.org; Wed, 22 Nov 2023 20:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=0z0AIoc88UOfQIVQiVwNeMHPcblBW0FCmE+Uz5d2KzQ=; b=e3Is3Q7tEE44AWViluhpwK+64b
 sLCy0fpRtvgW3ooSFpjjZIA4JFUMZjwS7MtLLkO710WWGPNUF5N36j+cMaxsYioblUO5sNUZjP3q+
 qLTvCCWuQ+vFLjDior963PoIQt4yJNHYcDy/SG8fTnQjv7psGqnvcFwmiUx+c4QZRiZGxguvxI9/V
 Ssgr7VS9G3zZasJRUK6Q4JSH7n0QKj5DP75/WF8UiADA8zPzgKNg+jMF5l6tHwCaT8oS8yNavdzd5
 E5GA8M6XgbEoCpA4BysV2FPbguUgz1m7WKybtU6UXLk1Ueqbh348TEEQLr1aB87TtR5hF/c53ATa3
 nKm0AvUXHAF2+wYYszTobn6Nwq4qPWH202Va2rRiIdKFGAeEVJWfPk2Au/pAhuYOcxG/MO2gEJCwz
 zckFjV+1f49fmN2+9NZFms3zNY32Djjt7sOvCNlpO6apuWTAtfhBqRdA5iBnJ4/IiLmHusttQsO5B
 8XQElbl0aozGvNsNIJFkixU3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r5tnc-0004Ff-01; Wed, 22 Nov 2023 20:26:17 +0000
Message-ID: <107f4011e2de161a39d88a8c9698917b0e9dd75d.camel@samba.org>
Subject: Re: Suggested crypto libs for Diffie-Hellman and Eliptic Curve
 Diffie-Hellman
To: Andreas Schneider <asn@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Thu, 23 Nov 2023 09:26:13 +1300
In-Reply-To: <2320390.ElGaqSPkdT@magrathea>
References: <81c7b2c93303aa93bc3b6747c7935e040afff238.camel@samba.org>
 <2320390.ElGaqSPkdT@magrathea>
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

On Wed, 2023-11-22 at 12:07 +0100, Andreas Schneider wrote:
> On Thursday, 16 November 2023 07:08:59 CET Andrew Bartlett via samba-
> technical 
> wrote:
> > For Group Managed service accounts, which we are working on, for
> > reasons around RODCs and a few other things, Microsoft has decided
> > to
> > internally use a key-agreement between a 'root key' and a 'service
> > key', both held in AD.
> > 
> > The password comes, as I understand it, from the key agreement
> > derived
> > out of a Diffie-Hellman or Eliptic Curve Diffie-Hellman exchanges.
> > 
> > This is all in MS-GKDI, referenced from
> > https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/9cd2fc
> > 
> > 5e-7305-4fb8-b233-2a60bc3eec68
> > 
> > I just wanted to check if there are particularly cryptographic
> > libraries we should consider for this work.
> > 
> > In the past we have looked to libnettle when gnutls didn't provide
> > the
> > functions we wanted, but that was backed out fairly fast as another
> > method was found (
> > https://bugzilla.samba.org/show_bug.cgi?id=13276
> >  0784
> > 4a9a13506b4ca9181cfde05d9e4170208f88).
> > 
> > Even so, for this case is libnettle still the best first place to
> > look?
> 
> If something is missing in GnuTLS you need, open tickets at GnuTLS.
> They are 
> fairly quick implementing the stuff we need.

The main issue is the time to get the changes into the distributions so
we can get them into master, but yes, it has been an awesome
collaboration. 

> They implemented all the features we needed for Samba so far.
> Example:
> 
> https://gitlab.com/gnutls/gnutls/-/merge_requests/1611/
> 
> 
> Also AES-GMAC, AES-CCM, AES-CBF8 ...
> 
> They also fixed performance issues we discovered ...

Thanks.  It looks like we won't need the DH stuff, thankfully, but we
might need an alternate key derivation function: SP800-108.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions




