Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F75810377
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2019 02:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=g/kQtJxRMkRMXvhJHH69UKy8M23E7KJFQvSGAUHZDO8=; b=NEzoYllRZyGWCfYm/bRRm/T69i
	BmPGP0OSIgm24ZA2QY2y7LG3QdhM0p2dOJUTVQj4QHS6l9WAkhX4x673amYpXWXqpQq2yJJyyJz11
	EA00r0qwuo/duSa0NPJh9tJwYESTsWGjuEzp3rnuhLN6ckNDwr3hLBC8kBOOXw7qF8FdiBAgVlRDD
	xQJxlGy6977IHBJRSYuESIllZBKblYuHDs7PHOTvUlzkeagt/cvzTR4ladvIgkFsXucSbmXZeX+gr
	uMQpYv1JOshe+4H1UwwGnY8gEE1sC9tN0gFO/2w7ju1AmqrwbJBhARVhF4LZ+9MNaHsOfB8J/k1Lk
	RsDHG3ZA==;
Received: from localhost ([::1]:35324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLd2U-001kLd-JS; Wed, 01 May 2019 00:23:58 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40578) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLd2P-001kLW-57
 for samba-technical@lists.samba.org; Wed, 01 May 2019 00:23:55 +0000
Received: by mail-ed1-x52e.google.com with SMTP id e56so7524580ede.7
 for <samba-technical@lists.samba.org>; Tue, 30 Apr 2019 17:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g/kQtJxRMkRMXvhJHH69UKy8M23E7KJFQvSGAUHZDO8=;
 b=VTCBLS7Grhfi18h5fkuQRIxFE6UCdKFKH388MJlE/YgiIn6zqONaOIk3eiile8QdT6
 +1WqZp00wqUxJERgw5ZIf3iZMWbQ8u8XtYl/oDDGfLhWuIQv1C1KuFv2EWp5HUlnKZPu
 RuPb0281sqBVbNB2PS1BBZF2096zBubphu7rBHPy7KdHIEVtaaOucGCOsbB8kkezoGpM
 vgzohc1gJGxR72imEOtlKheka2Zbqp6O5uxQ4W+HSS41q3Nj5x2DoVkva+b35OaMetis
 QE2yDJZBBBtvTXJYU8UONHnTvsqVpjWTa3qU/LYmlSOl3jx34brVBj8jmuBiUG+kzPVI
 WTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g/kQtJxRMkRMXvhJHH69UKy8M23E7KJFQvSGAUHZDO8=;
 b=AR7dntYIysuaA3qHN93pbcUjC+ZlHHHB66ln7gdfswIhoOIkW8xZcWD1LZE6+dkE6g
 GIoP+KXlTGak1f7AebBuw3Z1LoM5M2NFDGEjHzWDmFt5x8yvsPWAnnOei2mED6NRWb1R
 0k4/CxJwzExZQsYU0CzcgfBMLSLFFFIVghqvqADJz3iTr5jJSYtQI66Dw9b6qwPu97WH
 mI6cJleZPh41mySVyrirGXLbz4fl4wF5b6dYZ9rU+BRfnF5Iaqjte2AAiQM2kVpub7LT
 wgxBpP5hCVkj+u2mf9nyufqXSu9GqLXleKTRCnQzfp1T/PP6ERHC2oCtnRD+MdEX74Q+
 vmag==
X-Gm-Message-State: APjAAAU7qSNwWxnEbcX/PaW3+JSFzAFl9FqsQ4vo56a4bcT8w7eGCwDA
 1ixj1KQnN34hu5+iyk7W5L+JMle2TWBlOx813yU=
X-Google-Smtp-Source: APXvYqzomb5+AoMCfRYDxXH7YkrFqWKz6hUebc1Il6m1D/EfkFAK+a2gxzhMbsEm3bPH1SCQUrIGnxOkgIWxWsWKjIo=
X-Received: by 2002:aa7:c483:: with SMTP id m3mr10800124edq.161.1556670232607; 
 Tue, 30 Apr 2019 17:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190429193555.GA28948@samba.org>
 <1556611116.21278.7.camel@samba.org>
 <CAOCN9rwVF-E3x4jJytPadM2r=PTr0HFq9zjkBwK2uT3042qU+Q@mail.gmail.com>
 <2134250.fEHozF1qz7@magrathea.fritz.box>
In-Reply-To: <2134250.fEHozF1qz7@magrathea.fritz.box>
Date: Tue, 30 Apr 2019 20:23:36 -0400
Message-ID: <CAOCN9rzwO7XW=yf4kp+aNTz6zBKPK-Lfn+hJscPHc_ko63bn5Q@mail.gmail.com>
Subject: Re: getting centos7 into bootstrap and gitlab CI
To: Andreas Schneider <asn@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: =?UTF-8?Q?S=C3=A9rgio_Basto?= <sergio@serjux.com>,
 Christof Schmitt <cs@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Apr 30, 2019 at 9:25 AM Andreas Schneider <asn@samba.org> wrote:
>
> On Tuesday, April 30, 2019 2:12:57 PM CEST Nico Kadel-Garcia via samba-
> technical wrote:

> > I'm not sure how to merge the work into the existing bootstrap
> > procedure, since they'd also expect these other modules to be built
> > and available in the bootstrap and yum deployment. Do these bootstrap
> > environment ssupport the use of "mock" ? I've also just noted that
> > mock, on RHEL 7, does not support "file://$PWD" syntax for finding the
> > local repository that my setup drops generated RPM's in. Works great
> > on Fedora, not on RHEL 7 or CentOS 7. That means the build environment
> > needs a web-based access to the built repository, which I'm doing with
> > "nginx", on RHEL 7. That.... makes it more awkward for an individual
> > software builder to be access their local working repositories. It can
> > be done stably, but it needs to be really locked down for a safe build
> > environment.
>
> The issue is that we need at least python34-crypto, python34-dns and those are
> not available in EPEL7!
>
> I'm sure your packages still use python2 :-)

Please, please, please put monry on this!!! All the libraries I've
packaged as updated versions for RHEL 7, and include python2 and
python3 modules, using python36 from EPEL. Sama 4.10.2 itself is
configured to use use only python3, or specifcally
"python%{python3_pkgversion}" which is python36 on RHEL 7 with EPEL
enabled.

