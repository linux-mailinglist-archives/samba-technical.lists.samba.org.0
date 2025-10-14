Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6BBDB03E
	for <lists+samba-technical@lfdr.de>; Tue, 14 Oct 2025 21:13:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Hj4KdecgoGHGYTc5Fn92jUDm+U1qN1I8QFfxys6tF+E=; b=ghg2YondPuxawt3BJCZpN7d7R+
	gN8gzynAZrWL3xFIxy1IKja/ddGFDtN2M8Q778mt2+iYtsmd1Fxs/49kHjChcq68DbFLDuGw1ln7u
	nJUyrKzu+Cfnf72OvARBU9wS8vJL0MwQ8KRZi3wOlrZ1nTjOibjuJ2QRnC/ucxbVB8YdpJ6/+DbVg
	ZWVHJAwMjxUGeiJ8xKtClIePEVuDrsotsQEnOPu+59M2n9z6Vlk6DZfY02Pyn9g54vFFrApzkFbB+
	QXcsH/BBYs1/vqk52rzAq4qEZwcrgwI4k5SM3oMxmlSQZOwUvVuO1G5aacnLLdSKF5t5zrxGQ/9Xp
	tj5wZ3wg==;
Received: from ip6-localhost ([::1]:51112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v8kS4-007m5X-A2; Tue, 14 Oct 2025 19:12:52 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:59430) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v8kRz-007m5Q-Hh
 for samba-technical@lists.samba.org; Tue, 14 Oct 2025 19:12:50 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-7960d69f14bso44480726d6.2
 for <samba-technical@lists.samba.org>; Tue, 14 Oct 2025 12:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760469165; x=1761073965; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hj4KdecgoGHGYTc5Fn92jUDm+U1qN1I8QFfxys6tF+E=;
 b=ndMDgYaFrJAf5GUF3mxv5covyjxpSU7BOUniL1AfHH6gIiV3s2UWAFy5AB6UUxkCTn
 b68LUIsQdjrKbZmqSpg9JTS/E+GaYKS03pY3mfDlVv2hqxeBR+zKji6/nJ4zr+4A5jeB
 9vjibP1IOUcD0gNKpT3n7zFt6fReabDCn9OnBWbk70Q1dGX4Mpbe33kw5pBNptujQ+sf
 SRTLRktgmpck4N9hNNdDvKceDYOts0j9TbpDMHH7wtXxynRDFPS9D9QdOh/UbuIbK+Gi
 Z6vjnicj7LtIOSVrdk0OMa+NNf1NTY6PZG9Z5P7/9k/MfVHXd6dG+z3qHLNnv7FixXy4
 /0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760469165; x=1761073965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hj4KdecgoGHGYTc5Fn92jUDm+U1qN1I8QFfxys6tF+E=;
 b=vTOX/wtsCCBLOxNsPsCgPJCxUECd7zZwMXqTtHZgffIMMUVchOSIH5YLoM8R0ylckY
 p1Bcnexf0cZw7TbrvdPbeMacrWZT7pfyIhkEy8JDBqHeaBsI2mmxf+zj8aaN/j5CDod+
 QsrZwl+f2w/8gAGRCZQ7D2i/Q6pcaqvOhj1aQvEBxLga8NWrZoo1x5Ej2rh4UKDL1bMr
 2HKMPFlVHESY+FA1st9u93Kq2TSRaQlHM362byKHy/72ygiPU6NtupHEORaY5AuXvbh3
 pRGxH9Kz2rHmuf6pjgZNDLIll6zmkD4qKcsBITO8TTjU1l1ZyEkhOpYOJ8mu6OTeZin1
 rq2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwdWTv979640GOXQ/J6As9aUOnMGZn7ARPIXTPAdsdzPIHiq4vdnExYbag/nAr2uUivArGq4LZr5JHNuGAdW0=@lists.samba.org
X-Gm-Message-State: AOJu0YxHWDfMN1lg09hWfZ8/jWbBPP/d2/ASib2V9Jhn97yGKVr6SNpJ
 aTBk6GnkFaHZMwo3CrOIUxAVpZWyJ/UtFBjhIAGU9RLEI/YIPSVHOIQWKbQOynWdGg328CJLrUx
 k/3w7SvyndmFI1wtlrK4x0Yfcy8htrCE=
X-Gm-Gg: ASbGncvPkd0fziuRK1SvALJto5Ljomn6PrVbRoLSdQtW+o4nyRki10N8NSVUu28dFlL
 wnU75wsH7BYMt+kQLXVq7O73DWw97T641s+Yzdsqqzd4TkKBMb89wORbmR40KqwqBCPCIv5Gcbj
 xW9FL3A0KABqifBzHluwr/kdTzZ84ypEFNFJi7zjvSnteCovFTZFvCqWqv6NDMyBL+BbXgvrnme
 73AQjg91/gyyzVzHKpuGS2vfIUnH6plfGFvgrDcUNZmxYQoKBDC5bsz/2nV8UsEkKliU7NiWMv9
 dCu96pB4dI+mOgKoDU74QXFwfkFb830MoPs+qR5xFlnOZybfHWdBexBbRCcoKpGh5xEbE62YKmA
 s0YZjlFXwv9/cp6hIAqX7csceLb7zwUQI8BFKmpw=
X-Google-Smtp-Source: AGHT+IGVnLqJpoAZcGkUlBY7oBpr7+xLff+kKqWhWi8JYLrzCEMQGNtSYRJnnKTVONKAwpF6Xdp30jZhS5ZxqaNWFFo=
X-Received: by 2002:a05:6214:f6d:b0:70f:5a6d:a253 with SMTP id
 6a1803df08f44-87b2ef44013mr355883666d6.49.1760469164911; Tue, 14 Oct 2025
 12:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251014-smb-client-fix-wformat-32b-parse_dfs_referrals-v1-1-47fa7db66b71@kernel.org>
In-Reply-To: <20251014-smb-client-fix-wformat-32b-parse_dfs_referrals-v1-1-47fa7db66b71@kernel.org>
Date: Tue, 14 Oct 2025 14:12:32 -0500
X-Gm-Features: AS18NWA3bxi7uC4cjWWZ93Qyu_Sqb3TU4Fwo7i25Q_1DJKLVcEl20vSn3Vb4mSs
Message-ID: <CAH2r5mtcJJ+_x2dQ3UkVFWd4+YapHXJFWFcxs5ErU+u8kncWsA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Fix format specifiers for size_t in
 parse_dfs_referrals()
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: multipart/mixed; boundary="000000000000369f240641232bf3"
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, Eugene Korenevsky <ekorenevsky@aliyun.com>,
 samba-technical@lists.samba.org, patches@lists.linux.dev,
 stable@vger.kernel.org, Ccm Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000369f240641232bf3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nathan,
Good catch.  Have updated the patch with your change (rather than
having two patches) and added a Suggested-by.  If you want a
Reviewed-by or Acked-by let me know.

Updated patch attached.


On Tue, Oct 14, 2025 at 1:33=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> When building for 32-bit platforms, for which 'size_t' is
> 'unsigned int', there are a couple instances of -Wformat:
>
>   fs/smb/client/misc.c:922:25: error: format specifies type 'unsigned lon=
g' but the argument has type 'unsigned int' [-Werror,-Wformat]
>     921 |                          "%s: header is malformed (size is %u, =
must be %lu)\n",
>         |                                                                =
        ~~~
>         |                                                                =
        %u
>     922 |                          __func__, rsp_size, sizeof(*rsp));
>         |                                              ^~~~~~~~~~~~
>   fs/smb/client/misc.c:940:5: error: format specifies type 'unsigned long=
' but the argument has type 'unsigned int' [-Werror,-Wformat]
>     938 |                          "%s: malformed buffer (size is %u, mus=
t be at least %lu)\n",
>         |                                                                =
              ~~~
>         |                                                                =
              %u
>     939 |                          __func__, rsp_size,
>     940 |                          sizeof(*rsp) + *num_of_nodes * sizeof(=
REFERRAL3));
>         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
>
> Use the proper 'size_t' format specifier, '%zu', to clear up these
> warnings.
>
> Cc: stable@vger.kernel.org
> Fixes: c1047752ed9f ("cifs: parse_dfs_referrals: prevent oob on malformed=
 input")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Feel free to squash this into the original change to make backporting
> easier. I included the tags in case rebasing was not an option.
> ---
>  fs/smb/client/misc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> index 987f0ca73123..e10123d8cd7d 100644
> --- a/fs/smb/client/misc.c
> +++ b/fs/smb/client/misc.c
> @@ -918,7 +918,7 @@ parse_dfs_referrals(struct get_dfs_referral_rsp *rsp,=
 u32 rsp_size,
>
>         if (rsp_size < sizeof(*rsp)) {
>                 cifs_dbg(VFS | ONCE,
> -                        "%s: header is malformed (size is %u, must be %l=
u)\n",
> +                        "%s: header is malformed (size is %u, must be %z=
u)\n",
>                          __func__, rsp_size, sizeof(*rsp));
>                 rc =3D -EINVAL;
>                 goto parse_DFS_referrals_exit;
> @@ -935,7 +935,7 @@ parse_dfs_referrals(struct get_dfs_referral_rsp *rsp,=
 u32 rsp_size,
>
>         if (sizeof(*rsp) + *num_of_nodes * sizeof(REFERRAL3) > rsp_size) =
{
>                 cifs_dbg(VFS | ONCE,
> -                        "%s: malformed buffer (size is %u, must be at le=
ast %lu)\n",
> +                        "%s: malformed buffer (size is %u, must be at le=
ast %zu)\n",
>                          __func__, rsp_size,
>                          sizeof(*rsp) + *num_of_nodes * sizeof(REFERRAL3)=
);
>                 rc =3D -EINVAL;
>
> ---
> base-commit: 4e47319b091f90d5776efe96d6c198c139f34883
> change-id: 20251014-smb-client-fix-wformat-32b-parse_dfs_referrals-189b8c=
6fdf75
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>


--=20
Thanks,

Steve

--000000000000369f240641232bf3
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-parse_dfs_referrals-prevent-oob-on-malformed-in.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-parse_dfs_referrals-prevent-oob-on-malformed-in.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mgqxvjv90>
X-Attachment-Id: f_mgqxvjv90

RnJvbSA3ZjBmNTRkZmMzMTA2M2E4ZWE4YzBkMTAzNGNjOTBhZTY2MTQwM2ZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFdWdlbmUgS29yZW5ldnNreSA8ZWtvcmVuZXZza3lAYWxpeXVu
LmNvbT4KRGF0ZTogTW9uLCAxMyBPY3QgMjAyNSAyMTozOTozMCArMDMwMApTdWJqZWN0OiBbUEFU
Q0hdIGNpZnM6IHBhcnNlX2Rmc19yZWZlcnJhbHM6IHByZXZlbnQgb29iIG9uIG1hbGZvcm1lZCBp
bnB1dAoKTWFsaWNpb3VzIFNNQiBzZXJ2ZXIgY2FuIHNlbmQgaW52YWxpZCByZXBseSB0byBGU0NU
TF9ERlNfR0VUX1JFRkVSUkFMUwoKLSByZXBseSBzbWFsbGVyIHRoYW4gc2l6ZW9mKHN0cnVjdCBn
ZXRfZGZzX3JlZmVycmFsX3JzcCkKLSByZXBseSB3aXRoIG51bWJlciBvZiByZWZlcnJhbHMgc21h
bGxlciB0aGFuIE51bWJlck9mUmVmZXJyYWxzIGluIHRoZQpoZWFkZXIKClByb2Nlc3Npbmcgb2Yg
c3VjaCByZXBsaWVzIHdpbGwgY2F1c2Ugb29iLgoKUmV0dXJuIC1FSU5WQUwgZXJyb3Igb24gc3Vj
aCByZXBsaWVzIHRvIHByZXZlbnQgb29iLXMuCgpTaWduZWQtb2ZmLWJ5OiBFdWdlbmUgS29yZW5l
dnNreSA8ZWtvcmVuZXZza3lAYWxpeXVuLmNvbT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
U3VnZ2VzdGVkLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+CkFja2Vk
LWJ5OiBQYXVsbyBBbGNhbnRhcmEgKFJlZCBIYXQpIDxwY0BtYW5ndWViaXQub3JnPgpTaWduZWQt
b2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvc21i
L2NsaWVudC9taXNjLmMgfCAxNyArKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L21pc2MuYyBiL2ZzL3Nt
Yi9jbGllbnQvbWlzYy5jCmluZGV4IGRkYTZkZWNlODAyYS4uZTEwMTIzZDhjZDdkIDEwMDY0NAot
LS0gYS9mcy9zbWIvY2xpZW50L21pc2MuYworKysgYi9mcy9zbWIvY2xpZW50L21pc2MuYwpAQCAt
OTE2LDYgKzkxNiwxNCBAQCBwYXJzZV9kZnNfcmVmZXJyYWxzKHN0cnVjdCBnZXRfZGZzX3JlZmVy
cmFsX3JzcCAqcnNwLCB1MzIgcnNwX3NpemUsCiAJY2hhciAqZGF0YV9lbmQ7CiAJc3RydWN0IGRm
c19yZWZlcnJhbF9sZXZlbF8zICpyZWY7CiAKKwlpZiAocnNwX3NpemUgPCBzaXplb2YoKnJzcCkp
IHsKKwkJY2lmc19kYmcoVkZTIHwgT05DRSwKKwkJCSAiJXM6IGhlYWRlciBpcyBtYWxmb3JtZWQg
KHNpemUgaXMgJXUsIG11c3QgYmUgJXp1KVxuIiwKKwkJCSBfX2Z1bmNfXywgcnNwX3NpemUsIHNp
emVvZigqcnNwKSk7CisJCXJjID0gLUVJTlZBTDsKKwkJZ290byBwYXJzZV9ERlNfcmVmZXJyYWxz
X2V4aXQ7CisJfQorCiAJKm51bV9vZl9ub2RlcyA9IGxlMTZfdG9fY3B1KHJzcC0+TnVtYmVyT2ZS
ZWZlcnJhbHMpOwogCiAJaWYgKCpudW1fb2Zfbm9kZXMgPCAxKSB7CkBAIC05MjUsNiArOTMzLDE1
IEBAIHBhcnNlX2Rmc19yZWZlcnJhbHMoc3RydWN0IGdldF9kZnNfcmVmZXJyYWxfcnNwICpyc3As
IHUzMiByc3Bfc2l6ZSwKIAkJZ290byBwYXJzZV9ERlNfcmVmZXJyYWxzX2V4aXQ7CiAJfQogCisJ
aWYgKHNpemVvZigqcnNwKSArICpudW1fb2Zfbm9kZXMgKiBzaXplb2YoUkVGRVJSQUwzKSA+IHJz
cF9zaXplKSB7CisJCWNpZnNfZGJnKFZGUyB8IE9OQ0UsCisJCQkgIiVzOiBtYWxmb3JtZWQgYnVm
ZmVyIChzaXplIGlzICV1LCBtdXN0IGJlIGF0IGxlYXN0ICV6dSlcbiIsCisJCQkgX19mdW5jX18s
IHJzcF9zaXplLAorCQkJIHNpemVvZigqcnNwKSArICpudW1fb2Zfbm9kZXMgKiBzaXplb2YoUkVG
RVJSQUwzKSk7CisJCXJjID0gLUVJTlZBTDsKKwkJZ290byBwYXJzZV9ERlNfcmVmZXJyYWxzX2V4
aXQ7CisJfQorCiAJcmVmID0gKHN0cnVjdCBkZnNfcmVmZXJyYWxfbGV2ZWxfMyAqKSAmKHJzcC0+
cmVmZXJyYWxzKTsKIAlpZiAocmVmLT5WZXJzaW9uTnVtYmVyICE9IGNwdV90b19sZTE2KDMpKSB7
CiAJCWNpZnNfZGJnKFZGUywgIlJlZmVycmFscyBvZiBWJWQgdmVyc2lvbiBhcmUgbm90IHN1cHBv
cnRlZCwgc2hvdWxkIGJlIFYzXG4iLAotLSAKMi40OC4xCgo=
--000000000000369f240641232bf3--

