Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6190545E30
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jun 2022 10:09:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6UoMg7XAdZhjLF3+TuyFXMPmzf7hGCGFPyI+PbeCZf8=; b=iKKgxe/Bsw0106LY5ISbtvl8yy
	81w7pmfGAj74DpvhEh5Y3CJtptWzhSQZQA5Pcb0RPBd0jo3cove0awG/gCYUEnunxd5dPxG2S2CU9
	klWKB+aNHHOkCR+E5q+oFIA/bswBql55sVy1C8rqJYPbDYNMWYmmQAsJap+u2WV5Vggh/zcDaCO+g
	fr3ysKNA7+bvSUy2o9gfs5n6ST+2pvV9iyB3jVe1TIkxCGJTwL3HgzZHJNGHxJEU23SYn0tVO76N7
	2qQlzWX/iEtUw4Vx1KrVnkf5z3y2dQMbsi5Wo6QqEOxjmKGs763wuL3oekwCafNjR72R26wbFy2vi
	H3lT1qtw==;
Received: from ip6-localhost ([::1]:61178 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nzZhV-0095lf-6C; Fri, 10 Jun 2022 08:09:01 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44623) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nzQIB-008yHt-KY
 for samba-technical@lists.samba.org; Thu, 09 Jun 2022 22:06:17 +0000
Received: by mail-ej1-x62e.google.com with SMTP id kq6so37052919ejb.11
 for <samba-technical@lists.samba.org>; Thu, 09 Jun 2022 15:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6UoMg7XAdZhjLF3+TuyFXMPmzf7hGCGFPyI+PbeCZf8=;
 b=bg+vgE40WdCztmrYjVSM/YJF9ZXtLor8NrvacxWrs8tmReVOyatbyF3+bwL2eQ+QeM
 h+OM4NPlRuZy2i1/Ro6kdbLrzQGd7SZNUFH7OSOKsX6tGe3TeNeXQa/eGc0tnjd1Yy2D
 IwGPT6SLiwVu0vhgUhkqA+ubHnvIUAQpO7X4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6UoMg7XAdZhjLF3+TuyFXMPmzf7hGCGFPyI+PbeCZf8=;
 b=3FzqtP8Po59dQ6tPnEr30Rh38lN+nEwrwmzVH9UTTKe0wjJhkM8ezeOJxSv0VogRjG
 D6bNqjHaom+Yp1fSthlhDNitNlDGM/pLlXJew7Zk1gX6xE/9UreuFfldf/KI/BYg5XCS
 RUM6RhQ5+5hO+H5vrGWXsWywa5Mf5FFsiXwcf+K8BytP6yegdbeeNYPCFX2yp+sd2szp
 xod9RMrn5VKnrwFmCbPzyr/N6DEd7sy2/gH6mZ30kivm883pR5IPDIlqMCchQaAIQARr
 0+D5Cl1n5oiXXhJGw/caeuUC+Gl0n9Ng/28iaCY3eYwohmedSlqPCEEVYR6mCjZr+ih7
 s8gw==
X-Gm-Message-State: AOAM533rvYswp0HRshP0MrZYB7lhdIJeRICFwjgpNcSNf0SjgZVjkOGr
 r57Ct+M/7JNBiWA8bPPXeFPlJXh1u1KBvH8bvaA=
X-Google-Smtp-Source: ABdhPJw/x5o4CdxRFXjRwVEnxQVLzk+TX8uxi2eZ6yjT7JJ7oxVdGybXe17PcB+4JRucpdJTyzd3Ag==
X-Received: by 2002:a17:906:149:b0:712:502:bc62 with SMTP id
 9-20020a170906014900b007120502bc62mr5153576ejh.720.1654812374591; 
 Thu, 09 Jun 2022 15:06:14 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 n8-20020aa7d048000000b0042dcdfb003esm15079732edo.53.2022.06.09.15.06.14
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 15:06:14 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id q15so9918463wmj.2
 for <samba-technical@lists.samba.org>; Thu, 09 Jun 2022 15:06:14 -0700 (PDT)
X-Received: by 2002:a05:600c:42c6:b0:39c:4bfd:a4a9 with SMTP id
 j6-20020a05600c42c600b0039c4bfda4a9mr5442248wme.8.1654812362760; Thu, 09 Jun
 2022 15:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <40676.1654807564@warthog.procyon.org.uk>
 <CAHk-=wgkwKyNmNdKpQkqZ6DnmUL-x9hp0YBnUGjaPFEAdxDTbw@mail.gmail.com>
In-Reply-To: <CAHk-=wgkwKyNmNdKpQkqZ6DnmUL-x9hp0YBnUGjaPFEAdxDTbw@mail.gmail.com>
Date: Thu, 9 Jun 2022 15:05:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=whGrrF20LshkNGJ41UmNN13MU6x0_npwaJQi9cr626GQQ@mail.gmail.com>
Message-ID: <CAHk-=whGrrF20LshkNGJ41UmNN13MU6x0_npwaJQi9cr626GQQ@mail.gmail.com>
Subject: Re: [PATCH] netfs: Fix gcc-12 warning by embedding vfs inode in
 netfs_i_context
To: David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:08:55 +0000
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
From: Linus Torvalds via samba-technical <samba-technical@lists.samba.org>
Reply-To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 samba-technical@lists.samba.org, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Dave Chinner <david@fromorbit.com>,
 William Kucharski <william.kucharski@oracle.com>,
 linux-hardening@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, CIFS <linux-cifs@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Steve French <smfrench@gmail.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, Kees Cook <keescook@chromium.org>,
 Eric Van Hensbergen <ericvh@gmail.com>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jun 9, 2022 at 3:04 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> IOW, I think you really should do something like the attached on top
> of this all.

Just to clarify: I did apply your patch. It's an improvement on what
used to go on.

I just think it wasn't as much of an improvement that it should have
been, and that largely untested patch I attached is I think another
step in a better direction.

                      Linus

