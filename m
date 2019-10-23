Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 13536E1257
	for <lists+samba-technical@lfdr.de>; Wed, 23 Oct 2019 08:43:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jPegUdJN7yXEfQ500kQLEq8NUBHs9FawWWxs1z72qPs=; b=a77YKhpgf1iakOjELawml+LX06
	4KQ4LwfXiX/pO/fFtuX4kRDcOVw3GSo56ykrFl0BEblDdg2aS47rsYUwQ6s0IqtnU73rvgm4lDM0T
	zkgOYwzdPO7U3X9fWJ/iHNU7fVjVCbUleV9LmClnIuhP3V3Qyvw+QI9czNzbuXVHLKHhqgavfVDv8
	tJsSEpnkhFnbnMxbHGIhV6jrkT1ZGl6+90HJgh+B/bYho3Ze9rEt0SWvXr3NCR3CmHzhhl/uFAZxU
	pC+9WilOCFql9pMMlkYyktqJNNwe7e1yXx9vypIUiYHBbtT6sazV08TAL0+endB6ybRW+wJGujHHz
	V5rIKQBg==;
Received: from localhost ([::1]:31044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iNAMB-001alN-SW; Wed, 23 Oct 2019 06:42:56 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:37625) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNALy-001alG-Tg
 for samba-technical@lists.samba.org; Wed, 23 Oct 2019 06:42:46 +0000
Received: by mail-vk1-xa32.google.com with SMTP id v78so4185888vke.4
 for <samba-technical@lists.samba.org>; Tue, 22 Oct 2019 23:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jPegUdJN7yXEfQ500kQLEq8NUBHs9FawWWxs1z72qPs=;
 b=WSeV+zb7cEMNFk2E1sLSz/yFFnUbNy+qNhLbrcuvaVfXZrRIXhv/gY2LzntZSuWj4U
 9QpADPrw0kAxarn6ByvQzcjnQpYQFX+qycnFYjaiw1FCcldRFP454E1xY48Mj1wCoFKb
 5r1BVwm1RzAn17c5j5zIK/A2foQqrvyKjbcnIyqE5SPFrYVXKpqs9JjMyqbwBw6D0mGi
 21s+DcZ9v1aUlucl1k8pHr/U9hCCZRM8DgdU2NRuLZygjE40oKG8Zq4yLLuMOm1G0FXo
 q+iMGWn5oD2n6bCD8O/JZRQA/m6urne8osmANy4KPxNfbmIikmccv+W3Vq9ehpMcjIrA
 vefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jPegUdJN7yXEfQ500kQLEq8NUBHs9FawWWxs1z72qPs=;
 b=PD4XP20WsIhqZqa+4ntHqCbV39WsY0sMw/rQZdu2KVrw5XrCkc3bjk5QUl/7+AdET+
 ZogGtZPI5mj1BLc9AfBPYfHzNKtvdKyCyC+FOu9pQ6Kw0B707fQt0nHvaxOb5veHIHZB
 dHe59MB31n3xGVy7YaO9ErRr4/UfWUQnISYIQF8yvoP1KueJPVfbGEzg4COOMx+fzKN8
 z9JKWRQMgVB6/5P4Mzq6aImoOJ+SvfaU489DemsLBdD85mm5tHpvJZ1bFdgA9pLcAUPq
 j8BRCmnJY19QA/1jlLk0HJNDsAsi7NPBPZdFJfcJK0HWvUQ5Iv3f1LG4LPcNc82mXkrj
 xHMw==
X-Gm-Message-State: APjAAAVaHnyLTQ060tmBBF4stEgTqKWtP6zfhHx58CLs5iOm/BIEdVke
 7WK30lcfUc1XsotJ6EYPNvxma2Q0d8dcahBZLF4=
X-Google-Smtp-Source: APXvYqw1ymMnRkXOY6Lb4Zbe4GvM1Ov6hCr8BX7OZqg9wIFZgxqVN4lMfjYBOLOgnRMYuDRGW4yHwzl2mu/vGqr4lBk=
X-Received: by 2002:a05:6122:30f:: with SMTP id
 c15mr4178481vko.41.1571812960854; 
 Tue, 22 Oct 2019 23:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <3ee51a4a-c102-df01-8e52-cf8ea702194f@samba.org>
 <3255b7bf-d793-66f9-10de-c52f0c07ad28@tranquil.it>
 <CAOCN9rwt2UN1EYN586zEjtPTWVHz7TKoc_xNgcpcz7d1ivvBfQ@mail.gmail.com>
 <1862579.bBNgSl7iVu@magrathea>
 <CAOCN9rx-gSq1UphhyN_MFh2fbA7+hj0bgGYTwr5MUKUSOvbURA@mail.gmail.com>
In-Reply-To: <CAOCN9rx-gSq1UphhyN_MFh2fbA7+hj0bgGYTwr5MUKUSOvbURA@mail.gmail.com>
Date: Wed, 23 Oct 2019 02:42:28 -0400
Message-ID: <CAOCN9rw2Bww+WsOPqi8FG5VG4shRk=6MoCWv2c6GM3EwOz0beg@mail.gmail.com>
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

On Wed, Oct 23, 2019 at 2:34 AM Nico Kadel-Garcia <nkadel@gmail.com> wrote:
>
> On Wed, Oct 23, 2019 at 1:51 AM Andreas Schneider <asn@samba.org> wrote:
> >
> > On Wednesday, 23 October 2019 01:53:58 CEST Nico Kadel-Garcia via samba=
-
> > technical wrote:
> > > On Tue, Oct 22, 2019 at 2:14 PM Denis Cardon via samba-technical
> > >
> > > <samba-technical@lists.samba.org> wrote:
> > > > Hi Dario,
> > > >
> > > > Le 10/22/2019 =C3=A0 12:17 PM, Dario Lesca via samba-technical a =
=C3=A9crit :
> > > > > Il giorno sab, 19/10/2019 alle 12.22 -0400, Nico Kadel-Garcia via
> > > > >
> > > > > samba-technical ha scritto:
> > > > >> Cool! I just managed to get 4.11.1 into my published CentOS 7, 8=
,
> > > > >> andFedora setup at https://github.com/nkadel/samba4repo. This se=
tup
> > > > >> usesHeimdal Kerberos, which eased the gnutls requirements and ma=
de
> > > > >> CentOS7 easier.
> > > > >
> > > > > Thanks Nico
> > > > > How can use your great work?
> > > > > I must rebuild all on my system (Centos8) or I can use a binary r=
epo?
> > > >
> > > > I just published RPMS and SRPMS at
> > > > https://samba.tranquil.it/centos7/samba-4.11.1/
> > > > https://samba.tranquil.it/centos7/samba-4.11.1-srcrpm (note : fresh=
ly
> > > > baked from the oven, not yet thoroughly tested). You may try to reb=
uild
> > > > the srcrpm on CentOS8. I've not yet had time to look at that new Ce=
ntOS
> > > > release.
> > >
> > > RHEl 8 does not include "quota-devel" and some dependencies such as
> > > "libtommath", unless you build them from a setup like, say, mine over
> > > at github. You are certainly welcome to any useful parts of that.
> >
> > RHEL8 **does** include quota-devel, CentOS8 *doesn't*.
> >
> >
> > https://bugs.centos.org/view.php?id=3D16549
>
> No, Red Hat does not publish the package in any of their channels. I
> just checked on my licensed RHEL 8 box, the one I use to run
> "reposync" on to build up a full local RHEL 8 mirror for
> "mock" compilatoin of Samba before CentOS 8 was published. This is why
> my public tools to build Samba 4.11 have a local setup, based on the
> published SRPM, to build the quota packages as needed on CentOS or
> RHEL 8.

Looking at that, it came off a bit... sharp. It's not you, it's that
Red Hat has elected to do this for a number of different devel
packages I've tried to compile with, and the excuses for publishing
only the SRPM and binary packaes have been.... well, let's say it
raises questions about renewing my licenses.

