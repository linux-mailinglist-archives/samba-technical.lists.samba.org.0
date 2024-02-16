Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0641B8572E3
	for <lists+samba-technical@lfdr.de>; Fri, 16 Feb 2024 01:53:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=A2d098e00MjE5O4BB27Z4uB5HVxslffyQJSq7EYi5Fs=; b=XvWAncQ/nqPR2D6JMLc7HfcEx1
	PvgB3bLGdTkpUGsxdkju+poCaCOSHiMnYkXsDD/BtNCyWkspk1ygHL8Mi3JmbC4Q8e3W/8sHdQjil
	1/L2IaSsdL3PeUW9va42yScLdL7XyucwVbI+8fxRHrijr2NT4WzZfYYSCGF/i/aSBTHrE2J4VEGSi
	UPDyNkYY+Fq/5UyaWw0shVIlngGC4pgyVk/C+iJ6roZm1wEu6S6fwxk4OGrLykDM/jhVyqMQZ4m6S
	CQbUoW1xeSEdOpLwnUBipEjtd5bX4AJHZsCGkbEs0KPEoLGn8oK68KZIbgtMwXMaWhxH4pMOR9uwW
	tglfty6Q==;
Received: from ip6-localhost ([::1]:52796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ramTK-008e54-Ow; Fri, 16 Feb 2024 00:52:58 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:50297) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ramTF-008e4x-T4
 for samba-technical@lists.samba.org; Fri, 16 Feb 2024 00:52:56 +0000
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d10ad265d5so3372961fa.0
 for <samba-technical@lists.samba.org>; Thu, 15 Feb 2024 16:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708044772; x=1708649572; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2d098e00MjE5O4BB27Z4uB5HVxslffyQJSq7EYi5Fs=;
 b=h+KZXUHrysBUmjZXTvQaRUMnw8vo2NBCdB/rxnJocNt+AWEGbadbu2Js8RtXUKLWoi
 elj0ylHxqXHFjKuSlF3yWOAXW85k9ssdArmogPAo51PewxZAHD0RFKUzmsoabK52Xvbb
 YJFCZFGEfnRirjSGJLuOVDMx0ypI+o7rMofvpkaZOo95p/NkDVubnksWKmmwhBl9VUys
 lx3ugpHfFNFB/aKNyGCiBHIgfrqp8CD0XUhCPXTY8wSY/fecL56HSnCEt6rlAG9Bszvi
 3BkfouXfGjujt9oeameFdW1kMlT41jdGRnCsX2hTwZ2Ico1Phter3kHn7FavnI/YHQD3
 +hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708044772; x=1708649572;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A2d098e00MjE5O4BB27Z4uB5HVxslffyQJSq7EYi5Fs=;
 b=LPiFPjmdIY3L3UhjQ98QJ2bkrpI5xNPnsMSg3/WVqMFDzd49vadG8FJwC3MfuZcxcB
 Lv6jgJgXzv+doyFsAM3XkIyqOWozrPGn38hrZ89T7kVhMGbQSvK9TbmkcxmmFGbHfqK+
 43ztal9ROFzSZK38UlbDXYTXE63a3tEeoSr3bmQqZ/CY7wbrixx7dzs4tSX69EvniNlX
 Rb5dyobJ4SZE9x2ZanKFfvdzwMkaGrwACP//vVt/uXgQ7DJs6E70IcP1LjnifL2G3Qcp
 N2CyCuaBuFl8Vp4jD9Hiy5whfOgJZ17w+hkfGlszEvDi4w9+Xxj0G3/8kouIWaRLxyQ4
 K0UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEfpVM96jF+0mm/lZgiER6Ga2Jn9gbl6HWvC/km+bmEhbvh+nsV5RtJ+OdMvOZE2Y+kvT4a0gkDsa4V+I3obonXUIIg2VyofRBcvYC3F+w
X-Gm-Message-State: AOJu0YwkIONp2x+5FKat2EA0kBXbDTGIdwhjTXhVQTh65dgelMTKrudC
 HnIjT3tB+vn7/IZegQqkG4SJMdqTdEPR8VHMtJRRRVEoMZIGhHITp3O6wCbN8ByOt+mKCBwy8Jl
 i5+c5UAhZz+9SCSsPbXDUUbvi+jM=
X-Google-Smtp-Source: AGHT+IHyv7PKfnEL8ag3c+/Wt7xhqmUFfrqiuCzvvCTt8nqfV5j9LkGBJ3IsRTA89gC+ZW0n6SNClPoNL3MlXfqUf0I=
X-Received: by 2002:a2e:9952:0:b0:2d0:7fea:2920 with SMTP id
 r18-20020a2e9952000000b002d07fea2920mr2574039ljj.37.1708044772280; Thu, 15
 Feb 2024 16:52:52 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mtUnLDtwbW7or=Uc+AXkzLpHsJoPuoLE7yyjPVYjvZCow@mail.gmail.com>
In-Reply-To: <CAH2r5mtUnLDtwbW7or=Uc+AXkzLpHsJoPuoLE7yyjPVYjvZCow@mail.gmail.com>
Date: Fri, 16 Feb 2024 06:22:39 +0530
Message-ID: <CANT5p=oNRF9BAgybCX7dE+KvYj=k2G3tERa+fMJOY6tsuZ00Hw@mail.gmail.com>
Subject: Re: [WIP PATCH] allow changing the password on remount in some cases
To: Steve French <smfrench@gmail.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>, Bharath S M <bharathsm@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Feb 13, 2024 at 12:23=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
>
> cifs: Work-in-progress patch to allow changing password
>  during remount
>
> There are cases where a session is disconnected but we can
> not reconnect successfully since the user's password has changed
> on the server (or expired) and this case currently can not be fixed
> without unmount and mounting again which is not always realistic to do.
> This patch allows remount to change the password when the session
> is disconnected.
>
> This patch needs to be tested for cases where you have multiuser mounts
> and to make sure that there are no cases where we are changing
> passwords for a different user than the one for the master tcon's
> session (cifs_sb->tcon->ses->username)
>
> Future patches should also allow us to setup the keyring (cifscreds)
> to have an "alternate password" so we would be able to change
> the password before the session drops (without the risk of races
> between when the password changes and the disconnect occurs -
> ie cases where the old password is still needed because the new
> password has not fully rolled out to all servers yet).
>
> See attached patch
>
>
> --
> Thanks,
>
> Steve

need_recon would also be true in other cases, for example when the
network is temporarily disconnected. This patch will allow changing of
password even then.
We could setup a special flag when the server returns a
STATUS_LOGON_FAILURE for SessionSetup. We can make the check for that
flag and then allow password change on remount.

Another option is to extend the multiuser keyring mechanism for single
user use case as well, and use that for password update.
Ideally, we should be able to setup multiple passwords in that keyring
and iterate through them once to see if SessionSetup goes through.
It'll be a bigger change than this though.

--=20
Regards,
Shyam

