Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EC549090
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jun 2019 21:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=IYqG3I/iR+698zzFiG8VG32oFmAJR0f1860DQH1iHtU=; b=WD3IxbFj30wVlZ9tES15X4VaQH
	G7/FU8aPJFW3/2Di/iCBaAtorWTzqDn6WecIpHLGl5EWscnhMZ228yp+dDi/zTuYO8+McMziMJMBs
	5H2jxrv7drPJpNr7ux+me8ufW1DwWVSj0IeWnvU04bMZu64Ubjj661p5vg9yryYKNCOw3lUiGblFB
	Z6kHqJ/xj1/7xMo+ceu0Le5vKZFlOBfSShI4u7dh62wyXXd/fqEoztoqO4SL0eEv90wBKH3b24Phb
	0NZU5/NRQLpAJ2D+xxAhHCauOEjFVs5kn1kCyWUf++805foUh6629mrrEp4kZ6nSGXpokdXwmFTCC
	visl8qUg==;
Received: from localhost ([::1]:41990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hcxfF-000rYR-90; Mon, 17 Jun 2019 19:51:37 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34869) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hcxfB-000rYK-CZ
 for samba-technical@lists.samba.org; Mon, 17 Jun 2019 19:51:35 +0000
Received: by mail-pf1-x441.google.com with SMTP id d126so6242683pfd.2
 for <samba-technical@lists.samba.org>; Mon, 17 Jun 2019 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=IYqG3I/iR+698zzFiG8VG32oFmAJR0f1860DQH1iHtU=;
 b=eWGmlu8t0NJZ9ndABvMxc5XUA0CnatWcAmacEFf9OnYL0uF/mJKbOdn9Wb3wOpa9Pi
 UUxjlRbilZQGb1lXbZSeGr1d1dOTy0txJ5q9AjK0f+g1OsBmoziref3nA2pkCnnAR78S
 Zze8eJ3JS5oIW8hf9kjrv1TU+QW93k79vX+aGWVbBm7zwdtf4mL0FOwYBW2HYFLBcmNU
 DTpF0Cp+b1LPYmvQ7LFooDgssPi17fL5Gd7mVxgLM9ApZd4LP1vbu9qmU3vP7BtMTR0x
 y91flvBBSZ2Pl8pGPSZy39D98XzJbjYPaNCIBsmPFver4tevd8OnS49yc5Dp3Gk8je8b
 8Nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=IYqG3I/iR+698zzFiG8VG32oFmAJR0f1860DQH1iHtU=;
 b=dxyrefcW3Ix0qeO4zn2Mg2Fev2bGu/F77e62HVU903Dpzrt5+iJQdT6bjJXNH8J+xM
 JCM6iydBG1ECxaY0QQbRHpVC+qN0lWdVcWZOfuer9OQelwMkIc4yvQDEbYpJ6u+Nk1Oh
 kAxj6dejI22sAy0U7zmGdDHt0sOzuRhM9nFBiHP2UJ8gmvBz/6uUz9j+ffb8xxvrgr9K
 4vgzTP8i/GPcJBoNHieF+aj1FsHoUj3nRGwDWolCTPF6SaCqHGL9s0IDhCf1h4CBHMxe
 mFFuDwbcZpQiHsEgJTDJi51gI0tCLN13IsKvfxc3XiQMzln0GvjLeCyg8rMJCTYIt+Xq
 OJFQ==
X-Gm-Message-State: APjAAAUDnUqjLa9ulzulYWONsnyswNIjvR7KNm173AYQmYglACbcIwju
 53yeNzdSqT4lLZn7k9HEuiXkGSCG7vRI467rCtA=
X-Google-Smtp-Source: APXvYqzJ+54h6jeOUAU98078dX9Nk4qjnXTI7K6Lc4UnFba0squ46cGPdTjDYe4K9baVLGefFkHpN4jgENWhpgZY9Ok=
X-Received: by 2002:a17:90a:2385:: with SMTP id g5mr713432pje.12.1560801088072; 
 Mon, 17 Jun 2019 12:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvo9sWf8VoPb8puCDh4HM6WnrMgjs+HyhUzqEZXtuQwtA@mail.gmail.com>
In-Reply-To: <CAH2r5mvo9sWf8VoPb8puCDh4HM6WnrMgjs+HyhUzqEZXtuQwtA@mail.gmail.com>
Date: Mon, 17 Jun 2019 14:51:16 -0500
Message-ID: <CAH2r5mtC5cXkhAVrioy_cLeoTq_4Jq0nw3CR4HTiEP_twSSKJg@mail.gmail.com>
Subject: Re: NT_STATUS_INSUFFICIENT_RESOURCES and retrying writes to Windows
 10 servers
To: Pavel Shilovsky <piastryyy@gmail.com>,
 ronnie sahlberg <ronniesahlberg@gmail.com>, 
 Paulo Alcantara <paulo@paulo.ac>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>, 
 CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000006b8e16058b8a5241"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000006b8e16058b8a5241
Content-Type: text/plain; charset="UTF-8"

Attached is a patch with updated comments and cc:stable:


On Sat, Jun 15, 2019 at 11:18 PM Steve French <smfrench@gmail.com> wrote:
>
> By default large file copy to Windows 10 can return MANY potentially
> retryable errors on write (which we don't retry from the Linux cifs
> client) which can cause cp to fail.
>
> It did look like my patch for the problem worked (see below).  Windows
> 10 returns *A LOT* (about 1/3 of writes in some cases I tried) of
> NT_STATUS_INSUFFICIENT_RESOURCES errors (presumably due to the
> 'blocking operation credit' max of 64 in Windows 10 - see note 203 of
> MS-SMB2).
>
> "<203> Section 3.3.4.2: Windows-based servers enforce a configurable
> blocking operation credit,
> which defaults to 64 on Windows Vista SP1, Windows 7, Windows 8,
> Windows 8.1, and, Windows 10,
> and defaults to 512 on Windows Server 2008, Windows Server 2008 R2,
> Windows Server 2012 ..."
>
> This patch did seem to work around the problem, but perhaps we should
> use far fewer credits when mounting to Windows 10 even though they are
> giving us enough credits for more? Or change how we do writes to not
> do synchronous writes? I haven't seen this problem to Windows 2016 or
> 2019 but perhaps the explanation on note 203  is all we need to know
> ... ie that clients can enforce a lower limit than 512
>
> ~/cifs-2.6/fs/cifs$ git diff -a
> diff --git a/fs/cifs/smb2maperror.c b/fs/cifs/smb2maperror.c
> index e32c264e3adb..82ade16c9501 100644
> --- a/fs/cifs/smb2maperror.c
> +++ b/fs/cifs/smb2maperror.c
> @@ -457,7 +457,7 @@ static const struct status_to_posix_error
> smb2_error_map_table[] = {
>         {STATUS_FILE_INVALID, -EIO, "STATUS_FILE_INVALID"},
>         {STATUS_ALLOTTED_SPACE_EXCEEDED, -EIO,
>         "STATUS_ALLOTTED_SPACE_EXCEEDED"},
> -       {STATUS_INSUFFICIENT_RESOURCES, -EREMOTEIO,
> +       {STATUS_INSUFFICIENT_RESOURCES, -EAGAIN,
>                                 "STATUS_INSUFFICIENT_RESOURCES"},
>         {STATUS_DFS_EXIT_PATH_FOUND, -EIO, "STATUS_DFS_EXIT_PATH_FOUND"},
>         {STATUS_DEVICE_DATA_ERROR, -EIO, "STATUS_DEVICE_DATA_ERROR"},
>
>
> e.g. see the number of write errors in my 8GB copy in my test below
>
> # cat /proc/fs/cifs/Stats
> Resources in use
> CIFS Session: 1
> Share (unique mount targets): 2
> SMB Request/Response Buffer: 1 Pool size: 5
> SMB Small Req/Resp Buffer: 1 Pool size: 30
> Operations (MIDs): 0
>
> 0 session 0 share reconnects
> Total vfs operations: 363 maximum at one time: 2
>
> 1) \\10.0.3.4\public-share
> SMBs: 14879
> Bytes read: 0  Bytes written: 8589934592
> Open files: 2 total (local), 0 open on server
> TreeConnects: 3 total 0 failed
> TreeDisconnects: 0 total 0 failed
> Creates: 12 total 0 failed
> Closes: 10 total 0 failed
> Flushes: 0 total 0 failed
> Reads: 0 total 0 failed
> Writes: 14838 total 5624 failed
> ...
>
> Any thoughts?
>
> Any risk that we could run into places where EAGAIN would not be
> handled (there are SMB3 commands other than read and write where
> NT_STATUS_INSUFFICIENT_RESOURCES could be returned in theory)
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

--0000000000006b8e16058b8a5241
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3-retry-on-STATUS_INSUFFICIENT_RESOURCES-instead-.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3-retry-on-STATUS_INSUFFICIENT_RESOURCES-instead-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jx0snfv30>
X-Attachment-Id: f_jx0snfv30

RnJvbSBlYTY1MWViZWEyOTAyMDQ2MDJjMTRlNDBhOGFiNDc4MzU0MDVhNDI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgMTcgSnVuIDIwMTkgMTQ6NDk6MDcgLTA1MDAKU3ViamVjdDogW1BBVENIXSBT
TUIzOiByZXRyeSBvbiBTVEFUVVNfSU5TVUZGSUNJRU5UX1JFU09VUkNFUyBpbnN0ZWFkIG9mCiBm
YWlsaW5nIHdyaXRlCgpTb21lIHNlcnZlcnMgc3VjaCBhcyBXaW5kb3dzIDEwIHdpbGwgcmV0dXJu
IFNUQVRVU19JTlNVRkZJQ0lFTlRfUkVTT1VSQ0VTCmFzIHRoZSBudW1iZXIgb2Ygc2ltdWx0YW5l
b3VzIFNNQjMgcmVxdWVzdHMgZ3Jvd3MgKGV2ZW4gdGhvdWdoIHRoZSBjbGllbnQKaGFzIHN1ZmZp
Y2llbnQgY3JlZGl0cykuICBSZXR1cm4gRUFHQUlOIG9uIFNUQVRVU19JTlNVRkZJQ0lFTlRfUkVT
T1VSQ0VTCnNvIHRoYXQgd2UgY2FuIHJldHJ5IHdyaXRlcyB3aGljaCBmYWlsIHdpdGggdGhpcyBz
dGF0dXMgY29kZS4KClRoaXMgKGZvciBleGFtcGxlKSBmaXhlcyBsYXJnZSBmaWxlIGNvcGllcyB0
byBXaW5kb3dzIDEwIG9uIGZhc3QgbmV0d29ya3MuCgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVu
Y2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+CkNDOiBTdGFibGUgPHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmc+Ci0tLQotLS0KIGZzL2NpZnMvc21iMm1hcGVycm9yLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9jaWZz
L3NtYjJtYXBlcnJvci5jIGIvZnMvY2lmcy9zbWIybWFwZXJyb3IuYwppbmRleCBlMzJjMjY0ZTNh
ZGIuLjgyYWRlMTZjOTUwMSAxMDA2NDQKLS0tIGEvZnMvY2lmcy9zbWIybWFwZXJyb3IuYworKysg
Yi9mcy9jaWZzL3NtYjJtYXBlcnJvci5jCkBAIC00NTcsNyArNDU3LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzdGF0dXNfdG9fcG9zaXhfZXJyb3Igc21iMl9lcnJvcl9tYXBfdGFibGVbXSA9IHsK
IAl7U1RBVFVTX0ZJTEVfSU5WQUxJRCwgLUVJTywgIlNUQVRVU19GSUxFX0lOVkFMSUQifSwKIAl7
U1RBVFVTX0FMTE9UVEVEX1NQQUNFX0VYQ0VFREVELCAtRUlPLAogCSJTVEFUVVNfQUxMT1RURURf
U1BBQ0VfRVhDRUVERUQifSwKLQl7U1RBVFVTX0lOU1VGRklDSUVOVF9SRVNPVVJDRVMsIC1FUkVN
T1RFSU8sCisJe1NUQVRVU19JTlNVRkZJQ0lFTlRfUkVTT1VSQ0VTLCAtRUFHQUlOLAogCQkJCSJT
VEFUVVNfSU5TVUZGSUNJRU5UX1JFU09VUkNFUyJ9LAogCXtTVEFUVVNfREZTX0VYSVRfUEFUSF9G
T1VORCwgLUVJTywgIlNUQVRVU19ERlNfRVhJVF9QQVRIX0ZPVU5EIn0sCiAJe1NUQVRVU19ERVZJ
Q0VfREFUQV9FUlJPUiwgLUVJTywgIlNUQVRVU19ERVZJQ0VfREFUQV9FUlJPUiJ9LAotLSAKMi4y
MC4xCgo=
--0000000000006b8e16058b8a5241--

