Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB41FDDC
	for <lists+samba-technical@lfdr.de>; Thu, 16 May 2019 05:00:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wAnMT3wPbUftDQ9VRXJkEmAHdM6PJNXSjrEixjo7CHw=; b=k9IifxCNXoVf6Bgh8DXfDStNHh
	cWwOnw4iCuuYUmseLRMQtehQgdV6qA/cLO6gQdEeSVXvXgJOO+7sf/TIwWiwzZqGx6DTNdgVN53LD
	mj+SdrblAJw6WM9UmgKgo3XMjO05MCp426LQmskqfrdDAYY/5fXNqN7X8RGYNBCwZ6nh3krKnAPpV
	D0ibPDQCCuZ+1tL5GVL+IidDIIr+yKBIPaGx6GhH3MJIZctLgi6jrXV9lP1yoN2Q+BIbvaXilYaTS
	5emOZDEREuQIRgBuAOULEk1bnDoZSTz2maSQkA0saGLIm1BcD5+oPuXV+ytTnv7nCT7R6Pn7Pmi89
	wnvEvcLQ==;
Received: from localhost ([::1]:44050 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hR6d8-003tsJ-Lk; Thu, 16 May 2019 03:00:26 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34453) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hR6d0-003trz-HS
 for samba-technical@lists.samba.org; Thu, 16 May 2019 03:00:23 +0000
Received: by mail-pl1-x644.google.com with SMTP id w7so848548plz.1
 for <samba-technical@lists.samba.org>; Wed, 15 May 2019 20:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wAnMT3wPbUftDQ9VRXJkEmAHdM6PJNXSjrEixjo7CHw=;
 b=h4i4HSAGJR84UoKeK/j3ibfEiSl0Nae5/4egy2hqYp5rHK/2jW16GV7Qey53Al97vP
 r7bnqErxE3mgsEfE6logv/FDJh5K/lrkuZXOPcgwSVM+xFdnSNj1nBJKXcdIN3HhgnnB
 YdmwwkHf4NM6xBUCsa0naS3Y+eDjwvldeCEAgETr/HrWJi/uV0HVl7NEy/A+QHHL/fR4
 HzZdoX5Myb3QuHw37CFsXIMb3G1jd5hirXfEMj2Dwo0rVVRaYmi+7CP4STR+84i6sHc2
 iGyaaxMuOsyeT27LmyPCuw7If4G8G/eqPeeqKeR5k1ZNWBbxUSG1LyaofgEHkuTf3YZD
 aqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wAnMT3wPbUftDQ9VRXJkEmAHdM6PJNXSjrEixjo7CHw=;
 b=hSDajnqjE5a/PmKm4ydpCw3o1Y0Gm/2/I+/QEBrCmFb5Xg1SxDSkNOJx3401h7HT0Q
 7NRbgZgKCTP8MuO2qYukIQFB7v5f0j4g6AeDbHsVaC3TVCQ5Q4S2kcbFI+fTFer/faYx
 HQtvNU3Ak5JY1Usv8acBY+OSAZJ/piKJ6o4SlHCvpAvV7QFBj3+vuWZVINDI8tGBdCXq
 lKUQP9AYY/EjippvHvHtIZQGGhlkDIeHdVEqQSscWEd7x8Hs6vzHPAdu/SuJsbK9RW7I
 emLel75wkdHImH1F1+oO+z3vJCidNmId/cZrI2HLTrTm31/OX1J7O+lwVu95f3Bfiy7q
 7eAQ==
X-Gm-Message-State: APjAAAU0Ni8Rqs+ed3q1CKWouI+6CJiiqyQCC4Zc3Zmkv++4gM0coFqn
 94jAPnSpIaTCWs6cROv4WRQQxdYzY1Dvf9Zzu+0=
X-Google-Smtp-Source: APXvYqybsPMkPVEtKUFspQfYXb7gQWaPGXo8DDb+bCwfN7GobgQ49jKQ21DnWy2YMNVJW1YK1oj/1CIn6OoWtcQPDdA=
X-Received: by 2002:a17:902:6bc2:: with SMTP id
 m2mr46813962plt.24.1557975616425; 
 Wed, 15 May 2019 20:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <1557954545-17831-1-git-send-email-longli@linuxonhyperv.com>
In-Reply-To: <1557954545-17831-1-git-send-email-longli@linuxonhyperv.com>
Date: Wed, 15 May 2019 22:00:05 -0500
Message-ID: <CAH2r5mvuRaEJDVv6hXwWuegckvXjtTfbpkLGLXE8kb2h1s-xUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] cifs: Don't match port on SMBDirect transport
To: Long Li <longli@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On Wed, May 15, 2019 at 4:09 PM <longli@linuxonhyperv.com> wrote:
>
> From: Long Li <longli@microsoft.com>
>
> SMBDirect manages its own ports in the transport layer, there is no need to
> check the port to find a connection.
>
> Signed-off-by: Long Li <longli@microsoft.com>
> ---
>  fs/cifs/connect.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 0b3ac8b76d18..8c4121da624e 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -2446,6 +2446,10 @@ match_port(struct TCP_Server_Info *server, struct sockaddr *addr)
>  {
>         __be16 port, *sport;
>
> +       /* SMBDirect manages its own ports, don't match it here */
> +       if (server->rdma)
> +               return true;
> +
>         switch (addr->sa_family) {
>         case AF_INET:
>                 sport = &((struct sockaddr_in *) &server->dstaddr)->sin_port;
> --
> 2.17.1
>


-- 
Thanks,

Steve

