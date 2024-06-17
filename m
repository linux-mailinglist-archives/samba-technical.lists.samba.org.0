Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB71990AB60
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jun 2024 12:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=HzasI8KTrpYGS7yS3z3eR7s5T1NRmfiyEvqAlsjJvto=; b=KUEXXr1ybYUORbFQ/I5JBOU7Hi
	sW0KTir7Gh/n+TShMxIYDqXzLRYbPvEK5SgFXUbZJuusoerhaVocFXLcSECFtgl8zSg85Iki+wUf9
	jsfdudDu4S8+3xlh/WTi1vS9eNZX5MH4t7H7nPIHK+DRYZCdFbLXetzE+MHWF1u46apYexMfXxVQV
	wgzfu1W2/SUb49lt7VweKkpUnfhIrqbAQENLgmV6DkldErsEAyG4MGgqlxUk5KRbsAkDi6hIkHHCi
	0Upom4JtT6Gn58+S60LHT7GSVYti6mo+VDQuhrPj7XRYEBgQ1XEOx0FwpczRpEkPExytRrr4a+yXN
	gTWjSKew==;
Received: from ip6-localhost ([::1]:46992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sJ9lV-00E7ev-Ae; Mon, 17 Jun 2024 10:39:09 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:55509) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sJ9lO-00E7eo-7g
 for samba-technical@lists.samba.org; Mon, 17 Jun 2024 10:39:05 +0000
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-6c5bcb8e8edso3431061a12.2
 for <samba-technical@lists.samba.org>; Mon, 17 Jun 2024 03:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718620740; x=1719225540; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dWe3iYqT1KfMyjXjzNNebFuG7r/aJ1dIKDeGABwKkvc=;
 b=SazbM0niazlCFzHWRgiObO7lQGSXqe83Uhg5AMMgKM/Nd62pnMei5yvH9yRgrO602/
 7mEZrkV+FPV2xOEML6SBSO26PAyPgdgpIOOW/jyuJBrc3Dgst268RftSDV8RcINrkA1P
 xEDsKrBnoYuSPhj4ws5dhsXRbCuI1DHTmlDC/h+EBNz4AJ2uRiTxUoHd5E7AE8RRzdyW
 vIp82TDZs+ar5H/AShd6Zp/6kgxJOw3FujuR0uebHN9pMa9kYFt5JTpezO9uDbLujgpi
 RoWGLKTSmLI3VsVu2Zyt8WMJWkgm/VIJv73ZEFvs7wWKxznKty06vOx1BK8sh2DlL7qH
 Wy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718620740; x=1719225540;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dWe3iYqT1KfMyjXjzNNebFuG7r/aJ1dIKDeGABwKkvc=;
 b=Goc1ER5HvK6ETSg63frQF/cCXxBmtbnObHA2AqxF+h1VYSE2la+ddBxrrfBTz3F49k
 4HYC2apDm61TarSdDlcq4GUbiDN3POPgWN9EaZH54OQTmynDAPsERJiDeVQCMTqnwuQV
 qmbM6YDr2VbIeLb9FIP6OJStxxaq9v8w7JAhffiYeGV87RtMbWI1ltPrthk7rjeyAkv0
 JNBFUFsRnjWE4CulU7E00ukPdVRFcJ5e3MTfPtZZFEu57LA82bZUYLyvGfSMrCqWiyyq
 qWT5ZYm2/vXv7qSdxDWHmzdMoC0VVjZpVEU+sTcz/qkM6BKdW9G45vCFBEZOVeLVIEC/
 MpcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzk4sMGntV44ojJXjjQAYpoxlaTm4hKYKP+Uh1KcbPlckvYD6ALSNWIwWwJYr6UGVaRW27PVM9kqqzqwHP21RulC4+CiP1QlM3QMq3dkE+
X-Gm-Message-State: AOJu0YzQCWTR6jFesvOpl1pdNUuHo2jVQaookhg1LuRYQ/wRVzrhBZUn
 Nltf+Jb7xy5I90AGduaIni/crt2zZi0qhvhharRg4upMZDhlM/Kf+aL0nClvpVpmSG0uW3sayUW
 fPzDuh1yz9sroc1eqV9HUWTROtuI=
X-Google-Smtp-Source: AGHT+IE3FCKTlD0J1KzYGvKEDT24X8vg2mv21FZRIYocBPhRvwAWE8ylNDeGNHov6Kao04RhOer8XMel41YkYu3REf8=
X-Received: by 2002:a17:90b:211:b0:2c4:eab5:1973 with SMTP id
 98e67ed59e1d1-2c4eab519e5mr6887173a91.7.1718620739591; Mon, 17 Jun 2024
 03:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <d5a2f19e8e319d29cbae169da4c0d33b7edf3a9e.camel@redhat.com>
 <6e9a8ade-8357-4c35-8d1b-c0749503011d@samba.org>
 <CAO9H7P876Qx8wEN_kfYQKUW7XqMWevfqx7A0kAbf_1UJkmu=zw@mail.gmail.com>
 <35b4b0bc-1e9a-4d69-9fce-ba8782d1ce65@samba.org>
In-Reply-To: <35b4b0bc-1e9a-4d69-9fce-ba8782d1ce65@samba.org>
Date: Mon, 17 Jun 2024 12:38:48 +0200
Message-ID: <CAO9H7P8Quhsdk3dBVUX7=kgWOs6fY0+wba7B-fOjDb_Rbv9gWw@mail.gmail.com>
Subject: Re: smb2.session.reauth4: UID/GID to use as anonymous user when
 modifying DACL
To: Stefan Metzmacher <metze@samba.org>
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
From: Xavi Hernandez via samba-technical <samba-technical@lists.samba.org>
Reply-To: Xavi Hernandez <xhernandez@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Stefan,

On Mon, Jun 17, 2024 at 12:30=E2=80=AFPM Stefan Metzmacher <metze@samba.org=
> wrote:

> Hi Xavi,
>
> >>> At the same time, I can also see that getuid()/getgid() returns 0/0 a=
nd
> >>> geteuid()/getegid() also returns 0/0. Does the default plugin use
> >>> uid/gid 0/0 while performing this operation?
> >>>
> >>> I have the following questions
> >>> 1) What are we testing for with this smbtorture test?
> >>> 2) Is the anonymous user allowed to modify the DACL of the file as do=
ne
> >>> in the test? This would obviously lead to access denied errors as we
> >>> see currently.
> >>
> >> It checks the reauthentication has no effect on open file handles
> >> only on new file handles. After the SMB2 Create only fsp->access_mask
> >> matters for access checking.
> >>
> >>> 3) What uid/gid should be set when performing this action as the
> >>> anonymous user?
> >>
> >> Maybe you need to remember the low level token at open time
> >> and use that.
> >>
> >
> > I'm not sure if this will work in all cases. When the acl_xattr vfs
> module
> > is used, the Windows ACLs are stored in "security.NTACL". To correctly
> set
> > this xattr, the process needs to become root on a kernel mounted
> filesystem
> > because the kernel doesn't allow a regular user to modify that xattr,
> even
> > if the user has permissions to modify the file.
> >
> > If a share uses a vfs module instead of a kernel mount to export the
> > filesystem, and that filesystem also requires root privileges to modify
> the
> > "security" namespace, then using the cached permissions at the time of
> > opening the file won't be enough.
> >
> > I think that the unix token should be kept consistent with the effectiv=
e
> > owner of the process at all times to avoid this problem or similar ones=
.
>
> We have get_current_utok(), which refects become_root().
> Currently that can be used instead of
> handle->conn->session_info->unix_token.
>

That's exactly what I was looking for. Thanks !

Just to try to understand it a bit better, what's the reason that the
"conn->session_info->unix_token" is not kept in sync with the effective
process owner instead of keeping another unix token which is in sync ?

Is it just because become_root() doesn't receive a "conn" argument, or
there's some other reason ?

Xavi
