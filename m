Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70274B3B062
	for <lists+samba-technical@lfdr.de>; Fri, 29 Aug 2025 03:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qqP5CDhXCb3ftYNxpwkwkKBdJvB6qPfRjc3g5Hj9v5k=; b=2jfp9CLnM/12x1kubboT2H6CS3
	2uhji3RMIdfARyxVygxJwrt85xkviVPGB00o2shY/XRhkL/9n/iuKveo5dJr4N5aZcjXvq7G5YBtN
	SvGJQu/bfjcYkx0lVwzEqk/Z42dwIdIxdpzHZX+08AhI58ny1RaISybNrNmuUZSIG3A0Ii/eDfR1t
	vbqobHbCXnwgpp6vRJaw5eIvSwx2XGt4Ls2Li7f4Jg1AWh6gpG/L1LUqrmAUDJAhP2ELQSua1dgy9
	NXIqaxw138ZLVr4jZEOtwnWCqZ0fQ4FTIe8upp3NSTZEk8QYIVRCD+hXtbQIT1otJZ2rnI5l4UWKZ
	qLVzDZAg==;
Received: from ip6-localhost ([::1]:21074 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1urnpP-000j3v-9R; Fri, 29 Aug 2025 01:22:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:52042) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1urnpL-000j3n-FC
 for samba-technical@lists.samba.org; Fri, 29 Aug 2025 01:22:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7971560141
 for <samba-technical@lists.samba.org>; Fri, 29 Aug 2025 01:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0ADC4CEF8
 for <samba-technical@lists.samba.org>; Fri, 29 Aug 2025 01:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756429411;
 bh=JnjTHc4tN+fj7bTEL4vaeVKqTaIJBWp8jzHXrTlqc6o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J3fVGpMgabd0xHSNkOU7/Glp23pcZHxo4B0/Z2eXh3M08w24rnhzn/kCh53F2efwy
 qURAQZE9LKq4K2bioGolyZHbI+mj9FQ6imO1ZPCed42Vqn9bwzxVjOD0LjfhNTlM/6
 hqj8QjsCmTcs60wgMTkmI3U4o16STA0luobBtNuGUpAl8XHyI1IBPSzPuSIqoopR3I
 UtLbQYStZNzvVNLdjXtPKThSFW5vhQZSXYtJCgC9KAr4ndgNPDY6IkFftm+I2Pu0Fx
 GKMZTQXsbZGGTaaYzxVXESYef+qIEBij+LhRT4MFGMTrWbp7dMDJdoJv7vro1DvkTE
 4xREp4xA2h7NQ==
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-61cf0901a72so1285907a12.1
 for <samba-technical@lists.samba.org>; Thu, 28 Aug 2025 18:03:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVdDfYCBerH1I07i9lV0PUGBAybTw93uBkFZKo1G0PHmg7Z7foNj6n1AcJSi5p37pryhg/qqrKngaLYTGqqeNo=@lists.samba.org
X-Gm-Message-State: AOJu0YxVvHeXOCn7BEWruzyOEYK+4zrw3e1GqiIBySMoohOPUA52RC2L
 ZNA/ujGFYKhruVt5YQCaQbD07HVT6/vPFgnHuPuoWxQhQvk7j3m4QFsY8g8vDkmMWTQzGlIUUvR
 KB40sSCEOZDhK/A+9H2mLqxy1efHZSSg=
X-Google-Smtp-Source: AGHT+IEC3tzEBZVMFFl1IVXgtix0fY5IP99nyNrSk50T1sy3myoDXtbVpBcpWYLdNJsJljRKWhOMMIEUMhJmKMOqcvo=
X-Received: by 2002:a05:6402:5107:b0:61c:9970:a86a with SMTP id
 4fb4d7f45d1cf-61c9970ad16mr8655627a12.34.1756429409703; Thu, 28 Aug 2025
 18:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <8c6027ac-09dc-4ee6-ba82-4afd897dabf6@samba.org>
In-Reply-To: <8c6027ac-09dc-4ee6-ba82-4afd897dabf6@samba.org>
Date: Fri, 29 Aug 2025 10:03:17 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-TNCOd04Nw+FYhWT3inPCpQU0scT91FuM-SbahX3cRwQ@mail.gmail.com>
X-Gm-Features: Ac12FXwgjPnR8HAbaB9WFamRg7luu63RqUjZlEtl70_jCyn-9Os0DdZAWIdluog
Message-ID: <CAKYAXd-TNCOd04Nw+FYhWT3inPCpQU0scT91FuM-SbahX3cRwQ@mail.gmail.com>
Subject: Re: struct rdma_conn_param uses u8 for responder_resources,
 initiator_depth and private_data_len
To: Stefan Metzmacher <metze@samba.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Tom Talpey <tom@talpey.com>, Samba Technical <samba-technical@lists.samba.org>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 22, 2025 at 6:04=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi,
CC: Jason and Leon.
>
> this mail is triggered by the discussion in this thread on
> linux-cifs:
> https://lore.kernel.org/linux-cifs/f551bf7f-697a-4298-a62c-74da18992204@s=
amba.org/T/#t
>
> In include/rdma/rdma_cm.h we have this:
>
> struct rdma_conn_param {
>          const void *private_data;
>          u8 private_data_len;
>          u8 responder_resources;
>          u8 initiator_depth;
>          u8 flow_control;
>          u8 retry_count;         /* ignored when accepting */
>          u8 rnr_retry_count;
>          /* Fields below ignored if a QP is created on the rdma_cm_id. */
>          u8 srq;
>          u32 qp_num;
>          u32 qkey;
> };
>
> The iwarp MPA v2 negotiation can handle values up to
> 0x3fff for responder_resources and initiator_depth.
> And private_data_len can be 0xffff for MPA v1 and
> 0xffff - 4 for MPA v2.
>
> I just found that ROCE only supports u8 in the CM ConnectRequest
> (and I guess it's ROCE v1 and v2 as well as Infiniband,
> but I've only every seen ROCE v2 captures).
>
> BTW: does ROCE also support private data and if how much?
>
> So is it desired to limit iwarp to u8 values too?
>
> Thanks!
> metze

