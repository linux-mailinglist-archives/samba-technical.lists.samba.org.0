Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BABB064468F
	for <lists+samba-technical@lfdr.de>; Tue,  6 Dec 2022 15:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+c8r9/oIt50HC1wYqsQEflGL3D83a+hq7Wa/m7aZeeY=; b=qpbsn+wMyUvMJ39dQgUZZ1+egO
	Ne7+D8039mt/6xnlLgd/8H7YveJmBILbjZATMc94iB3aoaBpPaW4iyJHx9eftDHf8VYRwCiFGIZFC
	9oNwz2Tzl3cPWnrny+emdMuwWyI/ftndNDxicM8l4Vh1p7zmdj2umqUi7ZjfTCZgJq98A8+X+Z14o
	jKC6sfb9H7Ob5nllneuZLGTgtkWyJmQxniMzv4Jlmfxyi6JRGNAnY976qir+aq2+nK1CWZG5mloVs
	W6jLe3Qz1ZiUiC+6JNCBWCen+vEwofD/fWrpjePNWdTNAPC4hIsDHhZMdz3G/fVaYKCYF43fx/58n
	HtC14qjQ==;
Received: from ip6-localhost ([::1]:41284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p2ZId-006fiu-D6; Tue, 06 Dec 2022 14:51:59 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:42836) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p2ZIY-006fil-3Y
 for samba-technical@lists.samba.org; Tue, 06 Dec 2022 14:51:56 +0000
Received: by mail-lj1-x234.google.com with SMTP id q7so17465221ljp.9
 for <samba-technical@lists.samba.org>; Tue, 06 Dec 2022 06:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+c8r9/oIt50HC1wYqsQEflGL3D83a+hq7Wa/m7aZeeY=;
 b=DqAQCaMBLr8JlEoTNR3xKiOTqEYAXX1FVcPv7Out7W5CzTaZC72nCKbMe9DWKB/V/p
 yM1gntmsSEMFMz3phuGvPPDRWw2EagzvKGzjBbL+e6KwBnEZaQCSNFAlcHnYXhzLEo4P
 OoBrjAeKfeHbmJO4nElGme+U/ZbedJaI1tPw3crfIOf7GkmLJn5n1xnLXCUihZsm5vN8
 nz0WJvohlmKP0wMcoImPZurmBbsp3Jqlp8eJqB3pt0eyfAY1LZrTfPcVHjnPZWIMpR1U
 uIMljITRcL1Cn6Wm6V1NcYMOnWDLQdxu1Em0QK33QkVOeRnCTcqDlpJN1nDxC1FcAuJH
 3HNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+c8r9/oIt50HC1wYqsQEflGL3D83a+hq7Wa/m7aZeeY=;
 b=8KTzld4c2p7dbNR7eKjm0VfgDVbsYS3b6re1/HpaERwHA/crjVU9CJjUkoWGRqVh8W
 8zKMj9wACenkFtLCcJ1kfYroZ06Wn56AWOhc3y0hFXajAggAe+msQJX/ffdRBji//eIY
 z3WJ1IyIh0C6Br6yrMw8fPYy7r9lWeU+zgPQd075Z7Z/Wkemm0e9jYshruUtet9xcotX
 qX5D09a9zyiEsUqI3MqWwbSl+RBx/G5izo3M8s0nGRKbUx0gV7RVTJ+Z4vhyk3yr7Ljg
 mYe7uG/pS7zUkClCEj0KWh66KZ7gmP8vgfAGKiB9rwb1BDfASBbaUiQHnHmntSMUwBQC
 qumQ==
X-Gm-Message-State: ANoB5pluJKOn45JKYPLJ3ZhP1/COQ/h5mUyEcGfCdRe3t8ZwHjCt3xrM
 YeG+KDR6HCmhF/dWCqZTAOa4ohOei3ClXdINXzE=
X-Google-Smtp-Source: AA0mqf5mxr0kaG2P9ih3iG5KC/btRmXOc8R7RI0wvfkVEv5gxA9Ug7a5PA4i9/JLGTi7sE76Ji09E5ARVqV7qPs0p2s=
X-Received: by 2002:a05:651c:12c1:b0:277:2fd5:482 with SMTP id
 1-20020a05651c12c100b002772fd50482mr23681476lje.194.1670338312401; Tue, 06
 Dec 2022 06:51:52 -0800 (PST)
MIME-Version: 1.0
References: <184e5d5c395.e6da05c53387741.2839551941271541423@elijahpepe.com>
In-Reply-To: <184e5d5c395.e6da05c53387741.2839551941271541423@elijahpepe.com>
Date: Tue, 6 Dec 2022 08:51:40 -0600
Message-ID: <CAH2r5mvhP=Sh1Y0YKwHbChdu-oisfT05D6_XF95kGtfE+Vcaaw@mail.gmail.com>
Subject: Re: [PATCH v2] cifs: add ipv6 parsing
To: Elijah Conners <business@elijahpepe.com>
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
Cc: linux-cifs <linux-cifs@vger.kernel.org>, sprasad <sprasad@microsoft.com>,
 pc <pc@cjr.nz>, samba-technical <samba-technical@lists.samba.org>,
 tom <tom@talpey.com>, sfrench <sfrench@samba.org>,
 lsalhber <lsalhber@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Can you fix the whitespace error and make sure it merges (cifsroot.c
hasn't changed in over a year so should be easy). I got this error
when trying to apply the patch.

Applying: cifs: add ipv6 parsing
.git/rebase-apply/patch:26: trailing whitespace.
{
error: fs/cifs/cifsroot.c: does not match index
Patch failed at 0001 cifs: add ipv6 parsing

On Mon, Dec 5, 2022 at 11:25 PM Elijah Conners <business@elijahpepe.com> wrote:
>
> CIFS currently lacks IPv6 parsing, presenting complications for CIFS
> over IPv6.
>
> To parse both IPv4 and IPv6 addresses, the parse_srvaddr() function
> was altered; parse_srvaddr() now returns void. To retrieve the IP
> address from parse_srvaddr(), the parameters *out6 and *out32, an
> in6_addr and a __be32 respectively, are provided. The value of
> root_server_addr is determined by if those parameters are set or not.
>
> The parsing in parse_srvaddr() was updated slightly. The character addr
> can hold up to 46 characters, the longest a possible IPv6 address can
> be. In the while loop, isdigit() has been replaced with isxdigit() to
> account for letters present in IPv6 addresses, and *start is also
> checked for being a colon. Finally, the function uses inet_pton() to
> determine if the address is an IPv6 address; if so, *out6 is equal to
> in6, set by inet_pton, otherwise, *out32 is set to in_aton(addr).
>
> Signed-off-by: Elijah Conners <business@elijahpepe.com>
> ---
>  fs/cifs/cifsroot.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/fs/cifs/cifsroot.c b/fs/cifs/cifsroot.c
> index 9e91a5a40aae..0246e0792d8e 100644
> --- a/fs/cifs/cifsroot.c
> +++ b/fs/cifs/cifsroot.c
> @@ -14,6 +14,7 @@
>  #include <linux/in.h>
>  #include <linux/inet.h>
>  #include <net/ipconfig.h>
> +#include <arpa/inet.h>
>
>  #define DEFAULT_MNT_OPTS \
>         "vers=1.0,cifsacl,mfsymlinks,rsize=1048576,wsize=65536,uid=0,gid=0," \
> @@ -22,19 +23,24 @@
>  static char root_dev[2048] __initdata = "";
>  static char root_opts[1024] __initdata = DEFAULT_MNT_OPTS;
>
> -static __be32 __init parse_srvaddr(char *start, char *end)
> -{
> -       /* TODO: ipv6 support */
> -       char addr[sizeof("aaa.bbb.ccc.ddd")];
> +static void __init parse_srvaddr(char *start, char *end, struct in6_addr *out6, __be32 *out32)
> +{
> +       char addr[INET6_ADDRSTRLEN];
> +       struct in6_addr in6;
>         int i = 0;
>
>         while (start < end && i < sizeof(addr) - 1) {
> -               if (isdigit(*start) || *start == '.')
> +               if (isxdigit(*start) || *start == '.' || *start == ':')
>                         addr[i++] = *start;
>                 start++;
>         }
>         addr[i] = '\0';
> -       return in_aton(addr);
> +
> +       if (inet_pton(AF_INET6, addr, &in6) > 0) {
> +               *out6 = in6;
> +       } else {
> +               *out32 = in_aton(addr);
> +       }
>  }
>
>  /* cifsroot=//<server-ip>/<share>[,options] */
> @@ -42,7 +48,8 @@ static int __init cifs_root_setup(char *line)
>  {
>         char *s;
>         int len;
> -       __be32 srvaddr = htonl(INADDR_NONE);
> +       struct in6_addr addr6;
> +       __be32 addr32;
>
>         ROOT_DEV = Root_CIFS;
>
> @@ -60,7 +67,7 @@ static int __init cifs_root_setup(char *line)
>                         return 1;
>                 }
>                 strlcpy(root_dev, line, len);
> -               srvaddr = parse_srvaddr(&line[2], s);
> +               parse_srvaddr(&line[2], s, &addr6, &addr32);
>                 if (*s) {
>                         int n = snprintf(root_opts,
>                                          sizeof(root_opts), "%s,%s",
> @@ -73,7 +80,11 @@ static int __init cifs_root_setup(char *line)
>                 }
>         }
>
> -       root_server_addr = srvaddr;
> +       if (addr6.is_set) {
> +               root_server_addr = addr6;
> +       } else if (addr32.is_set) {
> +               root_server_addr = addr32;
> +       }
>
>         return 1;
>  }
> --
> 2.29.2.windows.2
>
>


-- 
Thanks,

Steve

