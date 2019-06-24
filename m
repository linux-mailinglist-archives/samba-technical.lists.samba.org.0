Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEFF50055
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jun 2019 05:45:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bcJh3ScCQqVkMPXMTs4j568BRTTMVAoHQlqsGJwztRo=; b=FJ6XG68DxLASgnMZVVnouSZcQb
	G2BjXp5hHcTj6IARbKP3+h/dNhCZpXDlW9Zq6m9ZhVDHGQziTxDNPg2WW/Tx76IeA6l+r/93nHHo3
	NDwZnCsfYjExNaZ8d7Fg7X3ZXMj/+IqU/96LsUHSNzz40dTlEcGTLN1fT8SELv5JXC5QVivKNE7ju
	ddq+c3l6IRNehrLCLs1DHb+WqS2JEFPi4HOMFqYTFpxhA5m+j9yW65/zQWkIMK5XrTt7hFVbYTpcZ
	scEwG61avl7DyIeWj9kXHUJjTd7wp5fs1BIM0SEvTij1oRD0HNxWImNKEmxwDhQcDnU4vcKQIBGo8
	zRc/qFmw==;
Received: from localhost ([::1]:64906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfFus-001Llf-8J; Mon, 24 Jun 2019 03:45:14 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:40911) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfFuk-001LlY-4g
 for samba-technical@lists.samba.org; Mon, 24 Jun 2019 03:45:08 +0000
Received: by mail-io1-xd43.google.com with SMTP id n5so462153ioc.7
 for <samba-technical@lists.samba.org>; Sun, 23 Jun 2019 20:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bcJh3ScCQqVkMPXMTs4j568BRTTMVAoHQlqsGJwztRo=;
 b=KKTTqkx4JnK2agWr7E9o07V5mvQMzoCeoQi8WxAGc0DWXD7dwQdOsIuYg/RZK5TiLk
 GZ4CBGZq7BBvYJ8FEVIvznQ8OxzXxItHmhfPtdXSfBNmvoKkf/PSexyamiKY8hK8MXDs
 OJ1hxfHxHBmoeLG974AT8Xumkmbqpqj7FoHn/9mCNLETspV+qUEzmvU0UbIwVeIUA+9A
 Vk99ymB3crRWzCT6ESfrGMd9WFs53W/rQwHvw33bZ6JDKHrN4VHdxMIZ2ogGgK7l4Sx9
 UtkD3EsnvEdCpDwddPUcXUWwZroYFQGGUPLsGoKlKG2w4T3li7fLS2LHOA9nW+Cn/yYJ
 i4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bcJh3ScCQqVkMPXMTs4j568BRTTMVAoHQlqsGJwztRo=;
 b=NvlGmCti4VhE1B6KtjtDR1rSkqnJfEi3fhamyzv2J7zUSNELte07SatuVxF4XnoRzB
 wmtxt4N0ZC0cc8iTTLnI/VXdXBYEbYB4ocRg/4diWusoQJmf4zh81pV94zOvuhbJcLuJ
 Zv5yECE+XtraRGKFc+LtFi5OKQ0ohwoLcWp3X6V6ZFymLL7Eqt4par/Tlu6+yRdnOkLX
 GMmkZp2lZZqQ5ZjPM3MjIp5fWHevRYDWdYkkrkOnO0tmj2g7UlUjk3qHlNamQBF7oACy
 J53MS7VpJFJfnBN5Xlgc4+etuHhkz1fvW1JF9+t0YoqqQwWlnlJcPf/Fq8yULBiYATYA
 WglQ==
X-Gm-Message-State: APjAAAWNLFfCqlkB9/xSgeBnrQrLX1OA1pH4Nzg5GJc40uetmQEDDsDm
 Pk4kofDG/7mHaUjAoyedwxpSj0EPZ4qaOYA9SVc=
X-Google-Smtp-Source: APXvYqxd3DUikZw6ws4oXLhCbFlSHQk7m77ZT3mQh5+OUqZfuJ06Pw2qTK8TafoHCEK2iDQLz4IATsddwzxZqEO8LAk=
X-Received: by 2002:a6b:3883:: with SMTP id
 f125mr108394436ioa.109.1561347904242; 
 Sun, 23 Jun 2019 20:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv+oqGxZRkV_ROqdauNW0CYJ7X9uJCk+uYmercJ4De41w@mail.gmail.com>
In-Reply-To: <CAH2r5mv+oqGxZRkV_ROqdauNW0CYJ7X9uJCk+uYmercJ4De41w@mail.gmail.com>
Date: Mon, 24 Jun 2019 13:44:53 +1000
Message-ID: <CAN05THTqP+_uSEPq2FqBEnV8FeuutaHASznH6iBDS=C0hCD=kQ@mail.gmail.com>
Subject: Re: xfstest 531 and unlink of open file
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jun 24, 2019 at 1:23 PM Steve French <smfrench@gmail.com> wrote:
>
> Xioli created a fairly simple unlink test failure reproducer loosely
> related to xfstest 531 (see
> https://bugzilla.kernel.org/show_bug.cgi?id=203271) which unlinks an
> open file then tries to create a file with the same name before
> closing the first file (which fails over SMB3/SMB3.11 mounts with
> STATUS_DELETE_PENDING).
>
> Presumably we could work around this by a "silly-rename" trick.
> During delete we set delete on close for the file, then close it but
> presumably we could check first if the file is open by another local
> process and if so try to rename it?
>
> Ideas?

The test is to check "can you unlink and recreate a file while someone
(else) is holding it open?"

I don't think you can rename() a file while other folks have it open :-(
This is likely a place where NTFS is too different from Posix that we
can't get full 100% posix semantics.

>
> --
> Thanks,
>
> Steve

