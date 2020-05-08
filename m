Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE9A1CB911
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 22:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=MxtKpvW5QgVrBpXd8Rk2nXbyuvkMxUah4/nnb4DXZ18=; b=E+0PPQmYyMajUdkqg+SbgEePE2
	5pu10BoLIDQriXQpxylJpuFCE77fWSMgmf1Un8o4kTSKOxwSQad1b8jOb8uaHinnLIjZX+pL55Qns
	z2eHb89OoupT4I6seQg6yaaT7woZV4jDAIZb95MVoWu+vtDTGcTpXjlAg+b3qTu+72qNMJFw46yBt
	SrmitUM/KzpE8VjW+p/3zMASZWkjf238MmbzuuDomEE4nhtYYNofwdywAtHOCjH8rd24mIOIwXn4x
	v+fbTXDnoc3OmQ17CIE0FOF6Boc48T9oLGfZkSftEWrxLyvHMWx5dUzDU02OxRl/aqjoJoittJOB9
	dJ4DtQ+Q==;
Received: from localhost ([::1]:27246 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jX9jt-003HOB-Mw; Fri, 08 May 2020 20:36:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14908) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX9jm-003HO4-AT
 for samba-technical@lists.samba.org; Fri, 08 May 2020 20:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=MxtKpvW5QgVrBpXd8Rk2nXbyuvkMxUah4/nnb4DXZ18=; b=XNKxab8USdxmYwN9CgfLcLqFzc
 ieignzBkefrqtAlHMQ59KuAZcRRjN10Xwzkd/v9K0nRB6NUwW9vykZhJlrlTisa2UKhd8bppcIwUt
 2dFEZVp9JIWxT/JO5iZo5jGc++UMpUyniRxkUghyXcdhYyewXnDa/tdj5jPG3cU6VHKt+fHoTDTQb
 JzzkJjRQc7dm3IetR7QY1cAGSs6WKf7VJqTylSKQ9gcZEZwiW4EeqZKhfV1823hp51oiUTK1kfk1N
 0kuNTcajzVM0rjkUdOSZf06w/NsI5bZ11bqMNZrJsVfj1i2jUtHrL1QkzrdqAUXq++tm8Zfwl7Ti+
 MAohCS8ncZC5owjI2NKZWB4tMouUgCGEUANFOznC2fuY/eLrsKUvxA8SS3BiKPqTxn0LZAkbgLwwd
 u0gDzJGFccks1EhzNgw5rnu3Ra8KnhWu2DA0hYLbrm9IGmb4QjEhknx9Ok+7kvs04dtI4EJWAtuc/
 PBC/PVT0bOYj1xLnY/SQ/rA5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX9jk-0000Ur-AS; Fri, 08 May 2020 20:36:49 +0000
Message-ID: <29c6778ebf0a22d063042589526b98922d06301d.camel@samba.org>
Subject: Re: [PATCH] snapper: add configure option to control build
 (default: auto)
To: David Disseldorp <ddiss@samba.org>, Matt Taylor via samba-technical
 <samba-technical@lists.samba.org>
Date: Sat, 09 May 2020 08:36:44 +1200
In-Reply-To: <20200508222441.4f74c615@samba.org>
References: <CALSyjX5G7ps8Pafurh5L+6U_JYBA9uTRxJaEhwKL5jTvU=2ZOQ@mail.gmail.com>
 <20200508222441.4f74c615@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Matt Taylor <liverbugg@rinux.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-05-08 at 22:24 +0200, David Disseldorp via samba-technical 
wrote:
> On Fri, 8 May 2020 14:05:16 -0400, Matt Taylor via samba-technical
> wrote:
> 
> > Recently the samba packages on Gentoo Linux had a hard dependency
> > on
> > dbus added.  This is because the vfs_snapper module is enabled
> > automagically on the existence of dbus headers with no option to
> > disable it.  See: https://bugs.gentoo.org/721320 for the Gentoo bug
> > where it was suggested this be reported upstream.
> > 
> > This patch adds a configure option to control the build of snapper
> > similar to other vfs modules.
> > 
> > Signed-off-by: Matt Taylor <liverbugg@rinux.org>
> 
> Thanks for the patch Matt!
> The change looks reasonable, although I think I'd prefer to see the
> default be True, so that existing packagers aren't affected.
> 
> Also, if this work is contributed on behalf of your employer, you'll
> need to sign the DCO as described at:
> https://www.samba.org/samba/devel/copyright-policy.html

I agree.  I do not like ./configure parameters that default to 'auto'
(and the same goes for features), because of the inverse of this, that
the absense of a header on a build machine would mean that a feature is
unintentionally lost.

The recent practice has been to have a configure option to allow a
distribution to disable a feature (as is desired here) but to otherwise
give an error if the header/library is not available and point to the
flag.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




