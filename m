Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F8D86CA81
	for <lists+samba-technical@lfdr.de>; Thu, 29 Feb 2024 14:42:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=I/XyHeEocAFGGWkiv8CIl0X+a53gseXW5Q5gpuX2Sxc=; b=bJ2cRM70fn31aAT0gqiWpbWotD
	r4z6CHWeOJdRYtx4AGspzPmNyl+aZ8RYf4M4yaywT47dPwq+yIuMd56bz8Mj341LRuFmd1vRkmzAi
	85vIVhybs2FDp9dx5opUbnLdB/AsiqThUT/mOWd/2task/vg+CrXUMIQtiOV2zamGW3uRzV808BFk
	IQ3CAozD5uPEerZxVVpSFdQqkRBYf32KOeGcBPnQJ01fnLGpWKZa8bjcRZQ2OH1HojzxCrPlI0+hd
	bejtMmus14b2B2CAl82EPI/zzZO9rkM8Mu8EsPAnB7g/LggFpsmOHfczJDDMzslfFFKAMCI08aL3U
	HcdLA5Wg==;
Received: from ip6-localhost ([::1]:49350 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rfgfU-009hnw-TX; Thu, 29 Feb 2024 13:41:48 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:59728) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfgfP-009hnp-PS
 for samba-technical@lists.samba.org; Thu, 29 Feb 2024 13:41:46 +0000
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7c78573f31aso41611039f.3
 for <samba-technical@lists.samba.org>; Thu, 29 Feb 2024 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709214101; x=1709818901; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/XyHeEocAFGGWkiv8CIl0X+a53gseXW5Q5gpuX2Sxc=;
 b=PvQV/EcV5VYLCv9qCMy8x11+wS/8lLRMhhgHUiUZiD/lgGHMnDGdPEFfCWxDY/XVPO
 dvFRFpzl3AHpa4XKz+7Aun/N0HseBGRcuti/seme3WnxhGHy6wvqbEABeT+5gMN62zHW
 Cu2qTgoJ5D+sPhJNoRFJpb4PWhQe3vUH5/IJV5Gf74otinK6bNeJPeqB+tpZO2DO+vcs
 hk0hVPSH3Hqqd3TenErSHeH6SJqB+p3KTMcktVNsWHW4jtq4EtSDTZ3E9ef10v9Rru3/
 8Om0iJimijR4teBVrLmXqIpob9gOQUVGmX9jLFlQGL5ZoXV1nljOzPvnakYAPmc9Ry8B
 696Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709214101; x=1709818901;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I/XyHeEocAFGGWkiv8CIl0X+a53gseXW5Q5gpuX2Sxc=;
 b=v8SFpmz0m/rMa6mcQuPzkDKCXsarXCrvWNj7ErH2KnekLpe27d/To4uIsw6K7E7uRY
 XUeP/9jYySzVj9emIFyThzGx5AqULiaB1VRG/DDb7br7uBeW8CDx8LzvJPTdZhV5rmao
 ZFn2JgCUb3f65HGxKbdfDOD5kUdIMRHRdHAZH7/w0loNymPW1NpNfhFKi4a6+pQGylEE
 NEXZP9FSxwffT5GXmsRRRiXbcYMfaBPWjFoxSYPRUCevqveOg6tGMJVUH+hOMbSsYquT
 67xhgYKDG9mKQdIY7y2O+21SFX6lgQjbkmHBzz9TonTJE4YLNTzHaSTr5PUhUTrUOhK5
 6/uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8KD/r7FZkL2vPx0KEJmByH70Ts9iCxWlOqxhdlmanmcVPmm7JCjRf10NRxJbpqRHjsn5sov+ChHjwTQRQjD/G4daSJmutv3aqUVv7o/VQ
X-Gm-Message-State: AOJu0YyPEFDQLydJure6OI0aIy/mi7uW64ebEtngYO13wh8L7i4SEZwI
 utqLxg9MXJJVi19fgVIXdR9FCwRqwYRJUoQ8870O1k3XpYyEds3Ok9qOR7fuBK6zTzLz+aNjAkv
 2dKuHDAd2PbFO8yh3L5VwvFRuwRz767qI
X-Google-Smtp-Source: AGHT+IF0vP9hz+bkW8YE04ntyotLQjp6d3nnKd8wDn4YqVEBlYs3bVOpflVAfELApLArCJ6y7x3OHCNDALyNrmEl/Vs=
X-Received: by 2002:a05:6602:6426:b0:7c4:8543:c19d with SMTP id
 gn38-20020a056602642600b007c48543c19dmr2942981iob.14.1709214101530; Thu, 29
 Feb 2024 05:41:41 -0800 (PST)
MIME-Version: 1.0
References: <CAOCN9rxnv=Wx7OJQ4JDdZQn62D1VKjYSBYGOjX45CJLSq=-LJw@mail.gmail.com>
 <ZdIU8U1tFrsf0Yi2@toolbox>
 <CAOCN9rwCGJOhK2EkCDJOeahbt7j1R5fNpbd+55rjrKrtCbqjtA@mail.gmail.com>
 <Zd2jaaIxgSWMiZ6f@toolbox>
 <CAOCN9rz3nPyzGyyZVHAydFxaO0wDstMnDSZUttYs6D+c4VXk3w@mail.gmail.com>
 <6b86a32e36a815cd2394e05600d963262601f7c1.camel@samba.org>
In-Reply-To: <6b86a32e36a815cd2394e05600d963262601f7c1.camel@samba.org>
Date: Thu, 29 Feb 2024 08:41:29 -0500
Message-ID: <CAOCN9ry_QhZ6ZvUMpx7mzLgjdLFBeX1-1=CmbCsBSDKadnRaYQ@mail.gmail.com>
Subject: Re: Samba 4.20.0rc2 fails to support "--with-includelibs" or build
 Heimdall Kerberos
To: Andrew Bartlett <abartlet@samba.org>
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
Cc: Alexander Bokovoy <ab@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It's a *veru good* red herring! It helped show me where the dang shark
was gobbling all the little fishies. Namely the latest samba.spec from
the Fedora published SRPM for samba delete the heimdal directory, "to
ensure the use of gnutls".

Bad Red Hat! No biscuit!

It's compiling successfully now. though it still requires tuning for
slightly different files in the RPM. Thank you for the pointer..


On Wed, Feb 28, 2024 at 10:10=E2=80=AFPM Andrew Bartlett <abartlet@samba.or=
g> wrote:
>
> I think this is a red herring.  The files did move, but so did the heimda=
l_build directory that references them.
>
> Andrew,

