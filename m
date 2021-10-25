Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA543A5B8
	for <lists+samba-technical@lfdr.de>; Mon, 25 Oct 2021 23:18:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=NxGwoyeb5S9K4VCcymg2OTg0ZkDq1WIY0kwSMzOWJY8=; b=TBerCecE/FUHH98VYR5akoQ8pn
	G0RcIEbLrKBpkCkdX/fVbN3eWRvsL6or4GLQJE35eoUi6pjzNqm+JzjIgXIg0HWLyoq8TxzGX5Jpd
	S3DGpFOpcAxrhCOFa322pzoc9gqpG5dPslpHzCpX1ux4gpJs5bFq/dAHUhWo2m4PFO/T2outQ4OWg
	8wODX7NyqJhd2LqysuZqf3jto9D415MaiuzkNK1bFzp1rc70tZuDvE1dC+77KcXLCNSwDT43GkYeG
	NH08OGinAbwiaqBFTo0w9e1B6Q0n7kVPph0SDaJT8y6gMR7VSJtE0NlqtvWGfxMFozkl2xpsz/Xna
	PjPI/8hw==;
Received: from ip6-localhost ([::1]:49316 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mf7M4-00CtTJ-R7; Mon, 25 Oct 2021 21:18:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56702) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mf7Ly-00CtTA-Ln
 for samba-technical@lists.samba.org; Mon, 25 Oct 2021 21:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=NxGwoyeb5S9K4VCcymg2OTg0ZkDq1WIY0kwSMzOWJY8=; b=mX1J1QPpKicz1fILylf1Y6ERRk
 2fuhrveOuvjBoTZEdjQx2X91Ig2RXHCAabdT5vN+q4nXxHLfH7EPQEAJcCaeBbOBdsL5rHYeLXK4y
 TkUPLvzeTDfmVk3Jr9S/pcvqu6GmDaOmHUCTsQ9T4uZATXctqbsBm3oVvRyk+VnEz7ZJIz+LKogTI
 v3CHbUIr9UEg6m3pgt8hTc8eRhxN/nxVtz6V+OBexQSrN85rJAd76pmpuDWyN3K3zhJQlAoQXErYk
 WYJwhGhfUddhHWRrvCoiebQ8JPHo7dEaeIHiD+xc/NEvVLcIT9c2uVONZLe2ZtBU5HkszpMKqIjMP
 ccsJwjzoi4mhbhsVnR/NHVCWI5Fglbg7DUR5kaGZ/x1vatoy4UEDyrLIKCO/Zc0FbXDJu5IRPh1eL
 +bWaAYRHxWHWI0RQ5zirSyf0QBB5KBfMNo+x8X6FI83czAMmEMyGy/Z7WZeEh5/b1rtqMbdfIHIt0
 /TBhx33XOMXH5PLDYEmcnvxX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mf7Lx-003AQq-2Q; Mon, 25 Oct 2021 21:17:57 +0000
Date: Mon, 25 Oct 2021 14:17:54 -0700
To: Pavel Filipensky <pfilipen@redhat.com>
Subject: Re: directory with a symlink pointing to non-existing file
Message-ID: <YXcfApG7ovsqLNUJ@jeremy-acer>
References: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
 <YXGd6x6nxD4pHj6l@jeremy-acer> <YXGh+Mp1s/oMnHzU@jeremy-acer>
 <YXGyEPiGNwaXyPln@jeremy-acer> <YXG0WUXsDFpmFVZr@jeremy-acer>
 <CAEcb10sPbR1eDzQCyGt4c7A12MTPhf7QTmR_R5oDnMDvMOJTJQ@mail.gmail.com>
 <YXbcnQJl78LG9txV@jeremy-acer>
 <CAEcb10twxsCBi-jno5V0fh5c6ubZ307tOKPEjDOcueCs=7-Tag@mail.gmail.com>
 <YXbmFp0wcd4Nc//S@jeremy-acer>
 <CAEcb10vbaE0uYow4Xwd5zBEMp+sqow1pQe1hQgAsNK=aMoVKMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAEcb10vbaE0uYow4Xwd5zBEMp+sqow1pQe1hQgAsNK=aMoVKMA@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 25, 2021 at 07:38:30PM +0200, Pavel Filipensky wrote:
>With "vfs objects =" it works for me as well ;-) Great!

Pavel, MR is here:

https://gitlab.com/samba-team/samba/-/merge_requests/2222

I made it work with the streams_xattr and xattr_tdb modules
so I didn't need to add the "vfs objects =" to the shares :-).

Cheers,

Jeremy.

