Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9856DF668
	for <lists+samba-technical@lfdr.de>; Wed, 12 Apr 2023 15:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7fIG3lqvF17DOD1WOD6j8fGkxR13egSgtx6SbXVA99E=; b=vvvSpbST5L/w+cYKbBrp7jfm9D
	0M2/+yfOwY1oVWctr/yVFlXrKaTFjAEVwOeM8pC7TNrEPm2FIHE0VWZe533A0KGoRqrhtM3c5vzHI
	8uMj6KgZYIG8YLuOBUF6xAQ903qitbnSIL0bEtwJv6esup4AY3yldKnNe3M631SJKNSW/XrtKo2l5
	HYMPLW61wDLO+frbcFQE3AjO33N9djEmuyydRy1x/C434//Dfn7rBzk3sZDfhiZmpg5X+OnkAqzNt
	9VWT3BaR27NdH3DgzUIS7sr9HXeEC5m/hugBzTtL5ITw8EHwmw47Pk7zntXi/CM8OlJYOc/TkvNSF
	9TEYe2Sg==;
Received: from ip6-localhost ([::1]:60736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pma8z-000lQC-5U; Wed, 12 Apr 2023 13:04:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58764) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pma8u-000lQ2-3m
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 13:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=7fIG3lqvF17DOD1WOD6j8fGkxR13egSgtx6SbXVA99E=; b=Vuvq8uOSbNdV4+zliFuugglwCX
 6ExnMDh8VgUVUM90rRrYhmrhH+UIlqcHfbaFfVQJ3wP/v5vfng6DxjslayKrK+XlUZfzlxlk433gT
 8HEkacjgxxSB3o0PFfMmBX9qc6UTPaIOdyYMfMlTJWa551lKJJETRD06uBx0EabbyaE05l+PPuFNn
 BlkYaYCfmR6XDYpDXV9f7gCKfL7CWb/tEgTFtuuXaAkZfr9n07WydhhoE/kVlXcRT2JWbRCAnxof3
 w/QY54tFeSWmfAy6iUP4pSOQqmfzqna2p9XeDGtor4zaTwfhVAJpSZ3NWdXWBuY+T/ZidT8CmMdR+
 9xq+Cp7m0BFvFdR6SOuCoGd68qkJxMQZMT7tv3M5pDOVHQ/P08ajii86ZQ6zBEX54l2iQtaZmKLUy
 S45hYxzvZvd7F+ZvlgV9g+pOeeODusOG525vT5WPnBfrUMzjj1JE/1QwbNcq3KQvqOMwT9u1JBcbd
 2JoJ2H8BNaMJpbtyTVga7KXK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pma8t-000iEM-4q; Wed, 12 Apr 2023 13:04:07 +0000
Date: Wed, 12 Apr 2023 16:04:05 +0300
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: How to test samba LDAP parameters with openldap tools, eg
 ldapsearch?
Message-ID: <ZDasRVeLmdPsqa5V@pinega.vda.li>
References: <a8fdda06-765b-b26e-717a-76b794035cb7@comind.io>
 <19d97578-4936-6197-871a-5996f32cfd54@samba.org>
 <d1cc4ccf-a8a0-0ef5-e418-1e406490fa80@comind.io>
 <0ca6506a-af76-a2ec-626a-5ee11ef7952e@samba.org>
 <04c86436-6665-354f-84b5-479613a81545@comind.io>
 <93859d7c-eaf9-0a93-a236-53a172381782@samba.org>
 <CAB5c7xoHu91S2W6Ux=RfrhJRJ-_FWgPmgPJM7KzwCvuNypYTMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB5c7xoHu91S2W6Ux=RfrhJRJ-_FWgPmgPJM7KzwCvuNypYTMQ@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 12 huhti 2023, Andrew Walker via samba-technical wrote:
> On Wed, Apr 12, 2023 at 7:51 AM Rowland Penny via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> >
> >
> > On 12/04/2023 13:37, Jan Andersen wrote:
> > > Hi Rowland,
> > >
> > > I noticed something odd about the logs: it seems smbd generates one both
> > > for the workstation's name and one for its IP address - I didn't attach
> > > the latter, so here it is. It seems to have more detail.
> > >
> > > Jan
> > >
> > > On 12/04/2023 12:06, Rowland Penny via samba-technical wrote:
> > >>
> > >>
> > >> On 12/04/2023 11:39, Jan Andersen wrote:
> > >>> Hi Rowland,
> > >>>
> > >>> Thank you for replying. I wiped the existing logs, changed the smbd
> > >>> service to include '-d 10' and restarted, so I would have logs
> > >>> without too much noise - please find them attached along with smb.conf
> > >>>
> > >>>
> > >>
> > >> You appear to be running Samba as a standalone server with an ldap
> > >> backend, are you aware that such a setup is two parameters away from
> > >> being a PDC ? If you comment out 'server role = standalone server' and
> > >> add 'domain logons = yes', it becomes a PDC and a PDC (from 4.8.0)
> > >> requires winbind to be running.
> > >>
> > >> Rowland
> > >>
> > >>
> >
> > Before Samba 4.8.0 , smbd could directly connect to the domain
> > controller, from 4.8.0 smbd now needs to go via winbind.
> > Now I know that you are not strictly running a PDC, but what you are
> > running is the next thing to it, so I presume that you need to run
> > winbind, you do not need to configure anything, just run winbind.
> >
> > Whatever happens, you should be aware that Samba is working to remove
> > SMBv1 and things like PDC's with it.
> >
> > One thing I did notice from that last log, you are not using SMBv1, try
> > adding these lines to the smb.conf:
> >
> > server min protocol = NT1
> > client min protocol = NT1
> >
> > Rowland
> >
> 
> It's probably also worth noting that doing this requires your LDAP
> schema to contain all the fields you need to generate a valid passbd
> entry for users. Do note that using this schema requires storing an
> MD4 of your users passwords _and_ having those accessible to the file
> server (hence discussion of this being a de-facto PDC). My general
> feeling is that this goes beyond my risk tolerance for a production /
> business environment.

Correct. Unless you know how to run PDC, it is better to have Samba AD
set up for that. We keep and use LDAP-based backend in FreeIPA but that
disabled MD4 passwords for users and forces use of Kerberos
authentication instead, making it close to Active Directory use from
Samba as a domain member perspective.

-- 
/ Alexander Bokovoy

