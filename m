Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 094FD36B2A9
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 14:01:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2xfUBeY98HfnlZkS+3lVnJNCTrLd0p5QahTmq0k6Mig=; b=NIbcxKwPkiVjTgWZ/NWT2J1NQb
	kbMz65I4OFr+e95U+gJ6v5VtTj08HwZ3AeUNP1DhOi0yrxCeQh4Dtabv7XC/ICToUfly5wigud1AS
	TLwR70JXZ4bjuBH7x7qMYqNBucH0Jt/R3cY8QwIqjabe75J9WGbFtfV65SZlJ1Osxv5ymv2Tv72vo
	c8F1nSWyjwiXBR3a66tnb3tDgPGw4MzgDY74AWdmU0JmFo9QuM9TP7GUqG+Qi07tejau8uufUEjb6
	Y6LWz6gOCBAl4RzRQoFLLfQMNuTI5DncGPDy9+NNCrMgXai7xxVN1miZLHUMsYiiXH6cy1YZJLLNx
	4JIn0CdQ==;
Received: from ip6-localhost ([::1]:54436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lazvQ-00CTui-3m; Mon, 26 Apr 2021 12:01:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24708) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lazvF-00CTt3-TZ
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 12:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=2xfUBeY98HfnlZkS+3lVnJNCTrLd0p5QahTmq0k6Mig=; b=rBSpNjRUfxHHwMtY+B4A4h0AuC
 hXfQ2X+roM/jykvyp1HCU259JtxTeGFbBs5q5UwNjY366FgeGGSuA4oT6DrYLJjTT/8OuXkNfsJPA
 bLe9jGcPtonvkyIgffxi2Kr/mYBIJVd95hy7Yc7w9hxiTmhz/2S8T4fHIUvnhYx4xdtft61FSGy/g
 HPkn2+bl/ME4oW6Y08SS17rhLaOYqPR+c8r/QlU6qvJHO7OAHS9LkCln4mTn3NeqELIGELxpbZQzk
 RnM6Tf2Xv/G7jRm/ilqevdmeHl39QELGy8hZZEiuW9YSSCfyAl4wH5fwMgPANUaQAUndqgdRzrpYA
 RDdzT4RBmEqFRCcGn+LcauRZcvdQnFvPXcQD6N5gMmFa3bCVZdt/mH5k+pO34tFD7U23+BDjrPoza
 bf0EWAfLfw1eX+3SFEzs0eyWVRXsoIdCp6XqSPrlIoEfFgqwLQOeo6OHzjbc7ayBrvY0i8MMJ4Lay
 skjmz6TEgj6WbRzSLMZO+QwX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lazvF-0006oh-4H; Mon, 26 Apr 2021 12:01:05 +0000
Date: Mon, 26 Apr 2021 14:00:50 +0200
To: Jason Long via samba-technical <samba-technical@lists.samba.org>
Subject: Re: vfs_snapper is enabled but prerequisite dbus-1 package not found.
Message-ID: <20210426140050.26e7bcfd@samba.org>
In-Reply-To: <1398593433.332041.1619436765261@mail.yahoo.com>
References: <1398593433.332041.1619436765261.ref@mail.yahoo.com>
 <1398593433.332041.1619436765261@mail.yahoo.com>
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
Cc: Jason Long <hack3rcon@yahoo.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jason,

On Mon, 26 Apr 2021 11:32:45 +0000 (UTC), Jason Long via samba-technical wr=
ote:

> Hello,
> I want to install the last version of Samba as a DC on Fedora Server. I d=
id "./configure" and got below error:
>=20
> vfs_snapper is enabled but prerequisite dbus-1 package not found. Use --w=
ith-shared-modules=3D'!vfs_snapper' to disable vfs_snapper support.
>=20
> I checked the=C2=A0dbus package and it installed already:
>=20
> # yum install dbus
> Last metadata expiration check: 0:12:35 ago on Mon 26 Apr 2021 03:43:20 P=
M +0430.
> Package dbus-1:1.12.20-2.fc33.x86_64 is already installed.
> Dependencies resolved.
> Nothing to do.

When building with vfs_snapper enabled, Samba requires the development
header files. They should be present on Fedora in a dbus-1-devel or
dbus-devel package.

Cheers, David

