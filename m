Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD043BCBC
	for <lists+samba-technical@lfdr.de>; Mon, 10 Jun 2019 21:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3c8rhFJE14sMpTTc89Hz57tyhVCoAB2/e1RKeHiyLVI=; b=lh6wTsv85+2mpPuAw/gvbZVbfi
	m/SXhEXD0VOsqTyb7f4sQhRj+Rxz4yIZAHAGht0vSGAOWDEjvfEV0g9mFgo0KdcS+sJFD1WJyryHV
	K2lSZP2EFUGxVT2Gm4ErA/9Jff55cTLu+tdPbR5evjnc9vWb+tN4mi5ZT4vcAQhNUVJmsosLf+CWD
	u4py/9kpCKiY9P/y/Kge3WQguowQgDta8wcpXITL2kr5hcmm/1Ts1NKsVeCCbogY45HYpQFBWhZcr
	a/Un/8j4d4sWA+3HPjtIcvwm5LcvdwqyUXYd2HqbrGlGnY+KCmcy6hGX2xrKZfm09LM2PyoMNwQPT
	a80//VmA==;
Received: from localhost ([::1]:32060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1haPpB-000pbv-CJ; Mon, 10 Jun 2019 19:19:21 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:46321) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1haPp7-000pbn-3P
 for samba-technical@lists.samba.org; Mon, 10 Jun 2019 19:19:19 +0000
Received: by mail-lj1-x236.google.com with SMTP id v24so4718517ljg.13
 for <samba-technical@lists.samba.org>; Mon, 10 Jun 2019 12:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3c8rhFJE14sMpTTc89Hz57tyhVCoAB2/e1RKeHiyLVI=;
 b=GbeyrCeD+ICYA9A1mM+GsGYjoYY2ApUxmWtx4k5c8rXjgjRrzNDqI/lKQXvGbOvInk
 1Bs5QQZC2oYXrVikNbLPGrjHBYMBnoTP8E+KTBIffL+G4o5b6jEiHqwD3UwmSVWuzbmx
 Du7I5jMhKvcGPgeLxIddG6AF2g1ACr9Lk7yah/5yHzgVhO9D/XLiGkK2PLgYQeR0vPXu
 JLC1ZJ31kNxn+o8+vDZKASKLFkjdLIYfT2p7rFfACXicHbJuS+ewrI5a8M6fzl5rr2wA
 Ij8fW4BrrUnNIwJU3jWc20HiJkHOL45xLFDhSsjbMqtP1exKchpcrjbfWBO8fhWx66QA
 IuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3c8rhFJE14sMpTTc89Hz57tyhVCoAB2/e1RKeHiyLVI=;
 b=mPQn8Re7S9Ip/vP2jMP2MqfddUNu4Zd0wPVyez6qzhjYVGYe8/3VkMHqiI0OdGdPCj
 /6nxEu+maGds1U2BrvbjfHDPt8t6fiV0etUFrdqBwM7cDllWO0TZCXqIAKVxVXpa1IOA
 phYv6yOltaJP2cSpULpa7QU6L2I5DRZyyE5gptUIwPUleTKeKEEO4kB7CXOZPUZiz9Zl
 8Sb31xW21PFDDKvmGeKY+JJlq6CDkWCN+mUrF1aO54LlSQrE+OJIHwko4OzKnNMasxaz
 0PW+WuRAAlrdUpg0PTDtx1zkQD3bJ9mtP30IG69Wl8irjD0ly3LrDUC+gMJLF95vmLCb
 l3bA==
X-Gm-Message-State: APjAAAXBPy95ZNcuILlJ7gt5CQ2n6EzzA55/qDP8ZiUsSwjZeTRngbUT
 Fz+DsgusyqaxhiWLOmDsAKQQJI+Q9a1fZoQmsA==
X-Google-Smtp-Source: APXvYqwrLQ7AV7CFM9xhrtFsTzHPL7DUncCaEc2S0ccmGZviuhfUK+VAeEptKTKO1dAwjUSxc4aufapVYMJkZqawP2c=
X-Received: by 2002:a2e:a318:: with SMTP id l24mr25289379lje.36.1560194356061; 
 Mon, 10 Jun 2019 12:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvA3t2Nm4F=LuBwHkN+E19pHuiLaSv0JV9SMNYvZrxAiQ@mail.gmail.com>
In-Reply-To: <CAH2r5mvA3t2Nm4F=LuBwHkN+E19pHuiLaSv0JV9SMNYvZrxAiQ@mail.gmail.com>
Date: Mon, 10 Jun 2019 12:19:04 -0700
Message-ID: <CAKywueTTp_jQqhND0gpLhffNeXudPUjkWHGEze33+=6oVWhLpw@mail.gmail.com>
Subject: Re: [SMB3.1.1] Faster crypto (GCM) for Linux kernel SMB3.1.1 mounts
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=BF=D1=82, 7 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 13:23, Steve French=
 via samba-technical
<samba-technical@lists.samba.org>:
>
> I am seeing more than double the performance of copy to Samba on
> encrypted mount with this two patch set, and 80%+ faster on copy from
> Samba server (when running Ralph's GCM capable experimental branch of
> Samba)
>
> Patches to update the kernel client (cifs.ko) attached:
>
> --
> Thanks,
>
> Steve


--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -3324,7 +3324,7 @@ smb2_dir_needs_close(struct cifsFileInfo *cfile)

 static void
 fill_transform_hdr(struct smb2_transform_hdr *tr_hdr, unsigned int orig_le=
n,
-                  struct smb_rqst *old_rq)
+                  struct smb_rqst *old_rq, struct TCP_Server_Info *server)
 {
        struct smb2_sync_hdr *shdr =3D
                        (struct smb2_sync_hdr *)old_rq->rq_iov[0].iov_base;
@@ -3333,7 +3333,10 @@ fill_transform_hdr(struct smb2_transform_hdr
*tr_hdr, unsigned int orig_len,
        tr_hdr->ProtocolId =3D SMB2_TRANSFORM_PROTO_NUM;
        tr_hdr->OriginalMessageSize =3D cpu_to_le32(orig_len);
        tr_hdr->Flags =3D cpu_to_le16(0x01);
-       get_random_bytes(&tr_hdr->Nonce, SMB3_AES128CCM_NONCE);
+       if (server->cipher_type =3D=3D SMB2_ENCRYPTION_AES128_GCM)

We only use server->cipher_type here and below. Let's pass just this
integer instead of whole server pointer to fill_transform_hdr then

+               get_random_bytes(&tr_hdr->Nonce, SMB3_AES128GCM_NONCE);
+       else
+               get_random_bytes(&tr_hdr->Nonce, SMB3_AES128CCM_NONCE);
        memcpy(&tr_hdr->SessionId, &shdr->SessionId, 8);
 }

@@ -3491,8 +3494,13 @@ crypt_message(struct TCP_Server_Info *server,
int num_rqst,
                rc =3D -ENOMEM;
                goto free_sg;
        }
-       iv[0] =3D 3;
-       memcpy(iv + 1, (char *)tr_hdr->Nonce, SMB3_AES128CCM_NONCE);
+
+       if (server->cipher_type =3D=3D SMB2_ENCRYPTION_AES128_GCM)
+               memcpy(iv, (char *)tr_hdr->Nonce, SMB3_AES128GCM_NONCE);
+       else {
+               iv[0] =3D 3;
+               memcpy(iv + 1, (char *)tr_hdr->Nonce, SMB3_AES128CCM_NONCE)=
;
+       }

        aead_request_set_crypt(req, sg, sg, crypt_len, iv);
        aead_request_set_ad(req, assoc_data_len);

Other than the note above looks good.

--
Best regards,
Pavel Shilovskiy

