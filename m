Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC6ACAEAE
	for <lists+samba-technical@lfdr.de>; Thu,  3 Oct 2019 20:57:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aa6r931Rjp1NE7cgnIGCkHLvHKb0A2CYSfJ4m7AK8VA=; b=Qfn+WytnBy++WaJqOXDaXyDQHH
	8l0U25BJWy+rmpV3kR5a5qS8/13r5qPIMtzpys/dfzmM8c19FiE9k6lIw6KbWgrQRK9vsU68DR1eu
	cbKfxV84WKmafYtiYiiuGCtiKKFiYIf+j5EIrgIHYxJoUTJklscYcKIGTCFE0IJRV25JFliI9uwOw
	3NE7JwwAFtr78WWWfO0SgUCDG2JL6q+wuDgAERCOIlexyh9V1WcCzeZdl8MHvizLYuoIizrClcNp/
	bvWtTWhUk1YucKAogwWYgaX4rMipBeB1xwokeVIWJGgOfmDvYuE1GvSnfRIXQ5CsYGMJcMH9VKe8A
	Cwm4LUQg==;
Received: from localhost ([::1]:47344 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iG6IP-000q3U-Q1; Thu, 03 Oct 2019 18:57:49 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:45483) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iG6IK-000q3M-N4
 for samba-technical@lists.samba.org; Thu, 03 Oct 2019 18:57:47 +0000
Received: by mail-io1-xd44.google.com with SMTP id c25so7962389iot.12
 for <samba-technical@lists.samba.org>; Thu, 03 Oct 2019 11:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aa6r931Rjp1NE7cgnIGCkHLvHKb0A2CYSfJ4m7AK8VA=;
 b=O7PPsQ4zo2sfTl6NOOpE5XsVzE5RNltNIJ3BWIjoP92YjkqCBcz4qI/eBObiEFXHxG
 KRCWmXU5E6KeddHOB8UC3E5e2kPXWnfMhDspqFWqDTx4jTXTKFnfflDpMxlSj8QQ1ljS
 fmuw1vNpa3Srq0SIWXs3Yi8+CZ2o1gSYFOzL3TWpH9CYIiygn++HYMB4hX9sctCfrbeo
 ATuEaJcaYLvYIjB/e6/PErOcfUZWKWlgQTRbvjxOQIFhwAhCJj5WwHA7nqs0A2i372Ra
 1nwpkJ3rEVH8ssU/VgHToN77qu95pjftoLb/trkIUAcWvXG3cECeieEVc2QRbCNL+uR/
 qKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aa6r931Rjp1NE7cgnIGCkHLvHKb0A2CYSfJ4m7AK8VA=;
 b=nTHL2PPDKUfTC6b+wkO9eB6fyHYK0QDXJ/4YlmrPSOsOFN9i3eyCrPFixtUdADZlYQ
 ECnGZPhIeNqts68+zOhZsTsfNT7DGZPq+AQhg4AOI0Uq5Aqzjl9chZTDEdHw3hWXlf3I
 TKCxTsE/o6QGWKjrjGSkDFk/ltcfL7+nS8xy5lvEAynrMExowQfwxqJFXTSoSeHWTBCw
 FurFKyt62+d6SKntwYAVa/OLy+Ppo6AevvMwCylcgSlOBQ6t+/Gc90PymnZyzO6GMpw5
 bUwaiX3CU7lZliCwOd05GXnjbJAPeNUvEYnK7FpAP++FFNwcDP5Udruqa/7vkks7U7HM
 S0zw==
X-Gm-Message-State: APjAAAXhq4OqCbdezEOpk5JlqyfLgn4ETHGcUPvmfUszPeavekJISEMJ
 G9t6evK7G2vtt1ICXJNZmwWkmC09FwZf4ZztxnxFmGLq
X-Google-Smtp-Source: APXvYqw5LZFI0OlAdzJ3Zi5QgTBf3yzfeslOKU0JWKwjHyMto7VKmPhcOSlsE1S3BTxGJi0w5yQ/WHCyiK/fEHdewQE=
X-Received: by 2002:a92:1657:: with SMTP id r84mr10980876ill.5.1570129060851; 
 Thu, 03 Oct 2019 11:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191001073413.GA51148@LGEARND20B15>
In-Reply-To: <20191001073413.GA51148@LGEARND20B15>
Date: Thu, 3 Oct 2019 13:57:29 -0500
Message-ID: <CAH2r5mtx3OWKv4ZDM=Nob9nRi7ahRW-DK2nY9LP28urQ6NBvFw@mail.gmail.com>
Subject: Re: [PATCH] fs: cifs: mute -Wunused-const-variable message
To: Austin Kim <austindh.kim@gmail.com>
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Oct 1, 2019 at 2:34 AM Austin Kim <austindh.kim@gmail.com> wrote:
>
> After 'Initial git repository build' commit,
> 'mapping_table_ERRHRD' variable has not been used.
>
> So 'mapping_table_ERRHRD' const variable could be removed
> to mute below warning message:
>
>    fs/cifs/netmisc.c:120:40: warning: unused variable 'mapping_table_ERRHRD' [-Wunused-const-variable]
>    static const struct smb_to_posix_error mapping_table_ERRHRD[] = {
>                                            ^
> Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> ---
>  fs/cifs/netmisc.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/fs/cifs/netmisc.c b/fs/cifs/netmisc.c
> index 49c17ee1..9b41436 100644
> --- a/fs/cifs/netmisc.c
> +++ b/fs/cifs/netmisc.c
> @@ -117,10 +117,6 @@ static const struct smb_to_posix_error mapping_table_ERRSRV[] = {
>         {0, 0}
>  };
>
> -static const struct smb_to_posix_error mapping_table_ERRHRD[] = {
> -       {0, 0}
> -};
> -
>  /*
>   * Convert a string containing text IPv4 or IPv6 address to binary form.
>   *
> --
> 2.6.2
>


-- 
Thanks,

Steve

