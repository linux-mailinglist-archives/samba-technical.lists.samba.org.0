Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8882784E547
	for <lists+samba-technical@lfdr.de>; Thu,  8 Feb 2024 17:44:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Bn99mLYfBA4B9quQ0tHmCrwkV7dDVY8lFI/viLoh/Io=; b=DKZdYkDe3pSIXzbcUH6QnBb89z
	LA8V7kntarMTvKN4QRGlPUCPSZEVhiFAl3xu+D/rTbUg98ZYZyqwyc5HpbZlhD3VY/q3IhCMqPuLo
	CCfx+4JMbM+wlluUTKRXUveObzf0fg7M5V7QSYP5t3tEikVDbmZ25SLM9TpQ+LRj0hW6Uu4xqK5DB
	AEvWGkC4Zdv7+nZUVoD4sm5TfG0hnjHvmyUJ6wo6zjBH6dLfKvcoAQ2tP2A/pxSahz2qpINlkqOvK
	LtN+IINL90Zy0hwPW5t20pslBAt1YsHAEyFnUexMRy/nNJUsOYrKiHZxNSAveK+8yRaDU2kzc0zHs
	HhIbT1ng==;
Received: from ip6-localhost ([::1]:25878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rY7VT-007tyv-EA; Thu, 08 Feb 2024 16:44:11 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:46534) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rY7VP-007tyn-UL
 for samba-technical@lists.samba.org; Thu, 08 Feb 2024 16:44:09 +0000
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5116b017503so1960086e87.1
 for <samba-technical@lists.samba.org>; Thu, 08 Feb 2024 08:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707410647; x=1708015447; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bn99mLYfBA4B9quQ0tHmCrwkV7dDVY8lFI/viLoh/Io=;
 b=biuT9k0IU3nWDCwofz74hLoRzf5yNnITCe+kUynSEpNSLsuj7MR6bnnX6bITyhdv8m
 gE/oHvke/QpVhJD4jCcFQ4spXE253AMmXFJM/8Ma5pr1RhnjODQnYoW3drqhebYJkOQ6
 F0uyuY/2v5hdkHajMWgYnLuShRXRBGBZLMuxgKPF26kSfrJ18nN9qMUgzMpzQXe8qjNA
 /fXpgIlhtt6QMHld98wK5VDTIpQyqUqFbGTjPedQm5TxUW7UzFcWm/3tSpHjovbrSZYQ
 9EFsmZ3i6osbafZsHFmH7d8Y4GskJPuC/tpcdkdXWkbM0mweIIo6+e3UEl1EoBamdxDK
 qWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707410647; x=1708015447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bn99mLYfBA4B9quQ0tHmCrwkV7dDVY8lFI/viLoh/Io=;
 b=f2MKBw1aPeUZqy2A4NVAIDp5x6eBEjy6//p6plTC3L/pjZNu1ryy2+/N9fJYCR1rwb
 wywRTZMU9LhrXdjwC4xAnekA/ikK6o+TSXtQTZPSIYeXyMGc6uH4RR3ZaDfnO8aO90yh
 tuo5Axkct4RSUpKEdcA0oui7MoxtyzeW5qzHYKIng9uXSz68cF5h1Sq8+rf0CalXoXPv
 5Ucds1EJANM7bNGPvqhcRV4fV4pjx6JhPLsNWjIE7K/tmezAl8eON0Tt45cG+0x5C205
 d14RNjRILWuPW1rvMRAIFI0XHUUA6Um9f+maOJX7IBRc7mmFTczosrE74rd0IfaAG3Md
 fofQ==
X-Gm-Message-State: AOJu0YyKcapYzgOL6YnyH6M3omWQH6iSWA62M78pRwQK4jXyBp/rDL0m
 RAqrd6FivpKEfYK+BE89Kkoz4heJ2dcXCxl3HSmU8wge0/ruvi/y7X4A0srplpLM28kwfLlPw0T
 yusbcHjDDqC4ndt8SIdoeMtWUQmA=
X-Google-Smtp-Source: AGHT+IHDXo7hJEjVCsdZUNorRY4OQ9Cn2/PoeJI4ym3rhvQ0Vw3q1GxEdBhqZFZaCNzfLJ2xNYz6jBwmY+C6jKCkF48=
X-Received: by 2002:ac2:4116:0:b0:511:617a:3130 with SMTP id
 b22-20020ac24116000000b00511617a3130mr4671813lfi.35.1707410646485; Thu, 08
 Feb 2024 08:44:06 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mutYBiXyBnMWKF66DGrKHd7=ypsPGcg_XSrJW=JykNBbQ@mail.gmail.com>
In-Reply-To: <CAH2r5mutYBiXyBnMWKF66DGrKHd7=ypsPGcg_XSrJW=JykNBbQ@mail.gmail.com>
Date: Thu, 8 Feb 2024 22:13:55 +0530
Message-ID: <CANT5p=qRUd3w6E9v7zhLjmtTkQkM_fgoPqH=QNDF4dOoePwXTg@mail.gmail.com>
Subject: Re: [PATCH][smb client] updating warning message for sec=krb5p
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Feb 7, 2024 at 11:38=E2=80=AFAM Steve French <smfrench@gmail.com> w=
rote:
>
>     smb3: clarify mount warning
>
>     When a user tries to use the "sec=3Dkrb5p" mount parameter to encrypt
>     data on connection to a server (when authenticating with Kerberos), w=
e
>     indicate that it is not supported, but do not note the equivalent
>     recommended mount parameter ("sec=3Dkrb5,seal") which turns on encryp=
tion
>     for that mount (and uses Kerberos for auth).  Without an updated
> mount warning
>     it could confuse some NFS users.   Note that for SMB3+ we support
> encryption,
>     but consider it ("seal") a distinct mount parameter since the same
> user may choose
>     to encrypt to one share but not another from the same client.
> Update the warning message
>     to reduce confusion.
>
>     See attached.
> --
> Thanks,
>
> Steve

Looks good to me.

--=20
Regards,
Shyam

