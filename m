Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6212B2860B
	for <lists+samba-technical@lfdr.de>; Fri, 15 Aug 2025 20:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JdyN6WGrqk0qlIimHEpOBWJyn0gKIKwkZ/kscgd9yuQ=; b=v50XK9L4Y80Bm0l/TdHRy2beIs
	+e6qMf3npUQzgkm0SOV254+9XaOfqHVGkWfvK17wL2SXQW+zaI/62I+i3o65Y0wJiXZMGDj4lp3xX
	Ow/SJmu9bghlHRKXLp23yo3Bkshb51lw0J+j1cYT1rDjtw1G1uSjv08R83Y+JUsdLGvYPErv+OUOV
	cOoT29dQWlI607JcOBPXcUou+phwAIOQUKjXkZnSwZ3jZ2QyQfAzXnNAgn7diuK+o259osqo68qhf
	x9ttQzsbIFzbm4mLLyCQR57pGDRLdqsjh5+wei2D2nfqWXeNW5FChAqMPD1BCdWzEnE5iG3q3qp9k
	9/yGiI2Q==;
Received: from ip6-localhost ([::1]:57976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1umzXz-00F5wW-FI; Fri, 15 Aug 2025 18:53:03 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:60763) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umzXu-00F5wP-Na
 for samba-technical@lists.samba.org; Fri, 15 Aug 2025 18:53:01 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-70ba7aa136fso6656576d6.1
 for <samba-technical@lists.samba.org>; Fri, 15 Aug 2025 11:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755283977; x=1755888777; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JdyN6WGrqk0qlIimHEpOBWJyn0gKIKwkZ/kscgd9yuQ=;
 b=IYQzuSVuAOFUqVYeklMXQw7zywUBKWvk95+pSczBj7CvHJ8XNOhvgF+MpphI9CXRUw
 ESM6ji4b2oMrEdrISkDVodM2vwSLFtspZGv/ADqxLjo8wZIW3/tgW4bmyfSkzrMyJ82X
 gIGTWT1AyL8Y+OHoFEMut+6vYsd6+6pYxoVI0w2zW0XF4DIGeddRvLCmw4HKTzPzltem
 4plcwaQ9GV+c8D+YvPPbOqAPyvKPcO9JKZpJVWCIBT9tjOGDy/vC/1oB+/kAIEQkdBFD
 VE0RjdUCiFDT3K1f9LB0qs1xHHWfMHR/UnzNvWcLxMynm9X8nSbnuAV1E+22wSGdQgGt
 +xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755283977; x=1755888777;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JdyN6WGrqk0qlIimHEpOBWJyn0gKIKwkZ/kscgd9yuQ=;
 b=UDi9M0hYFXnffdNLvisMbipPq5dYHtS3CgIOBXuILMGPGloBYpUhwzWYHvrBsgbtOW
 eEa0xw3G+qcJ5ts5QUDoAYI2TCGcEqxBNzqNnxkCLXI5xwZJLgeHDMs13LHfJR1A5ypL
 THR7gQidcMN4T75PaNQPIKUt4vGHPHpW2cqIPAw9PHmgkVI/emVTVrhFYUXSyLleG1MZ
 rJeZqde6SEjWPpWR8PmYqDdSX6Uiz3ZTcH9SskpS/dlGZCZn2DfadTQ5UJEznYgXX0Vf
 0/0k6abCvO4kNAFtVb3MwAm2huC3KWgx9r441Z0f29RUcrIHflfOwjBefYlXJ2uAXpHi
 WHIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA2g2RZIG7Voh93SRVXqeIZw5Hq7pK8BemcH3yJ0d/g9X6twY7GVfDEp5S4knmT72x3PDqRUigHsX9Rsaphys=@lists.samba.org
X-Gm-Message-State: AOJu0YyB/DURM2ZA8qYwtCL7VpD7qmCGwG8DVamk/dgzyFJ32PZ2WtpN
 9eNZRDQUP8JQmTtV0FBdgvWgp7ael7cGfJAbHlNOfHE/QVsTZ+WcceQA03hb82/haqUyTrF/h1v
 D5yAY/K+ChJ3jU/yv1g0Utl6VUQ4BCvA=
X-Gm-Gg: ASbGncuIzlrQ3vr7JQSfE4bSAObUa616cidop6AJn67fn0O5BGUZLDaBOKBfriS68QB
 P9Oe7ECf09PyEAoHfGvigH61H3cjqtLG/z8vu6KASI+62B/MbyOG5f+p1tv77i4MMuk5NxV0eW4
 VoVZsHQmbJsVUav31SWZtWINL31cpap/Ww0XT0huhpeRYOEv3MKXy8WUiwyunodH5AJhgtRw0YY
 7XLXEhlvzNXRcEtLmWQCiTNFuRwKQoUcNqC1O/Krg==
X-Google-Smtp-Source: AGHT+IHD+xBmJAin9zj3WSwmYl22L1CYJTaMu9iVRXfDe7O50dZ9zSrnq/9Ck/5Ix1eFfDnsvjP8jrKvgpw63x3GkoM=
X-Received: by 2002:a05:6214:f2c:b0:707:56bd:906f with SMTP id
 6a1803df08f44-70ba7ae85camr36370706d6.17.1755283976846; Fri, 15 Aug 2025
 11:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250812164546.29238-1-metze@samba.org>
 <cwxjlestdk3u5u6cqrr7cpblkfrwwx3obibhuk2wnu4ttneofm@y3fg6wpvooev>
 <706b8f8e-57f2-4d34-a6f8-c672c921e4f2@samba.org>
 <CAH2r5mvtxMnwdgz15RrSZj_Kut9WVLGK+WRGUGQD1Rs_MJEWbA@mail.gmail.com>
 <0bcae9fe-1dff-4530-875b-fe917af5b649@samba.org>
In-Reply-To: <0bcae9fe-1dff-4530-875b-fe917af5b649@samba.org>
Date: Fri, 15 Aug 2025 13:52:44 -0500
X-Gm-Features: Ac12FXy5OtU2K4dWp9NkoumOvpMO0vbMmWRZC4lTQxEL6_bw9NEbEHMwQjYcbwE
Message-ID: <CAH2r5mtas+irtVpkkCYRLyXpPknXqbAiN9gdupo-5z=YbFepTQ@mail.gmail.com>
Subject: Re: [PATCH] smb: server: split ksmbd_rdma_stop_listening() out of
 ksmbd_rdma_destroy()
To: Stefan Metzmacher <metze@samba.org>
Content-Type: multipart/mixed; boundary="000000000000eba7ea063c6be504"
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

--000000000000eba7ea063c6be504
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Maybe also remove the 'return;' from the inline ksmbd_rdma_destroy functi=
on?

Done (updated cifs-2.6.git for-next with attached)

It does look a little strange that a trailing ';' is only after the
ksmbd_rdma_stop_listening() line - is that intentional

diff --git a/fs/smb/server/transport_rdma.h b/fs/smb/server/transport_rdma.=
h
index 77aee4e5c9dc..ce3c88a45875 100644
--- a/fs/smb/server/transport_rdma.h
+++ b/fs/smb/server/transport_rdma.h
@@ -54,13 +54,15 @@ struct smb_direct_data_transfer {

 #ifdef CONFIG_SMB_SERVER_SMBDIRECT
 int ksmbd_rdma_init(void);
+void ksmbd_rdma_stop_listening(void);
 void ksmbd_rdma_destroy(void);
 bool ksmbd_rdma_capable_netdev(struct net_device *netdev);
 void init_smbd_max_io_size(unsigned int sz);
 unsigned int get_smbd_max_read_write_size(void);
 #else
 static inline int ksmbd_rdma_init(void) { return 0; }
-static inline int ksmbd_rdma_destroy(void) { return 0; }
+static inline void ksmbd_rdma_stop_listening(void) { };
+static inline void ksmbd_rdma_destroy(void) { }
 static inline bool ksmbd_rdma_capable_netdev(struct net_device
*netdev) { return false; }
 static inline void init_smbd_max_io_size(unsigned int sz) { }
 static inline unsigned int get_smbd_max_read_write_size(void) { return 0; =
}

On Fri, Aug 15, 2025 at 12:24=E2=80=AFPM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> Am 15.08.25 um 18:52 schrieb Steve French:
> >> Steve can you remove 'return' so that the line is this:
> >> static inline void ksmbd_rdma_stop_listening(void) {
> >
> > Done, and have updated ksmbd-for-next
> >
> > Updated patch also attached, let me know if any problems.
>
> Maybe also remove the 'return;' from the inline ksmbd_rdma_destroy functi=
on?
>
> > Also let me know if you have rebased versions of the other smbdirect
> > patches for 6.18-rc so I can get them in linux-next
>
> I guess I'll base on Monday on 6.17-rc2 and will post what I have then.
>
> Thanks!
> metze
>


--=20
Thanks,

Steve

--000000000000eba7ea063c6be504
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb-server-split-ksmbd_rdma_stop_listening-out-of-ks.patch"
Content-Disposition: attachment; 
	filename="0001-smb-server-split-ksmbd_rdma_stop_listening-out-of-ks.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_med6qycc0>
X-Attachment-Id: f_med6qycc0

RnJvbSA2NTYyMDVkYjY1MGE5OTQyYTMzYjVjYzViYzkwMTJjMzMxNzQ2NTk2IE1vbiBTZXAgMTcg
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
L3RyYW5zcG9ydF9yZG1hLmgKaW5kZXggNzdhZWU0ZTVjOWRjLi5jZTNjODhhNDU4NzUgMTAwNjQ0
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
bWFfZGVzdHJveSh2b2lkKSB7IH0KIHN0YXRpYyBpbmxpbmUgYm9vbCBrc21iZF9yZG1hX2NhcGFi
bGVfbmV0ZGV2KHN0cnVjdCBuZXRfZGV2aWNlICpuZXRkZXYpIHsgcmV0dXJuIGZhbHNlOyB9CiBz
dGF0aWMgaW5saW5lIHZvaWQgaW5pdF9zbWJkX21heF9pb19zaXplKHVuc2lnbmVkIGludCBzeikg
eyB9CiBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBnZXRfc21iZF9tYXhfcmVhZF93cml0ZV9z
aXplKHZvaWQpIHsgcmV0dXJuIDA7IH0KLS0gCjIuNDMuMAoK
--000000000000eba7ea063c6be504--

