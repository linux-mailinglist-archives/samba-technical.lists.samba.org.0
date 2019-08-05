Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BA98229F
	for <lists+samba-technical@lfdr.de>; Mon,  5 Aug 2019 18:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=LeR6FwcDKYvZ7G+VoOgyO1Y3ifHWdlYs2dv1bpQIzuo=; b=EEqgdn0pL+JfnPAz0IgWpeb2Qd
	QKSO66cbHeXO312BDUDzhuhvNn18EZVtGhHKZEFCh87T3GgRSatp/nGAUpPmbnw9mss/USazBbblY
	zfDzTNbmFr6DlvxR2cNB+pC2ZXIsVbSIt7/pcwYDW0QXPX5Wq5VG+P+yFDJYzRkxfOtsUotLtl+3E
	SgiHWcgP6XVzZFz1/RilFYCxoDvTBbCdUDQrF4qvy11Y3M3paZumbChDOyOCkdc3w6f4lOAAkWq6j
	ULB6eGiD08oiO+CRF8Y5jOvjrmqHmapOy2R3r6LNN4FV4GYRZr1TaRHmRYQ5yYeTMU7LYVIsOjuTi
	X2QaeyBw==;
Received: from localhost ([::1]:62190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hug2b-004JqK-Ey; Mon, 05 Aug 2019 16:40:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40782) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hug2W-004JqC-RM
 for samba-technical@lists.samba.org; Mon, 05 Aug 2019 16:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=LeR6FwcDKYvZ7G+VoOgyO1Y3ifHWdlYs2dv1bpQIzuo=; b=WfjK5jjOpJIhcAm/J47MJVGR3J
 kzCfFlarnx0G0HtnyNI0HYcGn+Oc46wqatCu7arHW2FxPWEQVVrlRzzYtKhQRzKTZN3IlTRwvyKCM
 TqkTQBnTwq/lXQTsaPizTDDzY5lHWFW2xpoqccQ6+TCchodCJVd41YDKZF/Tgtai35Eg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hug2W-0003o9-3l; Mon, 05 Aug 2019 16:40:52 +0000
Date: Mon, 5 Aug 2019 09:40:34 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: NT_STATUS_INVALID_HANDLE during file open with  vfs_glusterfs
Message-ID: <20190805164034.GE224585@jra4>
References: <e3886f8fcb0ed4aae2965099bcdb0b4ff35a581a.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e3886f8fcb0ed4aae2965099bcdb0b4ff35a581a.camel@cryptolab.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Volker.Lendecke" <Volker.Lendecke@SerNet.DE>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Aug 05, 2019 at 07:52:37PM +0530, Anoop C S via samba-technical wro=
te:
> Hi all,
>=20
> The following commit changed the way in which O_NONBLOCK is
> added/removed from file status flags during open.
>=20
> https://git.samba.org/?p=3Dsamba.git;a=3Dcommit;h=3Def582ffcf3a220b73f678=
d9bce0fd37800f76c54
> smbd: Always open files with O_NONBLOCK
>=20
> Since O_NONBLOCK is now internally getting added unconditionally,
> storage backed by GlusterFS volumes using vfs_glusterfs produces
> *Invalid file handle* error while opening files(I tested from Windows).
> set_blocking() from open_file() is now being invoked due to the
> presence of O_NONBLOCK flag and fails at fcntl() call operating on fsp-
> >fh->fd which is obviously bad and returns EBADF.
>=20
> Thus when open file descriptors are handled as fsp_extensions we may
> have to rely on VFS itself to get the job done.

Hi Anoop, can you fix this by removing the O_NONBLOCK
=66rom the open call inside vfs_glusterfs ?

Adding the O_NONBLOCK is correct for the local filesystem
side of things, so if glusterfs needs something different
it'll need to cope.

Adding a test environment for gluster into Samba would
also be a really good way to ensure we don't cause
problems like this in the future - but currently
our base test environment is the local filesystem,
which I think is the correct decision.

Jeremy.

