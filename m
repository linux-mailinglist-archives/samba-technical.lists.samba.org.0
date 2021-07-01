Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE8B3B8CB2
	for <lists+samba-technical@lfdr.de>; Thu,  1 Jul 2021 05:40:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CBe1xWuu8bcKASw9p8IRNMBANi4CWwjNaiDKZvC9iQU=; b=hhD+OWbYgmRGCNQqQohQPg5oKY
	l/ienaL4//Ynd38G3K6GxDw2Av8m4gyxDckhvjDyILL1eILblamylD+aOQsTi14WBm9aVepe9bZti
	8f5Y12unXEOyfWYOUeRw+FL6OuQCZKEs6bU7okJsiqEtb+ygQadFv3LRM0v4PZiYDXgCB0LjuVva/
	BRKyEfbOKhnHIJAofu2nzBBXp/HwbquJZkb7UlK1/bgNtrMCP1GgQpoJhJ4/T9YBN3ip0KazIRFpl
	GtU4nQlN+HbYbdRxwjW8nb3TE3w2N1XaEOoYoIv3J/NF8iS5306idihKESG8I8ITEJtt8DMyqfUIX
	X4aCqnsg==;
Received: from ip6-localhost ([::1]:34430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lynYc-00BNi3-Ht; Thu, 01 Jul 2021 03:40:06 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36703) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lynYW-00BNht-Du
 for samba-technical@lists.samba.org; Thu, 01 Jul 2021 03:40:03 +0000
Received: by mail-ej1-x632.google.com with SMTP id nd37so7984339ejc.3
 for <samba-technical@lists.samba.org>; Wed, 30 Jun 2021 20:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=om8A0YMAiilLg6aUsM/uUranEOJ6Dt/bAv8KDaRdZys=;
 b=PCRXoL/DEAQqebDEr0YrSA8Is12GsKC6EA4GQT8uYcwa+nomHMGOq3Szy1ej5is7cE
 vSIbRk/5ZCe28q1pOnIUhDeAAnWWMC7xXnHPUkt2Nxd0enBaiE5wglRJA/aUj3VK7OAh
 bVzq+7CIb8rMeyY9goToqFtwO0bBst0+4ey5SZq0sfpeiUsKFjSTvMcoEDOkYZMqut5Z
 DzfF7CwabPJvPgj0o95Or0BjxU9+lFlQvhZQptt9KO6GzOFUdR2aG1oPYxgFHKBIFBQt
 SAYga3YV3Vt7qLvGrjI1Aad4xYi9COodrTNfCVqEWdhEJOscfyv0jb9HWvW6Sje6J4Ov
 OC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=om8A0YMAiilLg6aUsM/uUranEOJ6Dt/bAv8KDaRdZys=;
 b=r6sysvTz5GcTcp+JoLedgFlv0uAGWhZD+YPs+6a9zZJy6FIvhRYencc5R6nFkLi0nx
 kn6o2nnezaddc7rCV3wSrb1N9GVK86B5CNP9pW702rleOP7fVefykx8QWzngs87mfnOR
 HEfXLhGFfHXwbYysGCTdSxlCh5XEjQhDTiPqMzYxtHsbSebF1JHymsvbztptRiqUMrpA
 3SLjbLUTTHReDq2tAf9XnefowziWs/+ICCvTc7Sz1/DWxse8r8uE5z6lVo1ZQOoQ2QS4
 oJGYjTxzdVrr7sNS8Dqppe+9pVLFV54CdhqGdenLMe8C/FHGaYgstyWt2+i16ljUT9oi
 UceQ==
X-Gm-Message-State: AOAM5303hF95EkwlUvH/1qvJG6umaNnsjkw/Rgq1hQKFwvkC3fnt9Akv
 Lq0sb22t0z3fF6VqIon7Pc1U43zdrlHfA/U+u21ZtA==
X-Google-Smtp-Source: ABdhPJwfWt/44sDtmx8rlWvwehkZoRytFFfl7AGzdkBpcY75zBv5ysVzwq4uhBqGlyV4+ZhNLm9EcUAwWEzxzVcaLgE=
X-Received: by 2002:a17:906:6d97:: with SMTP id
 h23mr38233073ejt.467.1625110797396; 
 Wed, 30 Jun 2021 20:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <e95c3ab28e222f9e5edc8eb6993cd34fd862a3ff.camel@samba.org>
 <CAN05THQbpJQbeRrt-rAF6K0tpnqRi9rRrg8xRxA34d=_Sy9EKQ@mail.gmail.com>
In-Reply-To: <CAN05THQbpJQbeRrt-rAF6K0tpnqRi9rRrg8xRxA34d=_Sy9EKQ@mail.gmail.com>
Date: Wed, 30 Jun 2021 23:39:46 -0400
Message-ID: <CAB5c7xrm79T2A_bL2DNx+irnv1s95PNhVrf1ZPrmsH21nHkFHg@mail.gmail.com>
Subject: Re: Given PrintNightmare,
 should spoolss go the way of SMB1: off by default?
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 30, 2021 at 10:06 PM ronnie sahlberg via samba-technical <
samba-technical@lists.samba.org> wrote:

> On Thu, Jul 1, 2021 at 11:58 AM Andrew Bartlett via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > G'Day all,
> >
> > It seems the current keep-the-sysadmin-up-at-night is a thing called
> > PrintNightmare (CVE-2021-1675):
> >
> >
> https://therecord.media/poc-released-for-dangerous-windows-printnightmare-bug/
> >
> > Hopefully this doesn't read on Samba, nobody really knows the details
> > right now, and if you find out please mail the Samba security alias
> > with the details of how and we will deal with that confidentially.
> >
> > But the public question I have is this:  For Samba 4.15, can we set
> > 'disable spoolss = true' by default please?
> >
> > I love printing just as much as any other team member (joke!), but we
> > have a lot of juicy code in printing that many use cases don't need.
> >
> > When the next printing exploit comes our way, it would be nice if like
> > SMB1, many of our installs have it turned off already.
> >
> > What do folks think?
>
> +1
>
> I don't work on that codebase so take my input for what it is or ignore it.
> Do people still need/use smb/dcerpc based printers in 2021?
>
> Since it is a huge codebase, that runs as root, where I assume there
> is no one actively working on,
> and where for end-users there are much better solutions in the last 20
> years anyway;
>
> I suggest : disabling it by default sounds like the right thing to do.
> And maybe deleting it at a later stage.
>
> regards
> ronnie sahlberg
>
> >
> > Andrew Bartlett
> > --
> > Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> > Samba Team Member (since 2001) https://samba.org
> > Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
> >
> > Samba Development and Support, Catalyst IT - Expert Open Source
> > Solutions
> >
> >
>
> We've had it disabled in FreeNAS for ages. I think it's an easy / quick
win to reduce default exposed attack surface.
