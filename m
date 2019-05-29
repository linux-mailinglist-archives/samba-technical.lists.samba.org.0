Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C94B32E84A
	for <lists+samba-technical@lfdr.de>; Thu, 30 May 2019 00:32:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Obi1vtZJGv7b3n8w1qVD9o4njKypD63hJCUy7G48TRc=; b=bsp1S2Dq16gMMwJLpTs3fpv16R
	OZORk7RNTRTs7oK51Ea2CwKcPALO0LQefhv/S2UqhXRtCmgWchOBIOUF8stfVA6DsNAlRUTkixiAa
	yJipOCjPbQiJW9cIHykgQ8hSAiWa0ugRgOltCxJ3GzYot+NcygQy3E3cANtSYqGvcoEgA3D59Id7j
	UsV+hdX0NYdbinUk/mZPxSX+4IL2rYbI0rQ5/TOxx8oloXB8j49ccRJEegfWeFL39MbPbUcTSj4AD
	e3TZs/LmYtg35/8d3CVvNh3NFMF+XR/qTnyb3Cr5n+g57F6lBA8uAjWrddTrZpnh7MLVfu5sqKsnE
	4xjh+0dw==;
Received: from localhost ([::1]:41070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hW77H-002WT1-11; Wed, 29 May 2019 22:32:15 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:42150) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hW77C-002WSu-86
 for samba-technical@lists.samba.org; Wed, 29 May 2019 22:32:12 +0000
Received: by mail-lj1-x241.google.com with SMTP id y15so901536ljd.9
 for <samba-technical@lists.samba.org>; Wed, 29 May 2019 15:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Obi1vtZJGv7b3n8w1qVD9o4njKypD63hJCUy7G48TRc=;
 b=a4CEdTw4BjUT0tNwpWepAPfwyRAej2nkXEM3HTPpmZ1ZfGHDrC6B0QxdPMxOCqp5AC
 uQle4azBb8Nu4VOBV+di4lSGiMwMYp+HY9Lu5KSK3c0g95twAoOKn4Qpkm3ThnCsC1JD
 SpCio8IMxZRUhP6yixRo79MQjcwT7GFEU8waNDv03BDy+FdAm4k7+IF3r/rq1oD89J/M
 j1K6zVBSD6tu1IB1vyZVQfkd9eUG/UvM3KY+PvotETFWzZ9ZXHbS1dsxGwRvYXYJl02l
 elaIRW+jrEekFujF766zBYift6aFp0WsRdsbvyv4j6t1waCfJ5obkL954wc5bcjx454Y
 dDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Obi1vtZJGv7b3n8w1qVD9o4njKypD63hJCUy7G48TRc=;
 b=JMefkAJukAOTcgxApJ/HxEQhuCOvoai14MnVC5P4dpFqWICmeQCIYtPnEbJYRkg3jt
 ceUm22/cPnZA208lA1oAOu8YIU5yCEV6oypP4Vvs1lYB7aVxwiPxbm3WbAufb3qckUbw
 A/Oesm5YyFiSdtVdX5Ezc+w+PUeLvwP3ndDO2d5FOXbZMr3NEsjYCS3F6ag0NrAFpjQo
 rleTgdbzgQ6QIZaMesVA8jRa0A4dJtNgdBuq8zyW3YLxiEsBkVw0H4dKJikYtp2Ovy6q
 ddnATsxmBtgFV1N3094Eh3HoPdl/Cousn3Pscu89aRUsG0X1wpIiHM1rC4EC7mlPwV39
 P3mg==
X-Gm-Message-State: APjAAAWtBQRGTFehIYljChSEopZCo1FS8Ji91a4xF/CBxG1t8Vfpl8sL
 8xaUC3kPlDEEVsVHqunHby5l2hsNJeIeMpvg1To=
X-Google-Smtp-Source: APXvYqzKoIxUsdFq9Ap6b5aSz9az/n9dqHmIvhMj3D4a8vM0eCUvj/+D8rdxOAv5XY+p+45nMlPLYB0Fd7i8s4WvFPY=
X-Received: by 2002:a2e:890c:: with SMTP id d12mr135488lji.107.1559169128448; 
 Wed, 29 May 2019 15:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8RUTx4Zvj3m_bc_tG7gMzbTy7iHyMLVnFur=6b83+pTtw@mail.gmail.com>
 <CAC-fF8SAdgU992P8tsKyGSLfi0iwcjH7vdWrw8ObqqrcZsdycA@mail.gmail.com>
 <2736033.mZseHfHTOk@krikkit>
 <CAC-fF8Qt3TH-1h0dGjGVWnROOoXMAoeL0GF6Z1dSizd0FWnkbQ@mail.gmail.com>
 <1559167973.29502.39.camel@samba.org>
In-Reply-To: <1559167973.29502.39.camel@samba.org>
Date: Thu, 30 May 2019 00:31:50 +0200
Message-ID: <CAC-fF8S=SMej5czuj6VY3yb7xjB_y7ULm5ebWT--JsVxu_2E2A@mail.gmail.com>
Subject: Re: [PATCH] pac-glue: fix delegation info blob
To: Andrew Bartlett <abartlet@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>, Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 30, 2019 at 12:12 AM Andrew Bartlett <abartlet@samba.org> wrote:
>
> On Thu, 2019-05-30 at 00:07 +0200, Isaac Boukris via samba-technical
> wrote:
> > On Wed, May 29, 2019 at 10:04 PM Andreas Schneider <asn@samba.org> wrote:
> > >
> > > On Wednesday, 29 May 2019 18:47:56 CEST Isaac Boukris via samba-technical
> > > wrote:
> > > > On Wed, May 29, 2019 at 6:03 PM Isaac Boukris <iboukris@gmail.com> wrote:
> > > > > Hi,
> > > > >
> > > > > Attached patch fixes the delegation-info blob to be the same as
> > > > > Windows KDC returns, by adding the realm to the correct principal.
> > > >
> > > > Metze points out that this bug is already logged as:
> > > > https://bugzilla.samba.org/show_bug.cgi?id=13133
> > > >
> > > > And thank you for all the other hints!
> > >
> > > Could you add the bug to the patch comment?
> > >
> > > BUG: https://bugzilla.samba.org/show_bug.cgi?id=13133
> >
> > I didn't mention, but the bug has already attached the same patch
> > essentially (without my terminology changes, but in second thought
> > those probably belong in a separate commit).
>
> Yes, but Andreas is asking for the opposite, that is our practice of
> adding BUG: ... to the commit message of every commit fixing or related
> to a bug, so we can track in the git tree which commits fix which bugs.

Sorry for being unclear, what I meant to say is that we can discard my
patch since Metze has already made a patch, attached to this bug (with
the bug number properly specified in the commit message).

Isaac

