Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 098093BF8B
	for <lists+samba-technical@lfdr.de>; Tue, 11 Jun 2019 00:35:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LltCkFa1Ze/Y4zpwPdj13U8xPludj7nW69ZTQKnjQ/c=; b=zSvfNUDfErVIoaFlRfhla+jOYe
	HgX6NQMRZHb3/BJIvuEKWwDMtDNQFqRROsmBeEnwqW4ezDvRfyJZd+8DZ6UmWmuqax+OA6oRyr+z/
	U4k0FlJLf0Rtvy6s8QnprKbJ5w7j+HwNStEcVoIWJeyHtr2KPlK9LAD8+6jE9Y5zpNkLqkxQ83IwO
	/USRf8D4CfBFz5Rn+d3Ajqv+9THMp2kxfCco2eTYT2YZqE1+MwJwEZCCJ5qwlL4S38cPWigrHMDRf
	BBILj94DRor4GMIaJuv5I+dzPT48UeM4h9vDxgKALw4KmP/sa9Gej+hVegzNWEjk/2VlteoRW4cuW
	Fyq541PQ==;
Received: from localhost ([::1]:35482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1haSs2-000qIW-OC; Mon, 10 Jun 2019 22:34:30 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41537) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1haSrx-000qIP-JP
 for samba-technical@lists.samba.org; Mon, 10 Jun 2019 22:34:28 +0000
Received: by mail-pl1-x644.google.com with SMTP id s24so4199038plr.8
 for <samba-technical@lists.samba.org>; Mon, 10 Jun 2019 15:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LltCkFa1Ze/Y4zpwPdj13U8xPludj7nW69ZTQKnjQ/c=;
 b=DQ4y7H8NAoFD1uMt0X6/xqy9D9T856vOQJUZBX8kJkf4swAypCn0w+VqY5un+ITg9X
 vNJknlUEfDK89i7bKKWTtVd9e8EEhqgYU3nbbHTU4wmsYFrTtCQ4dtDD0V6m+1aG1arY
 4ZkdCTIfoJ89EoW9/BEIlNdj7YT/u5aL2oELQMKjRyipeXQaQuki3yIcz17QhrsNjk9n
 cXnRkCZ2THQP91+vDUgzYrI8rHL6EjpYP7U9OFFwRJmtrrGLFzJjXHsxKJomh0es0MW8
 NARuhGfH9mYOFa6UUHBZhGgIsoVtPs8ffbVUGKscsS+JKF5wbUnk+3kwYKfoGUjmbdRc
 TG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LltCkFa1Ze/Y4zpwPdj13U8xPludj7nW69ZTQKnjQ/c=;
 b=tsHUAeifYxugCG0BJK4YRMB1Y5J/QH+E/Mnn9ki/85RNT4Bcgjjj4K09W/wiU9rutT
 JQACUQqfRj47fU5Etr/vrBW/HF0J/5/jrF5bPhEaThSSLYR1fmo3rrYBlfgJs0S3ANKc
 juV9CXn4JMJUw2pAGAEQgCu9WkWW+tjVag5bKipNkN7+9dvBs/6Xjo/K3Kz0oMZfiKhB
 xta2KWfzeIC7OyWT+xjmxQ1tbICn9iydNjs1jYHSNkweo4z7IdEGJ7TnEkCLzmtCL47c
 sK1h2L+3E088CnN25+Kb5Ab2VHInkN3fyBuU/YuJG4kUNjgnsm78rMVjUWK2EiO+avic
 2lZw==
X-Gm-Message-State: APjAAAXCzSBlyuHBpjRjg9fyt1o0UlYu2R5hQ5JMyGKcfa2TMiI2gXQI
 etb35b+ZkiPUpWkA7TKdm00pOs0ZnmOGoqYm5rMWcQ==
X-Google-Smtp-Source: APXvYqw4d3HTRzqmMNVNij6rrvTWf9IaW5h2WQFQYqGWufziPztL/xWqsl2ETT6Z4nKxlXzA0ycmZ+3+sj6/avkZOrY=
X-Received: by 2002:a17:902:f087:: with SMTP id
 go7mr46693130plb.330.1560206061580; 
 Mon, 10 Jun 2019 15:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvA3t2Nm4F=LuBwHkN+E19pHuiLaSv0JV9SMNYvZrxAiQ@mail.gmail.com>
 <CAKywueTTp_jQqhND0gpLhffNeXudPUjkWHGEze33+=6oVWhLpw@mail.gmail.com>
In-Reply-To: <CAKywueTTp_jQqhND0gpLhffNeXudPUjkWHGEze33+=6oVWhLpw@mail.gmail.com>
Date: Mon, 10 Jun 2019 17:34:09 -0500
Message-ID: <CAH2r5mvo5YbDd5Pqu6XcMBAW+4rPX0ZZU9RBj=NWLEFTp4L+-w@mail.gmail.com>
Subject: Re: [SMB3.1.1] Faster crypto (GCM) for Linux kernel SMB3.1.1 mounts
To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000146d99058affc878"
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000146d99058affc878
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Updated the patch with Pavel's suggestion and added reviewed by and
repushed to cifs-2.6.git for-next.

On Mon, Jun 10, 2019 at 2:19 PM Pavel Shilovsky
<pavel.shilovsky@gmail.com> wrote:
>
> =D0=BF=D1=82, 7 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 13:23, Steve Fren=
ch via samba-technical
> <samba-technical@lists.samba.org>:
> >
> > I am seeing more than double the performance of copy to Samba on
> > encrypted mount with this two patch set, and 80%+ faster on copy from
> > Samba server (when running Ralph's GCM capable experimental branch of
> > Samba)
> >
> > Patches to update the kernel client (cifs.ko) attached:
> >
> > --
> > Thanks,
> >
> > Steve
>
>
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -3324,7 +3324,7 @@ smb2_dir_needs_close(struct cifsFileInfo *cfile)
>
>  static void
>  fill_transform_hdr(struct smb2_transform_hdr *tr_hdr, unsigned int orig_=
len,
> -                  struct smb_rqst *old_rq)
> +                  struct smb_rqst *old_rq, struct TCP_Server_Info *serve=
r)
>  {
>         struct smb2_sync_hdr *shdr =3D
>                         (struct smb2_sync_hdr *)old_rq->rq_iov[0].iov_bas=
e;
> @@ -3333,7 +3333,10 @@ fill_transform_hdr(struct smb2_transform_hdr
> *tr_hdr, unsigned int orig_len,
>         tr_hdr->ProtocolId =3D SMB2_TRANSFORM_PROTO_NUM;
>         tr_hdr->OriginalMessageSize =3D cpu_to_le32(orig_len);
>         tr_hdr->Flags =3D cpu_to_le16(0x01);
> -       get_random_bytes(&tr_hdr->Nonce, SMB3_AES128CCM_NONCE);
> +       if (server->cipher_type =3D=3D SMB2_ENCRYPTION_AES128_GCM)
>
> We only use server->cipher_type here and below. Let's pass just this
> integer instead of whole server pointer to fill_transform_hdr then
>
> +               get_random_bytes(&tr_hdr->Nonce, SMB3_AES128GCM_NONCE);
> +       else
> +               get_random_bytes(&tr_hdr->Nonce, SMB3_AES128CCM_NONCE);
>         memcpy(&tr_hdr->SessionId, &shdr->SessionId, 8);
>  }
>
> @@ -3491,8 +3494,13 @@ crypt_message(struct TCP_Server_Info *server,
> int num_rqst,
>                 rc =3D -ENOMEM;
>                 goto free_sg;
>         }
> -       iv[0] =3D 3;
> -       memcpy(iv + 1, (char *)tr_hdr->Nonce, SMB3_AES128CCM_NONCE);
> +
> +       if (server->cipher_type =3D=3D SMB2_ENCRYPTION_AES128_GCM)
> +               memcpy(iv, (char *)tr_hdr->Nonce, SMB3_AES128GCM_NONCE);
> +       else {
> +               iv[0] =3D 3;
> +               memcpy(iv + 1, (char *)tr_hdr->Nonce, SMB3_AES128CCM_NONC=
E);
> +       }
>
>         aead_request_set_crypt(req, sg, sg, crypt_len, iv);
>         aead_request_set_ad(req, assoc_data_len);
>
> Other than the note above looks good.
>
> --
> Best regards,
> Pavel Shilovskiy



--=20
Thanks,

Steve

--000000000000146d99058affc878
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0006-Add-SMB3.1.1-GCM-crypto-to-the-encrypt-and-decrypt-f.patch"
Content-Disposition: attachment; 
	filename="0006-Add-SMB3.1.1-GCM-crypto-to-the-encrypt-and-decrypt-f.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jwqydzbw0>
X-Attachment-Id: f_jwqydzbw0

RnJvbSAxMjBhZTg1YzBlMDQxZDVjNmVkMmNhNWFkYjM3MDIyNmJkZDk4NGUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IEZyaSwgNyBKdW4gMjAxOSAxNToxNjoxMCAtMDUwMApTdWJqZWN0OiBbUEFUQ0ggNi83
XSBBZGQgU01CMy4xLjEgR0NNIGNyeXB0byB0byB0aGUgZW5jcnlwdCBhbmQgZGVjcnlwdAogZnVu
Y3Rpb25zCgpTTUIzLjEuMSBHQ00gcGVyZm9ybXMgbXVjaCBiZXR0ZXIgdGhhbiB0aGUgb2xkZXIg
Q0NNIGRlZmF1bHQ6Cm1vcmUgdGhhbiB0d2ljZSBhcyBmYXN0IGluIHRoZSB3cml0ZSBwYXRjaCAo
Y29weSB0byB0aGUgU2FtYmEKc2VydmVyIG9uIGxvY2FsaG9zdCBmb3IgZXhhbXBsZSkgYW5kIDgw
JSBmYXN0ZXIgb24gdGhlIHJlYWQKcGF0Y2ggKGNvcHkgZnJvbSB0aGUgc2VydmVyKS4KClNpZ25l
ZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KUmV2aWV3ZWQt
Ynk6IFJvbm5pZSBTYWhsYmVyZyA8bHNhaGxiZXJAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFBh
dmVsIFNoaWxvdnNreSA8cHNoaWxvdkBtaWNyb3NvZnQuY29tPgotLS0KIGZzL2NpZnMvc21iMm9w
cy5jICAgICAgIHwgMTggKysrKysrKysrKysrKy0tLS0tCiBmcy9jaWZzL3NtYjJ0cmFuc3BvcnQu
YyB8IDEwICsrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9jaWZzL3NtYjJvcHMuYyBiL2ZzL2NpZnMvc21i
Mm9wcy5jCmluZGV4IDdmYTk1OTI5YzhmYy4uYThlMjhiOTU1YzY5IDEwMDY0NAotLS0gYS9mcy9j
aWZzL3NtYjJvcHMuYworKysgYi9mcy9jaWZzL3NtYjJvcHMuYwpAQCAtMzMyNCw3ICszMzI0LDcg
QEAgc21iMl9kaXJfbmVlZHNfY2xvc2Uoc3RydWN0IGNpZnNGaWxlSW5mbyAqY2ZpbGUpCiAKIHN0
YXRpYyB2b2lkCiBmaWxsX3RyYW5zZm9ybV9oZHIoc3RydWN0IHNtYjJfdHJhbnNmb3JtX2hkciAq
dHJfaGRyLCB1bnNpZ25lZCBpbnQgb3JpZ19sZW4sCi0JCSAgIHN0cnVjdCBzbWJfcnFzdCAqb2xk
X3JxKQorCQkgICBzdHJ1Y3Qgc21iX3Jxc3QgKm9sZF9ycSwgX19sZTE2IGNpcGhlcl90eXBlKQog
ewogCXN0cnVjdCBzbWIyX3N5bmNfaGRyICpzaGRyID0KIAkJCShzdHJ1Y3Qgc21iMl9zeW5jX2hk
ciAqKW9sZF9ycS0+cnFfaW92WzBdLmlvdl9iYXNlOwpAQCAtMzMzMyw3ICszMzMzLDEwIEBAIGZp
bGxfdHJhbnNmb3JtX2hkcihzdHJ1Y3Qgc21iMl90cmFuc2Zvcm1faGRyICp0cl9oZHIsIHVuc2ln
bmVkIGludCBvcmlnX2xlbiwKIAl0cl9oZHItPlByb3RvY29sSWQgPSBTTUIyX1RSQU5TRk9STV9Q
Uk9UT19OVU07CiAJdHJfaGRyLT5PcmlnaW5hbE1lc3NhZ2VTaXplID0gY3B1X3RvX2xlMzIob3Jp
Z19sZW4pOwogCXRyX2hkci0+RmxhZ3MgPSBjcHVfdG9fbGUxNigweDAxKTsKLQlnZXRfcmFuZG9t
X2J5dGVzKCZ0cl9oZHItPk5vbmNlLCBTTUIzX0FFUzEyOENDTV9OT05DRSk7CisJaWYgKGNpcGhl
cl90eXBlID09IFNNQjJfRU5DUllQVElPTl9BRVMxMjhfR0NNKQorCQlnZXRfcmFuZG9tX2J5dGVz
KCZ0cl9oZHItPk5vbmNlLCBTTUIzX0FFUzEyOEdDTV9OT05DRSk7CisJZWxzZQorCQlnZXRfcmFu
ZG9tX2J5dGVzKCZ0cl9oZHItPk5vbmNlLCBTTUIzX0FFUzEyOENDTV9OT05DRSk7CiAJbWVtY3B5
KCZ0cl9oZHItPlNlc3Npb25JZCwgJnNoZHItPlNlc3Npb25JZCwgOCk7CiB9CiAKQEAgLTM0OTEs
OCArMzQ5NCwxMyBAQCBjcnlwdF9tZXNzYWdlKHN0cnVjdCBUQ1BfU2VydmVyX0luZm8gKnNlcnZl
ciwgaW50IG51bV9ycXN0LAogCQlyYyA9IC1FTk9NRU07CiAJCWdvdG8gZnJlZV9zZzsKIAl9Ci0J
aXZbMF0gPSAzOwotCW1lbWNweShpdiArIDEsIChjaGFyICopdHJfaGRyLT5Ob25jZSwgU01CM19B
RVMxMjhDQ01fTk9OQ0UpOworCisJaWYgKHNlcnZlci0+Y2lwaGVyX3R5cGUgPT0gU01CMl9FTkNS
WVBUSU9OX0FFUzEyOF9HQ00pCisJCW1lbWNweShpdiwgKGNoYXIgKil0cl9oZHItPk5vbmNlLCBT
TUIzX0FFUzEyOEdDTV9OT05DRSk7CisJZWxzZSB7CisJCWl2WzBdID0gMzsKKwkJbWVtY3B5KGl2
ICsgMSwgKGNoYXIgKil0cl9oZHItPk5vbmNlLCBTTUIzX0FFUzEyOENDTV9OT05DRSk7CisJfQog
CiAJYWVhZF9yZXF1ZXN0X3NldF9jcnlwdChyZXEsIHNnLCBzZywgY3J5cHRfbGVuLCBpdik7CiAJ
YWVhZF9yZXF1ZXN0X3NldF9hZChyZXEsIGFzc29jX2RhdGFfbGVuKTsKQEAgLTM1OTIsNyArMzYw
MCw3IEBAIHNtYjNfaW5pdF90cmFuc2Zvcm1fcnEoc3RydWN0IFRDUF9TZXJ2ZXJfSW5mbyAqc2Vy
dmVyLCBpbnQgbnVtX3Jxc3QsCiAJfQogCiAJLyogZmlsbCB0aGUgMXN0IGlvdiB3aXRoIGEgdHJh
bnNmb3JtIGhlYWRlciAqLwotCWZpbGxfdHJhbnNmb3JtX2hkcih0cl9oZHIsIG9yaWdfbGVuLCBv
bGRfcnEpOworCWZpbGxfdHJhbnNmb3JtX2hkcih0cl9oZHIsIG9yaWdfbGVuLCBvbGRfcnEsIHNl
cnZlci0+Y2lwaGVyX3R5cGUpOwogCiAJcmMgPSBjcnlwdF9tZXNzYWdlKHNlcnZlciwgbnVtX3Jx
c3QsIG5ld19ycSwgMSk7CiAJY2lmc19kYmcoRllJLCAiRW5jcnlwdCBtZXNzYWdlIHJldHVybmVk
ICVkXG4iLCByYyk7CmRpZmYgLS1naXQgYS9mcy9jaWZzL3NtYjJ0cmFuc3BvcnQuYyBiL2ZzL2Np
ZnMvc21iMnRyYW5zcG9ydC5jCmluZGV4IGQxMTgxNTcyNzU4Yi4uMWNjYmNmOWMyYzNiIDEwMDY0
NAotLS0gYS9mcy9jaWZzL3NtYjJ0cmFuc3BvcnQuYworKysgYi9mcy9jaWZzL3NtYjJ0cmFuc3Bv
cnQuYwpAQCAtNzM0LDcgKzczNCwxMCBAQCBzbWIzX2NyeXB0b19hZWFkX2FsbG9jYXRlKHN0cnVj
dCBUQ1BfU2VydmVyX0luZm8gKnNlcnZlcikKIAlzdHJ1Y3QgY3J5cHRvX2FlYWQgKnRmbTsKIAog
CWlmICghc2VydmVyLT5zZWNtZWNoLmNjbWFlc2VuY3J5cHQpIHsKLQkJdGZtID0gY3J5cHRvX2Fs
bG9jX2FlYWQoImNjbShhZXMpIiwgMCwgMCk7CisJCWlmIChzZXJ2ZXItPmNpcGhlcl90eXBlID09
IFNNQjJfRU5DUllQVElPTl9BRVMxMjhfR0NNKQorCQkJdGZtID0gY3J5cHRvX2FsbG9jX2FlYWQo
ImdjbShhZXMpIiwgMCwgMCk7CisJCWVsc2UKKwkJCXRmbSA9IGNyeXB0b19hbGxvY19hZWFkKCJj
Y20oYWVzKSIsIDAsIDApOwogCQlpZiAoSVNfRVJSKHRmbSkpIHsKIAkJCWNpZnNfZGJnKFZGUywg
IiVzOiBGYWlsZWQgdG8gYWxsb2MgZW5jcnlwdCBhZWFkXG4iLAogCQkJCSBfX2Z1bmNfXyk7CkBA
IC03NDQsNyArNzQ3LDEwIEBAIHNtYjNfY3J5cHRvX2FlYWRfYWxsb2NhdGUoc3RydWN0IFRDUF9T
ZXJ2ZXJfSW5mbyAqc2VydmVyKQogCX0KIAogCWlmICghc2VydmVyLT5zZWNtZWNoLmNjbWFlc2Rl
Y3J5cHQpIHsKLQkJdGZtID0gY3J5cHRvX2FsbG9jX2FlYWQoImNjbShhZXMpIiwgMCwgMCk7CisJ
CWlmIChzZXJ2ZXItPmNpcGhlcl90eXBlID09IFNNQjJfRU5DUllQVElPTl9BRVMxMjhfR0NNKQor
CQkJdGZtID0gY3J5cHRvX2FsbG9jX2FlYWQoImdjbShhZXMpIiwgMCwgMCk7CisJCWVsc2UKKwkJ
CXRmbSA9IGNyeXB0b19hbGxvY19hZWFkKCJjY20oYWVzKSIsIDAsIDApOwogCQlpZiAoSVNfRVJS
KHRmbSkpIHsKIAkJCWNyeXB0b19mcmVlX2FlYWQoc2VydmVyLT5zZWNtZWNoLmNjbWFlc2VuY3J5
cHQpOwogCQkJc2VydmVyLT5zZWNtZWNoLmNjbWFlc2VuY3J5cHQgPSBOVUxMOwotLSAKMi4yMC4x
Cgo=
--000000000000146d99058affc878--

