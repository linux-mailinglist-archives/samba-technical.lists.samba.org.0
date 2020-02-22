Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27016917A
	for <lists+samba-technical@lfdr.de>; Sat, 22 Feb 2020 20:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Lz1YjtcioOW4m4t6KB3py6mfoASqwxJwGV8yYcBn/SQ=; b=YLdyLblGvp8fqspdC3auOnLTLp
	aFU4RQdYLuTrFUi1axHH8zth3oQCkjiS+yHo7OCFqXYcBkfib3WMift1nFqzhWfGmqm98BDpZ5iHp
	vZP8FPM/Kf+LuIWgPnX+9e7oJvVTKkjCfaXiLYwWHm6/rSCJHQaEtZC7n/OnDW+g5Y/Su54ez5iG1
	O4JDvEoDI/C32KhzWu9j1oRR6yqdimzjdc+I+ULAvUnyj0pOSIyWM5GmAnJCrlTiDJuiQD/6tE2Hn
	OIIGx2rsiNd1//ttlGvv7l4R/L4pW/FOMv9E/pKXN6wGtfFWfPyjPNhloBENpDkWhY3dl8ndLetDe
	owYlV73Q==;
Received: from localhost ([::1]:63058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5aAP-00B6IC-OB; Sat, 22 Feb 2020 19:10:21 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:44575) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5aAF-00B6I5-Bo
 for samba-technical@lists.samba.org; Sat, 22 Feb 2020 19:10:15 +0000
Received: by mail-lf1-x141.google.com with SMTP id 7so3908617lfz.11
 for <samba-technical@lists.samba.org>; Sat, 22 Feb 2020 11:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lz1YjtcioOW4m4t6KB3py6mfoASqwxJwGV8yYcBn/SQ=;
 b=udI1HSJi3BdJdYXY9FKwWoVnE38EZ3jYGELHZKwFBFbqJJhqx0o2c8dRUXjxIrqIEy
 Jz8V/+/qAqutJC1Ven0+rckIr4IzdvB0Ad8tTTSsgGNJ5Czy86IdWKgcWpCHP+ITnRAE
 /3xIq5sXfndjUAfgBvvOPbaOJjpYvgXHqdUHgfvzhVP5q6cjWUqqOJ2BK9PTvxe5NqZb
 thNZB8A++24X6blhvM4rO1bDeDr01amwPYO4qxZR0iPfwVwffAjghsWtJvYc3Zg/4CoT
 suHobDjPVwmDzGxBSypuEHKnJdUtX34gjARtREtb+5fGecza5JjxA3OmVZvR1WH3oNww
 23xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lz1YjtcioOW4m4t6KB3py6mfoASqwxJwGV8yYcBn/SQ=;
 b=QkK9s5BfniU163x9lGLbiCHkoWOtaLTKHL3R1rFW5uk9JP5Yd2Ab/dl9ODurEY51vT
 wQQE8ST65fmZCcm+wrjVfKVDwykjSTF5uh5DrU3dd+tCD2Q6wiNSeaiksmcJPnjE0jzk
 V4b3cFqanif62OhR00Fw3lDUsaJlxXn1uVzAqdjZ9lURm0i2QDTfOhmIrm0hlNmO8KQX
 B2Dks+PEKLXEfvfVupkF+O0TTIzY3KwuMlNKaNyi/QDI/4MH46ro1aoa8Z44jBx4jwuI
 3YMu5hX48UU3NZ9p7UAeWFBdBFacMwNFz/rxVAyLrKQ9NrYVehbU1rNu2wxaPiYBE2Ls
 9Hpw==
X-Gm-Message-State: APjAAAUfy2P1Te2QX9xLDmQ2lktB1Lj3+5IKhXkAtoxv6xUeNOvnnmyY
 X/3FRzbQ9SMbpXBf6zA1gcDABkISMg1n5eJM5/o=
X-Google-Smtp-Source: APXvYqxZKNfHQLgdASPJ+qihzDX5XpsNjGt7MKfJQspHW98qcQ67l9/QSpfK4qS1ItPvp/6WQfD2m4LoWaVrkrnTQ24=
X-Received: by 2002:a05:6512:687:: with SMTP id
 t7mr23817495lfe.30.1582398608648; 
 Sat, 22 Feb 2020 11:10:08 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
In-Reply-To: <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
Date: Sat, 22 Feb 2020 20:09:57 +0100
Message-ID: <CAC-fF8T6dGjDbH3YFpZpEA+Rtoppj+sJ4bZtt9ZDMfH85_UuUg@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Stefan Metzmacher <metze@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Simo Sorce <simo@redhat.com>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Feb 18, 2020 at 5:48 PM Stefan Metzmacher <metze@samba.org> wrote:
>
> Am 18.02.20 um 17:06 schrieb Isaac Boukris:
> >
> > Has anyone looked into channel-binding or has any idea what is needed
> > to implement in samba (or upstream) for this to work?
> > Is there other ldap client code in samba that would also be impacted?
>
> Yes.
>
> > BTW, I noticed windows clients use both singing and sealing, should we
> > consider changing the defaults of "client ldap sasl wrapping" to seal?
>
> I looked at it a bit, see
> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=ac8fd11f1d4b9deb48d6c7942af0c83b52d69d7f
>
> I think we need input from dochelp to answer 2 questions:
> 1. which kind of channel bindings are expected/used by windows?
>    I assume tls-server-end-point. I guess MS-ADTS would be the place
>    to define these details for ldaps.

I noticed more another reference to channel-bindings in MS-KILE, I
think maybe KERB_AP_OPTIONS_CBT ad element is the way to tell the
server to require CB when LdapEnforceChannelBinding is set to 1 only,
needs testing.

3.2.5.8 AP Exchange
If ChannelBinding is set to TRUE, the client sends
AD-AUTH-DATA-AP-OPTIONS data in an AD-IF-
RELEVANT element ([RFC4120] section 5.2.6.1). The Authorization Data
Type AD-AUTH-DATA-AP-
OPTIONS has an ad-type of 143 and ad-data of KERB_AP_OPTIONS_CBT
(0x4000). The presence of
this element indicates that the client expects the applications
running on it to include channel binding
information ([RFC2743] section 1.1.6 and [RFC2744]) in AP requests
whenever Kerberos
authentication takes place over an "outer channel" such as TLS.
Channel binding is provided using the
ChannelBinding variable specified in section 3.2.1.

3.4.5
If the ApplicationRequiresCBT parameter (section 3.4.1) is set to
TRUE, the server, if so configured,
SHOULD<67> return GSS_S_BAD_BINDINGS whenever the AP exchange request
message contains
an all-zero channel binding value and does not contain the
AD-IF-RELEVANT element ([RFC4120]
section 5.2.6.1) KERB_AP_OPTIONS_CBT.

