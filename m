Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB69D446266
	for <lists+samba-technical@lfdr.de>; Fri,  5 Nov 2021 11:55:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=8Uy4LffU82QSp/i6ASfpJMKOZnJ67QF0Yl+BK/3e7/s=; b=TEmXdNnnC1IJmqmEOwQ/KshyjB
	iy8c5zehlXNrqqlfO/Vh7qC99L6VsTmeEenMRbrZdkSoxCMdLppsA7B71xas+df9zJkqrAPEBQstf
	U5ngTsAdNcf1Q2/SDaPCYPpoE4LBVt6xwMDK+Dfr/YLzQb5QA1fO5pztTrmLaK/3OoGvt5JWI6Qt4
	oM1RBPcZLxQ7d+swlNviTVho6EBGU4v6LuIDMgL45CFKUTg0s0lBkJmf5hWNV+nCgvhp2WUCYnuU4
	rCdp75MXmWCeniR/amQDZIAGs3CPX9bIwsKTUGWv0u/tFbGLJXRImtJJzgNNgz5VZkPMOZ3gPe49Q
	U+0+v5vQ==;
Received: from ip6-localhost ([::1]:19936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1miwrg-00807A-4n; Fri, 05 Nov 2021 10:54:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57544) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1miwrb-008071-7e
 for samba-technical@lists.samba.org; Fri, 05 Nov 2021 10:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=8Uy4LffU82QSp/i6ASfpJMKOZnJ67QF0Yl+BK/3e7/s=; b=Rs2acQzNkmm+aeNHJRaRBTRdiv
 z5ywxFyCq+FhSSOPbUVodUCBvqqotddUm+Q/tVfMLFewaRshQwWJwNii1xanVBG0wfQcjrIRxKk3F
 3WyZoIb1yd9QKrHLJWj8/5J1Eb9Vy1VmUeiuADHIGGxI4BaXa978nWiK/KP8pOawPn7ZKNWRyl8L4
 VN1T0jSIlhLB6ZcG43u7C1xBPlyTjDXzAoAd9zFHWN872NYFsSq0korV+liEWM+jhD50APqtqaPPu
 q6lEC7ez0Um1zeBuAjFxHqGocl/M1QikKTCqaXUZEIzsJdTgu9Rj5UTndzoZMGHRnZUg2qJbAJT6j
 +HPSXF8fuNyAN5+Mm7Y6T+gKkTal+Y9Jxfjr2MEGqxHYPwU/Ncck2UDCbvPMxFANAAz5IMbAu4enI
 VZygzRWmSbgqGaJ5tdAajW8CYsSGoVvLMA4hMyT2i6KXd31DAmVYWu/MFdp5BnnPjv3Y3MlvAedJp
 dLf+DAmIEFpQPPOA4YQzWkqf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1miwrZ-005KVf-JL; Fri, 05 Nov 2021 10:54:25 +0000
Date: Fri, 5 Nov 2021 12:54:15 +0200
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: Multiple idmap servers for failover
Message-ID: <YYUNV1B80LOATS/r@pinega.vda.li>
References: <CO1PR19MB5109D90918F5592C8891A0D3D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
 <6a03d46f09f838450185552da856c4673dc5e9b3.camel@samba.org>
 <CO1PR19MB51099709E2B9AB18701C1800D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
 <CAB5c7xp28HinVF0Z2TFvMa5O0r7q0S6fbNBWjwN-OxTj6DvzoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB5c7xp28HinVF0Z2TFvMa5O0r7q0S6fbNBWjwN-OxTj6DvzoQ@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Michael Starling <mlstarling31@hotmail.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 04 marras 2021, Andrew Walker via samba-technical wrote:
> On Thu, Nov 4, 2021 at 1:36 PM Michael Starling via samba-technical <
> samba-technical@lists.samba.org> wrote:
> 
> >
> >
> > ________________________________
> > From: samba-technical <samba-technical-bounces@lists.samba.org> on behalf
> > of Rowland Penny via samba-technical <samba-technical@lists.samba.org>
> > Sent: Thursday, November 4, 2021 1:26 PM
> > To: samba-technical@lists.samba.org <samba-technical@lists.samba.org>
> > Subject: Re: Multiple idmap servers for failover
> >
> > On Thu, 2021-11-04 at 17:18 +0000, Michael Starling via samba-technical
> > wrote:
> > > Hello.
> > >
> > > I would like to specify multiple OpenLDAP server backends for the
> > > ldap_url option. Is this possible as I don't see any examples showing
> > > the format?
> > >
> >
> > That could be because they rely on SMBv1 and Samba is trying to remove
> > it.
> >
> > Can I ask why you are not considering upgrading to Samba AD, it is
> > extremely easy to have multiple DC's
> >
> > Rowland
> >
> > Hi Rowland.
> >
> > This is a legacy installation and they aren't interested in upgrading.
> >
> > So this is not possible?
> >
> >
> IIRC, this particular idmap backend uses source3/lib/smbldap and so in
> typical cases ldap_url gets passed more-or-less directly to
> ldap_initialize() from libldap (with same formatting conventions).

Correct, here is an excerpt from ldap_initialize manual page:

       ldap_initialize() acts like ldap_init(), but it returns an
       integer indicating either success or the failure reason, and it
       allows to specify details for the connection in the schema
       portion of the URI.  The uri parameter may be a comma-  or
       whitespace-separated  list  of URIs containing only the schema,
       the host, and the port fields.  Apart from ldap, other
       (non-standard) recognized values of the schema field are ldaps
       (LDAP over TLS), ldapi (LDAP over IPC), and cldap (connec‐
       tionless LDAP).  If other fields are present, the behavior is
       undefined.

So, using something like

 ldap_url =  ldaps://host1.example.test,ldaps://host2.example.test,ldaps://host3.example.test

would probably work.

-- 
/ Alexander Bokovoy

