Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E11AC7490
	for <lists+samba-technical@lfdr.de>; Thu, 29 May 2025 01:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sWIKgijIfdRYSEDTEWEUg18jVcSU4vq11C7yRdLHgtc=; b=hCmRAUuMJqPjtUkvWsZww4V4/o
	PyKDtkYYvaTly1Qpuldqv1X1WSwB/h2X4NI8tTV6sFHmdkssQb6x/LweRfmAutv6MGbJ4O4rC9VI3
	S/ZGlaYKob4EHcIjQMoeIjldLTRnrxH9SKd/7kBnTueuFlR8xvYz6ukZJiGoOKWW6GahtE/FXZRNh
	umP3wqbaSvxYTqaNvmnWsrb7YjAiPTd0XSxba9wr7ceTWeyzNTAI6eXFnZA6pBmP+IIUM6ohPRqTB
	CwAmYbjkRN/xM4KdPmkQVbuBQEzMccZnQ4UJQewnvebIXzNchUDNkOmZglel6hyKcQfVjbhwYIMwk
	DgJa845g==;
Received: from ip6-localhost ([::1]:57470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uKQTL-004Osm-0K; Wed, 28 May 2025 23:46:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3]:33974) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKQTD-004Osf-Vb
 for samba-technical@lists.samba.org; Wed, 28 May 2025 23:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B4103A4FB90
 for <samba-technical@lists.samba.org>; Wed, 28 May 2025 23:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F9EC4AF09
 for <samba-technical@lists.samba.org>; Wed, 28 May 2025 23:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748474946;
 bh=zneln3AVy9GzuOLcazXpnBiKXS/mH1mKIHA9Be7pcss=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dOrRZSAMqZhXxwF/jsjqg2S2ZiDgJDft1w1k6clZhNEJ80+/9lvW9zuHT3Ggbgk+0
 iKujcHg2pozwS+1IP6pgAYa47s5vPAU5rVLrG0e4ZzLRrVLa+MHvWr1QK+lKoFDFsu
 unFKAZBVX685o5K6iV6nt189f4EhyXK4E/+Ci7Vbtw8i7q4I/C6v+0+0yczIrYdkV3
 kpBsWvP7SspXrsyL2Ghl5UDiQagPG18QVfXIpJeTgJ4LJOHcKWXiT29CRpovp/bZrg
 x0gUBGpHJCU7PjEjAQgVDebf/u0Ob/rj/YUCx+CmxcTHmDcLDPo677Csyd4CMjLxUQ
 2e7xhPocfMqaw==
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-604630fcd3aso481047a12.1
 for <samba-technical@lists.samba.org>; Wed, 28 May 2025 16:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVjh1R93IhueyqDAO+zgbxnADCElXiEmNEpjYj6zdx8uddaKfzEn3zdA6N2m4sFlHtsImXizoAZt9sPqFbiwRA=@lists.samba.org
X-Gm-Message-State: AOJu0YzN7oyYzojRXJiE+iqY2H6biNHs9JhICU3HCXN1iAs6VBbSnngu
 Ge164y9+KOZ69TX5EP7SfS0sbmItqe+tRlUUq1+cw2VTQ5nxQvX3RJ0WNL2M9cBb3FjZp6LliMA
 P+KmB8VJrZM3k+kh6mfxU6NWeRQgVcts=
X-Google-Smtp-Source: AGHT+IEe0cGbFuMCZiSElYdmz+9UTowYbCcQ62DFXujgMwP14Iy1+SUnvNmkiO1XCPczAw0xZDfrFjwA+UtQRNVKYtI=
X-Received: by 2002:a17:907:9715:b0:ad8:8841:b393 with SMTP id
 a640c23a62f3a-ad88841b3a0mr868768166b.6.1748474944920; Wed, 28 May 2025
 16:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748446473.git.metze@samba.org>
 <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
In-Reply-To: <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
Date: Thu, 29 May 2025 08:28:53 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
X-Gm-Features: AX0GCFvWJS9sSOn1SBVoAK4aYtA1DkpHP2uL3fZYfwzQcuj0g5JuU1qeWnftKHQ
Message-ID: <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] smb: smbdirect: add smbdirect_pdu.h with
 protocol definitions
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Hyunchul Lee <hyc.lee@gmail.com>,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 29, 2025 at 1:02=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> This is just a start moving into a common smbdirect layer.
>
> It will be used in the next commits...
>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Long Li <longli@microsoft.com>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Hyunchul Lee <hyc.lee@gmail.com>
> Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>  fs/smb/common/smbdirect/smbdirect_pdu.h | 55 +++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 fs/smb/common/smbdirect/smbdirect_pdu.h
>
> diff --git a/fs/smb/common/smbdirect/smbdirect_pdu.h b/fs/smb/common/smbd=
irect/smbdirect_pdu.h
> new file mode 100644
> index 000000000000..ae9fdb05ce23
> --- /dev/null
> +++ b/fs/smb/common/smbdirect/smbdirect_pdu.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + *   Copyright (c) 2017 Stefan Metzmacher
Isn't it 2025? It looks like a typo.

And why do you split the existing one into multiple header
files(smbdirect_pdu.h, smbdirect_socket.h, smbdirect.h)?

> + */
> +
> +#ifndef __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_PDU_H__
> +#define __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_PDU_H__
> +
> +#define SMBDIRECT_V1 0x0100
> +
> +/* SMBD negotiation request packet [MS-SMBD] 2.2.1 */
> +struct smbdirect_negotiate_req {
> +       __le16 min_version;
> +       __le16 max_version;
> +       __le16 reserved;
> +       __le16 credits_requested;
> +       __le32 preferred_send_size;
> +       __le32 max_receive_size;
> +       __le32 max_fragmented_size;
> +} __packed;
> +
> +/* SMBD negotiation response packet [MS-SMBD] 2.2.2 */
> +struct smbdirect_negotiate_resp {
> +       __le16 min_version;
> +       __le16 max_version;
> +       __le16 negotiated_version;
> +       __le16 reserved;
> +       __le16 credits_requested;
> +       __le16 credits_granted;
> +       __le32 status;
> +       __le32 max_readwrite_size;
> +       __le32 preferred_send_size;
> +       __le32 max_receive_size;
> +       __le32 max_fragmented_size;
> +} __packed;
> +
> +#define SMBDIRECT_DATA_MIN_HDR_SIZE 0x14
> +#define SMBDIRECT_DATA_OFFSET       0x18
> +
> +#define SMBDIRECT_FLAG_RESPONSE_REQUESTED 0x0001
> +
> +/* SMBD data transfer packet with payload [MS-SMBD] 2.2.3 */
> +struct smbdirect_data_transfer {
> +       __le16 credits_requested;
> +       __le16 credits_granted;
> +       __le16 flags;
> +       __le16 reserved;
> +       __le32 remaining_data_length;
> +       __le32 data_offset;
> +       __le32 data_length;
> +       __le32 padding;
> +       __u8 buffer[];
> +} __packed;
> +
> +#endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_PDU_H__ */
> --
> 2.34.1
>
>

