Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 999D52A016F
	for <lists+samba-technical@lfdr.de>; Fri, 30 Oct 2020 10:32:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BySc/OzV09EmLZyR8tdptbvlsShvKCqckJKtx68oUd8=; b=ZLJz/wgUZ6LI5oR9vpV8A7sSVR
	Jtrp3bdBEMrFWH+y7+vEOkmvvnYyeyp+Rm4geUIWLzdixpl/0pR2l2LMd76jRuOt25gCk7pPHDcOH
	q+kivlpPvQKZUrTRmXWNhFsBcabr/uwWqzq8VwRZ+rw1OeCpq33+cibo21jKg5F4FT/2CGvBrl4d/
	t6ee0NKq11Z3zCu8dOpyKOc59FaM5lsL/dXxb2+P7M4JuCiMInrLsqCG7QriibCyueJFodRH+uOgO
	0xN9qehVmczNHWnnt4xhID3hkA7nzSoBqPKLv6J7PdPWBHR0u9083HjKPg3Vu+QZyek1Vqoy6VFO2
	IZjudP5A==;
Received: from ip6-localhost ([::1]:18174 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYQlR-00EdM0-Jf; Fri, 30 Oct 2020 09:32:05 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:46628) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYQlL-00EdLQ-Vs
 for samba-technical@lists.samba.org; Fri, 30 Oct 2020 09:32:02 +0000
Received: by mail-il1-x136.google.com with SMTP id a20so5881185ilk.13
 for <samba-technical@lists.samba.org>; Fri, 30 Oct 2020 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kSt9B/EstRE+BM2srouxZnL1JwhGCwazS+aC17uAmRU=;
 b=FFeX9bBgrK+1hbwGGb9eYNnnbrE1DnI2RmSKejpg/2raHseno46/GOcx5rsYulyWgE
 77QWx07W+KU8F9x1CaKbU9Tj6/v8SV2xz/NJsEVffCEEGwksVWp15CC48vJwuBuUyyFT
 eDsFdrutC8qxmOe3VgtF0Ux2bTqlo50lxJni/c5xCYO8IZ9pNZHqza4YgqyW+z07IFTo
 gQrWA6Xdk16eECAWGrOyN71v64FML+RZRgOa6O6Q7eH1Adrod1Qt5YRwKn8AOLzOVbVv
 I74yz4z5daGwt5moCq7Moxe6okSbib/oSUm8ziQaFxkODh3VaZ+0aAnWiBRZL8PQlPR+
 ApWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kSt9B/EstRE+BM2srouxZnL1JwhGCwazS+aC17uAmRU=;
 b=c9DNwcpu3DAE+0o/qkyZ4a7ODsQviX7RiSFcC0OdhdjE4FKGXYKXuVV68aFjghC9hP
 3hxtAxOWOtFvuKRkcJvAW1KCMMISFxgCLc50I4JaofMlDiCCmKOLHqJHgsSNTLewsOEo
 j5mRZ33roP1IUVkWjK4cLa4EpgxXF7xfVwdVKfjr7NP67yMPPe2d23g0dTKFplax3zP8
 eIgIPKwniJZj/pd6E1VjHifeQKlAgosbBCQFKHkSWsZNpkf/8befRsnkJqDfqa+rLJXg
 4Zy5kMIzYkm8pEDY5gFNcm73XIsDHaz7ejQOSsH34mloeFEBFLjxd3DDtzHvfxukWblF
 oyGQ==
X-Gm-Message-State: AOAM530kMJMy3Y2FBCGYqDomuY++4sbe2W8wSEbMXfSxGDYTpkr40u7e
 GXasfdG2dVz/F88z1kFkSKcx1xzZmYKDU1+n3p0=
X-Google-Smtp-Source: ABdhPJytqFcW4R/a1c9HhlhFfLxmZAU68cBSOWHIso/BUWi6Z1/7HS7DL+9qOL4CmEBPXlwSLeqGRvKTbO0/sL3VZEo=
X-Received: by 2002:a05:6e02:14b:: with SMTP id
 j11mr1155175ilr.109.1604050317563; 
 Fri, 30 Oct 2020 02:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
 <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
 <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
 <758246149.55514473.1604038831866.JavaMail.zimbra@redhat.com>
 <47e9f3cf-e258-f441-76d5-4e72b4073031@samba.org>
 <2038917775.55518004.1604044565533.JavaMail.zimbra@redhat.com>
 <db176606-3dbd-b0d8-e249-9ab6cd693ba3@samba.org>
 <CAN05THR21TwQdcLUTDoa6bt13Zx5k+huT7Gg8m3TeGjBwPLqdw@mail.gmail.com>
 <fbc9e6a2-5934-c21b-cbc3-3d0dda0c4e32@samba.org>
In-Reply-To: <fbc9e6a2-5934-c21b-cbc3-3d0dda0c4e32@samba.org>
Date: Fri, 30 Oct 2020 19:31:46 +1000
Message-ID: <CAN05THSZbzA7x0Zq=wKyLguDCBi0ZgHM7FG4ZSz3Sm7kYv=66Q@mail.gmail.com>
Subject: Re: can't start smbd after install samba posix branch
To: Rowland penny <rpenny@samba.org>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 30, 2020 at 6:52 PM Rowland penny <rpenny@samba.org> wrote:

> On 30/10/2020 08:45, ronnie sahlberg wrote:
> >
> >
> > On Fri, Oct 30, 2020 at 6:29 PM Rowland penny via samba-technical
> > <samba-technical@lists.samba.org
> > <mailto:samba-technical@lists.samba.org>> wrote:
> >
> >     On 30/10/2020 07:56, Xiaoli Feng via samba-technical wrote:
> >     > Hi,
> >     >
> >     > ----- Original Message -----
> >     >> From: "Ralph Boehme via samba-technical"
> >     <samba-technical@lists.samba.org
> >     <mailto:samba-technical@lists.samba.org>>
> >     >> To: "Xiaoli Feng" <xifeng@redhat.com
> >     <mailto:xifeng@redhat.com>>, "ronnie sahlberg"
> >     <ronniesahlberg@gmail.com <mailto:ronniesahlberg@gmail.com>>
> >     >> Cc: samba-technical@lists.samba.org
> >     <mailto:samba-technical@lists.samba.org>, belle@samba.org
> >     <mailto:belle@samba.org>
> >     >> Sent: Friday, October 30, 2020 2:30:16 PM
> >     >> Subject: Re: can't start smbd after install samba posix branch
> >     >>
> >     >> Am 10/30/20 um 7:20 AM schrieb Xiaoli Feng via samba-technical:
> >     >>> There isn't error log output. Just know the exit code is 1.
> >     >>>
> >     >>> # smbd -D -d 10
> >     >> try
> >     >>
> >     >> # smbd -iF -d 10
> >     > Thanks. Now from log, I know the config file patch is changed to
> >     /usr/etc/samba/smb.conf.
> >     > Create it. Then smbd can start. But mount option posix is still
> >     unsupported.
> >     >
> >     > # mount //localhost/cifs ~/cifs -o
> >     user=3Droot,password=3Dredhat,posix,vers=3D3.1.1
> >     > mount error(95): Operation not supported
> >     >
> >     > [81490.590281] CIFS VFS: Server does not support mounting with
> >     posix SMB3.11 extensions.
> >     >
> >     > smb.conf:
> >     > [global]
> >     > server max protocol =3D SMB3_11
> >     > unix extensions =3D yes
> >     > [cifs]
> >     > path=3D/mnt/cifs
> >     > writeable=3Dyes
> >
> >     There is a reason why it doesn't work, you appear to be using one o=
f
> >     Jeremy's git branches where he is working on SMBv3 Unix
> >     extensions. The
> >     operative word is 'working', they do not work yet, so I wouldn't
> >     use the
> >     branch unless I wanted to test where he had got to =F0=9F=98=81
> >
> >     I suggest you wait until the required patches are finished and
> >     have been
> >     accepted into Samba master.
> >
> >     Rowland
> >
> >
> > Not true.
> >
> > Me as well as Steve and the other cifs.ko kernel developers have used
> > this branch for quite a while.
> > We even have a cifs.ko buildbot we use to test this very branch.
> >
> > ronnie s
> >
> Sorry, but I treat anything outside of master as experimental and only
> to be used for testing, you might use it, but would you use it in
> production ?
>

The guy wants to test the code.
He knows it is not in the master branch.

This is not helpful.
