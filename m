Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 630582968B0
	for <lists+samba-technical@lfdr.de>; Fri, 23 Oct 2020 05:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7PzakwHfQTWhtL06XjXf5GbEZM4bdpOgEHF4utsyP/Y=; b=1mPoCemcDMFv3kjUKtOlwIQiiW
	6Ly7jwYPS6cvifPiDno7tSyLLqgu9g1+sHUYEKfMOnHtWjUbKj+GD6ldBVv1Ll/mQkcGRfQT+dcG/
	ZGTyVhp6eCVLPDhu/dTq1a0HIXSBoYCpH+j6V8zB14FiMgwSt2zMnY3rkDOMVawJb4zxsKJyejkfA
	S+376ITiWbZ96zJrFWCIxg/TjBYh5MSxpNDrcJFGusvULqLeGkPiE1UlgtohJSqfF9gQ3Br3P1jzO
	/16I4SaP1TPEs+o6w6uhid+E/ale1iKq7ExaJkh4q8ccuB/AN0jcCtYS9KYJlTcW7HUt0xwWwZbfu
	/oka55/Q==;
Received: from ip6-localhost ([::1]:55176 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVnXw-00DPN2-2Q; Fri, 23 Oct 2020 03:15:16 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:41319) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVnXo-00DPMv-VN
 for samba-technical@lists.samba.org; Fri, 23 Oct 2020 03:15:11 +0000
Received: by mail-io1-xd43.google.com with SMTP id u62so184212iod.8
 for <samba-technical@lists.samba.org>; Thu, 22 Oct 2020 20:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7PzakwHfQTWhtL06XjXf5GbEZM4bdpOgEHF4utsyP/Y=;
 b=dfaSF0bP/teBvUOvcm3K6e8ZwRy5y2819A2zrUzxYHZhIFIEWTyrnoSM3bA0wZgbt8
 fTJGfxlwibps9mBucgNXI/efmJXGnwLBwVJvaY3UyOU13MMwUpEvsWs15fI7Mi/rHMnB
 RDcLnPoEP4szOGl3JuYbecPbcIksSzA8/DrBp7vaUBxl80MMEB30ymXhbB9FsVK8nYsL
 Jy9VRUc+e/ZWebXDtjzrA/igdwhBjIBJOX3QXZJenxaU+UZe4LiqtaYbQkVEPror29dx
 vwi+PS6O8uotWXCY9RyuK/+/SYGH3amTokVnIpEDNG/7bbZOBra/fq4yxKiBYCJH+eGL
 zLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7PzakwHfQTWhtL06XjXf5GbEZM4bdpOgEHF4utsyP/Y=;
 b=o+6pLSuPbqJXMRN8H33KvxviSRKPAMcHJz/7aeaj7hG6ZdJ3ZIhHzm0xRNN0afhNKu
 HS1NjQZU/3bK51mb27K3vh39JJEfIoSVlk3CvUHndKF2W84cHAjCS7JsE4cJkar0bEuB
 MIxR6RtBSiqzog4YSi3rXqJnbCac2253EmJ7BxKSeK7k5QpebMhaVpgXn5eeVDqIcN1M
 ThlhyVrm/9XehbwKZKz863EwIrjc0tWStWqJqBgKPulwQBZIavoRZ1zJu7dViNmWGjP9
 yooMTFNTuwHGo+tUpvmNeNBkagrczFj7WCGUxQwh5ymMo2uqgkac8LAPMCkpAq8dPDMY
 W/aw==
X-Gm-Message-State: AOAM533VDruSn/fgf7O+eaB8xeefVWxHAtaLCFT2gb053UYejes90n2b
 pRnsGy+qQfulxtsm3ccBb3pBG/mhX00VdW1tCus=
X-Google-Smtp-Source: ABdhPJwzx2gsPC2sSvxmnXvqWi53Ls9oHA9X+xyH6xFILPIFZK/WhH/Ip08a3xkGL+nvRg0CqwSG6kQJTCoj/Y0Tz0Q=
X-Received: by 2002:a05:6638:20a:: with SMTP id
 e10mr399276jaq.20.1603422906501; 
 Thu, 22 Oct 2020 20:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvWqz2bMX9ut0bT4ZQH8WQNAc8Cjg3bM1TKeXgzupOZMQ@mail.gmail.com>
In-Reply-To: <CAH2r5mvWqz2bMX9ut0bT4ZQH8WQNAc8Cjg3bM1TKeXgzupOZMQ@mail.gmail.com>
Date: Fri, 23 Oct 2020 13:14:54 +1000
Message-ID: <CAN05THQyNC1N4Y6oZ84RgAfmBQ+2RE8+ppv4XaJxUQW_T-ZzNA@mail.gmail.com>
Subject: Re: [PATCH]SMB3] Add support for WSL reparse tags
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Reviewed-by me

Very good.

On Thu, Oct 22, 2020 at 3:02 PM Steve French via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> The IO_REPARSE_TAG_LX_ tags originally were used by WSL but they
> are preferred by the Linux client in some cases since, unlike
> the NFS reparse tag (or EAs), they don't require an extra query
> to determine which type of special file they represent.
>
> Add support for readdir to recognize special file types of
> FIFO, SOCKET, CHAR, BLOCK and SYMLINK.  This can be tested
> by creating these special files in WSL Linux and then
> sharing that location on the Windows server and mounting
> to the Windows server to access them.
>
> Prior to this patch all of the special files would show up
> as being of type 'file' but with this patch they can be seen
> with the correct file type as can be seen below:
>
>   brwxr-xr-x 1 root root 0, 0 Oct 21 17:10 block
>   crwxr-xr-x 1 root root 0, 0 Oct 21 17:46 char
>   drwxr-xr-x 2 root root    0 Oct 21 18:27 dir
>   prwxr-xr-x 1 root root    0 Oct 21 16:21 fifo
>   -rwxr-xr-x 1 root root    0 Oct 21 15:48 file
>   lrwxr-xr-x 1 root root    0 Oct 21 15:52 symlink-to-file
>
> TODO: go through all documented reparse tags to see if we can
> reasonably map some of them to directories vs. files vs. symlinks
>
> --
> Thanks,
>
> Steve

