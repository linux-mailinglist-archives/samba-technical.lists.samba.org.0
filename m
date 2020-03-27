Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B2890195BAD
	for <lists+samba-technical@lfdr.de>; Fri, 27 Mar 2020 17:55:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=CgnpCD5k5Prqdb8gW76GFP+ZAztyHTbjb7BUSQkVIww=; b=U7oh0cVsPtovwy6/11UegiTlZi
	4TOvqsU5oqIqtPvHbov9VtXaSdscBeRyLiJjqosfnKDmCxPRCWDHqrylY4W3q7EDkN32TfBJWeDT/
	HZG+xuC+e89jQgmq81Xh8lO1BRTxmzDbHUFP/DDeGr+RuzZEqppf43JoJwRFNE9hTqsRFAyTx3zyg
	n6rzAsUh11pBSN9MdumIrbvip95VCFQT7UKnl4cgEozKRZveoPMdfR5fSMF0OrVM+B+RU+9z9scaC
	aRTIv38fFsPvQuKgbUqqjvehZZaT+8J2l/6L249Tvt1GCgO9K7DzuOsSq3RZJQdDUNN4h0AdNruGF
	+UziYcvA==;
Received: from localhost ([::1]:49628 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jHsGA-000rmt-NQ; Fri, 27 Mar 2020 16:55:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18212) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jHsG6-000rmm-71
 for samba-technical@lists.samba.org; Fri, 27 Mar 2020 16:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=CgnpCD5k5Prqdb8gW76GFP+ZAztyHTbjb7BUSQkVIww=; b=BkLAXvgJnUx9vldQ55oYkKnmL/
 U0a6gTrpSVOkcfNEdFClGP3/Ef+0N3mmm7XqnMpOVW5Lngfg6NOWXFcc/TETDzw6aOHrHIKihgKBC
 khU6yKU5Q4LzjPjcOYwlUCBTQCeo/+jZ/N6urW5U/ShTkCQ0cLxt1rm3nnBJr3BFhzhktj/jbRhs4
 uPoRGlB/IPwt5xVEoJs4vJoTwwlU/CR00l856jilHZ2d7bRu7kn1OjC3I+9pHSEjo8Y9KLe8wn3OC
 oOyE7aj9egocSZaF70ml2qsqkwx4lP0xkIL7f+WiBaB/PJShsGxnjw5vMP/L0Bry2gfiqJbwWJFuS
 DIj9RS84cQe++LBdpR484FTMUVY8wzvXLYONHqAFmbZUp6HFayX5yTUedKaj03o7YrF+BRt7UFFel
 pPwF4XCXbsbOFJCeZ+DJP4j35xJ9mnu89CilUis96QEs+j7t1lW0q0/eJE3ywnYWON/PPxQkzhgFK
 /ybUy1ZdMl/pDEzMexOiZidP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jHsG5-0007KV-AY; Fri, 27 Mar 2020 16:55:01 +0000
Date: Fri, 27 Mar 2020 17:54:58 +0100
To: Jeff Layton via samba-technical <samba-technical@lists.samba.org>
Subject: Re: [RFC PATCH RESEND] vfs_ceph: allow mounting a named filesystem
Message-ID: <20200327175458.314ac804@samba.org>
In-Reply-To: <20200327162950.94545-1-jlayton@samba.org>
References: <20200327162950.94545-1-jlayton@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Jeff Layton <jlayton@samba.org>, Marco Savoca <quaternionma@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jeff,

On Fri, 27 Mar 2020 12:29:50 -0400, Jeff Layton via samba-technical wrote:

> Signed-off-by: Jeff Layton <jlayton@samba.org>
> ---
>  docs-xml/manpages/vfs_ceph.8.xml | 16 ++++++++++++++++
>  source3/modules/vfs_ceph.c       | 16 ++++++++++++++++
>  source3/wscript                  |  6 ++++++
>  3 files changed, 38 insertions(+)
> 
> I had a few spare cycles today and went ahead and plumbed in this
> support since Marco had asked about it on the ceph-users list.
> 
> This builds but is otherwise untested. If it looks reasonable, I can
> clean it up and test it out in the near future.

Thanks for the patch!
Give that the cmount context may be reused between shares, this would
be problematic if the shares are configured with differing fsnames. That
said, I think we have the same issue with config_file / user_id, so I
don't think it's a showstopper.
Otherwise, the change looks reasonable.

Cheers, David

