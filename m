Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35625B715F
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2019 04:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KdkvmwmOSOwVn5z+zC8eYaCbIrPvzzvQGVbUx7EVelM=; b=SMmhm4nQjPTftpG3ldb2SUa8gO
	GM6sVuQ1pUB+NDH87y6C73rwZSUeAwMU9IsELoF9z1E7EjSAsomaOs2CyCrYxz/F7cqvKUrJCyTic
	sZGKbhEcqBsS2CvFbitpgkEhXfQWuoQ95flV9TN0WhuQqEuuR9ZMJt4O9xlhJ/so4X5oHoUPbM4aU
	Fu479+V/GiCMyzH/wEbuEiGipO/fr6NDRpvxQwAwjO3BBJh6ep9Ov7gjohaVNPG/v3Gliwnuy2Ebt
	oSQ5sIugzU7qJVSRh9EHZrOjYUkL9cZ9a1m4LQSnZ/y8nbriFMhoZhBeWtSNsui+Nor74/HS9X0If
	J/yJAYqA==;
Received: from localhost ([::1]:51484 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAllV-006kdb-L0; Thu, 19 Sep 2019 02:01:49 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:39664) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAllP-006kdU-Iv
 for samba-technical@lists.samba.org; Thu, 19 Sep 2019 02:01:46 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id f15so1205260vsq.6
 for <samba-technical@lists.samba.org>; Wed, 18 Sep 2019 19:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KdkvmwmOSOwVn5z+zC8eYaCbIrPvzzvQGVbUx7EVelM=;
 b=r2z6PVW8YpYiYc8ovEZclTVy/AVap1If5l9t0xEXggKF4V0R7WymEud4hFMrZjDJz4
 wrrQhY5uNY38x8EGBYTOq/VVR36XN+5l7EVfsdKx6N7lI0TOCW1eb4UxfjVAnw1g8rFJ
 ePXqCe4AEOR3/zkBvgqTxg7S/t72Ajx0+4Z0fnUAsiWKuaf5tfMXoNlu5HlBTvCYET6/
 f/9G+pv3xoOR+4RIjt1zuz30b6dEtY3XVIXHcCadZfRHktuOBi/dNhCmFrSJgdR+Mqb4
 b4qyZ3bm7tDvmBX+WdlqfAS1TiUeCSfvsuhbzwZf7cB5YTvv4+RUd5mEkEF4zz2WBvDJ
 QpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KdkvmwmOSOwVn5z+zC8eYaCbIrPvzzvQGVbUx7EVelM=;
 b=gDG5LhM+VKjlu9DT9iM268ZhrG6QMdUx4NiIwFu4p0LNA6Kkvs/0iv4UmcUxb0wD+2
 pfMt8OBKY1Qf3/be7G2vW/SyrfFUTkPdYYki2bcYhkKCIZQ1auS+7se7WjNqupgfdLej
 E5yC1hR4t4V1OH2gznajYR0PY/uHn1RtmPXnpHVzm6gKAAlUy+5u9JBZ6bgb0imGCBNY
 Ccjbep8lcceK5We0zweuQwZV66LZl72TYIlJ6OIzoVv1RED7oAY8sgSXJI6TeqkaEaur
 UgKh0RV35a7T9ZQ1hACeqJaFhI2PD+mYoHtKVaJcEqKn/F81eGSo/y0/jnmxm9smBN5A
 hhxw==
X-Gm-Message-State: APjAAAVnfKiTVLYcijrUoCkngf1HROEE6qnOREs8xmVqVpNgpIUNEU7t
 x/vloiMqHUq2mveRHhYh5Ws8mSEq/sDLqUQ4zEk=
X-Google-Smtp-Source: APXvYqw0wMByhFAjYSrMtikC6TCztmVCWdYecxIrAqo9OAY4GWZJla/uhI9RgkpBgsLsafIbKcGNZVOuSqMVZVUX68U=
X-Received: by 2002:a67:2981:: with SMTP id p123mr4099808vsp.121.1568858500170; 
 Wed, 18 Sep 2019 19:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <1567482029.19432.46.camel@samba.org>
 <20190903144445.58591c90@martins.ozlabs.org>
 <1568849556.4377.70.camel@samba.org>
In-Reply-To: <1568849556.4377.70.camel@samba.org>
Date: Wed, 18 Sep 2019 22:01:28 -0400
Message-ID: <CAOCN9rzCshckhzed96biz2QaopixuwsE13JQYCNcWSYd0BbkTA@mail.gmail.com>
Subject: Re: Building Samba master on CentOS 7 (gnutls)
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 18, 2019 at 7:33 PM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:

> We can't easily add comments like that to the bootstap.sh, but a README
> might work.  Only trouble is that you will need to modify
> bootstrap/template.py to also exclude that new file from the sha1sum
> calcuations.
>
> Getting a better gnutls34 or later package into EPEL without the
> conflicts would also be really helpful.

The published compat-gnutls34 and compat-nettle32 from have "devel"
packages that conflict with the default gnutls and nettle packages.
There are probably more graceful ways around them, but they'd need
some hooks in the samba building tools to *find* and use the
alternative locations.

Is there any chance that the alternative, mit-krb5 based Kerberos
setups are good enough to use for samba-4.11? Fedora has been enabling
them in rawhide, but I don't know if all the older components in RHEL
7 or now RHEL 8 are recent and play nicely, and I for one have not had
the spare stable build environment to test it out lately.

> Sorry this didn't go as well as I had hoped and hopefully smoother
> sailing with CentOS8 is on the way soon.
>
> Andrew Bartlett
>
> --
> Andrew Bartlett
> https://samba.org/~abartlet/
> Authentication Developer, Samba Team         https://samba.org
> Samba Development and Support, Catalyst IT
> https://catalyst.net.nz/services/samba
>
>
>
>
>

