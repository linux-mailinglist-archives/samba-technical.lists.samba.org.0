Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BC81CB8E5
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 22:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=QgI3emSGTmM+d2RlDjmPAqQRc+YV5yCZuseyJb/c0Wc=; b=thsS7QUFDrlqEqyASs/IlAN/VP
	jY80wSSnakiub6jlHyKq8RnsyIf0OARwQdX23NtS7jTZJlBhH767q3H3LkCkmbJI2GNe2eqtjB+92
	czvmCuEp9OPHNRcKrAV3AebgI7qgLWqor1dYmFvZ5PJNBaajArzVtiAXhva60cAV79TS0pIOCcX16
	VwKOi95p8xThIV8Qt+NDIwLUKRWMJ0TtgQd1o8CpBCFC9YR51NjDDjz+pGT7gA/P9iGR6k/AwP30T
	amQpAA7C8oYMJUnZiJIbf0DMz8LGm2wUAzMskCiU18561AV0j70j1kcIzmAX5NfciWcZ8a1zXeKSe
	qwfueHAQ==;
Received: from localhost ([::1]:26494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jX9YB-003HHj-L7; Fri, 08 May 2020 20:24:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65460) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX9Y4-003HHb-OB
 for samba-technical@lists.samba.org; Fri, 08 May 2020 20:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=QgI3emSGTmM+d2RlDjmPAqQRc+YV5yCZuseyJb/c0Wc=; b=GPsym+KktnhutNWM9k33aYLho4
 osHITv8tEyaD8CgrLGeLzlEWv5WIEWqPR8J93+/AKrr2AH+X/XARXbdFwtgSFXzTbXq6Xx4W8XA1g
 u8oDH6kaHEW/AM69Bm+vqOKLing/BNzX8/ONQVAoxGqgP043CIJ5mz4ax1sN7XeKAsKUZtYED9fVu
 dEyrCWZWUXRboVhX2RX39P347Lz42+xH+n2SR3xE4AOgpCd7V5MjE0njacAN83TDQKSh7Lf72I2+P
 +6Qb00+8M7LHC7xCBYqYUU0XhxI6vT6QO1VeIIIy0LcJp7MOmMHpXaZXzKPhRpAZddpVBDLk50A5N
 rVYjwnSIlHQLSNBSFXC6cj3TxnGKjTb8eetABasC5F5dAYZD4EuDiFz2iPrg8rQerydl+/5pYg/+U
 6n3vEPOKsOOrQWZRHsDuHYAxoKhx83ILzG0gJNZb4N0i7lad8+x985cn1trHed8UrbT72iXtQ9vt5
 IiFPu3skUot8UHrGGJCOb3ID;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX9Y3-0000MV-Vo; Fri, 08 May 2020 20:24:44 +0000
Date: Fri, 8 May 2020 22:24:41 +0200
To: Matt Taylor via samba-technical <samba-technical@lists.samba.org>
Subject: Re: [PATCH] snapper: add configure option to control build
 (default: auto)
Message-ID: <20200508222441.4f74c615@samba.org>
In-Reply-To: <CALSyjX5G7ps8Pafurh5L+6U_JYBA9uTRxJaEhwKL5jTvU=2ZOQ@mail.gmail.com>
References: <CALSyjX5G7ps8Pafurh5L+6U_JYBA9uTRxJaEhwKL5jTvU=2ZOQ@mail.gmail.com>
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
Cc: Matt Taylor <liverbugg@rinux.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 8 May 2020 14:05:16 -0400, Matt Taylor via samba-technical wrote:

> Recently the samba packages on Gentoo Linux had a hard dependency on
> dbus added.  This is because the vfs_snapper module is enabled
> automagically on the existence of dbus headers with no option to
> disable it.  See: https://bugs.gentoo.org/721320 for the Gentoo bug
> where it was suggested this be reported upstream.
> 
> This patch adds a configure option to control the build of snapper
> similar to other vfs modules.
> 
> Signed-off-by: Matt Taylor <liverbugg@rinux.org>

Thanks for the patch Matt!
The change looks reasonable, although I think I'd prefer to see the
default be True, so that existing packagers aren't affected.

Also, if this work is contributed on behalf of your employer, you'll
need to sign the DCO as described at:
https://www.samba.org/samba/devel/copyright-policy.html

Cheers, David

