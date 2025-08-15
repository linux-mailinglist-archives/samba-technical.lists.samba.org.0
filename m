Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6825B28444
	for <lists+samba-technical@lfdr.de>; Fri, 15 Aug 2025 18:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MQ4WuETe6+3eIFEdLKPPc4yZq7nJrF46UDBNltoe8As=; b=3Gwcc2eE6D1//Y+5EGJQFjMHCN
	6rx7krHOzoO6zp0O3b0Ih/enVLAyY0jcbURuZQHHM+8fgOBmCmcnsV/Afl0YGbIfjNCJvWiHUZzVn
	WeG1ORDUmeBX8BZd9Z+trLxAqj1ecEkyuRJDd4+cPBqSF5aOtnNq13QqgWbLcyelzah3TPm+N/Dm3
	8HjDp6n6w7TgNVOlzaoYJeX0glIlziFW08Q9HY1Eyam00Y8HLZI/wlv8lJ1/XOZsn649A1OlbeAhw
	lbZgKgyFXEsPogdRGGTpBK0T+eyzdc5t7e6SuoicDsxgLXVxfsDowpFL1H3PxZcG4pJ2dfx3y81jT
	wY6BVugw==;
Received: from ip6-localhost ([::1]:40590 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1umxfH-00F5XK-6C; Fri, 15 Aug 2025 16:52:27 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:60817) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umxfC-00F5XD-8V
 for samba-technical@lists.samba.org; Fri, 15 Aug 2025 16:52:24 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-70ba7aa136fso5573486d6.1
 for <samba-technical@lists.samba.org>; Fri, 15 Aug 2025 09:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755276739; x=1755881539; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MQ4WuETe6+3eIFEdLKPPc4yZq7nJrF46UDBNltoe8As=;
 b=EiR5Mmb+17M6678Vmc9KZpRT/10yf3+7YcB8hmR/8y/43YSZtP+9A5bNprDY9Dgkhd
 TW4nhKG5adD8H+hhN+ZDl96iJfgqsg2W0LPgnddEX8fUdpdF5LJXjcsIVyAt/QZDRqo8
 6vDD6AaxGWWoekJrlcn1FB6owAt1ZsP+PL0NaDxZ0yat3nXRIDsxxvoecB0u3B/kdX2B
 rLHA/WUh6j/3QR+JYr6UBStq4g8T2dPaoXw8aVOjPYNQxo4Ixnlha9dVP73kJg3MBTJ7
 fYSS3Z7Wd7yzVZx0fhuZNz74bMsW/V+LLUpJOqHAZIgO8eF3U6itk0lsbvVGgqwMJv3A
 sXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755276739; x=1755881539;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MQ4WuETe6+3eIFEdLKPPc4yZq7nJrF46UDBNltoe8As=;
 b=nmpnn2fdvDlaT1MVFky05LJWMysD+Sc9rGNVTIEOiprioVB1th8PyHO4VIN3v9hOeS
 jciYt/BfM+WB9Try/aKqKPVbcXq0s2jB0DRGTdrOdz0FNJO8tHAPt+pzxqoOmyL5gYEr
 se0/cYKiVVcS2AAsBNMor5kBnoCn12QJCllf8cveb3kmd1t3rGqhsj3NSQd6p5yFymK0
 GMsQvJBHPu4r8MgM4zg0TeXUGOu2W6GMd6zOD75yTeHCDz0tPvYkey0M8P/Iioe3ytEW
 xjB3nUnU3T4jMikdhPYtKBn1dWXYj4618+miPqaqizOMOgMm8G7JK729tJItQM4QROO9
 X2xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAWucKZ3LTbzC3zTiP/ggOccJR2yXSdNolTeGeGt8Xq6gUI7iZYyD5KiZUBtHHlUuPFLRB0+GnJDRHPorV4pc=@lists.samba.org
X-Gm-Message-State: AOJu0Yw5wU2VO/vmAHDuNUhuDzcjP4hQ26W5Ml+Eml6qyok81mwiwnsL
 APlRrZcHlUdYElUCB07D8TDJ5asRe4W6sJqoKG0Cpva6LTFIvt9y942tvI8nw/AbhAxw2pFgesh
 DHVW4ZehQacA7ifYttJXxuHrG2xVUJKc=
X-Gm-Gg: ASbGncsHhF6Fr8vXm8ELCsRBvIKHLC7rRI/I7XLu1zRIC3t1ABlizH2lsMJBg9Q099n
 B1S1zX7EAWMa6bcUyKRh6HbPgFqnbwFKCpq4dqFQMZDwEs1OnCVsPl1jxnBN2XS1snbRa6yPcT3
 zJI9+Xb+fT3Exe9HkfjrAC/USw57bsI7E4fjCaqXfoUdl0EYo1MLGLF2UD+uPEMPCAw9RGxhAG2
 dUQ+UPj8ZH07+irFtzcG07mGeJeyEfEG8kazQkxwE9rWdvm0ohF
X-Google-Smtp-Source: AGHT+IHtTH0me5W53ra96h8xzQUcu3nmMORO2IIo91eL4fYpU0zi428D6qJ2HcO4deMi13RDUX2ri/yCxQnSE6pkoC4=
X-Received: by 2002:a05:6214:1c46:b0:70b:9a89:c2d with SMTP id
 6a1803df08f44-70ba7a9a7d1mr30701786d6.11.1755276739421; Fri, 15 Aug 2025
 09:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250812164546.29238-1-metze@samba.org>
 <cwxjlestdk3u5u6cqrr7cpblkfrwwx3obibhuk2wnu4ttneofm@y3fg6wpvooev>
 <706b8f8e-57f2-4d34-a6f8-c672c921e4f2@samba.org>
In-Reply-To: <706b8f8e-57f2-4d34-a6f8-c672c921e4f2@samba.org>
Date: Fri, 15 Aug 2025 11:52:07 -0500
X-Gm-Features: Ac12FXxJg2UuuFtJrw_BsGhTgyHg1njJftPhRKa7ndhbi7n9UVVCIxi5ZYR5OJM
Message-ID: <CAH2r5mvtxMnwdgz15RrSZj_Kut9WVLGK+WRGUGQD1Rs_MJEWbA@mail.gmail.com>
Subject: Re: [PATCH] smb: server: split ksmbd_rdma_stop_listening() out of
 ksmbd_rdma_destroy()
To: Stefan Metzmacher <metze@samba.org>
Content-Type: multipart/mixed; boundary="0000000000008954d3063c6a36b8"
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

--0000000000008954d3063c6a36b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Steve can you remove 'return' so that the line is this:
> static inline void ksmbd_rdma_stop_listening(void) {

Done, and have updated ksmbd-for-next

Updated patch also attached, let me know if any problems.

Also let me know if you have rebased versions of the other smbdirect
patches for 6.18-rc so I can get them in linux-next

On Fri, Aug 15, 2025 at 7:45=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi Pedro,
>
> >> +void ksmbd_rdma_destroy(void)
> >> +{
> >>      if (smb_direct_wq) {
> >>              destroy_workqueue(smb_direct_wq);
> >>              smb_direct_wq =3D NULL;
> >> diff --git a/fs/smb/server/transport_rdma.h b/fs/smb/server/transport_=
rdma.h
> >> index 0fb692c40e21..659ed668de2d 100644
> >> --- a/fs/smb/server/transport_rdma.h
> >> +++ b/fs/smb/server/transport_rdma.h
> >> @@ -13,13 +13,15 @@
> >>
> >>   #ifdef CONFIG_SMB_SERVER_SMBDIRECT
> >>   int ksmbd_rdma_init(void);
> >> +void ksmbd_rdma_stop_listening(void);
> >>   void ksmbd_rdma_destroy(void);
> >>   bool ksmbd_rdma_capable_netdev(struct net_device *netdev);
> >>   void init_smbd_max_io_size(unsigned int sz);
> >>   unsigned int get_smbd_max_read_write_size(void);
> >>   #else
> >>   static inline int ksmbd_rdma_init(void) { return 0; }
> >> -static inline int ksmbd_rdma_destroy(void) { return 0; }
> >> +static inline void ksmbd_rdma_stop_listening(void) { return };
> >                                                       ^^ return; (nothi=
ng at all would be even better)
> > This seems to have broken our internal linux-next builds.
>
> Sorry for that!
>
> Steve can you remove 'return' so that the line is this:
> static inline void ksmbd_rdma_stop_listening(void) { }
>
> Thanks!
> metze



--=20
Thanks,

Steve

--0000000000008954d3063c6a36b8
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb-server-split-ksmbd_rdma_stop_listening-out-of-ks.patch"
Content-Disposition: attachment; 
	filename="0001-smb-server-split-ksmbd_rdma_stop_listening-out-of-ks.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_med2fiic0>
X-Attachment-Id: f_med2fiic0

RnJvbSBhNDk1MDEwMjNmNTBkMzllMDZjNDIwYWMwOWI3NDE4NWQwNmVlMGU2IE1vbiBTZXAgMTcg
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
L3RyYW5zcG9ydF9yZG1hLmgKaW5kZXggNzdhZWU0ZTVjOWRjLi5jMmY0NmNkNDhlNDQgMTAwNjQ0
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
bWFfc3RvcF9saXN0ZW5pbmcodm9pZCkgeyB9Oworc3RhdGljIGlubGluZSB2b2lkIGtzbWJkX3Jk
bWFfZGVzdHJveSh2b2lkKSB7IHJldHVybjsgfQogc3RhdGljIGlubGluZSBib29sIGtzbWJkX3Jk
bWFfY2FwYWJsZV9uZXRkZXYoc3RydWN0IG5ldF9kZXZpY2UgKm5ldGRldikgeyByZXR1cm4gZmFs
c2U7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBpbml0X3NtYmRfbWF4X2lvX3NpemUodW5zaWduZWQg
aW50IHN6KSB7IH0KIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGdldF9zbWJkX21heF9yZWFk
X3dyaXRlX3NpemUodm9pZCkgeyByZXR1cm4gMDsgfQotLSAKMi40My4wCgo=
--0000000000008954d3063c6a36b8--

