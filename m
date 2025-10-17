Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC2BEA88E
	for <lists+samba-technical@lfdr.de>; Fri, 17 Oct 2025 18:13:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OjQetjKtP2N8ZnKgF+/VCDLQar2SjrRhN3JEU0v7jTQ=; b=kgZat7igIG276vfjHAPTNIQR2V
	67mYo9sPPLPzr4LIjtCgA2+0LEvRbJh3FSUD+yWp/rG6QLsJ/rkBe/6uRQ3rrP/XnRfNh+J9R9vZ9
	ffLhIwdfHzxwrgoa98fzQy0NgQYGEY1IwSwbqS9erfP1sGxurc5fu7L0fhHX1M0fZQYgApan6gIdI
	pMWqkg5mLUvVj8+weAOqiaXqkRF+KD257pYkpoD4sawpC4QVnfCNG0cG3go3CrduwdWJpCbAxVmrI
	mLSfY/g4Pv4vTh9bwuBFouPQj1XZUDDFmIirknQXEcQLAacbyd/r14mxmEeGjFAxVJxnIu7f7UUhm
	tMmFewyw==;
Received: from ip6-localhost ([::1]:40034 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v9n4x-0087Sj-Dl; Fri, 17 Oct 2025 16:13:19 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:55621) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9n4q-0087Sc-UV
 for samba-technical@lists.samba.org; Fri, 17 Oct 2025 16:13:15 +0000
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-87bf3d1e7faso43349666d6.3
 for <samba-technical@lists.samba.org>; Fri, 17 Oct 2025 09:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760717591; x=1761322391; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OjQetjKtP2N8ZnKgF+/VCDLQar2SjrRhN3JEU0v7jTQ=;
 b=bCmrCFCzNdycw3ykgD4Mk62nqTjOMVp7IsWD7cpyOGD66P1vNhe9w5PXxSBgc8F4p8
 8Xe5wU3LhoUFLvzj7mGfXbnKrw2BdieeQuSnKovI8h6j8aAMfIKy/hCB1ihT/6wX1g2j
 u6FkZcLxZdqlM4alT0+dkAnO0Fo5LaBKyiTNfsBKJ2JugRmJjAie80i+GxXQMUdQNTWL
 ZybLMIZvnaXK+Ta+tOQ+FI8FyiOXf8u1YsuDV7+dQQqgFOtZRVK1UUH2UBjvaRYaonQZ
 9DxvPMMu9lKusWZhGTmV4g9fmisUt1oQwzGULRHhUjA4J/nVdu7sX3YVm6PmQa/MFhZ6
 3S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760717591; x=1761322391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OjQetjKtP2N8ZnKgF+/VCDLQar2SjrRhN3JEU0v7jTQ=;
 b=OXBV3CAQTu6MXygVbG4D9IHF7FtB7syQsDEi/oLj08iAK75zwCwgyxA1ITS6bciR9p
 USFTc91CL37wJIVxz9mIM9zf7HWnAVvaGiKxnxo81VY7KiJZy+TAIIvDDjFMuT8d99om
 08q3ntLqJMhH84mJAoNiHVuXiLSRUeCcpHEl5gM2gMmQUJwqaFD0pkxWaBnMW1LXYmxS
 SPMEQuGMF0hO+kWeGv+VR93hu6gwyguzWUw8VUJysXSh60FrS7SHqIXA4zjRIUoeQgRQ
 f8eoVUN2DvLgMGKf2pvgKA8XtIMr0P3xWD/btI3D/+C65J2pxaJRKbl50a/TbYjnh3MK
 GN2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrOWDB8GuTQiTFEWX0qxBhlPb5bs3v65pmUf6+pOiuGz0nBjf947521CKyLslu59KrUQYe3YM7mzVg1oUdKyM=@lists.samba.org
X-Gm-Message-State: AOJu0YwEK+39t8PHp9d+ePEPd1TtcPRb0UCIMxuJ62543he8t5AltA4h
 nMYi6G9qrRXbxUx4IGRqYRWcahLSahSti1ps97IMsEgn1hcx1T4R7r90enUkW6JJ7Kq3aAjWNTk
 m/yogqt5LwQnYBk0+mksvR1xk4/eAPpM=
X-Gm-Gg: ASbGncvpZzvCUNm/oyjL/LR5eXhuWQEDb/e6qRElPmOti0GQunDJhJxVWikS2Mpjl1b
 JlSyWkbeWWb6aPfo5bQdXTo/Jbsti40AhBrj6tSZGLwyNEsLprzwtXaSPiDCEHKS7p30Gl69G6j
 0zo26BQLjDCs67cdMTy3e0goFEtxy5nPNKwaBjXrZkAcnyQxSVY4GskCwQG2MgUrB8kGgRLgbdj
 rxlSfZ81Kr/6oGttcHUHs4y2q1gvukzpkYcPhvxiET2OEVcFXJHMpxF7LNUjxDzP4eAWju9EUos
 gHDF1K1Ewm1VnbLD8HIL1VwZokCsKLGR/tUf2TEwkR3D71h/tk8NXtyNPn8jjzD3HRj/Hh9gvSH
 WEHrzMDLQgeHT+ANO35oJpCHw7TZg+GKhvj4P8Xdjpl1MnovZ7xPHmmuBiPD2rKX9tEDNSfDk0+
 PVCTtvXQvo7A==
X-Google-Smtp-Source: AGHT+IFPgj/3I5wJOFrTttsDELhaFe1s9tLyKiAelB1Q4yJlww5/YuKcX8nISL32dOO4767+pyotyXgt7BP+A21mluA=
X-Received: by 2002:a05:6214:27e7:b0:87c:1f80:7609 with SMTP id
 6a1803df08f44-87c2063722cmr64935006d6.34.1760717590567; Fri, 17 Oct 2025
 09:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251012015738.244315-1-ebiggers@kernel.org>
 <20251014034230.GC2763@sol>
In-Reply-To: <20251014034230.GC2763@sol>
Date: Fri, 17 Oct 2025 11:12:58 -0500
X-Gm-Features: AS18NWAXgy1nFdCK093JcuNsEH8SVWOSU1ZaVUWkdPUWnKyCsTrh62MZCh2lBYs
Message-ID: <CAH2r5mtPp6yGFHipzQ6A+6Yi0FZjWZa=T=CrtALc4o6TGqF8EA@mail.gmail.com>
Subject: Re: [PATCH 0/8] smb: client: More crypto library conversions
To: Eric Biggers <ebiggers@kernel.org>
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>, Tom Talpey <tom@talpey.com>,
 linux-crypto@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> with SMB 1.0 I get "CIFS: VFS: SMB signature verification
> returned error =3D -13",

If testing SMB1 to Samba the server disabled signing unless I set
  "server signing =3D mandatory"
in smb.conf.  But with that, signing with your patches worked fine even to =
SMB1

Were you testing to Samba with SMB1?

On Mon, Oct 13, 2025 at 10:44=E2=80=AFPM Eric Biggers <ebiggers@kernel.org>=
 wrote:
>
> On Sat, Oct 11, 2025 at 06:57:30PM -0700, Eric Biggers wrote:
> > This series converts fs/smb/client/ to access SHA-512, HMAC-SHA256, MD5=
,
> > and HMAC-MD5 using the library APIs instead of crypto_shash.
> >
> > This simplifies the code significantly.  It also slightly improves
> > performance, as it eliminates unnecessary overhead.
> >
> > Tested with Samba with all SMB versions, with mfsymlinks in the mount
> > options, 'server min protocol =3D NT1' and 'server signing =3D required=
' in
> > smb.conf, and doing a simple file data and symlink verification test.
> > That seems to cover all the modified code paths.
> >
> > However, with SMB 1.0 I get "CIFS: VFS: SMB signature verification
> > returned error =3D -13", regardless of whether this series is applied o=
r
> > not.  Presumably, testing that case requires some other setting I
> > couldn't find.
> >
> > Regardless, these are straightforward conversions and all the actual
> > crypto is exactly the same as before, as far as I can tell.
> >
> > Eric Biggers (8):
> >   smb: client: Use SHA-512 library for SMB3.1.1 preauth hash
> >   smb: client: Use HMAC-SHA256 library for key generation
> >   smb: client: Use HMAC-SHA256 library for SMB2 signature calculation
> >   smb: client: Use MD5 library for M-F symlink hashing
> >   smb: client: Use MD5 library for SMB1 signature calculation
> >   smb: client: Use HMAC-MD5 library for NTLMv2
> >   smb: client: Remove obsolete crypto_shash allocations
> >   smb: client: Consolidate cmac(aes) shash allocation
>
> As requested off-list, here are some (micro)benchmark results for this
> series.  The CPU was AMD Ryzen 9 9950X.  The server was Samba running on
> localhost.  Message signing was enabled.  A valid username and password
> were given in the mount options.  The "Improvement" column is the
> percent change in throughput (reciprocal cycles):
>
>            Microbenchmark               Before      After   Improvement
>            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D               =3D=
=3D=3D=3D=3D=3D      =3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>     1. Total cycles spent in             44548      20081      122%
>     smb311_update_preauth_hash()
>     during SMB 3.1.1 mount
>     (4 calls total)
>
>     2. setup_ntlmv2_rsp() cycles         31777      22231       43%
>
>     3. Total cycles spent in             17802      22876      -22%
>     generate_key()
>     during SMB 3.1.1 mount
>     (3 calls total)
>
>     4. Total cycles spent in            205110      87204      135%
>     smb2_calc_signature()
>     during SMB 2.0 mount
>     (26 calls & 3316 bytes total)
>
>     5. Total cycles spent in          22689767   21043125        8%
>     smb2_calc_signature()
>     reading 10MB file using SMB 2.0
>     (316 calls & 10031077 bytes total)
>
>     6. Total cycles spent in             56803      37840       50%
>     cifs_calc_signature()
>     during SMB 1.0 mount
>     (18 calls & 1551 bytes total)
>
>     7. Total cycles spent in          52669066   51974573        1%
>     cifs_calc_signature()
>     reading 10MB file using SMB 1.0
>     (336 calls & 10021426 bytes total)
>
>     8. parse_mf_symlink() cycles          7654       4902       56%
>
> Note: case 3 regressed because the "cmac(aes)" allocation moved from
> smb311_update_preauth_hash (case 1) to generate_key (case 3).  Excluding
> that allocation, generate_key got faster.  Likewise, the sum of cases 1,
> 2, and 3 (which all occurred at mount time) got faster.
>
> There was a greater speedup in signature calculation than I expected.
> It's probably because many SMB messages are short (especially the ones
> exchanged at mount time), and also because the old code allocated new
> crypto_shash objects more frequently than I had thought.  The SMB 2.0
> code allocated a new "hmac(sha256)" crypto_shash for every other message
> signed.  That overhead is all gone after switching to the library.
>
> TLDR: all SMB crypto calculations (SHA-512, HMAC-SHA256, MD5, HMAC-MD5)
> affected by this series are faster now.  The library APIs fix the
> unnecessary overhead that the traditional crypto API has.  Of course,
> it's also a lot easier to use as well.
>
> - Eric
>


--=20
Thanks,

Steve

