Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E37BDBC9D
	for <lists+samba-technical@lfdr.de>; Wed, 15 Oct 2025 01:25:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kf2pDAfVjngTpkzODXnMwe0Da3237xRoCmOAzAJbeTc=; b=X+80u6lM9sfITTWhU9dIUv5dsn
	gEjQOkc3RLsMpMKgkr2mCbQ29EXs0nAjjS85TYWM0W9wF5PS4tdRrUo9l0AsLTdNS3S1PfFWZT3O5
	V057C/jeHgG/v3Fni18pjjdIkTGwDcZmyXtE5pOP5hFAeO/osktLHZhpmbp1XmZKesdl8ZxTwG/0I
	q5IT5QcE2c6HHn3ITZHuh8TeNzjMhblP1zm2K0O9lYND4t8DpBCJTVqzAQJp0Y0VJGooOn1w257Qv
	P5JeI3hweHLV3FdZfSCh+65S+OQsM0OgwyTBc29K2Zb+9tiKjkp6+mVSRiS19USdwW+bsTgiXIAWQ
	F3nnzXVQ==;
Received: from ip6-localhost ([::1]:44218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v8oOR-007mmf-Hs; Tue, 14 Oct 2025 23:25:23 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:42426) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v8oOL-007mmX-HX
 for samba-technical@lists.samba.org; Tue, 14 Oct 2025 23:25:20 +0000
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-8738c6fdbe8so6012726d6.1
 for <samba-technical@lists.samba.org>; Tue, 14 Oct 2025 16:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760484315; x=1761089115; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kf2pDAfVjngTpkzODXnMwe0Da3237xRoCmOAzAJbeTc=;
 b=WGi/Xjcr3zSMIGn+97mjiWVF4c+Mg7MT7DAbuvf4LdCL84NAb/3rIbuGlJwwjUHPU3
 Nh0LsAhV+ab4dMJpVPANXxQ0HiNYSgnc5HnnGBE8SEFr8c1RrQUPsEaI15pPg5bjf21i
 byUMlwuGoJ//qvF4XnP5oNg5bVNJ0ToUvDop85hM9Nwap0Lgruj3mW+bm+YCJly+L0kQ
 aOKyqPuWVt7GFwbGVG0FKVbzzYrYP+PtRavrC8pcqJNeyB+UAH4XU+R6HMmjkF301y5m
 b1Zh76x9RlkRFpDPKnz9+luivtzkfFZGGCtZTtmMvizLboVK96RCc1P2cL/Nde+1TPWS
 Y2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760484315; x=1761089115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kf2pDAfVjngTpkzODXnMwe0Da3237xRoCmOAzAJbeTc=;
 b=mCbWQ75EnOlSbHQ+5X1g+dkfCNQLsqBIvkMmcdVlFps4otXMmFeG8WV58BN5tqQdpG
 V+zit08OUBl9sUMqmVdh98ksaB0rlAGrb+Ca178eJ/CsnLcNhmH2+GE3Z3w9kUFZJvAb
 Bj+h5YFXQIty6vdnUqbBBo8J5G+8Ho+KF3tV46IPFPFgAv9OhXNpgtwtF4jb4ky12obv
 b0F77xalW9n9WHfiUEt8faRUWkkRZXX5QuxmX+KrnmgoqiPn3VUNxrrkrxyerIEVaUK9
 C2k8NUY8AkaXUme2JW/Z8Eol1uGRqVriEnFoxXOb/jI9jqvYHKdH/evCz7kVjNFuK1vv
 RBiQ==
X-Gm-Message-State: AOJu0YztjTW1M/8L0enLSu/mqAW6klXzrv3o1W1Bluw1Izq28aJg5SIN
 6+Fz8yX+AtnvytmXpm+6oFLKSm2dl5EAxmvBtONEAuUlCrInlvaHozyHCfRryI5a11qDdtVcmWc
 4uShpr9FjBnxCkiLO6SL0AKgs/BHSxlQPmg==
X-Gm-Gg: ASbGncu6sIJYT+Kspmc10CrYwQ5O3T4ZkjUI+suldDwen3eRmE6g1fCjnMUoH3vTFhR
 qDEFSQ8ZS6PiMwhkof+awiZjeGXXNTDLg8c48tAH0GB4WnRsv/f9G7Nmy+A9w5DMpyo1pH1iMHb
 sSqqQ1G6wrxmGbSzklcQmrS/Qs1Ma21hd9vceVseb8OY3LiPPcIcFsU2jHuBK449tzODF0jaVBN
 SxcQNxk0HO6vjJSlHQ2bfnRPXTJX18zoLIDaAtZcDV3A+SNQNTBu/YF387deGKAx7O6NUtNnbRg
 +bY5zKQsLL/zj7bM98My6WBwSWNh1oZiAesGnMkyxMhNWD2bGb51vLuIfT3bpjphSexWOERqqPf
 OC3xjmJ8TkHzpvItBnf+spHJMSe8Jj7arITKLG9ZAHGw2d74ubw==
X-Google-Smtp-Source: AGHT+IGhOjo2tt/E54qCy7T45XT65HNL1+mWVXmj0qI/0XpYaTiuuMZ2Wznu7wTOpdkqZ5zJu8fHUjR4U3NVNcxxv/w=
X-Received: by 2002:ad4:5ccd:0:b0:87b:b679:167b with SMTP id
 6a1803df08f44-87bb6791d98mr254917486d6.33.1760484315513; Tue, 14 Oct 2025
 16:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251014231759.136630-1-ebiggers@kernel.org>
In-Reply-To: <20251014231759.136630-1-ebiggers@kernel.org>
Date: Tue, 14 Oct 2025 18:25:04 -0500
X-Gm-Features: AS18NWCwTXgSEy-D8Bgt4esOjJoQx31sKEYEozCJ_QKBcZVRkt2wPJhyVw-YdHs
Message-ID: <CAH2r5mu6p+FGXb2aW2dkm2B9XOuSDnMc+eOMxtRV8JrYrd5X3g@mail.gmail.com>
Subject: Fwd: [PATCH 0/3] ksmbd: More crypto library conversions
To: CIFS <linux-cifs@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Adding linux-cifs mailing lists for more visibility to these changes

---------- Forwarded message ---------
From: Eric Biggers <ebiggers@kernel.org>
Date: Tue, Oct 14, 2025 at 6:18=E2=80=AFPM
Subject: [PATCH 0/3] ksmbd: More crypto library conversions
To: <linux-cifs@vger.kernel.org>, Namjae Jeon <linkinjeon@kernel.org>,
Steve French <smfrench@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey
<tom@talpey.com>, <linux-crypto@vger.kernel.org>,
<linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>


This series converts fs/smb/server/ to access SHA-512, HMAC-SHA256, and
HMAC-MD5 using the library APIs instead of crypto_shash.

This simplifies the code significantly.  It also slightly improves
performance, as it eliminates unnecessary overhead.  I haven't done
server-specific benchmarks, but you can get an idea of what to expect by
looking at the numbers I gave for the similar client-side series:
https://lore.kernel.org/linux-cifs/20251014034230.GC2763@sol/

No change in behavior intended.  All the crypto computations should be
the same as before.  I haven't tested this series (I did test the
similar client-side series), but everything should still work.

Eric Biggers (3):
  ksmbd: Use SHA-512 library for SMB3.1.1 preauth hash
  ksmbd: Use HMAC-SHA256 library for message signing and key generation
  ksmbd: Use HMAC-MD5 library for NTLMv2

 fs/smb/server/Kconfig      |   6 +-
 fs/smb/server/auth.c       | 390 +++++++------------------------------
 fs/smb/server/auth.h       |  10 +-
 fs/smb/server/crypto_ctx.c |  24 ---
 fs/smb/server/crypto_ctx.h |  15 +-
 fs/smb/server/server.c     |   4 -
 fs/smb/server/smb2pdu.c    |  26 +--
 fs/smb/server/smb_common.h |   2 +-
 8 files changed, 87 insertions(+), 390 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
--
2.51.0



--=20
Thanks,

Steve

