Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6A0B07C00
	for <lists+samba-technical@lfdr.de>; Wed, 16 Jul 2025 19:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=V7hbZC0Hh0Gq7KvB0tTmk/BvZ226VSNRGPWRnPQOlHU=; b=I6HYIdcJp+nIklxMtioB6laBbI
	CoDmUAcI6rEyH06KqQ3lemYQvmchIobmkIpYel39tlkiLRkfjmu0QaOBXOgxwQhRsa1cTX7fYtoxX
	H++4rz+Fo191Z8DTzWZ30yOsYisreKjcy8FYR/9Xn4qVRvQLNCPoV8q1GJjSdMEnWIv4aeIrxliAu
	WYffI0djm1rVhU3an8QWk3fVqeNIqQdi+i+A4iz0zNRRJUs3vIEkMxEPQgQ1PVBPkdHS9IhjEjQLF
	ORo6o5HAPQ8s0zRoOXK4/JVAo4BIYuMjQCXWKXjId59y9eiQQkPWK66EsIUaiLqBLVcX6dPMzQUUQ
	HZJ2+jag==;
Received: from ip6-localhost ([::1]:20688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uc5vg-00BKBr-NU; Wed, 16 Jul 2025 17:28:28 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:58436) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uc5va-00BKBk-MF
 for samba-technical@lists.samba.org; Wed, 16 Jul 2025 17:28:26 +0000
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-4ab63f8fb91so1475861cf.0
 for <samba-technical@lists.samba.org>; Wed, 16 Jul 2025 10:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752686901; x=1753291701; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yM+2Rk98GcMdnL2hNUE9/nTPg1oY1rqjDF3GfdJhsy0=;
 b=nYYje1uMCO2RINNax3kApqQWKcgxcltfkn9qtx2QPIALvhyJqZ3NloJtac1Qep5k3h
 irYFXEovOadDe/iKIBj1Z0Dp/ydu8VCVYRHK6va/kU9w0uftnSBAzn1Bsu/rY030+mfW
 jcDLMvuNyRQ/0bGscofJ2dbA4qg39Fy8Ctd8fvFONoKqo10QGkB9B136JQ4kcujVXxfm
 W42+UK03rAPwdZVVIBF0LX9yB56MZFCSSNDdNGZDYFDoX62RvAHPMOKpqX1p9i0Rr+b1
 KztpUGIDSFkVkRZmgQ62Bzu1v0zMJDvgMOy7fzKeRjdFNlfaWgGXnSMQ4gFwJSbJfdZM
 +F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752686901; x=1753291701;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yM+2Rk98GcMdnL2hNUE9/nTPg1oY1rqjDF3GfdJhsy0=;
 b=vkhsYTDYrA5JC8p6mODpmFG/XDC+pexor2F3dRXQrxcWIByOgFU5HeGIggFumPqX2A
 O9e0GD4uV4Sh79ISmkp1feQEZWCYnmGUx+nbBhVSzlimjC3V6jYXxLT2+33itiKaieaQ
 3XQNco2rbBJtWayfOAsyDLaTOGmqvpd9JUOK4Dfq/HPn1eegKO4nBWdvFscMGrIHK7UQ
 /RBm9R5TqheNMwuPQfLz384SdzNnhlono7p5jsYEubCHyIMQq7S4EFheCh5I+MEcTTn5
 bnbxIPsfMulaPyALcERsu2qhJkmFoVBfWhaBgF1nqxiNrLER+MY2zZPcQiIrpiDhHJ97
 bMVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyuKnxf8kviAhYeVp6E/UiVjGOdSgvcv38O7BJXwdH6sqoU9jCfF4Zp+Bi12ic5c6vpHADn2e4K4eWHWYmhks=@lists.samba.org
X-Gm-Message-State: AOJu0YzIGW92O3EqwHdBXoEWBaSeLLB+dAiGljmHRGGTrCOOeX6YG8pZ
 E+NOFhLYXiZyUzkY0rZLLS3Dw0ThAGyS5bSVj7qAdAURtb6/LRvc7PoqT8SXAYyasyGB9aPjnS3
 IOtzVyF8vcDqHi3WtO3sqZ9rWgSKBNJE=
X-Gm-Gg: ASbGncsnu23P+NgohE5LaOCpPCkMJosp8YzePGIimkOFT5vrNaxKXnAXKUFpW1vO/tp
 ieMc6d9DgNnEBWUKLvlIPFWaDtgQZtNt8w5rttnFClq34aFuBvna7SSsTMX5Uj2vLCsYskLr8tN
 kBzbMFERfKB6CyyAeCfOVvrotKjOIgxrWrGwLML7vqn/MHTcyZBHyKJgCcn3WU9RRqzVvXQRL7L
 7TIZz1jx5iNXaYmBwJF5xZoU1X/tbm8+9XtUbensg==
X-Google-Smtp-Source: AGHT+IFCbUbzHDYVKoMjO3PnsLoBWmTeky+oAVRMgWPdBCIc9ch2/VHO0y28bpLsn8J5wIrICyj2r7EoQVVX6ulc9B0=
X-Received: by 2002:a05:622a:588:b0:4ab:41a2:b980 with SMTP id
 d75a77b69052e-4ab93d492aamr45680081cf.33.1752686900334; Wed, 16 Jul 2025
 10:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <a97b22e8-144e-45ed-8850-c3fd18769a6c@pre-sense.de>
 <CAH2r5mtgWfxQtoy2gwnMiWM3HXno2icuWmiuhMJ64yTAi_jsyQ@mail.gmail.com>
 <aHXuSKMsQsPWd5NC@toolbx> <26a52d1e-f829-4264-a39b-a9591a5d9eb1@pre-sense.de>
In-Reply-To: <26a52d1e-f829-4264-a39b-a9591a5d9eb1@pre-sense.de>
Date: Wed, 16 Jul 2025 12:28:08 -0500
X-Gm-Features: Ac12FXywd3InPgCIle30W-6TxWL1M-CX0UwWxyQANmun1lgsfEvVCMk21W_zfZc
Message-ID: <CAH2r5mvSEv1RGyjpsPg9s8auS5hb9sF4xVNUsetKf1ZkEXJnfA@mail.gmail.com>
Subject: Re: Using UPN with mount.cifs?
To: =?UTF-8?B?VGlsbCBEw7ZyZ2Vz?= <doerges@pre-sense.de>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: linux-cifs <linux-cifs@vger.kernel.org>, Alexander Bokovoy <ab@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> I understand you correctly, mount.cifs basically cannot use the UPN to
authenticate

It is really up to the server if it has special case code to handle
user@domain (instead of just sending user) sent as username in ntlmssp
auth. For Kerberos auth (peer to peer Kerberos will also become more common
soon instead of ntlmssp even when not domain joined) that is different
story as previous email explained.

Since upn would be sent to the server for ntlmssp case it is really up to
the server, but obviously it is better to resolve the upn to the correct
domain and pass in the domain

Thanks,

Steve

On Wed, Jul 16, 2025, 1:45=E2=80=AFAM Till D=C3=B6rges <doerges@pre-sense.d=
e> wrote:

> Hello,
>
> thanks for your answers.
>
> In our setup we use NTLMSSP and a NetApp.
>
> If I understand you correctly, mount.cifs basically cannot use the UPN to
> authenticate - or at least not reliably.
>
> Simply splitting up the UPN (<user>@<domain>) for mount.cifs doesn't work
> either,
> because the SAM account name has a different domain and also a different
> username scheme.
>
> Is there a canonical way (with Linux) to map a given UPN to its SAM
> account name?
>
> Thanks -- Till
>
>
> On 15.07.25 07:59, Alexander Bokovoy wrote:
> > On =D0=9F=D0=B0=D0=BD, 14 =D0=BB=D1=96=D0=BF 2025, Steve French via sam=
ba-technical wrote:
> >> This is an interesting question.
> >>
> >> mount.cifs will pass it (the UPN) down to cifs.ko so it will get sent
> >> on the wire, so behavior will vary by server.
> >
> > Is this with GSSAPI krb5 or NTLMSSP?
> >
> > For GSSAPI we either expect already existing credential or initialize i=
t
> > from a keytab. In the first case cifs.upcall is not doing anything to
> > enable enteprise principal because it is not handling the initial ticke=
t
> > acquisition. In the second case it doesn't do anything to mark the
> > client principal as an enteprise one.
> >
> > The difference is by how that client principal is marked down in GSSAPI
> > negotiation. It needs two parts:
> >
> >   - a client name should be an enterprise principal,
> >   - client code should make sure it sets a flag to accept rewrites of
> >     its own client principal name by the KDC in the returned ticket
> >     (principal canonicalization).
> >
> > Neither is done by the cifs.upcall. More to that, for GSSAPI krb5 the
> > username passed to the cifs.upcall is pretty much ignored except for th=
e
> > keytab initialization.
> >
> > With NTLMSSP you don't really have 'enterprise principals', as it is up
> > to the SMB server to interpret the name you passed.
> >
> > The client has nothing to indicate that. A server may consider
> > interpreting it as a local machine-provided one (username=3Dtestuser), =
or
> > consider to map it into the local one even if it has domain name
> > explicitly set (such as with IAKERB case on a standalone Windows).
> >
> >>
> >> I tried it to current Samba (passing "username=3Dtestuser" and also
> >> "username=3Dtestuser@somedomain" and also for
> >> "username=3Dtestuser,domain=3Dsomedomain") and it worked fine for all
> >> three cases (with and without UPN, with and without "domain=3D").
> >>
> >> Trying it to Windows though:
> >> 1) "username=3Dtestuser" worked
> >> 2) "username=3Dtestuser,domain=3Dsomedomain"  worked
> >> 3) "username=3Dtestuser@somedomain"  did not work to Windows server
> >>
> >> So looks like the behavior varies by server, but safest way is to
> >> specify the UPN as "username=3D" and "domain=3D" rather than
> >> username=3Dsomeuser@somedomain
> >>
> >> On Mon, Jul 14, 2025 at 7:44=E2=80=AFAM Till D=C3=B6rges <doerges@pre-=
sense.de>
> wrote:
> >>>
> >>> Hello everyone,
> >>>
> >>>
> >>> I'm wondering whether it is possible to use User Principal Names (UPN=
)
> instead of
> >>> accountnames + workgroup/domain, when mounting a share with mount.cif=
s?
> >>>
> >>>
> >>> The man page for mount.cifs does not mention UPN. A quick grep throug=
h
> the latest
> >>> sources (cifs-utils-7.4) doesn't mention UPN either.
> >>>
> >>> Searching the ML in particular and the web in general came up emtpy,
> too.
> >>>
> >>>
> >>> So, is there a way to
> <https://www.google.com/maps/search/o,+is+there+a+way+to+?entry=3Dgmail&s=
ource=3Dg>do
> it?
> >>>
> >>>
> >>> Thanks and regards -- Till
> >>>
> >>> --
> >>>                                           www.pre-sense.de/fcknzs
> >>>
> >>> PRESENSE Technologies GmbH             Nagelsweg 41, D-20097 HH
> >>> Gesch=C3=A4ftsf=C3=BChrer/Managing Director        AG Hamburg, HRB 10=
7844
> >>> Till D=C3=B6rges                              USt-IdNr.: DE263765024
> >>>
> >>
> >>
> >> --
> >> Thanks,
> >>
> >> Steve
> >>
> >
> --
>                                          www.pre-sense.de/fcknzs
>
> PRESENSE Technologies GmbH             Nagelsweg 41, D-20097 HH
> Gesch=C3=A4ftsf=C3=BChrer/Managing Director        AG Hamburg, HRB 107844
> Till D=C3=B6rges                              USt-IdNr.: DE263765024
>
