Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D69F131BBBD
	for <lists+samba-technical@lfdr.de>; Mon, 15 Feb 2021 16:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=j333CBCAbbGJaJhjwFypDxfEj1ex0h7RGZ4P/p4Ip3w=; b=5MT5OB6bdkkETaa+svQilqEN+W
	yrx67/9P6ixx9cAHKLR17JzMGsOjWAOwYqbNNXfjHYq2eNs9SIOnuDm2/2Cdj9VWKxBSLhpX1gFZc
	ogz+6aDic2krTDRppM1TugRmhCSkEY3FjuW1hwqB2yOT19hHyQWRSe8QIgBTY3vct8L16bo3WunrT
	Qs0S9KDR8LgZfuIdZ7jlKNir7xkmhpoBIgmS8Yt4XXLEVyz5rszFPqYu+S9O5AUo+LNHIcealGn+I
	kR0sXnv/Jd6lNVIWM6B5UQ0S4bKZqpL5xf4DHu+NJrrSJnk9yYzRsqLT0r1ZmglA36+Myi6vDxB6s
	5FOFFoTw==;
Received: from ip6-localhost ([::1]:62688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lBfMv-00CglQ-4J; Mon, 15 Feb 2021 15:00:57 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:42450) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lBfMo-00CglJ-FA
 for samba-technical@lists.samba.org; Mon, 15 Feb 2021 15:00:52 +0000
Received: by mail-lf1-x129.google.com with SMTP id z11so10624953lfb.9
 for <samba-technical@lists.samba.org>; Mon, 15 Feb 2021 07:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7+L3At+H/HulGgtPFmrYC0tKlcW09IMrfW/z9ev5DXI=;
 b=RYy/RCUXtJCm5zhYXITuKtJOaWsBVxYHRfb4FQCjqEu9S/SYP3CWHknTwCc6h/0HDp
 ldxHyUldneYIYkbwpugcLgPKkj9Pmn0ShkG1aqQLAOEwtdccA3gIJ3G6m3bpa9kgu/z+
 +qugzOJu7/iI+y8jgAM4prJ0VtNsKUlww+66qbwMAYQMZYbs4etPiD5ql6Ezw2tcSFFW
 2H1OqyPcsW0BdahfxisYo5FL8klybi8alYcndagVn4vefbXk65pMm0O6/KzMN3FO8sdd
 hX+oazkqd56zx3aXUIxdiMAUkTxVCtENmx42Wdc0sn4RhRyJLkWW/Kn1LntKrVRLAKd1
 801Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7+L3At+H/HulGgtPFmrYC0tKlcW09IMrfW/z9ev5DXI=;
 b=Ceof2BaP5TY19O0Zhfto2eBE8vrAy6iaGpOP1IGoK4Yzqd8wOnciVJgf9fEmPtjXJS
 DxqwXgK3M4Ot0McoI/Bp4UFzW9WJbatrqe2TmdV8Jv81vKQVYIQCsfR5Iz2b9t9YIfjy
 h7tjm4gEiJDdRgTbi0cAusnZC4Iv5x8AKPJMC2gCk27zmifxAfTJChYvC5ffPhC4FA/t
 +vFcU8MWnEcWgM/XZzLCTMGQPzAsAZG/caSQ4Ho4AOrICIEI0xdbYYB9K/0doNjk1Zd0
 0EFyKYGXAnHzuBAK2/etoBykmNcEmjK9YBr7g4YPOh77Uil9HSdj7kBjmietTWioWML5
 /voQ==
X-Gm-Message-State: AOAM532a4RnMVAcMOcTx6HZ59iK+noHwry2NVtsOOye17+5dCjTy7Ku7
 7I1jNUwxMbTaQ65DR83hz7SMPCRJivD3fOH+Cac=
X-Google-Smtp-Source: ABdhPJywLxyljUPgZon1vkQtmZuJSOvFeF966RMCMqIPmqA8BbfjSwIsLefz7YXMGcUsbhaMeKD2/9nNoJRJdgI2EVQ=
X-Received: by 2002:a19:6a17:: with SMTP id u23mr8465605lfu.21.1613401249182; 
 Mon, 15 Feb 2021 07:00:49 -0800 (PST)
MIME-Version: 1.0
References: <CAKHbFk1n9tsr9hwBqLtXQid=zm6BOYbeeNhdcRMdK6pFQFNg-A@mail.gmail.com>
 <ad0f018d814db7f60a4fc3c42431c9cde96c9bd4.camel@samba.org>
 <35d275a0-4df3-8c4f-0a74-2fc6a5c7cdc8@tranquil.it>
In-Reply-To: <35d275a0-4df3-8c4f-0a74-2fc6a5c7cdc8@tranquil.it>
Date: Mon, 15 Feb 2021 10:01:12 -0500
Message-ID: <CAKHbFk1hRXvFcLCe6rXbWaL9sVpd_D6xgJ5KRnZfVKFBVYGqBg@mail.gmail.com>
Subject: Re: Certificate services
To: Denis CARDON <dcardon@tranquil.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Thomas Epperson via samba-technical <samba-technical@lists.samba.org>
Reply-To: Thomas Epperson <thomas.epperson@gmail.com>
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Is this something I need to implement with code changes to samba or can I
implement this using an existing configuration (and another process to
implement the certificate services)? (Perhaps server services in smb.conf?)

Thomas

On Tue, Feb 9, 2021 at 3:46 AM Denis CARDON <dcardon@tranquil.it> wrote:

> Hi Andrew and Thomas,
>
> Le 09/02/2021 =C3=A0 09:26, Andrew Bartlett via samba-technical a =C3=A9c=
rit :
> > On Fri, 2021-02-05 at 23:03 -0500, Thomas Epperson via samba-technical
> > wrote:
> >> Hello,
> >>
> >> Have there been any efforts or are there any technical boundaries to
> >> implementing the certificate services in samba (as would be used with
> >> active directory) ? I am looking to implement it and thought adding
> >> it to
> >> samba would make sense.
> >
> > I've not looked into it but are you thinking in terms of what would
> > allow a member server to self-issue a certificate in its own name etc?
>
> I have a client who had to setup an ADCS (AD Certificate Service) for
> VMWare Horizon. It has been set up on a member server joined to a
> Samba-AD domain and it does work properly (at least for that use case)
> for auto enrollment.
>
> They have a separate CA for the other stuff (user certificates, https
> server certificates, etc.), so I cannot say for every use cases.
>
> Cheers,
>
> Denis
>
> > A CA manager is a complex beast (once CRLs or OCSP etc start happening)
> > so I wonder if we should bridge any interfaces we need to supply to an
> > existing project.
> >
> > But beyond that have a go I suppose!  I've not heard of any other
> > efforts that are Samba-integrated.
> >
> > Andrew,
> >
>


--=20
Thomas Epperson
Build a man a fire, and he'll be warm for a day. Set a man on fire, and
he'll be warm for the rest of his life. - Terry Pratchett.
