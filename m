Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E9B28785
	for <lists+samba-technical@lfdr.de>; Fri, 15 Aug 2025 23:12:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3DJoGGrFBhwvjJCwPcmRNJiUDZVY0CjWxj9AGCQt4eI=; b=KUBBKPWpofSUETHaHMswV/EiFz
	SY3x2zpD0g34lRGZam9yzZZ/m7xrNt0hYX++0tP6fvxoijzPm7tfGOGdBL5/l4GEl7ZWl8sAv4RGV
	7/SR5h/4CrtAwSgtjZRMVQZpbyQ1RKCM4jrTPUvsFLPtrOR86j6AHDiksDAL7dQsJAlQW/owlIZU6
	vTMd0Z9S2kWe1WMN4byOgbK5mAvup0gDsShFwcV41uNWxl5z9MFSg1b2isMJ1BJ6S/V/L7/uxs4aU
	6q73qnbS9krvB4RNxg301lWtdWTpO3pQK+2ZQhkoaZY5BGbOVnuwdyjRMaKBxasJGpl5vkYhQTOVp
	+wmBy3WA==;
Received: from ip6-localhost ([::1]:42612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1un1in-00F6F7-NE; Fri, 15 Aug 2025 21:12:21 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:54564) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1un1ij-00F6F0-9A
 for samba-technical@lists.samba.org; Fri, 15 Aug 2025 21:12:19 +0000
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-70ba7aa13b3so10700676d6.1
 for <samba-technical@lists.samba.org>; Fri, 15 Aug 2025 14:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755292335; x=1755897135; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3DJoGGrFBhwvjJCwPcmRNJiUDZVY0CjWxj9AGCQt4eI=;
 b=P6Xfdpt8Ju8IshdjUmqo9wRtqJNcNUpO2ITuE98VdExW36w67c9hW+3o6hGVs6AH+9
 JMfeTSIMJd7wk5eLfx5weMg94al4a3ya1qnE7uKSFFZHWiLU+3lLpyH0cNzMwA+z5wNj
 tOz91BdxFtl6se0X5ffRYdv4ewX5NYmrXpAVmtZJlsKMF1Q/2rf4cR6DNZCA6/nt6YAU
 CI1QlTnck2lRm9EytBDhZQPDvf/rcS3v8JehD5Jggl2qRluslVIDIKkpiDnkAecscNKV
 gs3l39qciifR0mGOtdz4IrqFDyr/EpPZtQXxoJqc/dFhn6URhms1ZNmpA8JpFiuZM0j9
 HaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755292335; x=1755897135;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3DJoGGrFBhwvjJCwPcmRNJiUDZVY0CjWxj9AGCQt4eI=;
 b=FCpu/V1wyxqsVBObmqhBq0k5naADWKDaG0qqWgvGgEWp7zh2tRZ8mkEhsl+hZYqjc9
 f9G9d3AxO4BqIJK9irxKVa5qbMB/l3nv8/D3QwMr8+fhEAxm70LYHZGy3qYokzEk+C3L
 au1Zvw0RFVrX451+eaYaTkRS4I1EnVSv5bD9iTXPFMaO/kuZr7i500Ts72lu0Fr4wi26
 R3M203O7JRJ4lkj7uAfUkGBqRnjjlBEZXQ+mkOK850O0t0o3J0S6Whh+18+TushpHfDV
 Y9XQduTLp7VBIoQp9/rkT0G6usejbNcbQP72a1IRp+JACoiPr9SBlQSJ7YCfXT2pvruW
 fqzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTIH+tq7UlrUMeb9dJxYhOLd3SRJBkZ8Q9UM6ElJQ8ZTqTzdlyXe96g6KSqCNSaODYECYxFkZztmmArkZiGtY=@lists.samba.org
X-Gm-Message-State: AOJu0YxXl9veEcpdlW7eay4BLI+8JSqgf3KnmZcBl1TcqCvVJ84uU9HB
 KBIf0WYuj2UpnsVG/6DsowUbPa1as1nTpIF/YcrfgzMSJDWQtlXu1fkTfMbx2CNoQWRlEDHxGLA
 TOBmwYSwT+FLHwCtKH83kjV2202ntGDeXIQ==
X-Gm-Gg: ASbGncvjNMSckJWy1hkPwLko1ejMVOhrTa4PS60Ec/gL+bICOOmXb2CfXcxpoZhieue
 OrUaQQ7q8Op5bYrx5zebMtWSBVs5TgNFf410ew/U2DHaWUHY+CEYbozqSDIKD6CtHkuFPuX4rM4
 KeCGAoo1pzjWT+e7BEpMzPQBhgRY0pfLG7sDeTm6d18bsWSvnm9hVK4MRapjz7p1XooN3dy05zO
 LDGaqPGWcb6WJt1ZDTl9m6Ob0jDq9dJWm1ZxGvMqg==
X-Google-Smtp-Source: AGHT+IFeWW8F4H1/r2bbnw+xoqhpkhJJpvyu598+Y97r9BYEdPe60r4jFePeG3o6fttD4c9SqTuL/CLbK9j92XVuNrE=
X-Received: by 2002:ad4:58e5:0:b0:70b:aff7:3548 with SMTP id
 6a1803df08f44-70baff73588mr6674066d6.22.1755292335325; Fri, 15 Aug 2025
 14:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250812164546.29238-1-metze@samba.org>
 <cwxjlestdk3u5u6cqrr7cpblkfrwwx3obibhuk2wnu4ttneofm@y3fg6wpvooev>
 <706b8f8e-57f2-4d34-a6f8-c672c921e4f2@samba.org>
 <CAH2r5mvtxMnwdgz15RrSZj_Kut9WVLGK+WRGUGQD1Rs_MJEWbA@mail.gmail.com>
 <0bcae9fe-1dff-4530-875b-fe917af5b649@samba.org>
 <CAH2r5mtas+irtVpkkCYRLyXpPknXqbAiN9gdupo-5z=YbFepTQ@mail.gmail.com>
 <5c1a0969-1757-46c2-ba88-a5db75f76d78@samba.org>
In-Reply-To: <5c1a0969-1757-46c2-ba88-a5db75f76d78@samba.org>
Date: Fri, 15 Aug 2025 16:12:01 -0500
X-Gm-Features: Ac12FXx0raouwueAB8eaW5_Zv1MEWAJFFYedNi6HBNy5Q8kiXnsbsdIIakcbX3k
Message-ID: <CAH2r5mud9vmRxkxxJb6hGAJnzceVhqLo8ewqu4fOcQ3UV3nFuw@mail.gmail.com>
Subject: Re: [PATCH] smb: server: split ksmbd_rdma_stop_listening() out of
 ksmbd_rdma_destroy()
To: Stefan Metzmacher <metze@samba.org>
Content-Type: multipart/mixed; boundary="000000000000203c3d063c6dd824"
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
Cc: Tom Talpey <tom@talpey.com>, Pedro Falcato <pfalcato@suse.de>,
 samba-technical@lists.samba.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000203c3d063c6dd824
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

updated ksmbd-for-next (also can see attached patch)

On Fri, Aug 15, 2025 at 1:54=E2=80=AFPM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Am 15.08.25 um 20:52 schrieb Steve French:
> >> Maybe also remove the 'return;' from the inline ksmbd_rdma_destroy fun=
ction?
> >
> > Done (updated cifs-2.6.git for-next with attached)
> >
> > It does look a little strange that a trailing ';' is only after the
> > ksmbd_rdma_stop_listening() line - is that intentional
> >
> > diff --git a/fs/smb/server/transport_rdma.h b/fs/smb/server/transport_r=
dma.h
> > index 77aee4e5c9dc..ce3c88a45875 100644
> > --- a/fs/smb/server/transport_rdma.h
> > +++ b/fs/smb/server/transport_rdma.h
> > @@ -54,13 +54,15 @@ struct smb_direct_data_transfer {
> >
> >   #ifdef CONFIG_SMB_SERVER_SMBDIRECT
> >   int ksmbd_rdma_init(void);
> > +void ksmbd_rdma_stop_listening(void);
> >   void ksmbd_rdma_destroy(void);
> >   bool ksmbd_rdma_capable_netdev(struct net_device *netdev);
> >   void init_smbd_max_io_size(unsigned int sz);
> >   unsigned int get_smbd_max_read_write_size(void);
> >   #else
> >   static inline int ksmbd_rdma_init(void) { return 0; }
> > -static inline int ksmbd_rdma_destroy(void) { return 0; }
> > +static inline void ksmbd_rdma_stop_listening(void) { };
> > +static inline void ksmbd_rdma_destroy(void) { }
>
> No it needs to be just { } in both cases.
>
> Thanks!
> metze
>
>


--=20
Thanks,

Steve

--000000000000203c3d063c6dd824
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb-server-split-ksmbd_rdma_stop_listening-out-of-ks.patch"
Content-Disposition: attachment; 
	filename="0001-smb-server-split-ksmbd_rdma_stop_listening-out-of-ks.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_medbpc2c0>
X-Attachment-Id: f_medbpc2c0

RnJvbSA0NzNiMWYyMGY1OTE5Y2E1OGRlZWEyZDIzZDM5Zjc1YjExYWVmODMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEub3JnPgpE
YXRlOiBUdWUsIDEyIEF1ZyAyMDI1IDE4OjQ1OjQ2ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gc21i
OiBzZXJ2ZXI6IHNwbGl0IGtzbWJkX3JkbWFfc3RvcF9saXN0ZW5pbmcoKSBvdXQgb2YKIGtzbWJk
X3JkbWFfZGVzdHJveSgpCgpXZSBjYW4ndCBjYWxsIGRlc3Ryb3lfd29ya3F1ZXVlKHNtYl9kaXJl
Y3Rfd3EpOyBiZWZvcmUgc3RvcF9zZXNzaW9ucygpIQoKT3RoZXJ3aXNlIGFscmVhZHkgZXhpc3Rp
bmcgY29ubmVjdGlvbnMgdHJ5IHRvIHVzZSBzbWJfZGlyZWN0X3dxIGFzCmEgTlVMTCBwb2ludGVy
LgoKQ2M6IE5hbWphZSBKZW9uIDxsaW5raW5qZW9uQGtlcm5lbC5vcmc+CkNjOiBTdGV2ZSBGcmVu
Y2ggPHNtZnJlbmNoQGdtYWlsLmNvbT4KQ2M6IFRvbSBUYWxwZXkgPHRvbUB0YWxwZXkuY29tPgpD
YzogbGludXgtY2lmc0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IHNhbWJhLXRlY2huaWNhbEBsaXN0cy5z
YW1iYS5vcmcKRml4ZXM6IDA2MjZlNjY0MWY2YiAoImNpZnNkOiBhZGQgc2VydmVyIGhhbmRsZXIg
Zm9yIGNlbnRyYWwgcHJvY2Vzc2luZyBhbmQgdHJhbnBvcnQgbGF5ZXJzIikKU2lnbmVkLW9mZi1i
eTogU3RlZmFuIE1ldHptYWNoZXIgPG1ldHplQHNhbWJhLm9yZz4KQWNrZWQtYnk6IE5hbWphZSBK
ZW9uIDxsaW5raW5qZW9uQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8
c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9zbWIvc2VydmVyL2Nvbm5lY3Rpb24uYyAg
ICAgfCAzICsrLQogZnMvc21iL3NlcnZlci90cmFuc3BvcnRfcmRtYS5jIHwgNSArKysrLQogZnMv
c21iL3NlcnZlci90cmFuc3BvcnRfcmRtYS5oIHwgNCArKystCiAzIGZpbGVzIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9zbWIvc2VydmVy
L2Nvbm5lY3Rpb24uYyBiL2ZzL3NtYi9zZXJ2ZXIvY29ubmVjdGlvbi5jCmluZGV4IDNmMDRhMjk3
N2JhOC4uNjdjNGY3MzM5OGRmIDEwMDY0NAotLS0gYS9mcy9zbWIvc2VydmVyL2Nvbm5lY3Rpb24u
YworKysgYi9mcy9zbWIvc2VydmVyL2Nvbm5lY3Rpb24uYwpAQCAtNTA0LDcgKzUwNCw4IEBAIHZv
aWQga3NtYmRfY29ubl90cmFuc3BvcnRfZGVzdHJveSh2b2lkKQogewogCW11dGV4X2xvY2soJmlu
aXRfbG9jayk7CiAJa3NtYmRfdGNwX2Rlc3Ryb3koKTsKLQlrc21iZF9yZG1hX2Rlc3Ryb3koKTsK
Kwlrc21iZF9yZG1hX3N0b3BfbGlzdGVuaW5nKCk7CiAJc3RvcF9zZXNzaW9ucygpOworCWtzbWJk
X3JkbWFfZGVzdHJveSgpOwogCW11dGV4X3VubG9jaygmaW5pdF9sb2NrKTsKIH0KZGlmZiAtLWdp
dCBhL2ZzL3NtYi9zZXJ2ZXIvdHJhbnNwb3J0X3JkbWEuYyBiL2ZzL3NtYi9zZXJ2ZXIvdHJhbnNw
b3J0X3JkbWEuYwppbmRleCA4ZDM2NmRiNWY2MDUuLjU0NjZhYThjMzliMSAxMDA2NDQKLS0tIGEv
ZnMvc21iL3NlcnZlci90cmFuc3BvcnRfcmRtYS5jCisrKyBiL2ZzL3NtYi9zZXJ2ZXIvdHJhbnNw
b3J0X3JkbWEuYwpAQCAtMjE5NCw3ICsyMTk0LDcgQEAgaW50IGtzbWJkX3JkbWFfaW5pdCh2b2lk
KQogCXJldHVybiAwOwogfQogCi12b2lkIGtzbWJkX3JkbWFfZGVzdHJveSh2b2lkKQordm9pZCBr
c21iZF9yZG1hX3N0b3BfbGlzdGVuaW5nKHZvaWQpCiB7CiAJaWYgKCFzbWJfZGlyZWN0X2xpc3Rl
bmVyLmNtX2lkKQogCQlyZXR1cm47CkBAIC0yMjAzLDcgKzIyMDMsMTAgQEAgdm9pZCBrc21iZF9y
ZG1hX2Rlc3Ryb3kodm9pZCkKIAlyZG1hX2Rlc3Ryb3lfaWQoc21iX2RpcmVjdF9saXN0ZW5lci5j
bV9pZCk7CiAKIAlzbWJfZGlyZWN0X2xpc3RlbmVyLmNtX2lkID0gTlVMTDsKK30KIAordm9pZCBr
c21iZF9yZG1hX2Rlc3Ryb3kodm9pZCkKK3sKIAlpZiAoc21iX2RpcmVjdF93cSkgewogCQlkZXN0
cm95X3dvcmtxdWV1ZShzbWJfZGlyZWN0X3dxKTsKIAkJc21iX2RpcmVjdF93cSA9IE5VTEw7CmRp
ZmYgLS1naXQgYS9mcy9zbWIvc2VydmVyL3RyYW5zcG9ydF9yZG1hLmggYi9mcy9zbWIvc2VydmVy
L3RyYW5zcG9ydF9yZG1hLmgKaW5kZXggNzdhZWU0ZTVjOWRjLi5hMjI5MWI3NzQ4OGEgMTAwNjQ0
Ci0tLSBhL2ZzL3NtYi9zZXJ2ZXIvdHJhbnNwb3J0X3JkbWEuaAorKysgYi9mcy9zbWIvc2VydmVy
L3RyYW5zcG9ydF9yZG1hLmgKQEAgLTU0LDEzICs1NCwxNSBAQCBzdHJ1Y3Qgc21iX2RpcmVjdF9k
YXRhX3RyYW5zZmVyIHsKIAogI2lmZGVmIENPTkZJR19TTUJfU0VSVkVSX1NNQkRJUkVDVAogaW50
IGtzbWJkX3JkbWFfaW5pdCh2b2lkKTsKK3ZvaWQga3NtYmRfcmRtYV9zdG9wX2xpc3RlbmluZyh2
b2lkKTsKIHZvaWQga3NtYmRfcmRtYV9kZXN0cm95KHZvaWQpOwogYm9vbCBrc21iZF9yZG1hX2Nh
cGFibGVfbmV0ZGV2KHN0cnVjdCBuZXRfZGV2aWNlICpuZXRkZXYpOwogdm9pZCBpbml0X3NtYmRf
bWF4X2lvX3NpemUodW5zaWduZWQgaW50IHN6KTsKIHVuc2lnbmVkIGludCBnZXRfc21iZF9tYXhf
cmVhZF93cml0ZV9zaXplKHZvaWQpOwogI2Vsc2UKIHN0YXRpYyBpbmxpbmUgaW50IGtzbWJkX3Jk
bWFfaW5pdCh2b2lkKSB7IHJldHVybiAwOyB9Ci1zdGF0aWMgaW5saW5lIGludCBrc21iZF9yZG1h
X2Rlc3Ryb3kodm9pZCkgeyByZXR1cm4gMDsgfQorc3RhdGljIGlubGluZSB2b2lkIGtzbWJkX3Jk
bWFfc3RvcF9saXN0ZW5pbmcodm9pZCkgeyB9CitzdGF0aWMgaW5saW5lIHZvaWQga3NtYmRfcmRt
YV9kZXN0cm95KHZvaWQpIHsgfQogc3RhdGljIGlubGluZSBib29sIGtzbWJkX3JkbWFfY2FwYWJs
ZV9uZXRkZXYoc3RydWN0IG5ldF9kZXZpY2UgKm5ldGRldikgeyByZXR1cm4gZmFsc2U7IH0KIHN0
YXRpYyBpbmxpbmUgdm9pZCBpbml0X3NtYmRfbWF4X2lvX3NpemUodW5zaWduZWQgaW50IHN6KSB7
IH0KIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGdldF9zbWJkX21heF9yZWFkX3dyaXRlX3Np
emUodm9pZCkgeyByZXR1cm4gMDsgfQotLSAKMi40My4wCgo=
--000000000000203c3d063c6dd824--

