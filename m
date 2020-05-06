Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1310C1C732F
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 16:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=lFzGIfZyUzw09ujCQ7GaJvL7Kl/XhUaQt1wrBE8f8ww=; b=3zH0QcMD4XHc6uE0fsmwuDV3LS
	9OmnH2mhGZI2zAHFPE67A8aqS7he24dgnMWkbzN6XoWbaGp5xiI4mqiUh0AxVYHmvk46cRejnrK7m
	eCFD69ZHdslAnHa8sxjA+/PA5Tg7r/TPsUb28meEquOTJrSXzxKUe48FeE+YBtsbhowh++2Ik7omi
	/whxXvbAqS2i+8vWAIm8W5gxV1QcR8Lrxllo+bvyV0kwfEZVWzVGfeDYvtxBxBC9DSO/hCQs6iZa7
	O3eqjLC8DDXoDMDU/TvdEl66D5O1MJ+uo5qUNX4MEBtvHj5Xf7vp6/VzJNDyvjA/SroPdDuQ96yJ/
	oujK3dOQ==;
Received: from localhost ([::1]:42620 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWLGj-0031iu-68; Wed, 06 May 2020 14:43:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28154) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWLGc-0031in-Jd
 for samba-technical@lists.samba.org; Wed, 06 May 2020 14:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=lFzGIfZyUzw09ujCQ7GaJvL7Kl/XhUaQt1wrBE8f8ww=; b=JlfagcZJ0EwGy9ukNH689R3wRj
 esdqaJk4VrNCT+pbsQDkDAoE8grGAQnFiGGrkkUsNcuNaTzT4gwWUHY6XNo4EYdfORIS9UC+8IxmQ
 3uvwIN5NKTUfaDL7T2T518KEu37CS1cNxqb4WZMWdz4cD0u+IRv/EeRGk5u8kjhBpe5LcXSpRtVef
 bRK6wyvqzXX1Kjl9S/esl75nUM7Y8LLQgBKAjgjN21xZ17MdQhE24y/b7mgXm32Ay0C4DemsHRjv2
 OG8qYCNBP2HQolILnH4F9Ea12r6xJ0ceZpm5kTh474tqzjZ95AgbjPKRel0++H7FJW9hJOJpdSHQQ
 L6WL6pUT3WB9Rm6ekwqa05wWDftY5DHtmBWST92MT/bxsObk0R2pLrO3v9447rJqJTh7RlRlG77XC
 xpAHbpdCZoMWknHscgqBxd7eNEH1ztrARY7aMRuflmX5D2/AZxCTmsOmM7JzaU7nUUaiDYv9kZknq
 eIDzrF7qqGoFU6R5Dop9B7zJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWLGb-0006hZ-3f; Wed, 06 May 2020 14:43:21 +0000
To: Anoop C S <anoopcs@cryptolab.net>, Jeremy Allison <jra@samba.org>,
 samba-technical@lists.samba.org
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Date: Wed, 06 May 2020 16:43:19 +0200
Message-ID: <3382111.jB3aVEHC4s@magrathea>
In-Reply-To: <36fd1c62-abfb-931c-ac31-f6afbbb313fb@samba.org>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <62e94d8a6cecf60cfba7e5ca083e90bc8f216d61.camel@cryptolab.net>
 <36fd1c62-abfb-931c-ac31-f6afbbb313fb@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Jens Axboe <axboe@kernel.dk>, Stefan Metzmacher <metze@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 6 May 2020 16:08:03 CEST Stefan Metzmacher via samba-technical 
wrote:
> Am 06.05.20 um 14:41 schrieb Anoop C S:
> > On Wed, 2020-05-06 at 12:33 +0200, Stefan Metzmacher wrote:
> >> Hi Anoop,
> >> 
> >>> I could reproduce the difference in SHA256 checksum after copying a
> >>> directory with 100 copies of test file(provided by reporter) from
> >>> io_uring VFS module enabled share using Windows explorer(right-
> >>> click-
> >>> 
> >>>> copy/paste). Only 5 out of 100 files had correct checksum after
> >>>> copy
> >>> 
> >>> operation :-/
> >> 
> >> Great! Can you please try to collect level 1 log files with
> >> the patch https://bugzilla.samba.org/attachment.cgi?id=15955
> >> applied?
> > 
> > I have attached three log files.
> > log.io_uring.smbd -- Copy using Windows explorer
> > log.io_uring-mget.smd -- Copy using smbclient
> > log.io_uring-powershell.smd -- Copy using `Copy-Item`
> 
> Thanks! All of them show short reads like:
> > [2020/05/06 17:27:28.130248,  1]
> > ../../source3/modules/vfs_io_uring.c:103(vfs_io_uring_finish_req)> 
> >   vfs_io_uring_finish_req: pread ofs=0 (0x0) len=32768 (0x8000)
> >   nread=32768 (0x32768) eof=10000000 (0x989680) blks=4096 blocks=19536
> >   dir/1.bin fnum 1607026405> 
> > [2020/05/06 17:27:28.131049,  1]
> > ../../source3/modules/vfs_io_uring.c:103(vfs_io_uring_finish_req)> 
> >   vfs_io_uring_finish_req: pread ofs=9969664 (0x982000) len=30336 (0x7680)
> >   nread=30336 (0x30336) eof=10000000 (0x989680) blks=4096 blocks=19536
> >   dir/1.bin fnum 1607026405> 
> > [2020/05/06 17:27:28.133679,  1]
> > ../../source3/modules/vfs_io_uring.c:103(vfs_io_uring_finish_req)> 
> >   vfs_io_uring_finish_req: pread ofs=61440 (0xf000) len=32768 (0x8000)
> >   nread=32768 (0x32768) eof=10000000 (0x989680) blks=4096 blocks=19536
> >   dir/1.bin fnum 1607026405> 
> > [2020/05/06 17:27:28.140184,  0]
> > ../../source3/modules/vfs_io_uring.c:88(vfs_io_uring_finish_req)> 
> >   vfs_io_uring_finish_req: Invalid pread ofs=0 (0x0) len=1048576
> >   (0x100000) nread=32768 (0x32768) eof=10000000 (0x989680) blks=4096
> >   blocks=19536 dir/1.bin fnum 1607026405
> It seems the first request is at ofs=0 len=32768 (0x8000) and we get
> 32768 back.
> A follow up request with ofs=0 len=1048576 (0x100000) only gets the
> first 32768 bytes which are already in the page cache.
> 
> I can easily reproduce this with the Ubuntu 5.4 kernel once I add
> state->ur.sqe.rw_flags |= RWF_NOWAIT; to vfs_io_uring_pread_send()
> and use this.
> 
> echo 1 > /proc/sys/vm/drop_caches
> head -c 1024 /root/samba-test/ff1.dat | hexdump -C
> 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
> 
> |................|
> 
> *
> 00000400
> smbclient //172.31.9.167/uringff -Uroot%test -c "get ff1.dat"
> 
> results in this log entries:
> > [2020/05/06 06:51:57.069990,  0]
> > ../../source3/modules/vfs_io_uring.c:89(vfs_io_uring_finish_req)> 
> >   vfs_io_uring_finish_req: Invalid pread ofs=0 (0x0) len=8388608
> >   (0x800000) nread=16384 (0x4000) eof=8388608 (0x800000) blks=4096
> >   blocks=16384 ff1.dat fnum 840153065> 
> > [2020/05/06 06:51:57.076882,  1]
> > ../../source3/modules/vfs_io_uring.c:104(vfs_io_uring_finish_req)> 
> >   vfs_io_uring_finish_req: pread ofs=16384 (0x4000) len=8372224 (0x7fc000)
> >   nread=8372224 (0x7fc000) eof=8388608 (0x800000) blks=4096 blocks=16384
> >   ff1.dat fnum 840153065
> smbclient is just smart enough to recover itself from the short read.
> But the windows client isn't.
> 
> The attached test against liburing (git://git.kernel.dk/liburing) should
> be able to demonstrate the problem. It can also be found in
> https://github.com/metze-samba/liburing/tree/implicit-rwf-nowaithttps://gith
> ub.com/metze-samba/liburing/commit/eb06dcfde747e46bd08bedf9def2e6cb536c39e3

  ^^^ This link gives me 404 ...

> I added the sqe->rw_flags = RWF_NOWAIT; line in order to demonstrate it
> against the Ubuntu 5.3 and 5.4 kernels. They both seem to have the bug.
> 
> Can someone run the unmodified test/implicit-rwf_nowait against
> a newer kernel?
> 
> Thanks!
> metze


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



