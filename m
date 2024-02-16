Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB65485837C
	for <lists+samba-technical@lfdr.de>; Fri, 16 Feb 2024 18:07:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wjga3gQH/IKqLKITQswThucC6tah7iPo/cvtowVSbxY=; b=WOsZpTretzfeSDahtnHga9/puD
	WsyJbkttyXlml6tlWlcvdtygz1k26L/7qH8+OZaxzfiT4sTdtMCluj/MVoqhRywYfhUbONsdNpT+/
	PilvOK05MzG7P+BLoXvaDRnZWyIBV4ULliJ5FheMxZ5l89VAZlo1rFxEe7YSEJ6+qs62o5iq5jHFO
	nh/aO16G8RwbzYU/sCRMsofns8UfeoR5BFcf8HMv6apGY7Xa+Ns1Jfgr6BPBkhlGvKi9rwCcAAocX
	Mdt31QQtH0PT4mDvWxDkFgkcsR+DhFV8vGvFE11Oq9FridReH61LXQFsKWgCLl6RAdB6MnI/yvzcr
	z0jzZ9QA==;
Received: from ip6-localhost ([::1]:29310 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rb1fq-008iwF-Mx; Fri, 16 Feb 2024 17:06:54 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:58460) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rb1fm-008iw8-Le
 for samba-technical@lists.samba.org; Fri, 16 Feb 2024 17:06:52 +0000
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d0d799b55cso26882841fa.0
 for <samba-technical@lists.samba.org>; Fri, 16 Feb 2024 09:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708103209; x=1708708009; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wjga3gQH/IKqLKITQswThucC6tah7iPo/cvtowVSbxY=;
 b=U5vYUFTfSPxt4dxBbB5kQ+vfbUAkXDReFDkpnVpoeA9gruxHIpF9/HkuxxOsaVOEge
 SNuDEf1DPOu9QW/UfH8/7rVjlO2Y5lajbR7bMKkzeU9bNAIBXyJwvevqMoUJp11YCNYb
 9g+YD/p+HYOo7Gc3jt/51dY9tJL5nNavApv2eS9+sKQqpOYeSXIIzvqIGhxi3lYPqW5n
 0ueB8aVtaZfWAD6Qay5k2ay3t9Me57zEBrtb6BYulVMGn1I9zVEfR77IC9Pjh9aCDIxe
 BVPu7sMiQ75OFlw6prk1Hb7B8LbSygX1R6wZyiYdJix1juDL1iXC9qQ3i3pvEHMiLE7M
 vPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708103209; x=1708708009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wjga3gQH/IKqLKITQswThucC6tah7iPo/cvtowVSbxY=;
 b=KNIyRLGN7Qz0x2R6fO1nfJzBwiGcNoMflCr0BxkSOmQJ/4dlcvwn8rOZ3wIv1Scwkw
 9OPBgNTMV116rnS2Odhk9z7Go67oIjdmUr/549YyuyLXT7jlWwtIm2EvFciL52YUKtDa
 okE1dnw1Rtd3emby/sElHrr+rzFFo8FN4rmLTqGq4oEh2+xEpZZr5dWAbeTw8a0nCeg2
 AHOmqrn8f3osNx2Eeilg0fwlyd7/+Id4RAJlpjpdeMpMa4NmbV9UqaNjDpBUoTS7qedf
 4StXrdExb+/f/GbkwKbHf3iaWsG9v8O6Tnt2IVpqvGEGSkIqW1x4VfA3Nf8zbFazDYe7
 Xi8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg8kxsbhWTV1rmain4Tfit/K3yI8hawAzCGTluvJ9lePV1TbOs95fWQll4wmPNbYeB2WlY8LU8vsKpMG/M1RKVrqUM+dq5hN3zamB1MNF5
X-Gm-Message-State: AOJu0Yxliyd4+TBAvXA8uSOle8klmgZDmUul3UUu3Yahxgq31O1QC7+7
 SmJaGkeXncv9BgKlq8R3IJb5hUAIg8E32dfs5fY6j0SuksesAyovthzwnSX0q0tf/LQ5nkleHaX
 YjUJm89SYgVaHdvFWUUEfb5b7pr4=
X-Google-Smtp-Source: AGHT+IHXVhMOz/uDEfxZUOpgcZDeBm7klLlZKI6uwOxY3T9Y1IC943I3H57dHd6tAzB90H6h5q6I5MHfV+aMWgHHbP0=
X-Received: by 2002:a05:6512:3b9c:b0:512:8db1:8784 with SMTP id
 g28-20020a0565123b9c00b005128db18784mr3372861lfv.6.1708103209022; Fri, 16 Feb
 2024 09:06:49 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mtUnLDtwbW7or=Uc+AXkzLpHsJoPuoLE7yyjPVYjvZCow@mail.gmail.com>
 <CANT5p=oNRF9BAgybCX7dE+KvYj=k2G3tERa+fMJOY6tsuZ00Hw@mail.gmail.com>
 <bc2eaf5b9eafe2134820d1ea8c07e43f@manguebit.com>
In-Reply-To: <bc2eaf5b9eafe2134820d1ea8c07e43f@manguebit.com>
Date: Fri, 16 Feb 2024 11:06:37 -0600
Message-ID: <CAH2r5mvd3u3eg9hZ7Brx7bnbPkC9K2P3KVyxM+mTajE=uqT3tA@mail.gmail.com>
Subject: Re: [WIP PATCH] allow changing the password on remount in some cases
To: Paulo Alcantara <pc@manguebit.com>
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>, Bharath S M <bharathsm@microsoft.com>,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 16, 2024 at 8:41=E2=80=AFAM Paulo Alcantara <pc@manguebit.com> =
wrote:
>
> Shyam Prasad N <nspmangalore@gmail.com> writes:
>
> > need_recon would also be true in other cases, for example when the
> > network is temporarily disconnected. This patch will allow changing of
> > password even then.
> > We could setup a special flag when the server returns a
> > STATUS_LOGON_FAILURE for SessionSetup. We can make the check for that
> > flag and then allow password change on remount.
>
> Yes.  Allowing password change over remount simply because network is
> disconnected is not a good idea.  The user could mistype the password
> when performing a remount and then everything would stop working.

I agree - will change patch to do that.

> Not to mention that this patch is only handling a specfic case where a
> mount would have a single SMB session, which isn't true for a DFS mount.

We should do a patch for that too.  Agreed.

> > Another option is to extend the multiuser keyring mechanism for single
> > user use case as well, and use that for password update.
> > Ideally, we should be able to setup multiple passwords in that keyring
> > and iterate through them once to see if SessionSetup goes through.
>
> Yes, sounds like the best approach so far.  It would allow users to
> update their passwords in keyring and sysadmins could drop existing SMB
> sessions from server side and then the client would reconnect by using
> new password from keyring.  This wouldn't even require a remount.

Yes - I was discussing this with David Howells, and having a backup passwor=
d
in keyring is helpful in long run (and better solution for some) but we als=
o
need remount because that is what user's would intuitively try first.

> Besides, marking this for -stable makes no sense.

Problem we have is that it can be (and has sometimes been) a big problem fo=
r
user when password keys rotate and no way to fix it other than unmount - so
we will need the "easy and low risk" solution available for distros
since keyring
won't work for some use cases (although helpful for others)


--=20
Thanks,

Steve

