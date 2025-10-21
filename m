Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A81BF7F32
	for <lists+samba-technical@lfdr.de>; Tue, 21 Oct 2025 19:46:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Is8wbWn2PRb137hpX8Cf9e8uizjZfmxROvpNniu1Pgk=; b=yh54h6BRFuYODenyv56MOZJ240
	0g98L3/cnvRvmMrOthYlL8uIMOhTc6ylWx6u740Bwkfm3zYeJVIKSh3HUVjWWVHmGCwOS2TyopXf7
	bzNttytlElwFeQCAf02p1itQ2LnwNkniW3/HDw6iKIL5muU4voiplngvalimGv/7o5KwYSOji3A12
	V0CWm8gWpgZ71jexHv3b6w9J9slp527ggAPsHJeKjNFqQt0HEkCo4An5UbdXuskSjLeHDJ5haj/1t
	0nYry8rp11hYHel+Fqjej8EkciGM2k1ZHgthSlI5VRm5c4+aZuwYo2rXMNLWlZZG0khQpu3hmM7WQ
	to/+YDgA==;
Received: from ip6-localhost ([::1]:36850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vBGQR-008S8w-UR; Tue, 21 Oct 2025 17:45:35 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:48457) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vBGQN-008S8o-BV
 for samba-technical@lists.samba.org; Tue, 21 Oct 2025 17:45:33 +0000
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-87c237eca60so67198856d6.1
 for <samba-technical@lists.samba.org>; Tue, 21 Oct 2025 10:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761068729; x=1761673529; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Is8wbWn2PRb137hpX8Cf9e8uizjZfmxROvpNniu1Pgk=;
 b=TT6mimlwdNlc8roTK/dx9HfPgzuqy9YqsONR54DzgjbeHEuRzdvU6BwY5fgXGkWuVP
 G4yK0eYTm/OM2kysjpzNNaJ/UWxadGBTfSdoslXeWuveoXfllU3hG/kYvsgHKKeuwjKJ
 jaLJsZC6B4XeBsBNlH4WHcol84+Rt0nBvGbtFozQh+S9QqciFFYJ7Y6fOFE6zTgM48uR
 ZvN/B0dVUqRJ/oFb12oGOonLFPWFnMndxzi1nQNinP9XSpcGQs83BbvhINgmxsNLWr/J
 1eLjaIM9TWOG5tH07OSF0Fui8MPe95CXtBk8+3W8m2zDbjc8jQorDMnsFm+repjQIzP1
 +9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761068729; x=1761673529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Is8wbWn2PRb137hpX8Cf9e8uizjZfmxROvpNniu1Pgk=;
 b=qYMLuvR72y3aLm8Z43fWlqP57QFm/aw+l/NW7ioOsnK/BTT9G3pgZPCTdn4jGRWXII
 DwO8e6cGv1J0jjAVyy63Xd3DJAeTLeUuM8DB+BpXSQBctPj6DYOdBhjpvPYBRsa/ttR4
 GBnm8UvDVfincNLrUeJQH7z5BY/X370z2iJcxLwRZdAIxeIZJTI+al7BbbZGf7UFZpCQ
 Q0Z24jyf9sgJU1xH1OLu9gbrkBjwsitOVO7ZKOpByE3J0louo2b1T8mALjtI1QDKw6Vq
 Rg/x5YqL3LZcQLsmXGS/cG5ujUPxn1ThTMcgWGP74aaRw5vGZkwvI0OLSjCw4DNMvXch
 iHPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+Bf87KAPRc6nPki38Kgdw3raroaLqo3ZyWg2BoIvuP0dozOcYZDRGzGPsuY9ETeyt94Kmq+sijCY8464NNbA=@lists.samba.org
X-Gm-Message-State: AOJu0Yyh3j5mSiV2n1TQA5gYgbPJtxHqSatPLTe2Kj4N81OOSHrWBsGI
 lTHtuLExtwXKD4zd1CcaRsJiELfdz1uoNA+nP0RZNvKt1eeL/fLq6L3xoNVc83xk/JfeTPiai2F
 OHlgNKsqPN5DYXgkYoyW0K589dMLQlUo=
X-Gm-Gg: ASbGncsxSfKlz6uYDGCwNDZV9XCpwsaZQB4HNMiZm5sczmIvrZyOuSUf+mN9/Xqw1i7
 diL6Db2g5lP4J21B9DcDjPH6RQNR1y7SoUzcMwoGBHuT816AyHVpB0IzdaWJGFFTT4d7HYLuxLz
 BUNRc4PCivzabYhAcxvNK+e1f9PLdqCKKhrnyCeZvkbZVIXbm2Ykl78CkyQT5EYKAmr/Fkt3XJ6
 mMKuN50I6bRMnkqKhqsd+w6JkETlesXHjsL9xJXbdOjNjyRcEaShUkRT7Q7z9PbB/IsyzMjE+EX
 C1MbYmmDu7qWFUu6F7L7Uzmi0qnTkvoVMR+T2YCDh3vKMDsYsnogyxXZQijKLNNOnirPO1ar6rk
 37UNU5QhEOoFPpKADh+EBf6sV560XJJNRaAxUfsyy2fzUHS5q9Q==
X-Google-Smtp-Source: AGHT+IE8/MjObd6lLnDIXO5Y3xXfuL/3nMc3lmnBHuDgp7SD+tfMr7IafMDU5ZrAGbrLeSPHcxxHxt1h0JjcAPLLHtQ=
X-Received: by 2002:a05:6214:c8e:b0:875:e7f:ecf9 with SMTP id
 6a1803df08f44-87c207df8f6mr231497046d6.32.1761068729148; Tue, 21 Oct 2025
 10:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAEAsNvQmV=xFsU-4jn9zC2DYoAUjXTS3qcsGNe7XUZEEXg1cLg@mail.gmail.com>
In-Reply-To: <CAEAsNvQmV=xFsU-4jn9zC2DYoAUjXTS3qcsGNe7XUZEEXg1cLg@mail.gmail.com>
Date: Tue, 21 Oct 2025 12:45:17 -0500
X-Gm-Features: AS18NWA1q5dehCKE0zoTPQRv0Zkt2lZabQsBJUseIjIrp45IZ1PRr15vMvzSYOQ
Message-ID: <CAH2r5mtCjCvYphEAWir9PtxWQUy51jiir2Lk8erubUetX8TAbQ@mail.gmail.com>
Subject: Re: mount.cifs fails to negotiate AES-256-GCM but works when enforced
 via sysfs or modprobe options
To: Thomas Spear <speeddymon@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
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
Cc: linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good catch - this looks very important.

Do you remember if Samba support gcm256 signing?

On Mon, Oct 20, 2025 at 3:52=E2=80=AFPM Thomas Spear <speeddymon@gmail.com>=
 wrote:
>
> First time emailing here, I hope I'm writing to the correct place.
>
> I have an Azure Storage account that has been configured with an Azure
> Files share to allow only AES-256-GCM channel encryption with NTLMv2
> authentication via SMB, and I have a linux client which is running
> Ubuntu 24.04 and has the Ubuntu version of cifs-utils 7.0 installed,
> however after looking at the release notes for the later upstream
> releases I don't think this is specific to this version and rather it
> is an issue in the upstream.
>
> When I try to mount an Azure Files share over SMB, I get a mount error
> 13. However, if I do either of the following, I'm able to successfully
> mount.
>
> 1. Enable AES-128-GCM on the storage account
> 2. Keep AES-128-GCM disabled on the storage account, but enforce
> AES-256-GCM on the client side by running 'echo 1 >
> /sys/module/cifs/parameters/require_gcm_256' after loading the cifs
> module with modprobe.
>
> I can see after running modprobe that the parameter "enable_gcm_256"
> is set to Y (the default value) and the parameter "require_gcm_256" is
> set to N (also the default value)  so I believe the mount command
> should theoretically negotiate with the server, but it seems that no
> matter what I try, unless I require 256 bits on the client side by
> overwriting the "require_gcm_256" parameter, it will never mount
> successfully when the server only allows 256 bits.
>
> It seems like mount.cifs should look at the "enable_gcm_256" parameter
> and if it's "Y" try to use 256 bits at first, falling back to 128 bits
> if the server doesn't support it or throwing an error if the
> "require_gcm_256" parameter is set to the default "N" value, but I
> must admit I don't know if there's some reason that can't be done.
>
> Is this something that could be looked at and possibly improved? I'm
> unfortunately not a developer, but just a user interested in making
> better documentation so if this cannot be improved, I'll go ahead and
> get something written up and share it with downstream teams like Azure
> Files CSI driver -- on that note, I'll appreciate any clarification on
> why setting this specific parameter is required if this can't be
> improved.
>
> Thank you,
>
> Thomas Spear
>


--=20
Thanks,

Steve

