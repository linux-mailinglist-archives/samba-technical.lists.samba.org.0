Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1A867B10C
	for <lists+samba-technical@lfdr.de>; Wed, 25 Jan 2023 12:21:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=C3EmoLnTRuxJ3dlIShe6A8VSUJ4GgNJBCud7pAkQ5mY=; b=NECL5Raa9vlv0Wk5yTH6ROERhK
	hd7RZ74iUyD29HQ9fat3nHn4FGR5pHMNS/SEPKATn0fLU9kAykHoWL9wDEsI1RquiJP8uYQVXQUcI
	CeiVVhJCe1Ua31CmBcAeS4omhgvpm21Dw4a4KUlQ0vneci3dj9Q0nhCK6tL8TPKrteGThegSzLd+/
	DOwGJjktXJIlPq5gLz1tCM9B02fsESklYmCXlc0eFcYOPur/I4+MBJv3o5ywWktALZiJZANom+DBz
	WB7I+ysdb4aBFDPGgrMls1QOmmdM/ImSEWCmx7HANTFDYRGku4MIxXnXmaS/6GFRYmzawlSvI8HAf
	XgfbpDxQ==;
Received: from ip6-localhost ([::1]:65146 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pKdpv-002mwb-E1; Wed, 25 Jan 2023 11:21:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55468) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pKdpq-002mwS-Gw
 for samba-technical@lists.samba.org; Wed, 25 Jan 2023 11:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=C3EmoLnTRuxJ3dlIShe6A8VSUJ4GgNJBCud7pAkQ5mY=; b=WWtRK2jb+rx7qsVg5XUPUUIjP1
 XFJFR06sCcEH7LK9k7iIuay91Bm8Q+SDwiJDuZ5B1MAKTzPZ09OwfBkr1oklgFk2jJYw/D3e9ddcP
 qHEuorOGRWTXQW0WOsEk5AOKDaMIn4jjxq11uHkPgWcQTlDYRpxyroxicuQKzQ7yiHOpRnvFcDNhz
 ha2AD+cPwWNO3VwXmEI2ksKZd6pydUaoyFepthsp0GshTJqR8rF2kRarzYoLbY+WO32HKXMUW7IJU
 YVJl5L50hhmuq55ll1supcUY2DaDmASFrAj39hKXpgvgb93TSFD9cRLs4R8Ap/gm3fzMNRN+TUg3E
 QyEvBlRGxPuLvkXM25lq7IQlNEMW+nSpJzq4jvGd6x9Nxfa2ABdpadgk0kUaQGw4NyHLQBEiANAVG
 YRXS/lQZJvCLinW/mQ12f4Lya1miHNNx03zxQpdHhUdAPDQVYDxyzFwWHcFWtWz3tM5Z+gLpH3Y5V
 3U3ykeNfA0t1MtOpO41l7hSG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pKdpp-00AEJr-As; Wed, 25 Jan 2023 11:20:57 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Date: Wed, 25 Jan 2023 12:20:56 +0100
Message-ID: <5801755.MhkbZ0Pkbq@magrathea>
In-Reply-To: <Y9CEVgJd3XgnHqN6@jeremy-acer>
References: <E1pKFPN-006HUv-Jj@hrx0.samba.org> <1869592.tdWV9SEqCh@magrathea>
 <Y9CEVgJd3XgnHqN6@jeremy-acer>
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
Cc: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 25 January 2023 02:22:30 CET Jeremy Allison wrote:
> On Tue, Jan 24, 2023 at 02:50:37PM +0100, Andreas Schneider via samba-
technical wrote:
> >I suggest to use my `git review+` tool :-)
> >
> >https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-review+
> >
> >same for signoff:
> >https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-signoff+
> 
> Great work Andreas ! Although I personally prefer to use the
> "Reviewed-by: <myself>" tag as a mark I've actually read and
> understood the code I've merged in my tree.
> 
> Whilst I'm reviwing someone's patch I leave off the "Reviewed-by: <myself>"
> tag on patches I don't understand, and only add them once I'm
> good with the code.
> 
> So doing a bulk add of "Reviewed-by: <myself>" actually breaks
> my workflow.

It depends.

For example I reviewed already Pavel his debug indentation patches but asked 
to add a test now. So once this is done I will review the test and as I 
reviewed the other stuff already I can just call `git review+`.

It can also be the other way around. Someone reviews my MR and adds a comment 
that the patches look fine. Lets assume that was you. Then I can just do:

  git review+ --by jra
  git autobuild


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



