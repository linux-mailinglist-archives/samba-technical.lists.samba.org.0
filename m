Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B745F4ECE
	for <lists+samba-technical@lfdr.de>; Wed,  5 Oct 2022 05:31:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=AhtD3Nxeo233ijtaBGAkFch/kfp5ptj7ps5Ve0jS3rE=; b=xZZzCKLfZfuzhLv2JXPngqBMSN
	hSn54NsHOhab7wMJnQPjMk7bEBApyI/85mB+ysgh1lTCyNy1RyxV5bS2op9PIzvH8AEtX+SPqGthr
	smpwizI3CcWy6JJFGkYdi0/0H8e0M5OXexfPl0h4rXfuwhA3jNlsY1OVxZoeXpkzFxFASc3KVLtrA
	TQjCZWxsmP5MSt2ct9rVFpMa8vzUPBB7bukHtmCHzgPgz4UGt/p6HiUYn9Df4jC0OgfnjGb11o7Qr
	736wyMcqFTKJri27TXRkN6qoIwBXQGTDLkUKgcPQDSDecrQZSi5U7cOArrcDwGPzNS+nE8nkikSZR
	DU1RiXKA==;
Received: from ip6-localhost ([::1]:26518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ofv7G-0000Zo-FV; Wed, 05 Oct 2022 03:30:38 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33471) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ofv78-0000Zd-Fx
 for samba-technical@lists.samba.org; Wed, 05 Oct 2022 03:30:35 +0000
Received: by mail-ej1-x630.google.com with SMTP id lt21so7520736ejb.0
 for <samba-technical@lists.samba.org>; Tue, 04 Oct 2022 20:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AhtD3Nxeo233ijtaBGAkFch/kfp5ptj7ps5Ve0jS3rE=;
 b=PwXAORUakcWhQUOq+9BdIiqm5+8hgckUXnhGYtenuGEQKFD2WR5BXzI0aZjcNWIcW2
 MLfOfhA+zo30sbiASXK/KLXM7FVB5qiT46CvHWSYUYXZIUCwbK8JUuWjm8j1dqxJnfaO
 /nvIQ4pO5tXkPmtMW1vMP8jbeiHjGBgtPJVfICYQYeZUbBdxblgGPg0ofZDan4t6vOhp
 luGdjgmmxpJ+ExWCcy6VEx4YfvNhXk5ezdF/APujX0Xj4TsXwz5o3WUacfKba0nHvGId
 tGi/n/EKJUpVUzgz8LTcQyCO2q2fBEEAnWBYPYHfNthW7BfVU+1wKMcg3ZYDDrqXzu35
 YUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AhtD3Nxeo233ijtaBGAkFch/kfp5ptj7ps5Ve0jS3rE=;
 b=sk0bpLrhU48apFENJEk63+tNSDCESFDl2jLrm7qGj02bulM3NpC3/BM3VP6xvULtZa
 x8L5CK9jv+lj5L+x9iWKokqd33UC8etd3aifYtDYWbOEh9BGaFK+YheP1HYK60gZVN/O
 D8rOxixZLIQyCql8arKgI/iC+xxEyUbPEIOFx8uBcz7SfyuC+YLcSeqOTCNy53a/2FJV
 o72/ZKpxjbvbwcE57cjM476IYfPhJwu4Peo4Ef24wkbz0Q7mv3y+jOevFHSbVJBXXLsF
 sUUl5t40nHigVZk32iifJGJB6bmKA4Cc81mdXoKo/s5f3O56Znl0vbgogRxGThXyujA8
 dyiw==
X-Gm-Message-State: ACrzQf32jR/I7rTLLfcXj5a4LDYJ9+981tFR+ho9pa0jTFHHfBSmTUmJ
 3hm5jlarP/F1rh809JUaX/xB0GthFlU92ZuPb8c=
X-Google-Smtp-Source: AMsMyM5A5Rg0fahdHRX2NmyF9xDhTtT+izdF3OpQ519ZZD4mACJaPW88EtlUSodvSQxp8WVYYjo2cDNK1yEUWgDtkB8=
X-Received: by 2002:a17:907:7b95:b0:731:113a:d7a2 with SMTP id
 ne21-20020a1709077b9500b00731113ad7a2mr21333233ejc.377.1664940624371; Tue, 04
 Oct 2022 20:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <YzzjKyHDuFoQAVCu@work>
In-Reply-To: <YzzjKyHDuFoQAVCu@work>
Date: Wed, 5 Oct 2022 13:30:11 +1000
Message-ID: <CAN05THRcwWjJiYyBdVuVZrvqgK4VP7LKiNQ=XVMg5oOy5u9kzg@mail.gmail.com>
Subject: Re: [PATCH][next] cifs: Replace a couple of one-element arrays with
 flexible-array members
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, Paulo Alcantara <pc@cjr.nz>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 5 Oct 2022 at 12:31, Gustavo A. R. Silva <gustavoars@kernel.org> wrote:
>
> One-element arrays are deprecated, and we are replacing them with flexible
> array members instead. So, replace one-element arrays with flexible-array
> member in structs negotiate_req and extended_response, and refactor the
> rest of the code, accordingly.
>
> Also, make use of the DECLARE_FLEX_ARRAY() helper to declare flexible
> array member EncryptionKey in union u. This new helper allows for
> flexible-array members in unions.
>
> Change pointer notation to proper array notation in a call to memcpy()
> where flexible-array member DialectsArray is being used as destination
> argument.
>
> Important to mention is that doing a build before/after this patch results
> in no binary output differences.

Looks good to me.
Reviewed-by me

Thanks for verifying that it does not change the binary utput.

>
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
>
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/229
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  fs/cifs/cifspdu.h | 7 ++++---
>  fs/cifs/cifssmb.c | 2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/fs/cifs/cifspdu.h b/fs/cifs/cifspdu.h
> index aeba371c4c70..d1abaeea974a 100644
> --- a/fs/cifs/cifspdu.h
> +++ b/fs/cifs/cifspdu.h
> @@ -483,7 +483,7 @@ put_bcc(__u16 count, struct smb_hdr *hdr)
>  typedef struct negotiate_req {
>         struct smb_hdr hdr;     /* wct = 0 */
>         __le16 ByteCount;
> -       unsigned char DialectsArray[1];
> +       unsigned char DialectsArray[];
>  } __attribute__((packed)) NEGOTIATE_REQ;
>
>  #define MIN_TZ_ADJ (15 * 60) /* minimum grid for timezones in seconds */
> @@ -508,13 +508,14 @@ typedef struct negotiate_rsp {
>         __u8 EncryptionKeyLength;
>         __u16 ByteCount;
>         union {
> -               unsigned char EncryptionKey[1]; /* cap extended security off */
> +               /* cap extended security off */
> +               DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
>                 /* followed by Domain name - if extended security is off */
>                 /* followed by 16 bytes of server GUID */
>                 /* then security blob if cap_extended_security negotiated */
>                 struct {
>                         unsigned char GUID[SMB1_CLIENT_GUID_SIZE];
> -                       unsigned char SecurityBlob[1];
> +                       unsigned char SecurityBlob[];
>                 } __attribute__((packed)) extended_response;
>         } __attribute__((packed)) u;
>  } __attribute__((packed)) NEGOTIATE_RSP;
> diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
> index 7aa91e272027..7a808e41b1b8 100644
> --- a/fs/cifs/cifssmb.c
> +++ b/fs/cifs/cifssmb.c
> @@ -465,7 +465,7 @@ CIFSSMBNegotiate(const unsigned int xid,
>         for (i = 0; i < CIFS_NUM_PROT; i++) {
>                 size_t len = strlen(protocols[i].name) + 1;
>
> -               memcpy(pSMB->DialectsArray+count, protocols[i].name, len);
> +               memcpy(&pSMB->DialectsArray[count], protocols[i].name, len);
>                 count += len;
>         }
>         inc_rfc1001_len(pSMB, count);
> --
> 2.34.1
>

