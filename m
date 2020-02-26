Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB98B1703C1
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 17:05:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=AcOEheokivUrhjFbDO4NeTtSNcuOHn/llEuXuvVBQ0o=; b=jRHXMtrO1KfOQW3lSd7PpR0iTL
	9VxmY5G9UjjsUp2LrAYFXu8Lw99XnPn71AvTm93c6GnPIAHjGnVhIxV3GyUs7ybC931N3GjWMeAkU
	Lk4r+32uJXLNM/EKapb094JTw4+g5z8prvtKtIJDBjGEPR1mGFZsYgQX71zbXktBQ0FTE6mKSCGLr
	jrl4pXzg3Q4Wk3ro0y6Si6W49nRKOqyfT5yjXlC3LqKrd5qDgaIWtc5Mz3Sj7D0iGeli8ME17fR4W
	aFc8guR8DGoM1ez/1UR/KmPOmlf0BeSb2ezVx8VZuLUmaGC7WW3e3suxiol55pn88K31vTg0Ds5Nu
	vafFVG/A==;
Received: from localhost ([::1]:18876 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6zBD-00BpDs-5K; Wed, 26 Feb 2020 16:04:59 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:43315) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6zB8-00BpDl-Bu
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 16:04:56 +0000
Received: by mail-lj1-x22c.google.com with SMTP id e3so2638269lja.10
 for <samba-technical@lists.samba.org>; Wed, 26 Feb 2020 08:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AcOEheokivUrhjFbDO4NeTtSNcuOHn/llEuXuvVBQ0o=;
 b=CPuGtyUvLzEzot/tpeBNjz/zYhik/T8jhEKFfF3kta0Brm53p5x7q4rifBO0hPOcCy
 QEy4bZLBSYH9/teEqPnaJdBF2Tyjorx3x48GtAWtwT/etZ05FMeFZOHJ6c5EliNgehqG
 r7uLgcPv/FpTECvPExQm59YaxWCBIFgbGZiY9oeN9wx5VuRmyWg6s5z6IAOanWAu4Xxb
 RzJaOESu5MZtA5s3IVEs7CxmkrzrOO8o0F4pykP2T5W1RsxhxoYHpvqT2cQvw+1R/Tl9
 kBmcHmaA31T999a/GntBmz9KU/oGTu4lvSro6z+sSX7OprdcYGnMxuSuFYjacvRIacDh
 zhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AcOEheokivUrhjFbDO4NeTtSNcuOHn/llEuXuvVBQ0o=;
 b=bS8UzP0F2FLeJ2XokrRvVBihG/oAGVs0bL9vp8LnyKLzqx74soyyC8nab/XeWeFSze
 yMNODDoEgqar3TkSY2s/dAo33kf3/S9SGih1WpVcHyGdEIdhDXw6rMcd9iqAb9JN9kIj
 7Xx2GA1aEw5JhGhQVMOLNFMhrzHs8y8f0zF0JFgh4RKTJg5/U71Gw+RufU+xAy5X1Up8
 i4rr9aZzLZ4Uxw+/UcY9HcuoYyacMiJiHpimoW5bMHls9KmJp/zOF4L8wHmRQXp+jk/s
 44KuEfg+iBwVUu5M7DWCgcrVLAXXsp+D8SMsCkSgFYEdPfmPR7UdHE/OSdQtzZ2453j0
 GMUg==
X-Gm-Message-State: ANhLgQ22c6vsy2FxAeAA3Tyy0MLxxDByhO2B/0oYGDuez8A0eaaGOwO2
 E5O+tP3NhMgzOMv7ahFxnMjsERNSK7kBPkj0/fk=
X-Google-Smtp-Source: ADFU+vtYTIjwAFGicwcH8cRXzYewaccfDqshtov2Y0xBWrDkLoP3xs07jJGvHw6/RjPX4bMGXv6mTBgAT3hPpC2mqQU=
X-Received: by 2002:a2e:b78e:: with SMTP id n14mr347053ljo.269.1582733089968; 
 Wed, 26 Feb 2020 08:04:49 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8T6dGjDbH3YFpZpEA+Rtoppj+sJ4bZtt9ZDMfH85_UuUg@mail.gmail.com>
 <29a0fc8162de6bde7ea127956efb7de29b4fce3e.camel@redhat.com>
 <CAC-fF8QyT+t0Cmi3BdJe8kJ-LRL_BvvhQr76GwF2t3ZQJWsDDw@mail.gmail.com>
 <dc76b713e4e4c94d396a0d95ebb5145c63ce4a4d.camel@redhat.com>
 <CAC-fF8RrV1XtnaB0va3Bv8++c17qXKh+JtdSUqS00Eg-3OZUfQ@mail.gmail.com>
 <CAC-fF8RSs2NaB6B_v=UKp0KpDiu75kzLy+ioX9nZNy09miSQMg@mail.gmail.com>
 <ac934c852d7aad518a4d7261b097095064da38fe.camel@redhat.com>
In-Reply-To: <ac934c852d7aad518a4d7261b097095064da38fe.camel@redhat.com>
Date: Wed, 26 Feb 2020 17:04:38 +0100
Message-ID: <CAC-fF8RQO5CGPJQmrgGqH92zY19soJZeyTQFx-8fM0ekX8pgQw@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Simo Sorce <simo@redhat.com>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>, Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Feb 26, 2020 at 4:21 PM Simo Sorce <simo@redhat.com> wrote:
>
> On Wed, 2020-02-26 at 14:33 +0100, Isaac Boukris wrote:
> > On Mon, Feb 24, 2020 at 9:37 PM Isaac Boukris <iboukris@gmail.com> wrot=
e:
> > > On Mon, Feb 24, 2020 at 9:28 PM Simo Sorce <simo@redhat.com> wrote:
> > > > On Mon, 2020-02-24 at 17:41 +0100, Isaac Boukris wrote:
> > > > > On Mon, Feb 24, 2020 at 2:35 PM Simo Sorce <simo@redhat.com> wrot=
e:
> > > > > > On Sat, 2020-02-22 at 20:09 +0100, Isaac Boukris wrote:
> > > > > > > On Tue, Feb 18, 2020 at 5:48 PM Stefan Metzmacher <metze@samb=
a.org> wrote:
> > > > > > >
> > > > > > > > I think we need input from dochelp to answer 2 questions:
> > > > > > > > 1. which kind of channel bindings are expected/used by wind=
ows?
> > > > > > > >    I assume tls-server-end-point. I guess MS-ADTS would be =
the place
> > > > > > > >    to define these details for ldaps.
> > > > > > >
> > > > > > > I noticed more another reference to channel-bindings in MS-KI=
LE, I
> > > > > > > think maybe KERB_AP_OPTIONS_CBT ad element is the way to tell=
 the
> > > > > > > server to require CB when LdapEnforceChannelBinding is set to=
 1 only,
> > > > > > > needs testing.
> > > > > > >
> > > > > > > 3.2.5.8 AP Exchange
> > > > > > > If ChannelBinding is set to TRUE, the client sends
> > > > > > > AD-AUTH-DATA-AP-OPTIONS data in an AD-IF-
> > > > > > > RELEVANT element ([RFC4120] section 5.2.6.1). The Authorizati=
on Data
> > > > > > > Type AD-AUTH-DATA-AP-
> > > > > > > OPTIONS has an ad-type of 143 and ad-data of KERB_AP_OPTIONS_=
CBT
> > > > > > > (0x4000). The presence of
> > > > > > > this element indicates that the client expects the applicatio=
ns
> > > > > > > running on it to include channel binding
> > > > > > > information ([RFC2743] section 1.1.6 and [RFC2744]) in AP req=
uests
> > > > > > > whenever Kerberos
> > > > > > > authentication takes place over an "outer channel" such as TL=
S.
> > > > > > > Channel binding is provided using the
> > > > > > > ChannelBinding variable specified in section 3.2.1.
> > > > > > >
> > > > > > > 3.4.5
> > > > > > > If the ApplicationRequiresCBT parameter (section 3.4.1) is se=
t to
> > > > > > > TRUE, the server, if so configured,
> > > > > > > SHOULD<67> return GSS_S_BAD_BINDINGS whenever the AP exchange=
 request
> > > > > > > message contains
> > > > > > > an all-zero channel binding value and does not contain the
> > > > > > > AD-IF-RELEVANT element ([RFC4120]
> > > > > > > section 5.2.6.1) KERB_AP_OPTIONS_CBT.
> > > > > >
> > > > > > Very interesting, we should add support to decode this AD in MI=
T krb5
> > > > > > and exposes it via naming attributes or context options, whatev=
er makes
> > > > > > the most sense.
> > > > >
> > > > > Yeah, although I can't really think of something that would work,
> > > > > given we want to know that before calling accept() on the input t=
oken.
> > > > > On clients supporting CB, maybe we can add this ad-element via a
> > > > > gss_set_name_attribute() call, not sure.
> > > >
> > > > We might even just see there are CBs in gss_init_sec_context() and =
just
> > > > do it automatically. The only question is whether this can cause
> > > > interop issues which requires a more nuanced use of these.
> > >
> > > Right, doing it automatically make sense. I think an unknown
> > > ad-element in ad-if-relevant container shouldn't cause interop issues=
.
> >
> > It seems Windows clients send this same list of ad-element, over TLS
> > or not.  I think "AD-TARGET-PRINCIPAL" is for what they called in the
> > blog post "bound to SPN", not sure.
> >
> > authorization-data: 1 item
> >     AuthorizationData item
> >         ad-type: AD-IF-RELEVANT (1)
> >         ad-data: 3081a9938298930=E2=80=A6
> >             AuthorizationData item
> >                 ad-type: AD-TOKEN-RESTRICTIONS (141)
> >                 ad-data: 303330=E2=80=A6
> >             AuthorizationData item
> >                 ad-type: AD-LOCAL (142)
> >                 ad-data: f0bca424242eaf2...
> >             AuthorizationData item
> >                 ad-type: AD-AP-OPTIONS (143)
> >                 ad-data: 00400000
> >                     AD-AP-Options: 0x00004000, ChannelBindings
> >                         .... .... .... .... .1.. .... .... .... =3D
> > ChannelBindings: Set
> >             AuthorizationData item
> >                 ad-type: AD-TARGET-PRINCIPAL (144)
> >                 ad-data: 6c006400602=E2=80=A6
> >                     Target Principal: ldap/sdc.smb.net@SMB.NET
> >
>
> Sp this is just an AD element, not actual Channel Bindings, right ?

Yeah, an ad-element containing a flag, not bindings.

