Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 009FCE1230
	for <lists+samba-technical@lfdr.de>; Wed, 23 Oct 2019 08:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6J1RLMbvyjbjhPdbNWDYPWDpY6644mu55BggnYLpFyM=; b=kyFW8dhLy0fu9U+yGzXBw7q8uY
	up8w5twZFKD7m11DOL3Hqxa5lUzIT1igV329fjTqawgLrNZgbp9nvb6LsWPXkLEdKwDUrmBXMJFUE
	0SNwi3SjPHM4vsY/TA2uPPDhJIuhc+lLSQlRZF8SjnSp32+T5US1aI6v5BCRiQOi9IGMvRXk4ZTT3
	d4CVUNs6HqsXTwcw+fZqCXsR1dzsrUi+ydZm7eebVrdTqMwmbiO9owQ3uajAzlaTsUy1l322eXroN
	3ZWfctbNuiW0s1WrqBrnHXS24/1vo/XELcDKAlnrpavSHgokRU7D+hJVmf6gLCIaaSQMev02f77V1
	KXE9+tNA==;
Received: from localhost ([::1]:30266 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iNAE2-001ady-Kq; Wed, 23 Oct 2019 06:34:30 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e]:43141) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNADp-001adr-QV
 for samba-technical@lists.samba.org; Wed, 23 Oct 2019 06:34:21 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id i21so2134927vka.10
 for <samba-technical@lists.samba.org>; Tue, 22 Oct 2019 23:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6J1RLMbvyjbjhPdbNWDYPWDpY6644mu55BggnYLpFyM=;
 b=b6wnYjaQYzxm2i5epMX+/y51rQekdUEsyX8QHmsx4qG43jhO38s0gKGygBywSJjt1T
 yp0xzWrr0bZ6xx+4XIH2cTxVzgNcVXcwacRuZG+1IpYAhAA7TAZAaSEIIstpjbeqdTFB
 tQhen3M3qlr7hx5IUKJb9MCuGF4yKb8yst8z9h6wFVc1aMUoH3X+V43Cz6U6ATKbF/0T
 HnexCkGTHAgkZV10F10sQ/Kr62Um4jbZlHsOrlwk/vFKZMfn+AcvrypE7l6GUMz/NnbQ
 jmAEQ/Cww+xLrwlM1e8h/3PDEOgSTL6I+LayQsuFfx8q9CXbqVz2VfSUCpgdLqf+lYpa
 hGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6J1RLMbvyjbjhPdbNWDYPWDpY6644mu55BggnYLpFyM=;
 b=L0K8OFU0WJFTS18+rTfL9+m2ibJee33rbTFDFTDLbu9D1vmGRyjssqaCehxqmGQqy2
 MJuSK1mtRyr+tmpO/djI4wIHWeUGOForjk5rCo5TpKAkNvr2CFUcLPQG9SLVuxWQTb8f
 qSOBDBBtqtKVERGZr+Lgup9YPKp09IsHU+AgcOTXkS5m6rxAZ9oUhKHAJCyHAuVUVfgb
 uM89wrfLXPy1DTH4wp0cyDxwCmLRBZXL9r27kftS+vVedLY3dRdSOem/bqplHroijPLA
 jzPIy9bMiPi/HpGyAvU3lF2hOOe6PVNI+C+PzgZx57AvP0bn57gNAu/M5k2kSg2N2mcu
 ytBA==
X-Gm-Message-State: APjAAAVsVcowf9qIXT19BD6SlQF/AaxmzWw1vypP6f7BsFN3AchxFbdT
 4UBYk1Sri/NTZVKcGMtLQmJEEmoRpf1SUNRRCHY=
X-Google-Smtp-Source: APXvYqwjExT1sCF6lGjnCxguPjCTpqsx+NE1T6hHsLUIOptryIOZW9oTdlfd7SE6Q4RG+0Iq99VET9gkZjdnZlHVf24=
X-Received: by 2002:ac5:cdb8:: with SMTP id l24mr4316531vka.96.1571812455649; 
 Tue, 22 Oct 2019 23:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <3ee51a4a-c102-df01-8e52-cf8ea702194f@samba.org>
 <3255b7bf-d793-66f9-10de-c52f0c07ad28@tranquil.it>
 <CAOCN9rwt2UN1EYN586zEjtPTWVHz7TKoc_xNgcpcz7d1ivvBfQ@mail.gmail.com>
 <1862579.bBNgSl7iVu@magrathea>
In-Reply-To: <1862579.bBNgSl7iVu@magrathea>
Date: Wed, 23 Oct 2019 02:34:02 -0400
Message-ID: <CAOCN9rx-gSq1UphhyN_MFh2fbA7+hj0bgGYTwr5MUKUSOvbURA@mail.gmail.com>
Subject: Re: [Release Planning 4.11] Samba 4.11.2
To: Andreas Schneider <asn@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Denis Cardon <dcardon@tranquil.it>, Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Oct 23, 2019 at 1:51 AM Andreas Schneider <asn@samba.org> wrote:
>
> On Wednesday, 23 October 2019 01:53:58 CEST Nico Kadel-Garcia via samba-
> technical wrote:
> > On Tue, Oct 22, 2019 at 2:14 PM Denis Cardon via samba-technical
> >
> > <samba-technical@lists.samba.org> wrote:
> > > Hi Dario,
> > >
> > > Le 10/22/2019 =C3=A0 12:17 PM, Dario Lesca via samba-technical a =C3=
=A9crit :
> > > > Il giorno sab, 19/10/2019 alle 12.22 -0400, Nico Kadel-Garcia via
> > > >
> > > > samba-technical ha scritto:
> > > >> Cool! I just managed to get 4.11.1 into my published CentOS 7, 8,
> > > >> andFedora setup at https://github.com/nkadel/samba4repo. This setu=
p
> > > >> usesHeimdal Kerberos, which eased the gnutls requirements and made
> > > >> CentOS7 easier.
> > > >
> > > > Thanks Nico
> > > > How can use your great work?
> > > > I must rebuild all on my system (Centos8) or I can use a binary rep=
o?
> > >
> > > I just published RPMS and SRPMS at
> > > https://samba.tranquil.it/centos7/samba-4.11.1/
> > > https://samba.tranquil.it/centos7/samba-4.11.1-srcrpm (note : freshly
> > > baked from the oven, not yet thoroughly tested). You may try to rebui=
ld
> > > the srcrpm on CentOS8. I've not yet had time to look at that new Cent=
OS
> > > release.
> >
> > RHEl 8 does not include "quota-devel" and some dependencies such as
> > "libtommath", unless you build them from a setup like, say, mine over
> > at github. You are certainly welcome to any useful parts of that.
>
> RHEL8 **does** include quota-devel, CentOS8 *doesn't*.
>
>
> https://bugs.centos.org/view.php?id=3D16549

No, Red Hat does not publish the package in any of their channels. I
just checked on my licensed RHEL 8 box, the one I use to run
"reposync" on to build up a full local RHEL 8 mirror for
"mock" compilatoin of Samba before CentOS 8 was published. This is why
my public tools to build Samba 4.11 have a local setup, based on the
published SRPM, to build the quota packages as needed on CentOS or
RHEL 8.

