Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 881CA1CC5AE
	for <lists+samba-technical@lfdr.de>; Sun, 10 May 2020 02:08:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ajnplmeGIiqC9bNKSjtkF0D7lqaJZqAetoa2SBLX5AY=; b=vkccHO4eNSo+6gz4k/Dwx2tt7U
	9U3BQ5TOyNdYXlsvQzxfn0Df5uuvmdRKWUyCkwjjl95Fizinfsq/MJGsIiqnOmvvdhCUjm8jTruEg
	ZFQwfpMUCHzPqyttEtV5tq0DCbzTKrvW/RhZXp0MlC5mwM2wZH9bRPBnNN3PPgRYdRC0rMpbGSACW
	KRLja99Y5V3GvMP7d41erl05NQQrrYn/WkOF8G7I2WPId4oaXIkKm7WqQSVrFrFZ0Xu9NyVxRiiQO
	6SFMDUgsEbDQuTiTnfR4BVZQpe7AQEhHxDmmDT1v0p+LYtTJ8lffyJHdzZOYsgiJpT7NUF7QcfH6b
	jx0w7txg==;
Received: from localhost ([::1]:29982 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXZVa-003bqV-6c; Sun, 10 May 2020 00:07:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31946) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXZVU-003bqN-Fg
 for samba-technical@lists.samba.org; Sun, 10 May 2020 00:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ajnplmeGIiqC9bNKSjtkF0D7lqaJZqAetoa2SBLX5AY=; b=JyES/ywyyXFHcKvTyV+GxheEhp
 0feFQCBASrtIuBTr+2MP4/388SbeTplsSALG80PqIM9ZbC7J+cYqsqLzT01aX48Bf4mqPz+bd6ltX
 hOGyf9L6hNnYE3jNgrZDk/55zBrJueADsomRFODpkWU8by4+AUu4srhM6+LjOHymxoav1SdFVEpHd
 sb3lJw9GuyyrPLTu0Mt0vn+63G8KT0W4A7o43pY1sEK/xKbVyJcUIDgWhq4FqS7uYdttqEuKbOjkI
 ykbUl1l5NhDaN2NDkPyML+ygcnGtUNHPk9j2lB4M3vAIfKtwYSI/SMMXjmiicSq8FUJGp8Wnfrc0h
 av1eZlmiI5PmfDhIbqPXP986n2ZMV9A5dZ235w+etgAoGWFz12qDc+cvdsI8XE69+kz1maxxS6ZZ8
 O7fMcKFhJFqCBafZvKuuRcRU1nrkffvnA8LbOqoxA86ap4UDtMU6oRsAi8GjQggPIY+OlsjTkVhp1
 zaafEQx1h/l9SDm8V3znH15h;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXZVR-0005KX-Mh; Sun, 10 May 2020 00:07:45 +0000
Date: Sun, 10 May 2020 02:07:44 +0200
To: Matt Taylor via samba-technical <samba-technical@lists.samba.org>
Subject: Re: [PATCH] snapper: add configure option to control build
 (default: auto)
Message-ID: <20200510020744.2baaa806@samba.org>
In-Reply-To: <CALSyjX7RkiukckU5P1xL4FBX6tWpZFB9E1t0CrO+t+0EwNaNWA@mail.gmail.com>
References: <CALSyjX5G7ps8Pafurh5L+6U_JYBA9uTRxJaEhwKL5jTvU=2ZOQ@mail.gmail.com>
 <20200508222441.4f74c615@samba.org>
 <29c6778ebf0a22d063042589526b98922d06301d.camel@samba.org>
 <CALSyjX7RkiukckU5P1xL4FBX6tWpZFB9E1t0CrO+t+0EwNaNWA@mail.gmail.com>
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

Hi Matt,

On Fri, 8 May 2020 18:25:41 -0400, Matt Taylor via samba-technical wrote:

> As long as the option to disable is there that works for my scenario.
> I figured since it was automatically including snapper if dbus was
> found previously I would keep that automatic behavior.
> 
> Updated patch attached.  Snapper is enabled by default and configure
> will error out if dbus is not found and --disable-snapper was not
> passed.

There's some white-space damage below the new samba_add_onoff_option
line. The empty line between snapper and cephfs should also be removed.

Otherwise this looks fine to me:
Reviewed-by: David Disseldorp <ddiss@samba.org>

I expect the new default dbus dependency will catch a few people, but
the clear instructions on how to disable it should help.

As with your other patch, please use git format with a commit message
and sign off.
See https://wiki.samba.org/index.php/Contribute#Mailing_patches_to_samba-technical

> I'm contributing as an individual with no corporate
> involvement/restrictions, so does that mean no Signed-Off-by tag is
> needed?  I have another trivial spelling patch to send after this.

As Andrew mentioned, the signed-off-by tag is still needed, but
otherwise this should be good to go.

Thanks for your contribution!

Cheers, David

