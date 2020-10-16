Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F00628FD6D
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 06:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=El1d4udlKsuJARiEY0oHwCh1PN6hfU+sP+g7/+dmgHc=; b=oPh2yCXZZiCHPtXwxUxmScv9LU
	7WrO52/ucf+z/7THhAPNeaghJ4vFNioOYfAly6XoXcDVAdhlS4J9o7twWlErBMq7ol7BFnUBYYdP4
	panL/R7ulP55hVYoy/xfBMM2v3uVRuywAFZDMOy4V3NcB9rnZ1cx5EqmnQQEd31dEDS1yWATnBJOC
	XSGq+bx5bJbQYb+tLWs+4yTiT5fCNyizsTLGkar5mQ6AZXv2vr6m1vSvorXHZOAJ/SWbImD0FJNP3
	nfIAmDcZiap3TvZWigOShDlShA0vOwAoGsGbIJAOv+dP3LA5mOp+REtbOvaq49Hubjy/F7F4ZZRtJ
	qb6wyhyg==;
Received: from ip6-localhost ([::1]:36082 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTHhv-00CNDJ-4q; Fri, 16 Oct 2020 04:51:11 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:45900) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTHhm-00CNDC-20
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 04:51:06 +0000
Received: by mail-lj1-x22a.google.com with SMTP id a4so1048491lji.12
 for <samba-technical@lists.samba.org>; Thu, 15 Oct 2020 21:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=El1d4udlKsuJARiEY0oHwCh1PN6hfU+sP+g7/+dmgHc=;
 b=jNBSvhF8/fQKgJr/hqZbwqg7UsSSzJJWzpXOlGyVKS+LoL0A1FFEeEXFf5uINoc2Cq
 sMwYUIcLGO5xINiKaQNK8tN800bJTSx4H8g9RQB3FEHjsXGKbVAZyNvnLZrP4dwJrJ21
 Iz3v9CEuKEF+Y430BqyrUz7yzSNPv64WP8cc2vcGPEInOrBANhmpmkiFppD2MbPLrp0Z
 cGj0goRGNtbewLnzppQSYAxZ28s7A8rGhJfutfKYlC3gQVQyzSKpTKnZfINy7UqoLxxM
 kIcwuWBSwyjK4052PutCokp29wudJexEAyCi+udQlnF9fl6ww2HTcnKAKoT+OFsyM/2L
 5JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=El1d4udlKsuJARiEY0oHwCh1PN6hfU+sP+g7/+dmgHc=;
 b=DhH99saB+drI1F9fYClQWYfETOuouxjUClFOk3swRpNchZ+M56nnpoz+E3ppDjC/WL
 9LWRPxKdVMXVXqBHyhT5CvXFJItQj0Goidoe49A0Y95XaFD3yazBNgjXpoCn+7KTOAjU
 Mm7NcN7LOClt7xpbGNKVGxqR4QqiL0KpX5TFNJtrK3duXtiazLdx6PdQuMzKgdsFav71
 oRUh9uOP9vJ6iGgeRpxBfhrVb0jVqdzWGoBHJav/oDCW/L8MEsY+COERO9DBFcAy5S/K
 bI0N86Igrh7vOzr70Xt/t0E7D9lz9/q44mI7DPud+qGKSH7YM0Ttj+TsDag3DaqqHYTd
 8Bmg==
X-Gm-Message-State: AOAM533JzT93QmkU7hs+eE5EEfF9ryRAE0F/Ur3x5SdcjXdLqlzkrSo3
 3xJYdCvritQ8EHXFf9QcE+2Pr1ydp+3nhcdh7FE=
X-Google-Smtp-Source: ABdhPJwyuHIMsMJycZcJaXGrCm8C8VeMpnCnzOUqM1mmf0Bo9qbGQlruiK85myct2elANvJJkc47V75E5RgGEz9i1Tc=
X-Received: by 2002:a2e:a376:: with SMTP id i22mr769000ljn.325.1602823859357; 
 Thu, 15 Oct 2020 21:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
 <bd8f21ed-5fd4-0974-f15a-16d2f3ee607f@samba.org> <87r1q3hixr.fsf@suse.com>
 <827fd43f-40a9-9480-a6b9-aea1fa69090c@talpey.com>
In-Reply-To: <827fd43f-40a9-9480-a6b9-aea1fa69090c@talpey.com>
Date: Thu, 15 Oct 2020 23:50:48 -0500
Message-ID: <CAH2r5mt3t=FHVd8RtCyrzY6TUKb+rGENENXbKJBgUdq4T4Qe6Q@mail.gmail.com>
Subject: Re: [PATCH][SMB3.1.1] Add defines for new signing context
To: Tom Talpey <tom@talpey.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> suggest wrapping this context and the integrity algs in some kind of cond=
itional

I have a couple patches to send the context (which I haven't merged
yet, because, similar to what you suggested, I wanted to make sure
they were disabled by default).

Tentative plan was to have them disabled by default, and sending the
new context can be enabled for testing by a module parameter (e.g.
"echo 1 >  /sys/modules/cifs/parameters/enable_signing_context"  or
some similar config variable name)

On Thu, Oct 15, 2020 at 1:15 PM Tom Talpey <tom@talpey.com> wrote:
>
> On 10/12/2020 5:50 AM, Aur=C3=A9lien Aptel wrote:
> > Patch LGTM
> >
> > Reviewed-by: Aurelien Aptel <aaptel@suse.com>
> >
> > Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
> >> This isn't in MS-SMB2 yet.
> >>
> >> Is this AES_128?
> >
> > This is returned in latest Windows Server Insider builds but it's not
> > documented yet.
> >
> > https://www.microsoft.com/en-us/software-download/windowsinsiderpreview=
server
> >
> > I've asked dochelp about it during the SDC plugfest and they gave me
> > this:
> >
> >      The new ContextType is:
> >      SMB2_SIGNING_CAPABILITIES 0x0008
> >      The Data field contains a list of signing algorithms.
> >      =E2=80=A2    It adds a new negotiate context, which enables SMB to=
 decouple signing algorithms from dialects. E.g. if both client and server =
supports it, a session may use HMAC-SHA256 with SMB 3.1.1.
> >      =E2=80=A2    It adds the AES-GMAC algorithm.
> >
> >      SigningAlgorithmCount (2 bytes): Count of signing algorithms
> >      SigningAlgorithms (variable): An array of SigningAlgorithmCount 16=
-bit integer IDs specifying the supported signing algorithms.
> >
> >      The following IDs are assigned:
> >      0 =3D HMAC-SHA256
> >      1 =3D AES-CMAC
> >      2 =3D AES-GMAC
> >
> >
> > I've been CCed in a Microsoft email thread later on and it seems to be
> > unclear why this was missed/wasn't documented. Maybe this is subject to
> > change so take with a grain of salt.
>
> Just curious if you've heard back on this. Insider builds will sometimes
> support things that don't make it to the release. Even Preview docs can
> change. However, AES_GMAC has been on the radar since 2015 (*) so
> perhaps the time has come!
>
> I'd suggest wrapping this context and the integrity algs in some kind of
> conditional, in case this is delayed...
>
> Tom.
>
> (*) slide 29+
> https://www.snia.org/sites/default/files/SDC15_presentations/smb/GregKram=
er_%20SMB_3-1-1_rev.pdf



--=20
Thanks,

Steve

