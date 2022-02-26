Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A92BA4C5528
	for <lists+samba-technical@lfdr.de>; Sat, 26 Feb 2022 11:23:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7jsdZ9DhlS+cuBn5e0nl64bHzF3fsXAHgkXh5/R5ncc=; b=flBK1IrX5bSj79G0Af/b2EXXY7
	y6G4+w2U0Dcy97iF7T/lVXgbuBlWrmMyhlNDP08Zonxqz+eDJhs9heOdU3I6Hco5/rbuD0f4zbAdj
	TMEMKniHfwjuN3M4Razg47zulbNQdLBXC9PKN4kwhYw9vSP0UoNJ4HxPK5NldTrnraaIr7m+utnmc
	rZ+qKB7D2R63sFAevLnuQ4T4oa6ta0Gc7zYClDkeaGLaNjB2FhrwZ9gs1diuEwqsZ4RqtONST9rAE
	lnj1NYeySXrYYXwkv3V7upnSwzekGWLNymYuTXKv/e+GBZ5uxvP89bcQjoRsbIr4jjLPaF0JT53f7
	xKZhtVVQ==;
Received: from ip6-localhost ([::1]:30904 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nNuDx-00CAxS-0r; Sat, 26 Feb 2022 10:22:49 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:46853) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nNuDr-00CAxI-Jo
 for samba-technical@lists.samba.org; Sat, 26 Feb 2022 10:22:46 +0000
Received: by mail-io1-xd32.google.com with SMTP id d62so9346979iog.13
 for <samba-technical@lists.samba.org>; Sat, 26 Feb 2022 02:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7jsdZ9DhlS+cuBn5e0nl64bHzF3fsXAHgkXh5/R5ncc=;
 b=Pk/5G1ltlqkex9Y+38e0ALpLwIfmXwSdGhfyk3KPmYg7jA8caCJ5ptjHVJ8qkrApBN
 PNsT6YFchzjpfgqUDntNayFb7qHshC7M4cynt2wDG3w+qRcIzmjT4A123luLgdFYZZyS
 cfl3zIwmajvZby33ZoWHTOS7wjzJuwU9rc/p/psW6U9qElutFiMDXtaStoHn4VAIWJxw
 ccZNKUp3cfUMQjAfMaTlYk9sZSlPgpRDqIFTEPIHlUdaY8Vc4uecClBtQmeTHpV2GhcN
 qk3uBpZ7ZrG11i2NUPBf1rSerH/IpgTqx7BhceHzb94piiA5AWXht/y/hOcWWVVaBLUr
 VF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7jsdZ9DhlS+cuBn5e0nl64bHzF3fsXAHgkXh5/R5ncc=;
 b=Mf+bvEGlmp96wg5QK3D/WaAXDBnG49YBeSAmUzXmbpEBlZ+d5XfW7FS0WOk4YEaadJ
 qlsNxfxRvg0CdESOsoVKxrYsX9qB/cLQFdAumwvkCIHgjN/BfAQo7eq2ZO5OWMDgbpwu
 i+cogZF3BA1WgDDQ6BndeRw+PMIAoi/NNNdWGv3frY2pneesRnPDw5illjXVDMZ6WViX
 DloxemvppKfHco92W3wU4TWBx90NLhrFf3wyTfIHxxrnpf21JxRYAoUaBYaCicpbI8nm
 CosZoouTI2Q0zhTtJbmWX/gxSoWiMYM8Ho06hn/PUk2MSpvt6OqhI2GGzcqadjNlHbhO
 Au0Q==
X-Gm-Message-State: AOAM533B3+MI0iv34Q0Q+F7AEZrhPD+71+T3Lr3PeK+MGUSwc6yGAALK
 +TYrQjKMIYmdaWxn/6VXLrzP42TkYfB0jaDHkHM=
X-Google-Smtp-Source: ABdhPJwz8AsXgVV4L2PxrAIHcbkuaegZX2IWrny5SGALDuwN9dFZuBKCYJAaU1OIMy4FNI+KTaHOiybD2TFeolYhkIo=
X-Received: by 2002:a05:6638:4905:b0:317:1dda:b116 with SMTP id
 cx5-20020a056638490500b003171ddab116mr985704jab.188.1645870961399; Sat, 26
 Feb 2022 02:22:41 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mt9OfU+8PoKsmv_7aszhbw-dOuDCL6BOxb_2yRwc4HHCw@mail.gmail.com>
 <Yhf+FemcQQToB5x+@redhat.com>
 <CAH2r5mt6Sh7qorfCHWnZzc6LUDd-s_NzGB=sa-UDM2-ivzpmAQ@mail.gmail.com>
 <YhjYSMIE2NBZ/dGr@redhat.com> <YhjeX0HvXbED65IM@casper.infradead.org>
 <CAH2r5mt9EtTEJCKsHkvRctfhMv7LnT6XT_JEvAb7ji6-oYnTPg@mail.gmail.com>
 <YhkFZE8wUWhycwX2@redhat.com>
 <CAH2r5msPz1JZK4OWX_=+2HTzKTZE07ACxbEv3xM-1T0HTnVWMw@mail.gmail.com>
In-Reply-To: <CAH2r5msPz1JZK4OWX_=+2HTzKTZE07ACxbEv3xM-1T0HTnVWMw@mail.gmail.com>
Date: Sat, 26 Feb 2022 12:22:26 +0200
Message-ID: <CAOQ4uxi+VJG56TPvcpOqoVAGgbb8gZQJEfvhXyGyB5VboRE2wA@mail.gmail.com>
Subject: Re: [Lsf-pc] [LSF/MM/BPF TOPIC] Enabling change notification for
 network and cluster fs
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Ioannis Angelakopoulos <jaggel@bu.edu>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 lsf-pc <lsf-pc@lists.linux-foundation.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 25, 2022 at 8:11 PM Steve French <smfrench@gmail.com> wrote:
>
> > IOW, in general disable all local events and let filesystems decide which
> local events to generate? And locally cached write is one such example?
>
> The fs doesn't see cached writes so probably best to still use the common
> existing code for notification on local writes
>

I guess SMB protocol does not allow client B to request a NOTIFY on change
when client A has a directory lease, because requesting NOTIFY requires
getting a read file handle on the dir?

Effectively, smb client needs to open the remote directory for read in order
to prove that the client has read access to the directory, which is the
prerequisite for getting directory change notifications.

The local check for permissions is not enough for remote notifications:
        /* you can only watch an inode if you have read permissions on it */
        error = path_permission(path, MAY_READ);

Thanks,
Amir.

