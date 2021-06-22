Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0B3AFB27
	for <lists+samba-technical@lfdr.de>; Tue, 22 Jun 2021 04:41:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/8WjX4cnHEYgo+3vdxIdw+5bVRyOPIY5mBYw6H82eb8=; b=IbPtuWtK3VwOXOJZ2v9X7DFUIq
	UdvxeMQUlKi3C0pnsrHOzrRTloCa8XBcjqjlweLHfmaE9vs7OwlG0c7Eo0pCrLB8FULStzKFJPZl+
	59+aQptHzR1rQPhHasYzTwbyZfyVmrJIpfFwz7FdxY89dBT4uCfO2pu20kvLx5Ui8dBlLhOl+8WLM
	PK8MojTslc3Mk3v6jR873XaaBzN/7klLzvDMAFjtus9cHa9b3DqFkYmKseVfEJ3NLTp/tsaqer2/W
	Sik6CGyG8TvLKmkuKuKjanAETCv1FZc4Ep+wb0zXFPKtJrhs6TNHDhe71LH67XCu6o0hYkTrx/r53
	nTx7VS2w==;
Received: from ip6-localhost ([::1]:56420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lvWL3-007OET-Eg; Tue, 22 Jun 2021 02:40:33 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:35528) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lvWKy-007OEK-KX
 for samba-technical@lists.samba.org; Tue, 22 Jun 2021 02:40:30 +0000
Received: by mail-lj1-x22c.google.com with SMTP id u11so17015751ljh.2
 for <samba-technical@lists.samba.org>; Mon, 21 Jun 2021 19:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/8WjX4cnHEYgo+3vdxIdw+5bVRyOPIY5mBYw6H82eb8=;
 b=Mpcpbltx1iFJKINdMHpkVw7066ThgQ06/5vFObBvg7h3S0PL3Srp+IE7Br9m98k1SJ
 ZqDo+dEkcLjfL7FkK8Wn52U3QwsAXDfyOeFniEiWQPF1BuVKtLf2aIsrJXqkiLgxdWC6
 zf9vryWqWM6QiNqnIE3nvp9xObWKGu8AguaorfJVr+hP3e972SNzTPlyT7gRsPmgNvVS
 KjFyfzkB84vOsuTFXAsua3odvruEcsN2HUjZpdgAiom/tLaDEMbjOCC+KVZ+hfPARtky
 dvsEGfAqFCPJO0cIaLoQFpAd5u6fHkYla/vLQZnE9WUrRcGset52dFERO04bIQkjIE+v
 e5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/8WjX4cnHEYgo+3vdxIdw+5bVRyOPIY5mBYw6H82eb8=;
 b=Tc75a9zQrMqCESa1wNkt6Jmw/p5+xaBmUsKtTiNalg7ODLhzA4s3f3Rz2rFBzUTTGK
 CavI7wxqg95XHK0x5+wIN7HrWn5XeRqSp4ZnpzKMA+X8oTZRukTM7qqzqzwX8jvNM6nR
 WLkUD/dK519I8atlnwFJovdZcNHld2gX9dZwToWE6e0xOOtWoDwaEo/W+N2LXIBkG4yq
 th9m/ntfyqYTwFVQJ3eJNpOGQdB6BfR2Rh7kthWvT9cOkQQocPMEyRVk7H0j47m3MF5O
 9fVEAC+aVzoVllzuhep+4TC0xTFiY+fq5GXOKN3nnSHdDJFn9Bs/6jZXeZMvJ8mHZh5n
 m0Tw==
X-Gm-Message-State: AOAM532Q6IMjms2A5FF0JrLgt4Rp8nZ0JSrC03DGk4w3Yv+mino0MwQb
 npbBTQ+wy5y5Fecwnwre49b3TzrPOQEdRTe/ifk=
X-Google-Smtp-Source: ABdhPJySx3U18ns7T15pcuPKCF6pSzDGUr8BT5xrxXYEcg6Ga9upcgyuejaj9zI8ljAitWa/d/r5sLcgqZ00nsmp8P0=
X-Received: by 2002:a2e:a234:: with SMTP id i20mr1103486ljm.272.1624329627435; 
 Mon, 21 Jun 2021 19:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210621214446.1406159-1-keescook@chromium.org>
In-Reply-To: <20210621214446.1406159-1-keescook@chromium.org>
Date: Mon, 21 Jun 2021 21:40:16 -0500
Message-ID: <CAH2r5msjg34KP4OxSwJTHmwawkFBW1k6-EUb4G_Ac4anC9TOgA@mail.gmail.com>
Subject: Re: [PATCH] cifs: Avoid field over-reading memcpy()
To: Kees Cook <keescook@chromium.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <stfrench@microsoft.com>,
 linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Mon, Jun 21, 2021 at 4:45 PM Kees Cook <keescook@chromium.org> wrote:
>
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally reading across neighboring fields.
>
> Instead of using memcpy to read across multiple struct members, just
> perform per-member assignments as already done for other members.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  fs/cifs/smb2pdu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 31784e3fa96f..962826dc3316 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -2892,7 +2892,10 @@ SMB2_open(const unsigned int xid, struct cifs_open_parms *oparms, __le16 *path,
>  #endif /* CIFS_DEBUG2 */
>
>         if (buf) {
> -               memcpy(buf, &rsp->CreationTime, 32);
> +               buf->CreationTime = rsp->CreationTime;
> +               buf->LastAccessTime = rsp->LastAccessTime;
> +               buf->LastWriteTime = rsp->LastWriteTime;
> +               buf->ChangeTime = rsp->ChangeTime;
>                 buf->AllocationSize = rsp->AllocationSize;
>                 buf->EndOfFile = rsp->EndofFile;
>                 buf->Attributes = rsp->FileAttributes;
> --
> 2.30.2
>


-- 
Thanks,

Steve

