Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 28833139C4C
	for <lists+samba-technical@lfdr.de>; Mon, 13 Jan 2020 23:18:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bK5tAWYYK9RXUwEYak4dnGM+/7DX2wX/UYXB9gMajUQ=; b=ZSJNiGcYpjmoG/W4BhWdM+nSck
	rtBXsZZBmDjZCk/R6Jnm/qtBU5MmKFLK2nPfx0Uh7Ii4zr4+l1ETxkiHxX7Mvr3mix2+Cj+edzDCv
	HYUFyeb8oK4sO+RdGMsxxtdOwiIRSuaxFoIbuCoS5jziJK5pJ3DUjxluTE2jdXbd5+ywzjqZqVjCk
	a8XxotHX9QujtTq0HZPhNZKAIa3oWj/U5kEebfU/1F6FMehlZgzarLz/JSXwwgUd3q7/VKXf78FV2
	r3etfhOpoiTaFg+1+jLH3BQLxuBon4NvvwTB4m6QNnMTFvpsOlWsXAJh+JwHQ3lRShjairUUvd6El
	Atpm9NNw==;
Received: from localhost ([::1]:59554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ir828-003IZe-T2; Mon, 13 Jan 2020 22:18:04 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41617) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ir824-003IZX-5s
 for samba-technical@lists.samba.org; Mon, 13 Jan 2020 22:18:02 +0000
Received: by mail-ot1-x341.google.com with SMTP id r27so10556415otc.8
 for <samba-technical@lists.samba.org>; Mon, 13 Jan 2020 14:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bK5tAWYYK9RXUwEYak4dnGM+/7DX2wX/UYXB9gMajUQ=;
 b=ST4aSNTTlA/yd/eg+W3JhTUhV6Lymv/8pDR/NCMtzSaGxbjejrjsj5JOOrNLmLFwHS
 txzGWLc7LtTQZA6H/Pv6XNc+Yj9EOcL7cvnwGRpc6XJxvOiJq3cx58d8ft+HUt6C2EeE
 5tkBZAWLGSOKcNV0tpGqAUSpp+x2yS4V9yBaYhcrOTz9bKAZ+8q4Sqn1s04dV2WS3OcY
 kM9V7JcMhFPU1A8RkJoC/BLny1iM3OC/qfL5CTrVhKenXWKqOBdNcV7c6G0z60fcLmjE
 +qx1uMIRkYyJB+1xarfE3iHNDSMlNrslZFTlNx5LphRGI5Ta+JQx/9q6TLTHtePJ5k7M
 gnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bK5tAWYYK9RXUwEYak4dnGM+/7DX2wX/UYXB9gMajUQ=;
 b=qCCwXwkPrndt9iZSnXE51uNGBljQfNtkm+dK13+t+eC8L9zHL1vLpdB+d1WVNxJd6d
 ZZ8FbZeYrJkndVQPfkDd+lyVbIYwMbfN7/RIR4a/GGE8kkIdZgW0KiJNZ+ClU+IsN+Xl
 v8lwpHkq7Nt1FpFJ9nZZQlKUpw827iwDDEcm3rq2d8DDdrOXcKL9O9LAzHp7IQSpge1V
 unhZNC6JdLvYBnV6IioVaou+2APmpXJqV0bhc/RDCaNj3ZWpAUdPvrCqZCbJEwaCTXZV
 qFXdQ1UW7IgRBlBgWhDiOBj3jykAB0qrUx3xOU03hCQ0sQxJuM5DEcso7byFNA4483sN
 +x+Q==
X-Gm-Message-State: APjAAAWK+XFWa66omEw5hc+cfecqPx0X9Qt383hvnDBdMN9EbIAM7JjA
 peS2Yi40w1io3FFjqkXFbMqrq4HHXD05JlkDmsY=
X-Google-Smtp-Source: APXvYqyVdhG3hldz4ONnrT0gKc2YOBgljzMvL2rp8Bg5pF5JXB45PNzpJxFm6UCbTZB/iCUobze1pw30POKZAru7U64=
X-Received: by 2002:a05:6830:155a:: with SMTP id
 l26mr14851212otp.339.1578953877354; 
 Mon, 13 Jan 2020 14:17:57 -0800 (PST)
MIME-Version: 1.0
References: <20191219165250.2875-1-bprotopopov@hotmail.com>
 <CAH2r5mu0Jd=MACMn6_KPvNWoAPVu+V_3FOnoEZxDWoy0x2qEzA@mail.gmail.com>
 <780DD595-1F92-4C34-A323-BB32748E5D07@dilger.ca>
 <20200113203613.GA111855@jra4>
In-Reply-To: <20200113203613.GA111855@jra4>
Date: Mon, 13 Jan 2020 17:17:46 -0500
Message-ID: <CAHhKpQ6s9szkMk-C8bZzC=3X3APu64Sujc5xtB5-Aa4_beiA7w@mail.gmail.com>
Subject: Re: [PATCH] Add support for setting owner info, dos attributes, and
 create time
To: Jeremy Allison <jra@samba.org>
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
From: Boris Protopopov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Boris Protopopov <boris.v.protopopov@gmail.com>
Cc: Andreas Dilger <adilger@dilger.ca>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

OK, I will look into adding ctime-related attribute, and model it after btime.

On Mon, Jan 13, 2020 at 3:36 PM Jeremy Allison <jra@samba.org> wrote:
>
> On Mon, Jan 13, 2020 at 01:26:39PM -0700, Andreas Dilger via samba-technical wrote:
> > On Jan 9, 2020, at 12:10 PM, Steve French <smfrench@gmail.com> wrote:
> > >
> > > One loosely related question ...
> > >
> > > Your patch adds the ability to set creation time (birth time) which
> > > can be useful for backup/restore cases, but doesn't address the other
> > > hole in Linux (the inability to restore a files ctime).
> > >
> > > In Linux the ability to set timestamps seems quite limited (utimes
> > > only allows setting mtime and atime).
> >
> > The whole point of not being able to change ctime and btime as a regular
> > user is so that it is possible to determine when a file was actually
> > created on the filesystem and last modified.  That is often useful for
> > debugging or forensics reasons.
> >
> > I think if this is something that SMB/CIFS wants to do, it should save
> > these attributes into an xattr of its own (e.g. user.dos or whatever),
> > rather than using the ctime and btime(crtime) fields in the filesystem.
>
> FYI, we (Samba) already do this for create time to store/fetch it
> on systems and filesystems that don't store a create time. It's
> easy to add extra info here.

