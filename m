Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E88DAB2B346
	for <lists+samba-technical@lfdr.de>; Mon, 18 Aug 2025 23:17:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oWUVlv2pojTIZeWyJnueWXNvBqStnI18c1h6l2zfAKg=; b=YyI6SwaC5vswM5nIeD4u05VseP
	s4tfDHqoie0m6mCbdqJ2UPCzPxbObGgnS9/eC5SDJv6ctjlEIR3rd3DpVZm/JU7QICW2yVzfzpDLp
	nZbknMV79sTPYmAtAOfaCjapH9eXCUcnvvFdUj3hEUyecARP7z1ICMk3Y/LcyqNbWZqu1YK+DwocS
	zrvdCkF/d3+F+8laqy60FSQxIZJqVd9WMgVtI3BJ4FlH+RRaIoq4vNm2DD541vrFMInV5/supZEpV
	ffEIihT1mwYj6HBzkP7kLC7Cajp14lGxvhjYmqNFvRauhowG+FSwMKf/oaaZ+4ZygIR87wmyPTitF
	20IJo+zw==;
Received: from ip6-localhost ([::1]:43282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uo7Dn-00FGxV-Ea; Mon, 18 Aug 2025 21:16:51 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:61884) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uo7Dj-00FGxO-I9
 for samba-technical@lists.samba.org; Mon, 18 Aug 2025 21:16:50 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-70a9f6542f7so36311226d6.3
 for <samba-technical@lists.samba.org>; Mon, 18 Aug 2025 14:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755551805; x=1756156605; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWUVlv2pojTIZeWyJnueWXNvBqStnI18c1h6l2zfAKg=;
 b=InpoabaSN+Pc6V2TftfCKQCPuD6wggwv5Q9WoMRw+uZF2X9btkFGs4Vp+Ws4Uk8P4g
 SuutXnzMqh88gI35wUy1N360xTkaHKCoCjOFupl5AOZeyPhLb4/QDdqDkpdtQ2W4Ivag
 Xrn3LvN0bJTe+BSzTtt7cgydQ/qmTtzuOfH1e/90W8PWLXjOT5t0pgDtZZs8nxtCGqsf
 g58wY1OlmrqBYrKE2bY1Zqnll4KqZN01uo4+tBtajv860UqiM7/8voQlueuP+ThMYi2E
 7ve80qx0Sq0d4d9SK2ofUJWhChY2ROxUkIAXDmaBuau88b987NUX8e+GTtIP9ltjj7kD
 pZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755551805; x=1756156605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oWUVlv2pojTIZeWyJnueWXNvBqStnI18c1h6l2zfAKg=;
 b=Qkxm5LtFmtsjm6kGhiClQS2WVoxEUEkS1J1d7tF3sF9YBZUHSSKFJ/7Fxbhr+sKuLz
 J+7JG9G4z5ckYL/mp5FANEjIDf33B0/yWrOWDhVSFG4Z3fVWJNU3V/4hSShd/JZBdncQ
 kBXI43VvRwm8WL0kgMBjZ7vziPoUY5zRQUN5HXu4O7Qf1hVxWS+L2npI1KKNnJEoEeMf
 oOFfN6hSg4lEtjn/PA2QgqhXmCbSnsaRatkoS1rzwDNYrYrv8XTJg7v16Y4rxHwSqS/x
 X5cCOn3MTSNeoATOdQOflwEKVhFok6hGetBgHBkWnAvIcb+L/h2s/8bKCe2YSUzeWP2d
 OHqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQAvwr/0KQcsi9udLaOtydMUOU4OkpFi78iYf1+jW+KL6tkhKaTX6MyMojluT2rebmjme97nY4mWcNNSkoFEk=@lists.samba.org
X-Gm-Message-State: AOJu0Yx0nQCwV84xss1yEyvzEL5kJdmCoFTxARVemE0FUHokcpfM6CE5
 ClAP32oAJbAcAFht4CAtN9ux+0Vy1+1yccohLwVHpCAjwjbFUb+QM2HovUe1MpYpC7hgP6d+uJG
 6r1LXfzCIFWslzDRFIN4IEHmSkZh5xyg=
X-Gm-Gg: ASbGncspgVShgxpQ1D0wWKoz0ntWoFyTWE0TVFfiLo4MWCV05kyA0VIClfQ9njPDzBC
 ISxoQkHjwItlGXHTHiWa2KcVW3sRAob3sP5g2fawJ/uqcimn7S9q13LPXiRzXeDvz8Xc2gYZV4+
 cW7txK2xREjB52HkTpjmT3DBFWOQ+v3WPVAlMF2H/hwTNvhqEXS5z16YTZzhA6JxJ3m45CEhZPs
 00ge0dLOBOrBeN2mZsP1ZkjH6XIelCiWREUrVsRZ98a+HGlYKIml5/bpm9GtQ==
X-Google-Smtp-Source: AGHT+IFi2SGje0Y2893DKnfTCa0l25x98OF8buxJoMBcEXDVGk1mEhrTbgDHJ+cDcq4vBzms9t0uvv62umtFCvTw3jk=
X-Received: by 2002:a05:6214:f09:b0:70b:ab91:4c74 with SMTP id
 6a1803df08f44-70c2b6ffd83mr1701616d6.6.1755551805344; Mon, 18 Aug 2025
 14:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <c2d9d516-d203-44ff-946d-b4833019bfd5@samba.org>
In-Reply-To: <c2d9d516-d203-44ff-946d-b4833019bfd5@samba.org>
Date: Mon, 18 Aug 2025 16:16:34 -0500
X-Gm-Features: Ac12FXwFkrVY-BAQyXvf_oMhH1JOC41sBIc0ewltFj6B5gaoPGgg3m6Mz5kzkEE
Message-ID: <CAH2r5mu_Nm49VaLDvBA_n16MivzUojBBZHwQgS-JNbvL-UsMOg@mail.gmail.com>
Subject: Re: Current state of smbdirect patches
To: Stefan Metzmacher <metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> Should I post all patches including the ones already in for-next and ksmb=
d-for-next-next?
> But resorted, first all fs/smb/common/smbdirect/ patches, then
> all fs/smb/client patches and finally all fs/smb/server patches.

Yes, that sounds reasonable

> a smbdirect-for-next branch, which could be a shared ground for
> for-next (client) and ksmbd-for-next[-next] (server)?

I can do that (create an smb3-common-next, and possibly an
smb3-common-next-next branch if we need to distinguish patches for
next release vs. next rc),
but would prefer to wait until we have more of the code moved into
smb/common.  Probably reasonable to target creating that branch in a
month or two
as the common module becomes usable.


On Mon, Aug 18, 2025 at 3:25=E2=80=AFPM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi,
>
> I'm at the point where server/transport_rdma.c only has there
> local structures:
>
> struct smb_direct_device {
>          struct ib_device        *ib_dev;
>          struct list_head        list;
> };
>
> static struct smb_direct_listener {
>          struct rdma_cm_id       *cm_id;
> } smb_direct_listener;
>
> struct smb_direct_transport {
>          struct ksmbd_transport  transport;
>
>          struct smbdirect_socket socket;
> };
>
> All others are moved to smbdirect_socket.h.
>
> For the client I'm almost there I just need to
> finish the move of struct smbd_mr.
>
> Should I post all patches including the ones already in for-next and ksmb=
d-for-next-next?
> But resorted, first all fs/smb/common/smbdirect/ patches, then
> all fs/smb/client patches and finally all fs/smb/server patches.
>
> Maybe we want a smbdirect-for-next branch, which could be a shared ground=
 for
> for-next (client) and ksmbd-for-next[-next] (server)?
>
> So how should I post what I have?
>
> metze
>


--=20
Thanks,

Steve

