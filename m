Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4B5A5D85
	for <lists+samba-technical@lfdr.de>; Tue, 30 Aug 2022 09:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=64Zlx2OGGcBRJ0uzlXUAFdyDaCDbw03K5+5jVSYDGXs=; b=gEGpTQmt+kWwnCwIq3Bs4nU2Gr
	jlLQCpUzRGxr7d96jPbYQGwcL+7nz+QUkgv8L032YDkrK5qZIDR9LU8jGybatobm36zCfeBttMQAh
	S+QQElIeP8ReN137GuD40YB/a+EGdiQ+k625Yo2qFl1e5Eh1ie+BHbGyDmqe3evEZmJS2pEZ5ODYu
	haCFYmPIFLj0FCgKmHEpSwSnJviMPN64ug23X6s11JOsKy+2JLhsqjsXApk7XApPR9W2ZvW0eVLlA
	akZiaXFyWv4xHn3NHhbfgR9tqRZite+FaDSlJXhlTrMwy87xN71hkBFZE3rM1R5VP6Z/c+/L6FpMh
	oDJlN/SQ==;
Received: from ip6-localhost ([::1]:61864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oSw8p-0030V2-2Y; Tue, 30 Aug 2022 07:58:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25804) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oSw8f-0030Us-Di
 for samba-technical@lists.samba.org; Tue, 30 Aug 2022 07:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=64Zlx2OGGcBRJ0uzlXUAFdyDaCDbw03K5+5jVSYDGXs=; b=mee3K0lbtSWvR+PlBsikzEmgKP
 t2Za+aR5IwaGtgVskn5QAxiig2f4lA/D7ZeOYWxt76BepTWzvA67i73iaHOYKcSeyOCqmeL/7Eeb6
 FoXaTKAqZxzYh+DbBURE+89bFb19IQ3ne/x1NLIZ+pvk2Qlz2RogYqnXRwsB5vcWqPhRxlZNSP22B
 skqkxQvBeO12NL+4L/UWHivQCe9tBe4kSLl90MzcHPSivnDV3U8EUmEHhQZmF/0k9SvX2OoXw/PvZ
 XnrVw28AOGiq0IXVgPWPojsi7cpax5K4ZIa1VIPuYIJ8a86QaFWxxM9w1wXo3OcZz8KA19NQnBggR
 Gr9B1122TpTic3dwb+utDOqJPvy/yBNiFrpogAtUPbEZZV2OfRreZmXicq8LgqIrobBuR2nPaPL45
 OutAMaH5XaKABkgqqcxpUKgqrN91hcmo2xjYIc30Eso23qlBsUo9f9gwKJk7JawJkc83HjxiHKimE
 gmaMFbnVvlSOpvTw/vyffFSM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oSw8e-002KqV-2B
 for samba-technical@lists.samba.org; Tue, 30 Aug 2022 07:58:24 +0000
Message-ID: <012ee9705f94cb2b06bd891106fbfc2d15478c47.camel@samba.org>
Subject: Re: Samba 4.17.0rc3 opens via vfs_glusterfs fail
To: samba-technical <samba-technical@lists.samba.org>
Date: Tue, 30 Aug 2022 13:28:22 +0530
In-Reply-To: <CAB5c7xobm2hCmdmC3rspWC4-YOETb-S4Q7wtfMmccqMZRt8+Hw@mail.gmail.com>
References: <CAB5c7xobm2hCmdmC3rspWC4-YOETb-S4Q7wtfMmccqMZRt8+Hw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2022-08-29 at 15:36 -0400, Andrew Walker via samba-technical
wrote:
> ```
> [2022/08/27 14:48:25.748586,=C2=A0 0]
> ../../source3/smbd/files.c:1187(synthetic_pathref)
> =C2=A0 synthetic_pathref: opening [.] failed
> ```
>=20
> Seeing this on trying to connect to share. Looks like we're trying to
> glfs_open() <connectpath>/. with flags (O_RDONLY | O_NOFOLLOW |
> O_NONBLOCK), and it fails with EISDIR.

This was an issue with glfs_open() and is now already fixed[1]. I hope
you were having a released version of GlusterFS installed in which the
fix is not yet available and must have encountered the problem. I'll
try to see if backports can be made available. =20

[1]=C2=A0https://github.com/gluster/glusterfs/pull/3307

Thanks,
Anoop C S.


