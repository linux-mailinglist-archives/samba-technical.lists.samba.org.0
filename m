Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EE46B679F41
	for <lists+samba-technical@lfdr.de>; Tue, 24 Jan 2023 17:55:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ffFJ42GCdaPg3I0RAabsDJE1R4K70jxPonfY1VXA/Io=; b=0/N0qjlKQ4cK97GZcWNHLBlibQ
	/0nIBwfxNdjfTBX1gu8eycoSUK958Xx43M0sjcDCYpwjKxxRf46UddtZVBN0NrDQL9DeUyOR5+XEp
	iehLKl7kHrqWAuvRxu/ok7k/JPpB69dYMzrHp17+YBYclxJ2h7O3wHKFB8XuZXEyov1MINYyiZrCG
	DX8fDf+5Eu1m9jqOemPMV7sIriTUFqEVR/fXyVs8H2177fRGEMOozA54KSRWnJzeGGYUNHJ5NeY8E
	Nqp5jxmRjjFSEmKQ3g8gy9M73mkIwlJf86hEhbGcwNFUQWVgW3fjxjckS08ajmZjMFnsL4NrOPfa9
	YCvCxs8A==;
Received: from ip6-localhost ([::1]:38562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pKMZB-002Adu-Ok; Tue, 24 Jan 2023 16:54:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22384) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pKMZ5-002Adk-LO
 for samba-technical@lists.samba.org; Tue, 24 Jan 2023 16:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=ffFJ42GCdaPg3I0RAabsDJE1R4K70jxPonfY1VXA/Io=; b=KUzkimo3/lyN/tvcUq/pauVxjx
 8nLhF8g21pgDFmPibdbNXpyY9kD/3wy7Y/XYKWoI1QJsonsL5ncXMgm32K6js56ulljSmiFiWxOwC
 YnnxgfpzgN6Vuw/SQy8sgMiXwQ2kIC7cnVJY1oh3WEoVbMYbX8C3VeMDK7n7AUBnCfDIxsy82m++m
 ZZmgfZTYARoRV6nTTuDSoTgJCsp6y6z3oGCGKTZcX1/9MVhokDR1WREiPl2Wg5ZmInAqMXEQW6jHo
 bNYQlldPH8icD0f+Vas3RaNmvjgABQVAfqu6srP/CF4KePxQPxsyqnAsCQbo9WnUB/7M/MyKe0Qj1
 D4Pm+io8weG1edk/0zvOUvFozSCob2iz9Mvv/BI9JEG+FV5KFlcA3Y2GWWRHrhiv/YZ40y0eKUQl9
 BkrS7C79j6uS28gOQAXAyQT+L8/URRiOoOzvO4S4N3L8f97elff9I6DWhp7rBA30GLUzj7ISOXFc0
 N96k8JgbdmATc2ek+j5CiIOA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pKMZ4-00A71R-Hc; Tue, 24 Jan 2023 16:54:30 +0000
To: samba-technical@lists.samba.org, Stefan Metzmacher <metze@samba.org>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Date: Tue, 24 Jan 2023 17:54:30 +0100
Message-ID: <3744464.kQq0lBPeGt@magrathea>
In-Reply-To: <1869592.tdWV9SEqCh@magrathea>
References: <E1pKFPN-006HUv-Jj@hrx0.samba.org>
 <c08b0b3f-8ef5-1063-5412-18e96a1809e9@samba.org>
 <1869592.tdWV9SEqCh@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 24 January 2023 14:50:37 CET Andreas Schneider via samba-technical 
wrote:
> > > commit 35a32171b5067d5b80acffc99f8d43cdc7f5f9a7
> > > Author: Volker Lendecke <vl@samba.org>
> > > Date:   Wed Jan 11 08:18:35 2023 +0100
> > > 
> > >      smbd: Fix a typo
> > >      
> > >      Signed-off-by: Volker Lendecke <vl@samba.org>
> > >      Reviewed-by: Stefan Metzmacher <metze@samba.org>
> > 
> > These were all reviewd by me...
> > 
> > metze
> 
> I suggest to use my `git review+` tool :-)
> 
> https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-review+
> 
> same for signoff:
> https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-signoff+

Oh and I have a review check in for my 'autobuild' command.

https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/.gitconfig#n113

line 113-119

This will warn you if there are unreviewed patches.

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



