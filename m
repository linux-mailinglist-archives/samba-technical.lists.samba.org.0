Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2F32D864E
	for <lists+samba-technical@lfdr.de>; Sat, 12 Dec 2020 12:55:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qFUOplNij2To91Y9pa0YT16EsaBAG2TyeCtZNaAe/oU=; b=zkLlF914RblvlqXigY38oesDhk
	rRAL2bhDrRoDDatKje2i3/GvTBlmKQLN+U6lnqxbuX+2WiW0c9oIUlq7m50K3NeISAfl9GxeIn2eW
	ROuce5p0V19I3VhojOuVvO8htlVjQIshI+gFe1m4t+BGXhPgZgWb+bVA8qoVh4boHtsNpH+Hrwksy
	9foWckjq4JMUM9uL0lXc9D2fJ+0GKLI0w+Kh2x/M2WnyqRXQo2n9NWf/lnugF2HmdXa9uu7e0pmlP
	JQLLuRqdlwEhQNH7eDeMIFOx1EpkujTMyNmayHg5y5le8Cer6Wmrlzes0mxLU342FO6yCEbpAyKnv
	G4xou5WA==;
Received: from ip6-localhost ([::1]:44766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ko3Tc-000jJw-Km; Sat, 12 Dec 2020 11:54:16 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:34983) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ko3TV-000jJp-VP
 for samba-technical@lists.samba.org; Sat, 12 Dec 2020 11:54:13 +0000
Received: by mail-ot1-x32b.google.com with SMTP id i6so10882758otr.2
 for <samba-technical@lists.samba.org>; Sat, 12 Dec 2020 03:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qFUOplNij2To91Y9pa0YT16EsaBAG2TyeCtZNaAe/oU=;
 b=V0luvhJO/osl5f5G8d88S/pQoCtuJIkAylqHFf7y6U5/tFR1mLmG7/c8HZ1NfXojt5
 +38jHNuHI9GrMBLcvYOMY+OpfIDqHuNiIbQ32OwN9HCz3toLZ28xLR+NJrvcjpfRjz2y
 cgD+WwnCb6q6Jachs57KK9QkTNTtWJnuKuYab9ctCKgu6tPf2RUQBo9YvrnooegAc8IP
 LgnOVr+8Yt4G4cbLyFvhKB9O/70rSOznPTsWH6ts7IW9r68LwX+I9BuLYVd4EYlojfHR
 79np4q7Sk85YAxAyld+T0sQGgfBh7GJfxjyKgPMsNFwTbwfS0wytSZ4G6KQ7GyIKroCx
 /muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qFUOplNij2To91Y9pa0YT16EsaBAG2TyeCtZNaAe/oU=;
 b=Q5IjN8D/gmbavcYq1E6gp6wIloOE/KjBHB04darI0XYMFwruJP4BYXDFG2kMnX9vf5
 iVKKzLCjgR/SymSPKDqnNgIDyCXdPTRppsUfHfaWXrD5QgBJKS6xvEgvP3ab2fvyJOCq
 2ioN9TpU40AduG6WjIsoxWz5mSfagh2JdMVkvtJxoaXDDJ2RF8jtl3D7OsPzrvwHDjYr
 yRLzOBBwBwkBRzTR4yZH5sQllACGi5UZBYftD2oLs2IRCfr5MFEvP4S5kBPI0LdUpDjj
 33kLocUvRxqPff60BvCADbwZhppR8TGWy4urXhMQkOMCTbme29hnVEZsC1SNSgom7g1O
 GAYw==
X-Gm-Message-State: AOAM5335jklnMI1o5YWefJ+nV5dyCzLBxcCCc49hUAoDUULgKAkT1QoL
 tv3kMuYVFQGpKQrpIpYBsTXM+Re7AE6+POavOFo=
X-Google-Smtp-Source: ABdhPJzb2FKRtKIphqSsQn/MVcQJE6ngcreGx2Dorf3/G4RuEfTjQNhGYHBKQI/Ebxjga8Da6JbynB3UOrs0scdDW78=
X-Received: by 2002:a9d:68d8:: with SMTP id i24mr10255069oto.31.1607774036938; 
 Sat, 12 Dec 2020 03:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20201208231746.3c15f5b0@martins.ozlabs.org>
 <20201208124406.GF5029@pinega.vda.li>
 <20201209003132.328ca229@martins.ozlabs.org>
 <df4952fb-87d9-6cc8-e55c-a08487ff34aa@samba.org>
 <20201210142744.398a7e75@martins.ozlabs.org>
 <380efeccd76b37a958da2a49656a5c1c959a0173.camel@samba.org>
In-Reply-To: <380efeccd76b37a958da2a49656a5c1c959a0173.camel@samba.org>
Date: Sat, 12 Dec 2020 06:53:45 -0500
Message-ID: <CAOCN9rwHZO4vc1xcis0AJ3iXr4HKxuJMeO59W5mTWFwX=vspZQ@mail.gmail.com>
Subject: Re: Samba testing on CentOS 8
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 11, 2020 at 3:46 PM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:

> I'm assuming that, in the space of a few years another CentOS
> replacement will grow up into this same space, rebuilding the SRPMS of
> a specific RHEL release, but in the meantime this is going to be
> awkward...

Heh. I remember Whitebox Linux, and am still active on the Scientific
Linux mailing lists. I don't see CERN taking up the mantle and
re-activating their Scientific Linux support.

> Of course I must say I greatly appreciate the efforts put in by Red Hat
> and Red Hat's staff to building this ecosystem to which we have enjoyed
> for so long.

Bring popcorn. I'll bring butter.

