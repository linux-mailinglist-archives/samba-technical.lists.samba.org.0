Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0BA246DC3
	for <lists+samba-technical@lfdr.de>; Mon, 17 Aug 2020 19:13:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=oAP7hYHbdXYpDT9l053NmAYwwsJ+zUP6K6Qg6CJSdbA=; b=XQn7Oeth2wiyxJO446v7XYqzPu
	g/3tUChp05346vzukensYjDfEjKmuVfHZYf+Wg06Uy6VVL2zjotCh1tL7kS0DSLEzb4XyUoP0vHV5
	QWldpBMgwNDSE0tIxXHEPYSaJc8Dwcw+7jmqdzooH+BZ0nOghVYvQ8+2SAYUtfkxWUDVQEsryKIyO
	wPEs3qNHPSZFsp+eCAZ6uX3f95r9NruZobUOsp/K0XaqfMe4c2+y3qI2085zLjuSTpnQilqEqgTjv
	O2xhHTTyJp3teqQXJw+s3lKsl6k0Q8P57llI1Jj+/dDZmRJAVZ8h2inDWu7ikzjQ3pXCmXAvEjyTU
	txRzIGNA==;
Received: from localhost ([::1]:29740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k7igg-00E8vs-0z; Mon, 17 Aug 2020 17:12:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17918) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k7igb-00E8vl-Pr
 for samba-technical@lists.samba.org; Mon, 17 Aug 2020 17:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=oAP7hYHbdXYpDT9l053NmAYwwsJ+zUP6K6Qg6CJSdbA=; b=G/i9Q5KwIop/awO8OyH7W8zMLh
 RAAkiSx/wL59m3MG5qYSEutEYqD6BosP5vHcSGYBzJvPzbp2IWMCd1oQH90Qj92/03SarlNOwMom4
 0vbqLk7BT22/1su5osOvDpCPvAQrF8YzeqnFBKVdzX4VnHIbYWI+cuz7GxlAtE9GzMjjRbzVeuftK
 LcB6t1hY+/RYf7syNKQc+v6Eitmsb2zOiUNXGh31VTfVZ3td2GEVn36fNfkqt7GHzCfMqFp2N5fcs
 V4yug5gVb81d4uN+1BDtoq6CVDaifXp1pm225YHizlwxa5aH5x3n0fOn2CsrG63BMh2iEqLnCwdCR
 eiYzRkQCgOY70TZb4JZIwFhIRFLKFu17hma19CGtZWObvHsNp++Dm+/IVfSkUe9daFNSub0+quvhU
 I58PbY7YQdNl+3n0L7SS1dvSEjWcQfp/vI9Qoo/qBW5na3FbjhGOaRED8xaQRKc+g5zf3wno5K96G
 K03gntB5r93qVtF6RlYIjWxr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k7igZ-0004po-PW; Mon, 17 Aug 2020 17:12:40 +0000
Date: Mon, 17 Aug 2020 10:12:34 -0700
To: Matthew DeVore <matvore@google.com>
Subject: Re: Creating a VFS backend
Message-ID: <20200817171234.GD10362@jeremy-acer>
References: <CAMfpvhKQKyvzEgsyEPChU1ectmsbPeGiGKEHF2v=5hR+jC1GCQ@mail.gmail.com>
 <0f42582a-eee8-5e05-a55a-1f1c80f11845@samba.org>
 <CAMfpvh+VFgk6f2Gem0FetU+TfZ8wzVhzOaAo7bwPkNRNozT+FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMfpvh+VFgk6f2Gem0FetU+TfZ8wzVhzOaAo7bwPkNRNozT+FA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 12, 2020 at 02:10:47PM -0700, Matthew DeVore via samba-technical wrote:
> Fortunately I was able to figure this out because of a private reply
> (which I only just now realized was private). The salient advise of
> that reply was to set the debuglevel to 10 and look for
> STATUS_NOT_IMPLEMENTED in the log output. After I did that, I manually
> traced some code path from the log message to see it was attempting to
> invoke createfile. I didn't instrument or log createfile calls at all,
> but had them return NOT_IMPLEMENTED, because I thought createfile only
> referred to making a file on disk. But that's actually used to open
> files as well. So after I replaced my createfile function pointer with
> NULL in my struct vfs_fn_pointers, my backend's get_dos_attributes fn
> got invoked, since the default implementation of createfile does that,
> apparently, when a file is being opened. So I'll proceed by
> implementing get_dos_attributes.

Yes, CreateFile is modelled after the Win32 CreateFile() API
call, which is the generic call to open any object (IPC pipes
as well as files and directories). Clients will be unhappy if
SMB_VFS_CREATEFILE() returns NOT_IMPLEMENTED :-).

