Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D34211EB0F
	for <lists+samba-technical@lfdr.de>; Fri, 13 Dec 2019 20:15:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=kFSLcf40e4taGjyCo2mJtzot55HZEBI3VI5oc4n6xHA=; b=ZQd+m7RW9E+8F5eo6xMm5lGsHY
	2Hday42ah9iPMCGY9Zs2NG2exFrLma1KX7f1AGDOVCqou/IJN+RPaqwSZn/zDU0U+OZrHgXexRGlz
	ixTRTiFSkhqeE1VUEw1knz5karV4cHYwBsSnM3s3RpCQHlF7ASfhX66DUOGnSCzcrtjQYH/6VAWo2
	gcj868PWNqqcbq4P4uP7bRU7Dmbq+TNEzq1TylEMUcBoHKJEPMUe/QJYusrUVBEoztxxkJn7aWN8n
	rfnckk6YyaU/KJcATVXZb1Ouvmcf6hqyRa6xSIkfsiQXWpgS6X2meA6tak6GPZrUsiRuZSuYkiXuq
	KGEKfltw==;
Received: from localhost ([::1]:29294 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ifqOd-007E93-6R; Fri, 13 Dec 2019 19:14:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43070) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ifqOV-007E8w-6H
 for samba-technical@lists.samba.org; Fri, 13 Dec 2019 19:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=kFSLcf40e4taGjyCo2mJtzot55HZEBI3VI5oc4n6xHA=; b=jNeCiWjmi7IoS/tET/SbnSC/E4
 CJICkmo/HB/HHad2omQ3CaxgMTu90iFE8q4j9AYXgq6dOV72FvmCgcn/Jx8O0+LTZLjtjryzbNcU2
 wtGvru7CaA4jbPO5X+s23hKhJdns33ZvG7vBQLXPl/3M3nEg3iZQEA72iQEEDldH+g38LfQ6rfnzu
 drnzqVSGJw4rgl6VZTYFYunN1DHnpo1aQztb3biXsrrZLJu0D4PVqupfPeRJztejf9XZCmLJdkvxi
 FqJ2bJE9M/sncKAJMLeKzCRbAEpW3cD7DUni85g+bGpa/SJjePh79NJq9Sdd+iFa3lfiKjr5EXtxT
 KZCps16t136zVukdZ79kS+JnSLmpmPno3pTDyf/uUTYUlpLW+jcTY48E7aj4KudJveX+Hy/2085as
 AQpjVdJ/bCWt2TEQXMoOlassbGEk8Fu3DtXv66Y+MLuL5A7OHpBz6TL37ih2Zd0BB/yHXJROwVpcF
 bTbXdpOU7ZCUmXfmKoforWFp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1ifqOT-0006v2-BF; Fri, 13 Dec 2019 19:14:29 +0000
Message-ID: <27bec0e24c25881133b84f9ba94a422c51561438.camel@samba.org>
Subject: external libs and tools we depend on
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org, 
 Christopher O Cowan <Christopher.O.Cowan@ibm.com>
Date: Sat, 14 Dec 2019 08:14:25 +1300
In-Reply-To: <3526762.uABzyUzPJK@magrathea>
References: <9ff45788c1634239b78dea68d22e4fad@ibm.com>
 <7b03dac06c57cb6c0954861964c9d98a014888ac.camel@samba.org>
 <0265138D-48A2-4188-8B02-7D90551219B5@ibm.com>
 <3526762.uABzyUzPJK@magrathea>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
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
Cc: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-12-13 at 17:30 +0100, Andreas Schneider wrote:
> On Friday, 13 December 2019 16:27:52 CET Christopher O Cowan - 
> Christopher.O.Cowan--- via samba-technical wrote:
> > I should probably mention that I needed to port jansson and cmocka
> > to AIX.  
> > (Also needed  a current cmake in order to build cmocka).    I
> > believe you
> > can disable the former using --without-json, but I see no mention
> > of cmocka
> > in your dependency list.    I haven't check lately to see when and
> > where
> > it's required.   Is it only developer mode?   
> 
>  
> cmocka is required to build our unit tests. Also there are lot of
> projects 
> using cmocka in the meantime. I think we always build the tests, so
> you can't 
> turn them off.

I did recently merge a patch to put our tests behind --enable-selftest
(implied by --enable-developer) for the main Samba build.  We could
extend this to the libraries too with a little more work, which would
be a safe way to avoid the cmocka dep.

On the flip side JSON is becoming an increasingly important way to
express data for use by/consumption from external tools, so while
currently optional long-term I would expect we will increasingly rely
on jansson in the future.

We recently added zlib to the list of things we depend on BTW.

We do recognise that this change in approach from 'depend on nothing,
vendor what we do depend on' to 'depend on more, vendor less' is hard
on our users, but we are trying to focus our development effort on
Samba and not reimplementation of already established libraries. 

It is ironic, to me, that much of the rest of the industry has already
moved on to 'depend on everything, vendor everything', but Samba is
always a little slow to move to the latest thing :-)

I've updated the wiki page, but it needs much more TLC.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




