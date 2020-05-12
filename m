Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 453DE1CF606
	for <lists+samba-technical@lfdr.de>; Tue, 12 May 2020 15:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=D6j5e/NtAx3mNQ7WjP01SoIAH2Fb7gYgdeSB7jsBbPc=; b=tz5yD3FRin+ZJtikmvN3O+c2UQ
	lw349ebAzI5dDShOVJw1l90O5wn2qpCS1nMm/OQQLsE++SI72mLKqGs3PGzVk3bTPRtngnJHPuobR
	yKs187HaFnk5mZXKCGMr/P0eUK9GD/mAbgLaSgz4hRt768Eo0ofsJqLotg3t46hb8EgOf8YbpD+Eg
	ezRs82LtBa5P/+aREcgAUqy7UW+bYU74f6ZKPZK7l7q+lSXGSRBVAslLj1Wm+utpYizjYb5MktBT/
	ER1qh/qdb3fX7i9h21KQ4iSn3Py7uZPiZ3bSBvNJXAuyN0Z98EouC/j2XASQ085yzq9kRKCoBeR7F
	1wNb/Ecw==;
Received: from localhost ([::1]:62516 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYVBb-0046nu-6b; Tue, 12 May 2020 13:43:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30572) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYVBU-0046nn-Pe
 for samba-technical@lists.samba.org; Tue, 12 May 2020 13:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=D6j5e/NtAx3mNQ7WjP01SoIAH2Fb7gYgdeSB7jsBbPc=; b=IQ/BrNzhjXePDsC+cGX8ycOCTv
 UNmA3Q49VO7dYhTSJLaRDRq479kqVF2Io4TxgAqIYFxELz2/LLhNhUYNRBwHU4tUPtyQOqui/t6QV
 lUQQWtxSYCquPaLgQ8ahUEcqn+F/hxA/k5UhCMksyt4rRtMmGh7Y4dLdYKoW5zGxr4E3pNJZLckDX
 maNz/T7QxNXabH27Ck76x4GslM3V2Ge9CB/t0/AF8UC6cg5osMTtIX6NsZaU+jCVYJwq5eywY9sF5
 r0LnF0p1vnAJAwJb4fe9kC6SL1DuGyJMK2ioLaivcpb4zqY3kpNJWDSuDPNhZYSRmnQL2FJejcFFE
 8stGMI+WpjJ7gPLAQKod4mOvyYZ1hJ9gCcUUQDt5X/4ubDYR1byCmKbBvmJIXhCYdItppKkBvMy4d
 TShs08EaRzDUaOxtrI9fj84auRoVvZ8ksvlW1ZQ2ZfI3NVycxQ05vEzQj4llSOd5Ed61L00tgApuD
 NuJeKlYi2vJK+AxBlxloLqwI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYVBT-0005gl-RW; Tue, 12 May 2020 13:42:59 +0000
Date: Tue, 12 May 2020 15:42:58 +0200
To: Matt Taylor via samba-technical <samba-technical@lists.samba.org>
Subject: Re: [PATCH] snapper: add configure option to control build
 (default: auto)
Message-ID: <20200512154258.37bdfd3d@samba.org>
In-Reply-To: <CALSyjX46QX3HKUQoZ2oEXCyywRU2kB0KzMGm3_FzRg4tZjPHUA@mail.gmail.com>
References: <CALSyjX5G7ps8Pafurh5L+6U_JYBA9uTRxJaEhwKL5jTvU=2ZOQ@mail.gmail.com>
 <20200508222441.4f74c615@samba.org>
 <29c6778ebf0a22d063042589526b98922d06301d.camel@samba.org>
 <CALSyjX7RkiukckU5P1xL4FBX6tWpZFB9E1t0CrO+t+0EwNaNWA@mail.gmail.com>
 <20200510020744.2baaa806@samba.org>
 <CALSyjX46QX3HKUQoZ2oEXCyywRU2kB0KzMGm3_FzRg4tZjPHUA@mail.gmail.com>
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
Cc: Matt Taylor <liverbugg@rinux.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 11 May 2020 16:55:48 -0400, Matt Taylor via samba-technical wrote:

> On Sat, May 9, 2020 at 8:07 PM David Disseldorp <ddiss@samba.org> wrote:
> >
> > Hi Matt,
> >
> > There's some white-space damage below the new samba_add_onoff_option
> > line. The empty line between snapper and cephfs should also be removed.
> >
> > Otherwise this looks fine to me:
> > Reviewed-by: David Disseldorp <ddiss@samba.org>
> >
> > I expect the new default dbus dependency will catch a few people, but
> > the clear instructions on how to disable it should help.
> >
> > As with your other patch, please use git format with a commit message
> > and sign off.
> > See https://wiki.samba.org/index.php/Contribute#Mailing_patches_to_samba-technical
> >
> 
> I've removed the extra white space.  I think I did this correctly,
> it's my first time using git to try to submit a patch.
> 
> Thank you for reviewing and working with me on this.

I've submitted this (and your other patch) via:
https://gitlab.com/samba-team/samba/-/merge_requests/1335

I ended up backing out the vfs_snapper-enabled-by-default behaviour,
as I was a little worried about fallout from automated build scripts.

Cheers, David

