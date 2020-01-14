Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F325139DCC
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 01:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=r8nM49d/Bdh/QiyTVfyhsfS8+uffLmp/O9HaJJAqFm8=; b=g2im38SZGJOeygjg3TMsxdCcnD
	rBkX+gOs1J7akYvL0rByVDOwj12XV9A6+OKUhJ/9mVXSrrKW0R084L2C6oCZj3S/WZe7jWtu/nhK5
	W2KHYFxeQm8evtnXYO09uIGEU9FyQfIES8IKRNuskkT+vSqgVNWUBES60DDYDMIF6M4xPv/os8D7i
	gAf/DOsZIn3vMBX9q+1sgXbb/YhAdQd/Rdf9ZXdZee4sxq4/P1cNf47HUi4Yy4d+k6SChGrb6+M5f
	3kaKfJWm16T5OmWd76i29S43d+Dk4KJObMmUuMof6CMFXWVqIobEESdkw3AqeBZ7aK1duMQBPEjiJ
	/3IFz8Lw==;
Received: from localhost ([::1]:63666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ir9lF-003JHh-SN; Tue, 14 Jan 2020 00:08:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37864) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ir9lB-003JHa-PX
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 00:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=r8nM49d/Bdh/QiyTVfyhsfS8+uffLmp/O9HaJJAqFm8=; b=T98YMf9E4C7T8F040i6GsRkyxy
 GUSYHxt/roOdmE7dI+ZT2xHqnjiNKB8xijTpSv/SXcbHmonyChc7OLEpO0E+kBV0MkQ32/lU7QkgJ
 wliCYCcIXseOuMt7qX0Zw82fcImf1KbYN1oSpYBCf8wwwV5X88ZJbeL7G4tXXKOuwFDvhln8GA6uK
 Q6jwDfx80lodvIiSgKvVqAQ+cYz43VIoV6SWbkJYqDaxN0XurrPr73yh5dkwf2tPdOwjA7QrhgVVU
 s3iYNJqomQmnPSedGVd8M1R/6Wv3SP8+pgBzp9EbmvNEEqUwTRVE7XyKXk8uBubUuDUxdvHdr3Ud3
 kexEuZNUfRzj22UMLeGy1LR3yyskjrgFrc2wNkKWK3+dMCo3D39jiFNFWIPvY/3f6xx/MfIT2GP+s
 XbC6rHvUQfNg7aKTp6rLLJiquPCSNfaj/fxB5VVihxZsoegxZS2N90HXy0pU/mHjc5BlGoXfcWjn5
 j9mlb4qY2o3Gl8fFkiKweFFX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ir9l9-0003qJ-8p; Tue, 14 Jan 2020 00:08:39 +0000
Date: Mon, 13 Jan 2020 16:08:36 -0800
To: David Mulder <dmulder@suse.com>
Subject: Re: SMB2 Write truncate
Message-ID: <20200114000836.GA157517@jra4>
References: <fa364f9a-b16e-9142-177e-a98b6bf8ce0d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa364f9a-b16e-9142-177e-a98b6bf8ce0d@suse.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jan 13, 2020 at 10:47:26PM +0000, David Mulder via samba-technical wrote:
> Based on the behavior of tests in source4/torture/basic/delaywrite.c, it seems
> sending a write request in smb1, with a buffer size of 0, would truncate the file
> (at least that's what the comments say in the test). There doesn't seem to be any
> reason for the offset size in these tests (some are less than the current size of
> the file, others are much greater than the current size, which doesn't make much sense).

Yes, that's what I recall. Offset size less than the file should
truncate. Offset size greater should expand. Here's the code in
the server for SMB1write:

        /*
         * X/Open SMB protocol says that if smb_vwv1 is
         * zero then the file size should be extended or
         * truncated to the size given in smb_vwv[2-3].
         */

        if(numtowrite == 0) {
                /*
                 * This is actually an allocate call, and set EOF. JRA.
                 */
                nwritten = vfs_allocate_file_space(fsp, (off_t)startpos);
                if (nwritten < 0) {
                        reply_nterror(req, NT_STATUS_DISK_FULL);
                        goto out;
                }
                nwritten = vfs_set_filelen(fsp, (off_t)startpos);
                if (nwritten < 0) {
                        reply_nterror(req, NT_STATUS_DISK_FULL);
                        goto out;
                }
	} else ...

> 
> I'm working on converting these tests to SMB2, but the behavior isn't the same.
> An SMB2 write responds with NT_STATUS_INVALID_PARAMETER when you set the buffer size to 0.
> I can't find in the MS-SMB2 spec how to correctly truncate a file. Anyone know how to do this?

That sounds correct - SMB2 tidied up all these
horrible size effects.

To truncate in SMB2 you can call setinfo on a handle
with SMB_FILE_END_OF_FILE_INFORMATION.

