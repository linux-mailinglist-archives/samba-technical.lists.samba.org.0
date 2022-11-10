Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335362450B
	for <lists+samba-technical@lfdr.de>; Thu, 10 Nov 2022 16:05:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qL7ePikABfIXzVw6Z/2qzrMSs56bypG7tZY4JaTRn2Y=; b=ClburfINSNPeVxdXvT/2ka8dLb
	YouFFSsTHAwXaF7U6o6xWkTXcoaLxRdNkxIjFxJfdKxX3XHMsMDubw0KmRwBLB1IyE+7GeXaGsCwO
	IZ2s7kE0kdPYw1Aqs9cNBAlbTJVyEbwKrES1cvVKoyiUBQkWqw0IRhdo6ZMNdXsDrU6JaJ1zaJvcm
	ZPPK6neVAcoEIk5xRLobYXBY+3bu3kDAwtVxRC991Ai6YaqIIewb/O928RmMRYcaJUxoeIZ18dF2Z
	hU8mOwTAgRUtokjrb9cFZuzjfqY7Fb7z78++nHTy+AVT945AywnEbfsaUmg9/SsGqSK4BHTunEmb7
	BfKzRo1A==;
Received: from ip6-localhost ([::1]:59764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ot96h-00C0iG-2B; Thu, 10 Nov 2022 15:04:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37640) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ot96Z-00C0i6-8R
 for samba-technical@lists.samba.org; Thu, 10 Nov 2022 15:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=qL7ePikABfIXzVw6Z/2qzrMSs56bypG7tZY4JaTRn2Y=; b=dwHkPkGxtw488Wcw6xjv3IVLI0
 HE7vSvZsb6syBN/WUOGIQOBVmFRXByuMryjGfYLIRytop6vfCDk9FC1RruZQBVDo9ZLBdPzt1NMuq
 ojjkDT0qaDHUq1RUsez1NNyOjLHG9WuzsYf1s5HIW3ovxc6U0pHbIuhaNbdvMjOAhK2b5AzqKZjBe
 lT9NTjBnELFv88XziPtyGx9qEjkR2qbrcvlxPRmmqx/XDx8fgvZ/TGK0wtTCDNC981elZHa5plnE7
 Pg+H3EpOG29CKM9c1Y4HJI1hjGDnhKMYl2yqlpO4N9p1MRrLcCa0ZYdpzAw0ATcorIgHm1dmtU+oJ
 5zQMP+loOegjM6TP+UdHCU+i+EydSoNOq98wXUWMQHW4yOKe5GNli/k6Ejyvz4gLexPfR9WzSadLO
 nlyahZy4A/Q8YfEZOxwaEvxBO/TFkcizRAxmKRaWHL+IQGaYPGL3TzB2d8DabTxobaYBuRFb+x605
 5q9JVI0HZ6UNA1Yx+kcZ7P4c;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ot96Q-00815o-LS; Thu, 10 Nov 2022 15:04:26 +0000
Date: Thu, 10 Nov 2022 16:05:03 +0100
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: reflink support and Samba running over XFS
Message-ID: <20221110160503.4dd8b219@echidna.suse.de>
In-Reply-To: <Y2zjpE6f6WLtkqiz@infradead.org>
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
 <Y2molp4pVGNO+kaw@jeremy-acer> <Y2n7lENy0jrUg7XD@infradead.org>
 <Y2qXLNM5xvxZHuLQ@jeremy-acer>
 <CAOQ4uxgyXtr6DU-eAP+kR1a7NsS-zDhXi5-0BJ7i=-erLa3-kg@mail.gmail.com>
 <Y2vzinRPFEBZyACg@jeremy-acer> <Y2v1zQbnPoqg+0aj@jeremy-acer>
 <Y2v+au3rvWOUOr1t@jeremy-acer>
 <20221109233055.43b26632@echidna.suse.de>
 <Y2zjpE6f6WLtkqiz@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 Jeremy Allison via samba-technical <samba-technical@lists.samba.org>,
 metze@samba.org, Steve French <smfrench@gmail.com>, vl@samba.org,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 10 Nov 2022 03:42:28 -0800, Christoph Hellwig wrote:

> On Wed, Nov 09, 2022 at 11:30:55PM +0100, David Disseldorp via samba-tech=
nical wrote:
> > I think it's doable too :-). As indicated in my other mail, I think
> > FICLONERANGE will need to be used for FSCTL_DUP_EXTENTS_TO_FILE instead
> > of copy_file_range().
> > I'm not sure how to best handle FILE_SUPPORTS_BLOCK_REFCOUNTING -
> > ideally we'd set it for Btrfs and XFS(reflink=3D1) backed shares only.
> > Another option might be to advertise FILE_SUPPORTS_BLOCK_REFCOUNTING and
> > then propagate errors up to the client if FICLONERANGE fails for
> > FSCTL_DUP_EXTENTS_TO_FILE. Client copy fallback would work, but the
> > extra request overhead would be ugly. =20
>=20
> We could probably add a bit to struct statx if that is helpful for
> samba.

I think that'd be helpful for the above example.

The corresponding MS-FSA spec states:
  2.1.5.9.4 FSCTL_DUPLICATE_EXTENTS_TO_FILE
  ...
  The purpose of this operation is to make it look like a copy of a region =
from the source stream to the
  target stream has occurred when in reality no data is actually copied. Th=
is operation modifies the
  target stream's extent list such that, the same clusters are pointed to b=
y both the source and target
  streams' extent lists for the region being copied.

So it would appear that SMB clients can expect metadata I/O only.

There's one other SMB caveat which should be considered with any statx
changes, from MS-FSCC:

  2.3.9 FSCTL_DUPLICATE_EXTENTS_TO_FILE_EX Request
  ...
  When the DUPLICATE_EXTENTS_DATA_EX_SOURCE_ATOMIC
  flag isn=E2=80=99t set, the behavior is identical to FSCTL_DUPLICATE_EXTE=
NTS_TO_FILE. When the flag is set,
  duplication is atomic from the source's point of view. It means duplicati=
on fully succeeds or fails
  without side effect (when only part of source file region is duplicated).

Cheers, David

